{==============================================================================
  RadCORE / Sisgrãos - Módulo de Controle de Deploy (HyperServer)
  ------------------------------------------------------------------------------
  Autor: Equipe de Engenharia / Antigravity AI
  Data: 07/10/2026
  Objetivo:
    - Detectar automaticamente quando um novo executável foi implantado no
      HyperServer (ou standalone).
    - Registrar o histórico de deploys em formato simples e organizado por DIA.
    - Notificar sessões ativas com banner HTML no topo solicitando F5.
    - Ocultar a notificação automaticamente assim que o usuário recarregar.
    - Tolerante a exclusão de arquivos de backup (.bak) pelo administrador.
    - REVISÃO SÊNIOR: Detecção contínua e autônoma a cada deploy (1º, 2º, 10º...),
      com resolução precisa do binário raiz, tolerância a nós HyperServer
      e prevenção de concorrência com Mutex global.
 ==============================================================================}

unit uDeployControl;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, System.IniFiles, Winapi.Windows;

/// <summary>
/// Retorna o diretório base compartilhado da aplicação, identificando se está
/// rodando em nó do HyperServer (acima da pasta \nodes\) ou standalone.
/// </summary>
function rc_GetDeployBaseDir: string;

/// <summary>
/// Retorna o caminho completo do executável/binário raiz da aplicação (alvo dos deploys).
/// </summary>
function rc_GetRootExePath: string;

/// <summary>
/// Retorna a data e hora do arquivo executável raiz implantado no servidor.
/// </summary>
function rc_GetRootExeDateTime: TDateTime;

/// <summary>
/// Retorna a data e hora do executável (compatibilidade retroativa).
/// </summary>
function rc_GetExeFileDateTime: TDateTime;

/// <summary>
/// Retorna o diretório exclusivo de arquivos de deploy: files\deploy\
/// </summary>
function rc_GetDeployFilesDir: string;

/// <summary>
/// Registra a inicialização do nó ou força registro de novo deploy.
/// Salva no deploy_atual.txt e anota no histórico diário.
/// </summary>
function rc_RegistraDeployNodeStartup(const pNodePort: string = ''; const pNodePID: Integer = 0; const pForcar: Boolean = False): string;

/// <summary>
/// Obtém o ID do último deploy ativo registrado.
/// Verifica autonomamente se o executável raiz em disco é mais recente que o registrado,
/// atualizando deploy_atual.txt e histórico automaticamente se houve deploy novo.
/// </summary>
function rc_GetUltimoDeployID: string;

/// <summary>
/// Retorna informações resumidas do deploy atual para exibição informativa.
/// </summary>
function rc_GetDeployInfoFormatted: string;

/// <summary>
/// Retorna o conteúdo completo do arquivo de histórico diário formatado.
/// </summary>
function rc_GetConteudoHistoricoDeploy: string;

implementation

uses
  uVersion;

var
  vCachedDeployID: string = '';
  vLastDeployCheckTick: Cardinal = 0;

function rc_GetDeployBaseDir: string;
var
  p: string;
  idx: Integer;
begin
  p := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));

  // Se estiver rodando dentro de subpasta de Node do HyperServer (ex: \Nodes\0\ ou \Nodes\Node0\ ou /nodes/0/)
  idx := Pos('\nodes\', LowerCase(p));
  if idx = 0 then
    idx := Pos('/nodes/', LowerCase(p));
  if idx = 0 then
    idx := Pos('\node_', LowerCase(p));
  if idx = 0 then
    idx := Pos('/node_', LowerCase(p));
  if idx = 0 then
    idx := Pos('\node0', LowerCase(p));
  if idx = 0 then
    idx := Pos('/node0', LowerCase(p));

  if idx > 0 then
    Result := IncludeTrailingPathDelimiter(Copy(p, 1, idx))
  else
    Result := p;
end;

function rc_GetRootExePath: string;
var
  baseDir: string;
  candidate: string;
  iniCfg: TIniFile;
  binaryName: string;
begin
  baseDir := rc_GetDeployBaseDir;

  // 1. Verificar hyper_server.cfg se existir
  if FileExists(baseDir + 'hyper_server.cfg') then
  begin
    try
      iniCfg := TIniFile.Create(baseDir + 'hyper_server.cfg');
      try
        binaryName := iniCfg.ReadString('hyper_server', 'binary_name', '');
        if (binaryName <> '') and FileExists(baseDir + binaryName) then
        begin
          Result := baseDir + binaryName;
          Exit;
        end;
      finally
        iniCfg.Free;
      end;
    except
    end;
  end;

  // 2. Verificar hyper_server.ssl.cfg se existir
  if FileExists(baseDir + 'hyper_server.ssl.cfg') then
  begin
    try
      iniCfg := TIniFile.Create(baseDir + 'hyper_server.ssl.cfg');
      try
        binaryName := iniCfg.ReadString('hyper_server', 'binary_name', '');
        if (binaryName <> '') and FileExists(baseDir + binaryName) then
        begin
          Result := baseDir + binaryName;
          Exit;
        end;
      finally
        iniCfg.Free;
      end;
    except
    end;
  end;

  // 3. Verificar arquivo com o mesmo nome na raiz do deploy
  candidate := baseDir + ExtractFileName(ParamStr(0));
  if FileExists(candidate) then
  begin
    Result := candidate;
    Exit;
  end;

  // 4. Verificar nomes comuns (RadCORE.exe / RadCORE.dll)
  if FileExists(baseDir + 'RadCORE.exe') then
  begin
    Result := baseDir + 'RadCORE.exe';
    Exit;
  end;

  if FileExists(baseDir + 'RadCORE.dll') then
  begin
    Result := baseDir + 'RadCORE.dll';
    Exit;
  end;

  // 5. Fallback para o executável do processo atual
  Result := ParamStr(0);
end;

function rc_GetRootExeDateTime: TDateTime;
var
  exePath: string;
  dt: TDateTime;
begin
  exePath := rc_GetRootExePath;
  if (exePath <> '') and FileAge(exePath, dt) then
    Result := dt
  else if FileAge(ParamStr(0), dt) then
    Result := dt
  else
    Result := Now;
end;

function rc_GetExeFileDateTime: TDateTime;
begin
  Result := rc_GetRootExeDateTime;
end;

function rc_GetDeployFilesDir: string;
var
  d: string;
begin
  d := rc_GetDeployBaseDir + 'files' + PathDelim + 'deploy' + PathDelim;
  if not DirectoryExists(d) then
    ForceDirectories(d);
  Result := d;
end;

function rc_FindLatestBackupFile(const ABaseDir: string): string;
var
  sr: TSearchRec;
  latestTime: TDateTime;
  latestName: string;
begin
  latestTime := 0;
  latestName := '';

  try
    // 1. Procura na raiz da aplicação por arquivos .bak
    if FindFirst(ABaseDir + '*.bak', faAnyFile, sr) = 0 then
    begin
      repeat
        if (sr.Attr and faDirectory) = 0 then
        begin
          if (latestTime = 0) or (sr.TimeStamp > latestTime) then
          begin
            latestTime := sr.TimeStamp;
            latestName := sr.Name;
          end;
        end;
      until FindNext(sr) <> 0;
      System.SysUtils.FindClose(sr);
    end;

    // 2. Procura na subpasta backup se existir
    if DirectoryExists(ABaseDir + 'backup') then
    begin
      if FindFirst(ABaseDir + 'backup' + PathDelim + '*.bak', faAnyFile, sr) = 0 then
      begin
        repeat
          if (sr.Attr and faDirectory) = 0 then
          begin
            if (latestTime = 0) or (sr.TimeStamp > latestTime) then
            begin
              latestTime := sr.TimeStamp;
              latestName := 'backup' + PathDelim + sr.Name;
            end;
          end;
        until FindNext(sr) <> 0;
        System.SysUtils.FindClose(sr);
      end;
    end;
  except
    latestName := '';
  end;

  if latestName <> '' then
    Result := latestName
  else
    Result := 'Sem backup previo';
end;

procedure rc_AppendHistoricoDiario(const AHistoricoFile, ADataStr, AHoraStr, AVersao, ANodeInfo, ABackupInfo: string);
var
  lines: TStringList;
  i, insertIndex: Integer;
  headerDia: string;
  novaLinha: string;
  diaFound: Boolean;
  hMutex: THandle;
begin
  // Trava entre processos para evitar concorrência entre múltiplos nós HyperServer
  hMutex := CreateMutex(nil, False, PChar('Global\RadCore_DeployLogLock'));
  if hMutex <> 0 then
    WaitForSingleObject(hMutex, 3000);

  lines := TStringList.Create;
  try
    headerDia := '[ ' + ADataStr + ' ]';
    novaLinha := '  ' + AHoraStr + ' | Versao: ' + AVersao + ' | No: ' + ANodeInfo + ' | Backup: ' + ABackupInfo;

    if FileExists(AHistoricoFile) then
    begin
      try
        lines.LoadFromFile(AHistoricoFile, TEncoding.ASCII);
      except
        lines.Clear;
      end;
    end;

    // Se o arquivo estiver vazio, cria o cabeçalho padrão
    if lines.Count = 0 then
    begin
      lines.Add('========================================================================================');
      lines.Add('                      HISTORICO DE ATUALIZACOES (HYPERSERVER)');
      lines.Add('========================================================================================');
      lines.Add('');
    end;

    // Procura se o dia informado já possui seção no arquivo
    diaFound := False;
    insertIndex := -1;
    for i := 0 to lines.Count - 1 do
    begin
      if Trim(lines[i]) = headerDia then
      begin
        diaFound := True;
        insertIndex := i + 1; // Insere logo abaixo do cabeçalho daquele dia
        Break;
      end;
    end;

    if diaFound and (insertIndex >= 0) then
    begin
      lines.Insert(insertIndex, novaLinha);
    end
    else
    begin
      // Localiza o ponto logo após o cabeçalho principal
      insertIndex := -1;
      for i := 0 to lines.Count - 1 do
      begin
        if Pos('====', lines[i]) > 0 then
          insertIndex := i + 1;
      end;

      if insertIndex < 0 then
        insertIndex := lines.Count;

      // Pula linha em branco se houver
      while (insertIndex < lines.Count) and (Trim(lines[insertIndex]) = '') do
        Inc(insertIndex);

      lines.Insert(insertIndex, '');
      lines.Insert(insertIndex, novaLinha);
      lines.Insert(insertIndex, headerDia);
    end;

    try
      lines.SaveToFile(AHistoricoFile, TEncoding.ASCII);
    except
    end;
  finally
    lines.Free;
    if hMutex <> 0 then
    begin
      ReleaseMutex(hMutex);
      CloseHandle(hMutex);
    end;
  end;
end;

function rc_RegistraDeployNodeStartup(const pNodePort: string = ''; const pNodePID: Integer = 0; const pForcar: Boolean = False): string;
var
  deployDir: string;
  ctrlFile: string;
  histFile: string;
  ini: TIniFile;
  exeDate: TDateTime;
  recordedDateStr: string;
  recordedDate: TDateTime;
  isNovoDeploy: Boolean;
  deployID: string;
  versaoStr: string;
  nodeStr: string;
  backupStr: string;
  dataStr, horaStr: string;
  pid: Integer;
  hMutex: THandle;
begin
  deployDir := rc_GetDeployFilesDir;
  ctrlFile  := deployDir + 'deploy_atual.txt';
  histFile  := deployDir + 'historico_deploy.txt';

  exeDate := rc_GetRootExeDateTime;

  pid := pNodePID;
  if pid <= 0 then
    pid := GetCurrentProcessId;

  if pNodePort <> '' then
    nodeStr := 'Node (Porta: ' + pNodePort + ' | PID: ' + IntToStr(pid) + ')'
  else
    nodeStr := 'PID: ' + IntToStr(pid);

  try
    versaoStr := FileVersion;
  except
    versaoStr := '1.0.0';
  end;
  if Trim(versaoStr) = '' then
    versaoStr := '1.0.0';

  hMutex := CreateMutex(nil, False, PChar('Global\RadCore_DeployLock'));
  if hMutex <> 0 then
    WaitForSingleObject(hMutex, 5000);
  try
    isNovoDeploy := True;
    if (not pForcar) and FileExists(ctrlFile) then
    begin
      try
        ini := TIniFile.Create(ctrlFile);
        try
          recordedDateStr := ini.ReadString('DEPLOY', 'EXE_DATETIME', '');
          deployID        := ini.ReadString('DEPLOY', 'DEPLOY_ID', '');
          if (recordedDateStr <> '') and (deployID <> '') then
          begin
            try
              recordedDate := StrToDateTime(recordedDateStr);
              // Se a data de gravação do executável for idêntica ou anterior à registrada, não é novo deploy
              if (exeDate <= recordedDate + (2.0 / 86400.0)) then
                isNovoDeploy := False;
            except
              isNovoDeploy := True;
            end;
          end;
        finally
          ini.Free;
        end;
      except
        isNovoDeploy := True;
      end;
    end;

    if isNovoDeploy then
    begin
      deployID  := FormatDateTime('YYYYMMDD_HHNNSS', Now);
      dataStr   := FormatDateTime('DD/MM/YYYY', Now);
      horaStr   := FormatDateTime('HH:NN:SS', Now);
      backupStr := rc_FindLatestBackupFile(rc_GetDeployBaseDir);

      try
        ini := TIniFile.Create(ctrlFile);
        try
          ini.WriteString('DEPLOY', 'DEPLOY_ID', deployID);
          ini.WriteString('DEPLOY', 'VERSAO', versaoStr);
          ini.WriteString('DEPLOY', 'DATA_HORA', dataStr + ' ' + horaStr);
          ini.WriteString('DEPLOY', 'EXE_DATETIME', DateTimeToStr(exeDate));
          ini.WriteString('DEPLOY', 'NODE', nodeStr);
          ini.WriteString('DEPLOY', 'BACKUP', backupStr);
        finally
          ini.Free;
        end;
      except
      end;

      // Registra no histórico agrupado por dia
      rc_AppendHistoricoDiario(histFile, dataStr, horaStr, versaoStr, nodeStr, backupStr);
    end;

    vCachedDeployID := deployID;
    vLastDeployCheckTick := GetTickCount;
    Result := deployID;
  finally
    if hMutex <> 0 then
    begin
      ReleaseMutex(hMutex);
      CloseHandle(hMutex);
    end;
  end;
end;

function rc_GetUltimoDeployID: string;
var
  ctrlFile: string;
  triggerFile: string;
  ini: TIniFile;
  nowTick: Cardinal;
  exeDate: TDateTime;
  recordedDateStr: string;
  recordedDate: TDateTime;
  recordedDeployID: string;
  recordedVersao: string;
  currentVersao: string;
  isNovoDeployDetectado: Boolean;
begin
  nowTick := GetTickCount;

  // Cache de 5 segundos para não sobrecarregar I/O no disco a cada milissegundo no heartbeat
  if (vCachedDeployID <> '') and (nowTick - vLastDeployCheckTick < 5000) then
  begin
    Result := vCachedDeployID;
    Exit;
  end;

  ctrlFile    := rc_GetDeployFilesDir + 'deploy_atual.txt';
  triggerFile := rc_GetDeployFilesDir + 'force_update.flag';
  exeDate     := rc_GetRootExeDateTime;

  try
    currentVersao := FileVersion;
  except
    currentVersao := '';
  end;

  isNovoDeployDetectado := False;

  // 1. Verificação de gatilho manual para forçar atualização se o administrador desejar
  if FileExists(triggerFile) then
  begin
    try
      DeleteFile(PChar(triggerFile));
    except
    end;
    isNovoDeployDetectado := True;
  end;

  // 2. Se o arquivo de controle não existe no disco, registra o primeiro deploy
  if not FileExists(ctrlFile) then
  begin
    isNovoDeployDetectado := True;
  end
  else
  begin
    try
      ini := TIniFile.Create(ctrlFile);
      try
        recordedDeployID := ini.ReadString('DEPLOY', 'DEPLOY_ID', '');
        recordedDateStr  := ini.ReadString('DEPLOY', 'EXE_DATETIME', '');
        recordedVersao   := ini.ReadString('DEPLOY', 'VERSAO', '');

        if (recordedDeployID = '') or (recordedDateStr = '') then
          isNovoDeployDetectado := True
        else
        begin
          try
            recordedDate := StrToDateTime(recordedDateStr);
            // Se o executável raiz no disco for MAIS RECENTE que o registrado (+2s tolerância)
            // OU se a versão do sistema mudou
            if (exeDate > (recordedDate + (2.0 / 86400.0))) or
               ((currentVersao <> '') and (recordedVersao <> '') and (currentVersao <> recordedVersao)) then
              isNovoDeployDetectado := True
            else
              vCachedDeployID := recordedDeployID;
          except
            isNovoDeployDetectado := True;
          end;
        end;
      finally
        ini.Free;
      end;
    except
      isNovoDeployDetectado := True;
    end;
  end;

  // 3. Se um novo deploy foi detectado, registra autonomamente no disco e atualiza ID
  if isNovoDeployDetectado then
  begin
    vCachedDeployID := rc_RegistraDeployNodeStartup;
  end;

  vLastDeployCheckTick := nowTick;
  Result := vCachedDeployID;
end;

function rc_GetDeployInfoFormatted: string;
var
  ctrlFile: string;
  ini: TIniFile;
begin
  ctrlFile := rc_GetDeployFilesDir + 'deploy_atual.txt';
  Result := '';
  if FileExists(ctrlFile) then
  begin
    try
      ini := TIniFile.Create(ctrlFile);
      try
        Result := 'Versao: ' + ini.ReadString('DEPLOY', 'VERSAO', '') +
                  ' | Atualizado em: ' + ini.ReadString('DEPLOY', 'DATA_HORA', '');
      finally
        ini.Free;
      end;
    except
    end;
  end;
end;

function rc_GetConteudoHistoricoDeploy: string;
var
  histFile: string;
  lines: TStringList;
begin
  histFile := rc_GetDeployFilesDir + 'historico_deploy.txt';
  Result := '';
  if FileExists(histFile) then
  begin
    lines := TStringList.Create;
    try
      try
        lines.LoadFromFile(histFile, TEncoding.ASCII);
        Result := lines.Text;
      except
        Result := 'Erro ao ler arquivo de historico.';
      end;
    finally
      lines.Free;
    end;
  end
  else
    Result := 'Nenhum historico de deploy registrado ate o momento.';
end;

end.
