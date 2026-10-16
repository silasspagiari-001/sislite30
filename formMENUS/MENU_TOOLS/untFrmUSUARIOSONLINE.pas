unit untFrmUSUARIOSONLINE;

// ============================================================
// Form: Usuarios Online, Bate-papo Integrado e Grupos (Sidebar Lateral)
// - Estilo: Dark Emerald profundo (fundo 100% escuro, sem branco)
// - Nome de usuario com maximo contraste e nitidez
// - Seletor de Emojis integrado estilo WhatsApp
// - Visualizacao de imagens no balao em bom tamanho e sem cortes
// - Lightbox Fullscreen global no topo do navegador (fora do sidebar)
// - Campo de digitacao expansivel multilinhas (textarea estilo WhatsApp)
// - Historico dedicado por conversa salvo em TXT e recarregado automaticamente
// - Conversas em Grupo gerenciadas exclusivamente pelo usuario MASTER
// - Selecao de membros baseada na tabela USUARIOS com CODFUNC preenchido
// - Permissoes granulares de grupo: Pode Ver e Pode Enviar
// - Indicador de mensagens nao lidas com contador e destaque no card
// - Lixeira em vermelho, maior e com design moderno (apenas quem enviou)
// ============================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses,
  uniPanel, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniHTMLFrame, uniFileUpload, DB;

type
  TfrmUsuariosOnline = class(TUniForm)
    UniContainerPanel1 : TUniContainerPanel;
    paTitulo           : TUniContainerPanel;
    paSearchContent1   : TUniContainerPanel;
    labTitleFrm        : TUniLabel;
    labbtnExit         : TUniLabel;
    htmlOnline         : TUniHTMLFrame;
    timerRefresh       : TUniTimer;
    UniFileUploadChat  : TUniFileUpload;
    UniFileUploadPDF   : TUniFileUpload;

    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure labbtnExitClick(Sender: TObject);
    procedure timerRefreshTimer(Sender: TObject);
    procedure htmlOnlineAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFileUploadChatCompleted(Sender: TObject; AStream: TFileStream);
    procedure UniFileUploadPDFCompleted(Sender: TObject; AStream: TFileStream);

  private
    FLastMsgSeq      : Integer;
    FLastChatUserID  : Integer;
    FLastOnlineCount : Integer;
    FLastGroupCount  : Integer;
    FLastUnreadGlobal: Integer;
    procedure AtualizarLista;
  public
    FChatUserID      : Integer; // 0 = Lista, -1 = Sala Geral, > 0 = Chat Privado, < -100 = Grupo (-100 - GroupID)
  end;

// ============================================================
// Registro global de usuarios online e mensageria instantanea
// ============================================================
function rc_ResolveAvatarURL(const pAvatarPath: string): string;
procedure rc_RegistraUsuarioOnline(pID: Integer; pNome, pLogin,
  pEmpresa, pIP, pDispositivo: string; pAvatar: string = '');
procedure rc_RemoveUsuarioOnline(pID: Integer);
function rc_TotalUsuariosOnline: Integer;

// Funcoes de envio, busca e exclusao de mensagens
procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto, pImagemURL, pAvatarURL: string); overload;
procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto, pImagemURL: string); overload;
procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto: string); overload;
procedure rc_EnviaMensagem(pIDDest: Integer; pRemetente, pTexto: string); overload;
procedure rc_EnviaMensagemGrupo(pGroupID, pIDRemet: Integer; pNomeRemet, pTexto, pImagemURL, pAvatarURL: string); overload;
procedure rc_EnviaMensagemGrupo(pGroupID, pIDRemet: Integer; pNomeRemet, pTexto, pImagemURL: string); overload;

function rc_BuscaMensagemPendente(pIDUser, pChatAbertoID: Integer; var vRemetente, vTexto, vImagemURL, vAvatarURL: string): Boolean; overload;
function rc_BuscaMensagemPendente(pIDUser: Integer; var vRemetente, vTexto: string): Boolean; overload;

function rc_ApagaMensagem(pMsgID, pUserID: Integer): Boolean;
function rc_TotalNaoLidas(pIDDest, pIDRemet: Integer): Integer;
procedure rc_MarcarComoLidas(pIDDest, pIDRemet: Integer);
function rc_TotalNaoLidasGlobal(pUserID: Integer): Integer;
procedure rc_MarcarComoLidasGlobal(pUserID: Integer);
procedure rc_ShowMSNPopup(const pRemetente, pTexto, pImagemURL, pAvatarURL: string); overload;
procedure rc_ShowMSNPopup(const pRemetente, pTexto: string); overload;
function rc_IsImagem(const pURL: string): Boolean;
function rc_IsDocumento(const pURL: string): Boolean;
procedure rc_GetDocInfo(const pURL: string; var vExt, vBadge, vColor, vIconLabel, vDesc: string);
function rc_TotalNaoLidasGrupo(pGroupID, pUserID: Integer): Integer;
procedure rc_MarcarComoLidasGrupo(pGroupID, pUserID: Integer);

// Gerenciamento e Exclusao de Grupos e Membros
function rc_ExcluiGrupo(pGroupID, pUserID: Integer; pIsMaster: Boolean): Boolean;
function rc_RemoveMembroGrupo(pGroupID, pMemberUID, pUserID: Integer; pIsMaster: Boolean): Boolean;

// Historico dedicado por conversa em TXT
procedure rc_CarregaHistoricoConversa(pID1, pID2: Integer);

function frmUsuariosOnline: TfrmUsuariosOnline;
procedure rc_AbrirChatUsuariosOnline;
function rc_ChatAbertoUserID: Integer;


implementation

{$R *.dfm}

uses
  SyncObjs,
  MainModule, ServerModule, uniGUIApplication,
  untdm_rc, uconsts, mkm_layout, mkm_anim, mkm_func_web, Main;

// ============================================================
// Funcoes utilitarias
// ============================================================
function rc_IIF(ACond: Boolean; const ATrue, AFalse: string): string;
begin
  if ACond then Result := ATrue else Result := AFalse;
end;

function rc_MinInt(A, B: Integer): Integer;
begin
  if A < B then Result := A else Result := B;
end;

function rc_MaxInt(A, B: Integer): Integer;
begin
  if A > B then Result := A else Result := B;
end;

function rc_EscapeHTML(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '<br>', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '<br>', [rfReplaceAll]);
end;

function rc_URLDecode(const S: string): string;
var
  i, bIdx: Integer;
  hexStr: string;
  ch: Char;
  bList: TBytes;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  SetLength(bList, Length(S));
  bIdx := 0;
  i := 1;
  while i <= Length(S) do
  begin
    ch := S[i];
    if (ch = '%') and (i + 2 <= Length(S)) then
    begin
      hexStr := '$' + S[i + 1] + S[i + 2];
      bList[bIdx] := StrToIntDef(hexStr, 32);
      Inc(bIdx);
      Inc(i, 3);
    end
    else if ch = '+' then
    begin
      bList[bIdx] := 32;
      Inc(bIdx);
      Inc(i);
    end
    else
    begin
      bList[bIdx] := Ord(ch);
      Inc(bIdx);
      Inc(i);
    end;
  end;
  SetLength(bList, bIdx);
  try
    Result := TEncoding.UTF8.GetString(bList);
  except
    Result := S;
  end;
end;

function rc_EncodeTxtField(const S: string): string;
begin
  Result := StringReplace(S, '|', '&#124;', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '\n', [rfReplaceAll]);
end;

function rc_DecodeTxtField(const S: string): string;
begin
  Result := StringReplace(S, '\n', #13#10, [rfReplaceAll]);
  Result := StringReplace(Result, '&#124;', '|', [rfReplaceAll]);
end;

// ============================================================
// Suporte a HyperServer e multi-processos (Apache / IIS / Nodes)
// ============================================================
// ============================================================
// Mutex Global e Suporte a HyperServer Multi-Processos (Nodes)
// ============================================================
var
  gGlobalChatMutex: THandle = 0;

function rc_AcquireCrossProcessLock(timeoutMs: Cardinal = 2000): Boolean;
begin
  if gGlobalChatMutex = 0 then
    gGlobalChatMutex := CreateMutex(nil, False, 'Global\RadCORE_Sisgraos_Chat_Lock');
  if gGlobalChatMutex = 0 then
    gGlobalChatMutex := CreateMutex(nil, False, 'RadCORE_Sisgraos_Chat_Lock');

  Result := (gGlobalChatMutex <> 0) and
    (WaitForSingleObject(gGlobalChatMutex, timeoutMs) in [WAIT_OBJECT_0, WAIT_ABANDONED]);
end;

procedure rc_ReleaseCrossProcessLock;
begin
  if gGlobalChatMutex <> 0 then
    ReleaseMutex(gGlobalChatMutex);
end;

function rc_GetChatBaseDir: string;
var
  p: string;
begin
  p := '';
  try
    if (sm <> nil) and (sm.StartPath <> '') then
      p := IncludeTrailingPathDelimiter(sm.StartPath);
  except
  end;

  if p = '' then
    p := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));

  // Se estiver rodando dentro de subpasta de Node do HyperServer (ex: \Nodes\0\ ou \Nodes\Node0\)
  if (Pos('\nodes\', LowerCase(p)) > 0) or (Pos('/nodes/', LowerCase(p)) > 0) then
  begin
    p := ExtractFilePath(ExcludeTrailingPathDelimiter(ExtractFilePath(ExcludeTrailingPathDelimiter(p))));
    p := IncludeTrailingPathDelimiter(p);
  end;

  Result := p;
end;

function rc_GetChatLogsDir: string;
var
  d: string;
begin
  d := '';
  try
    if (sm <> nil) and (sm.FilesFolderPath <> '') then
      d := IncludeTrailingPathDelimiter(sm.FilesFolderPath) + 'chat_logs\';
  except
  end;

  if d = '' then
    d := rc_GetChatBaseDir + 'chat_logs\';

  if not DirectoryExists(d) then
    ForceDirectories(d);
  Result := d;
end;

function rc_SafeReadFile(const AFileName: string; out AContent: string): Boolean;
var
  fs: TFileStream;
  ss: TStringStream;
  retries: Integer;
begin
  Result := False;
  AContent := '';
  if not FileExists(AFileName) then Exit;

  rc_AcquireCrossProcessLock(1500);
  try
    for retries := 1 to 5 do
    begin
      try
        fs := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
        try
          ss := TStringStream.Create('', TEncoding.UTF8);
          try
            ss.CopyFrom(fs, 0);
            AContent := ss.DataString;
            Result := True;
            Break;
          finally
            ss.Free;
          end;
        finally
          fs.Free;
        end;
      except
        Sleep(15);
      end;
    end;
  finally
    rc_ReleaseCrossProcessLock;
  end;
end;

function rc_SafeWriteFile(const AFileName, AContent: string): Boolean;
var
  fs: TFileStream;
  ss: TStringStream;
  retries: Integer;
begin
  Result := False;
  rc_AcquireCrossProcessLock(3000);
  try
    for retries := 1 to 5 do
    begin
      try
        ss := TStringStream.Create(AContent, TEncoding.UTF8);
        try
          fs := TFileStream.Create(AFileName, fmCreate or fmShareDenyWrite);
          try
            ss.Position := 0;
            fs.CopyFrom(ss, ss.Size);
            Result := True;
            Break;
          finally
            fs.Free;
          end;
        finally
          ss.Free;
        end;
      except
        Sleep(20);
      end;
    end;
  finally
    rc_ReleaseCrossProcessLock;
  end;
end;

// ============================================================
// Estrutura de dados de usuarios, mensagens e grupos
// ============================================================
type
  TUsuarioOnline = record
    ID         : Integer;
    Nome       : string;
    Login      : string;
    Empresa    : string;
    IP         : string;
    Dispositivo: string;
    AvatarURL  : string;
    HoraLogin  : TDateTime;
    UltimoPing : TDateTime;
  end;

  TArrayUsuariosOnline = array of TUsuarioOnline;

  TLeituraInfo = record
    UserID   : Integer;
    Nome     : string;
    DataHora : TDateTime;
  end;

  TArrayLeituraInfo = array of TLeituraInfo;

  TMensagemOnline = record
    MsgID          : Integer;
    DataHora       : TDateTime;
    IDRemetente    : Integer;
    NomeRemetente  : string;
    AvatarRemetente: string;
    IDDestinatario : Integer; // > 0: user ID; -1: global; < -100: Grupo (-100 - GroupID)
    Texto          : string;
    Apagada        : Boolean;
    ImagemURL      : string;
    LidaPor        : array of Integer;
    NotificadaPara : array of Integer;
    Leituras       : TArrayLeituraInfo; // Quem visualizou com data e hora exatas
  end;

  TMembroGrupo = record
    UserID     : Integer;
    Nome       : string;
    PodeVer    : Boolean;
    PodeEnviar : Boolean;
  end;

  TGrupoChat = record
    GroupID      : Integer;
    Nome         : string;
    CriadorID    : Integer;
    DataCriacao  : TDateTime;
    Membros      : array of TMembroGrupo;
  end;

// ============================================================
// Variaveis globais thread-safe
// ============================================================
var
  gLockOnline     : TCriticalSection;
  gListOnline     : TArrayUsuariosOnline;
  gListMensagens  : array of TMensagemOnline;
  gListGrupos     : array of TGrupoChat;
  gMsgSeq         : Integer;
  gNextGroupID    : Integer = 1;

function rc_EncodeLeituras(const ALeituras: TArrayLeituraInfo): string;
var
  k: Integer;
begin
  Result := '';
  for k := 0 to High(ALeituras) do
  begin
    if Result <> '' then Result := Result + '~';
    Result := Result + IntToStr(ALeituras[k].UserID) + '@' +
              rc_EncodeTxtField(ALeituras[k].Nome) + '@' +
              FormatDateTime('yyyy-mm-dd hh:nn:ss', ALeituras[k].DataHora);
  end;
end;

procedure rc_DecodeLeituras(const AStr: string; var ALeituras: TArrayLeituraInfo);
var
  items, sub: TStringList;
  k, idx: Integer;
  fs: TFormatSettings;
begin
  if Trim(AStr) = '' then Exit;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-mm-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:nn:ss';

  items := TStringList.Create;
  sub := TStringList.Create;
  try
    items.StrictDelimiter := True;
    items.Delimiter := '~';
    items.DelimitedText := AStr;
    sub.StrictDelimiter := True;
    sub.Delimiter := '@';

    for k := 0 to items.Count - 1 do
    begin
      sub.DelimitedText := items[k];
      if sub.Count >= 3 then
      begin
        idx := Length(ALeituras);
        SetLength(ALeituras, idx + 1);
        ALeituras[idx].UserID := StrToIntDef(sub[0], 0);
        ALeituras[idx].Nome   := rc_DecodeTxtField(sub[1]);
        try
          ALeituras[idx].DataHora := StrToDateTime(sub[2], fs);
        except
          ALeituras[idx].DataHora := Now;
        end;
      end;
    end;
  finally
    items.Free;
    sub.Free;
  end;
end;

procedure rc_RegistraLeitura(var AMsg: TMensagemOnline; pUserID: Integer);
var
  k, nLeit: Integer;
  jaLeu: Boolean;
  uNome: string;
begin
  jaLeu := False;
  for k := 0 to High(AMsg.Leituras) do
  begin
    if AMsg.Leituras[k].UserID = pUserID then
    begin
      jaLeu := True;
      Break;
    end;
  end;

  if not jaLeu then
  begin
    uNome := '';
    if (mm <> nil) and (mm.varI_User = pUserID) and (mm.vUserName <> '') then
      uNome := mm.vUserName;

    if uNome = '' then
    begin
      for k := 0 to High(gListOnline) do
      begin
        if gListOnline[k].ID = pUserID then
        begin
          uNome := gListOnline[k].Nome;
          Break;
        end;
      end;
    end;

    if uNome = '' then
      uNome := 'Usuário #' + IntToStr(pUserID);

    nLeit := Length(AMsg.Leituras);
    SetLength(AMsg.Leituras, nLeit + 1);
    AMsg.Leituras[nLeit].UserID := pUserID;
    AMsg.Leituras[nLeit].Nome := uNome;
    AMsg.Leituras[nLeit].DataHora := Now;
  end;
end;

// ============================================================
// Singleton
// ============================================================
function frmUsuariosOnline: TfrmUsuariosOnline;
begin
  Result := TfrmUsuariosOnline(mm.GetFormInstance(TfrmUsuariosOnline));
end;

procedure rc_AbrirChatUsuariosOnline;
var
  f: TfrmUsuariosOnline;
begin
  try
    f := frmUsuariosOnline;
    try
      if (f.WebForm <> nil) and (f.WebForm.JSInterface <> nil) then
        f.WebForm.JSInterface.JSCall('addCls', ['form-noborder']);
    except
    end;
    f.Show;
  except
  end;
end;

function rc_ChatAbertoUserID: Integer;
var
  f: TComponent;
begin
  Result := 0;
  try
    if (UniApplication <> nil) and (UniApplication.UniMainModule <> nil) then
    begin
      f := UniApplication.UniMainModule.FindComponent('frmUsuariosOnline');
      if (f <> nil) and (f is TfrmUsuariosOnline) and TfrmUsuariosOnline(f).Visible then
        Result := TfrmUsuariosOnline(f).FChatUserID;
    end;
  except
    Result := 0;
  end;
end;

// ============================================================
// Determinacao do nome do arquivo TXT da conversa
// ============================================================
function rc_GetChatFileName(pID1, pID2: Integer): string;
var
  minID, maxID: Integer;
begin
  if (pID1 = -1) or (pID2 = -1) or (pID1 = 0) or (pID2 = 0) then
    Result := 'chat_global.txt'
  else if (pID2 < -100) then
    Result := 'chat_group_' + IntToStr(Abs(pID2) - 100) + '.txt'
  else if (pID1 < -100) then
    Result := 'chat_group_' + IntToStr(Abs(pID1) - 100) + '.txt'
  else
  begin
    minID := rc_MinInt(pID1, pID2);
    maxID := rc_MaxInt(pID1, pID2);
    Result := 'chat_user_' + IntToStr(minID) + '_' + IntToStr(maxID) + '.txt';
  end;
end;

// ============================================================
// Gravacao e sincronizacao de historico em arquivos TXT individuais
// ============================================================
procedure rc_AppendMensagemArquivo(const msg: TMensagemOnline);
var
  fileName, fullPath, sLine, fileContent: string;
  lines: TStringList;
begin
  try
    fileName := rc_GetChatFileName(msg.IDRemetente, msg.IDDestinatario);
    fullPath := rc_GetChatLogsDir + fileName;

    sLine := IntToStr(msg.MsgID) + '|' +
             FormatDateTime('yyyy-mm-dd hh:nn:ss', msg.DataHora) + '|' +
             IntToStr(msg.IDRemetente) + '|' +
             rc_EncodeTxtField(msg.NomeRemetente) + '|' +
             IntToStr(msg.IDDestinatario) + '|' +
             rc_IIF(msg.Apagada, '1', '0') + '|' +
             rc_EncodeTxtField(msg.ImagemURL) + '|' +
             rc_EncodeTxtField(msg.Texto);

    lines := TStringList.Create;
    try
      if rc_SafeReadFile(fullPath, fileContent) then
        lines.Text := fileContent;
      lines.Add(sLine);
      rc_SafeWriteFile(fullPath, lines.Text);
    finally
      lines.Free;
    end;
  except
  end;
end;

procedure rc_AtualizaArquivoConversa(pID1, pID2: Integer);
var
  fullPath, sLine, targetFile: string;
  lines: TStringList;
  i: Integer;
begin
  try
    targetFile := rc_GetChatFileName(pID1, pID2);
    fullPath := rc_GetChatLogsDir + targetFile;
    lines := TStringList.Create;
    try
      gLockOnline.Enter;
      try
        for i := 0 to High(gListMensagens) do
        begin
          if rc_GetChatFileName(gListMensagens[i].IDRemetente, gListMensagens[i].IDDestinatario) = targetFile then
          begin
            sLine := IntToStr(gListMensagens[i].MsgID) + '|' +
                     FormatDateTime('yyyy-mm-dd hh:nn:ss', gListMensagens[i].DataHora) + '|' +
                     IntToStr(gListMensagens[i].IDRemetente) + '|' +
                     rc_EncodeTxtField(gListMensagens[i].NomeRemetente) + '|' +
                     IntToStr(gListMensagens[i].IDDestinatario) + '|' +
                     rc_IIF(gListMensagens[i].Apagada, '1', '0') + '|' +
                     rc_EncodeTxtField(gListMensagens[i].ImagemURL) + '|' +
                     rc_EncodeTxtField(gListMensagens[i].Texto) + '|' +
                     rc_EncodeLeituras(gListMensagens[i].Leituras);
            lines.Add(sLine);
          end;
        end;
      finally
        gLockOnline.Leave;
      end;

      rc_SafeWriteFile(fullPath, lines.Text);
    finally
      lines.Free;
    end;
  except
  end;
end;

procedure rc_CarregaHistoricoConversa(pID1, pID2: Integer);
var
  fileName, fullPath, sLine, fileContent: string;
  lines, parts: TStringList;
  i, nID, nRemet, nDest, idx, foundIdx: Integer;
  dtHora: TDateTime;
  bApagada: Boolean;
  sNomeRemet, sImgURL, sTexto: string;
  fs: TFormatSettings;
begin
  try
    fileName := rc_GetChatFileName(pID1, pID2);
    fullPath := rc_GetChatLogsDir + fileName;

    if not rc_SafeReadFile(fullPath, fileContent) then Exit;
    if Trim(fileContent) = '' then Exit;

    fs.DateSeparator := '-';
    fs.ShortDateFormat := 'yyyy-mm-dd';
    fs.TimeSeparator := ':';
    fs.ShortTimeFormat := 'hh:nn:ss';

    lines := TStringList.Create;
    parts := TStringList.Create;
    try
      lines.Text := fileContent;
      parts.StrictDelimiter := True;
      parts.Delimiter := '|';

      gLockOnline.Enter;
      try
        for i := 0 to lines.Count - 1 do
        begin
          sLine := Trim(lines[i]);
          if sLine = '' then Continue;

          parts.DelimitedText := sLine;
          if parts.Count >= 8 then
          begin
            nID := StrToIntDef(parts[0], 0);
            try
              dtHora := StrToDateTime(parts[1], fs);
            except
              dtHora := Now;
            end;
            nRemet     := StrToIntDef(parts[2], 0);
            sNomeRemet := rc_DecodeTxtField(parts[3]);
            nDest      := StrToIntDef(parts[4], 0);
            bApagada   := parts[5] = '1';
            sImgURL    := rc_DecodeTxtField(parts[6]);
            sTexto     := rc_DecodeTxtField(parts[7]);

            foundIdx := -1;
            for idx := 0 to High(gListMensagens) do
            begin
              if gListMensagens[idx].MsgID = nID then
              begin
                foundIdx := idx;
                Break;
              end;
            end;

            if foundIdx >= 0 then
            begin
              gListMensagens[foundIdx].Apagada := bApagada;
            end
            else
            begin
              idx := Length(gListMensagens);
              SetLength(gListMensagens, idx + 1);
              gListMensagens[idx].MsgID          := nID;
              gListMensagens[idx].DataHora       := dtHora;
              gListMensagens[idx].IDRemetente    := nRemet;
              gListMensagens[idx].NomeRemetente  := sNomeRemet;
              gListMensagens[idx].IDDestinatario := nDest;
              gListMensagens[idx].Texto          := sTexto;
              gListMensagens[idx].Apagada        := bApagada;
              gListMensagens[idx].ImagemURL      := sImgURL;
              SetLength(gListMensagens[idx].LidaPor, 0);
              SetLength(gListMensagens[idx].NotificadaPara, 0);
              SetLength(gListMensagens[idx].Leituras, 0);
              if parts.Count >= 9 then
                rc_DecodeLeituras(parts[8], gListMensagens[idx].Leituras);

              if nID > gMsgSeq then
                gMsgSeq := nID;
            end;
          end;
        end;
      finally
        gLockOnline.Leave;
      end;
    finally
      lines.Free;
      parts.Free;
    end;
  except
  end;
end;

// ============================================================
// Persistencia de Grupos em chat_logs/chat_groups.txt
// ============================================================
procedure rc_SalvaGrupos;
var
  fullPath, sLine, sMembros: string;
  lines: TStringList;
  i, j: Integer;
begin
  try
    fullPath := rc_GetChatLogsDir + 'chat_groups.txt';
    lines := TStringList.Create;
    try
      for i := 0 to High(gListGrupos) do
      begin
        sMembros := '';
        for j := 0 to High(gListGrupos[i].Membros) do
        begin
          if sMembros <> '' then sMembros := sMembros + ',';
          sMembros := sMembros + IntToStr(gListGrupos[i].Membros[j].UserID) + ':' +
                      rc_EncodeTxtField(gListGrupos[i].Membros[j].Nome) + ':' +
                      rc_IIF(gListGrupos[i].Membros[j].PodeVer, '1', '0') + ':' +
                      rc_IIF(gListGrupos[i].Membros[j].PodeEnviar, '1', '0');
        end;

        sLine := IntToStr(gListGrupos[i].GroupID) + '|' +
                 rc_EncodeTxtField(gListGrupos[i].Nome) + '|' +
                 IntToStr(gListGrupos[i].CriadorID) + '|' +
                 FormatDateTime('yyyy-mm-dd hh:nn:ss', gListGrupos[i].DataCriacao) + '|' +
                 sMembros;
        lines.Add(sLine);
      end;

      rc_SafeWriteFile(fullPath, lines.Text);
    finally
      lines.Free;
    end;
  except
  end;
end;

procedure rc_CarregaGrupos;
var
  fullPath, sLine, fileContent: string;
  lines, parts, mParts, itemParts: TStringList;
  i, j, nGID, nCriad, idxG, idxM: Integer;
  dtCriac: TDateTime;
  fs: TFormatSettings;
begin
  try
    fullPath := rc_GetChatLogsDir + 'chat_groups.txt';
    if not rc_SafeReadFile(fullPath, fileContent) then Exit;
    if Trim(fileContent) = '' then Exit;

    fs.DateSeparator := '-';
    fs.ShortDateFormat := 'yyyy-mm-dd';
    fs.TimeSeparator := ':';
    fs.ShortTimeFormat := 'hh:nn:ss';

    lines     := TStringList.Create;
    parts     := TStringList.Create;
    mParts    := TStringList.Create;
    itemParts := TStringList.Create;
    try
      lines.Text := fileContent;
      parts.StrictDelimiter := True;
      parts.Delimiter := '|';
      mParts.StrictDelimiter := True;
      mParts.Delimiter := ',';
      itemParts.StrictDelimiter := True;
      itemParts.Delimiter := ':';

      gLockOnline.Enter;
      try
        SetLength(gListGrupos, 0);

        for i := 0 to lines.Count - 1 do
        begin
          sLine := Trim(lines[i]);
          if sLine = '' then Continue;

          parts.DelimitedText := sLine;
          if parts.Count >= 5 then
          begin
            nGID := StrToIntDef(parts[0], 0);
            nCriad := StrToIntDef(parts[2], 0);
            try
              dtCriac := StrToDateTime(parts[3], fs);
            except
              dtCriac := Now;
            end;

            idxG := Length(gListGrupos);
            SetLength(gListGrupos, idxG + 1);
            gListGrupos[idxG].GroupID     := nGID;
            gListGrupos[idxG].Nome        := rc_DecodeTxtField(parts[1]);
            gListGrupos[idxG].CriadorID   := nCriad;
            gListGrupos[idxG].DataCriacao := dtCriac;
            SetLength(gListGrupos[idxG].Membros, 0);

            if nGID >= gNextGroupID then
              gNextGroupID := nGID + 1;

            mParts.DelimitedText := parts[4];
            for j := 0 to mParts.Count - 1 do
            begin
              itemParts.DelimitedText := mParts[j];
              if itemParts.Count >= 4 then
              begin
                idxM := Length(gListGrupos[idxG].Membros);
                SetLength(gListGrupos[idxG].Membros, idxM + 1);
                gListGrupos[idxG].Membros[idxM].UserID     := StrToIntDef(itemParts[0], 0);
                gListGrupos[idxG].Membros[idxM].Nome       := rc_DecodeTxtField(itemParts[1]);
                gListGrupos[idxG].Membros[idxM].PodeVer    := itemParts[2] = '1';
                gListGrupos[idxG].Membros[idxM].PodeEnviar := itemParts[3] = '1';
              end;
            end;
          end;
        end;
      finally
        gLockOnline.Leave;
      end;
    finally
      lines.Free;
      parts.Free;
      mParts.Free;
      itemParts.Free;
    end;
  except
  end;
end;

function rc_UsuarioPodeVerGrupo(pGroupID, pUserID: Integer; const pUserMaster: string): Boolean;
var
  i, j: Integer;
begin
  Result := False;
  if (UpperCase(Trim(pUserMaster)) = 'S') or (pUserMaster = mm.VALUE_YES) then
  begin
    Result := True;
    Exit;
  end;

  for i := 0 to High(gListGrupos) do
  begin
    if gListGrupos[i].GroupID = pGroupID then
    begin
      if gListGrupos[i].CriadorID = pUserID then
      begin
        Result := True;
        Exit;
      end;

      for j := 0 to High(gListGrupos[i].Membros) do
      begin
        if (gListGrupos[i].Membros[j].UserID = pUserID) and gListGrupos[i].Membros[j].PodeVer then
        begin
          Result := True;
          Exit;
        end;
      end;
      Exit;
    end;
  end;
end;

function rc_UsuarioPodeEnviarGrupo(pGroupID, pUserID: Integer; const pUserMaster: string): Boolean;
var
  i, j: Integer;
begin
  Result := False;
  if (UpperCase(Trim(pUserMaster)) = 'S') or (pUserMaster = mm.VALUE_YES) then
  begin
    Result := True;
    Exit;
  end;

  for i := 0 to High(gListGrupos) do
  begin
    if gListGrupos[i].GroupID = pGroupID then
    begin
      if gListGrupos[i].CriadorID = pUserID then
      begin
        Result := True;
        Exit;
      end;

      for j := 0 to High(gListGrupos[i].Membros) do
      begin
        if (gListGrupos[i].Membros[j].UserID = pUserID) and gListGrupos[i].Membros[j].PodeEnviar then
        begin
          Result := True;
          Exit;
        end;
      end;
      Exit;
    end;
  end;
end;

procedure rc_CriaNovoGrupo(const pNome: string; pCriadorID: Integer; const pCriadorNome, pMembrosConfig: string);
var
  newGrp: TGrupoChat;
  idxG, idxM, j, uID: Integer;
  items, sub: TStringList;
  canSend, canView: Boolean;
  uNome: string;
begin
  if Trim(pNome) = '' then Exit;

  rc_CarregaGrupos;

  newGrp.GroupID := gNextGroupID;
  Inc(gNextGroupID);
  newGrp.Nome := Trim(pNome);
  newGrp.CriadorID := pCriadorID;
  newGrp.DataCriacao := Now;

  SetLength(newGrp.Membros, 1);
  newGrp.Membros[0].UserID     := pCriadorID;
  newGrp.Membros[0].Nome       := pCriadorNome;
  newGrp.Membros[0].PodeVer    := True;
  newGrp.Membros[0].PodeEnviar := True;

  items := TStringList.Create;
  sub   := TStringList.Create;
  try
    items.StrictDelimiter := True;
    items.Delimiter := ',';
    sub.StrictDelimiter := True;
    sub.Delimiter := ':';

    items.DelimitedText := pMembrosConfig;
    for j := 0 to items.Count - 1 do
    begin
      sub.DelimitedText := items[j];
      if sub.Count >= 4 then
      begin
        uID := StrToIntDef(sub[0], 0);
        uNome := rc_DecodeTxtField(sub[1]);
        canView := sub[2] = '1';
        canSend := sub[3] = '1';

        if (uID > 0) and (uID <> pCriadorID) then
        begin
          idxM := Length(newGrp.Membros);
          SetLength(newGrp.Membros, idxM + 1);
          newGrp.Membros[idxM].UserID     := uID;
          newGrp.Membros[idxM].Nome       := uNome;
          newGrp.Membros[idxM].PodeVer    := canView;
          newGrp.Membros[idxM].PodeEnviar := canSend;
        end;
      end;
    end;
  finally
    items.Free;
    sub.Free;
  end;

  idxG := Length(gListGrupos);
  SetLength(gListGrupos, idxG + 1);
  gListGrupos[idxG] := newGrp;

  rc_SalvaGrupos;
end;

// ============================================================
// Registro de usuarios online compartilhado (Multi-Node / HyperServer)
// ============================================================
function rc_ResolveAvatarURL(const pAvatarPath: string): string;
var
  fn: string;
begin
  Result := '';
  fn := ExtractFileName(Trim(pAvatarPath));
  if fn <> '' then
  begin
    if (Pos('uploads/', LowerCase(pAvatarPath)) > 0) or (Pos('http', LowerCase(pAvatarPath)) = 1) then
      Result := pAvatarPath
    else
      Result := 'uploads/usuarios/' + fn;
  end;
end;

procedure rc_SincronizaUsuariosOnlineDisco(pAtualizarUserID: Integer = 0; pNome: string = ''; pLogin: string = ''; pEmpresa: string = ''; pIP: string = ''; pDispositivo: string = ''; pAvatar: string = ''; pRemoverUserID: Integer = 0);
var
  filePath, fileContent, line: string;
  lines, parts, outLines: TStringList;
  i, nID, foundIdx: Integer;
  dtLogin, dtPing: TDateTime;
  fs: TFormatSettings;
  bFound: Boolean;
  sAv: string;
begin
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-mm-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:nn:ss';

  filePath := rc_GetChatLogsDir + 'users_online.txt';
  sAv := rc_ResolveAvatarURL(pAvatar);

  gLockOnline.Enter;
  try
    lines := TStringList.Create;
    parts := TStringList.Create;
    outLines := TStringList.Create;
    try
      parts.StrictDelimiter := True;
      parts.Delimiter := '|';

      if rc_SafeReadFile(filePath, fileContent) then
      begin
        lines.Text := fileContent;
        SetLength(gListOnline, 0);

        for i := 0 to lines.Count - 1 do
        begin
          line := Trim(lines[i]);
          if line = '' then Continue;
          parts.DelimitedText := line;
          if parts.Count >= 9 then
          begin
            nID := StrToIntDef(parts[0], 0);
            if nID <= 0 then Continue;
            if (pRemoverUserID > 0) and (nID = pRemoverUserID) then Continue;

            try dtPing := StrToDateTime(parts[8], fs); except dtPing := Now; end;
            try dtLogin := StrToDateTime(parts[7], fs); except dtLogin := Now; end;

            // Se o ping for mais recente que 35 segundos, o usuario esta ativo
            if (Now - dtPing) * 86400 <= 35.0 then
            begin
              foundIdx := Length(gListOnline);
              SetLength(gListOnline, foundIdx + 1);
              gListOnline[foundIdx].ID          := nID;
              gListOnline[foundIdx].Nome        := rc_DecodeTxtField(parts[1]);
              gListOnline[foundIdx].Login       := rc_DecodeTxtField(parts[2]);
              gListOnline[foundIdx].Empresa     := rc_DecodeTxtField(parts[3]);
              gListOnline[foundIdx].IP          := rc_DecodeTxtField(parts[4]);
              gListOnline[foundIdx].Dispositivo := rc_DecodeTxtField(parts[5]);
              gListOnline[foundIdx].AvatarURL   := rc_DecodeTxtField(parts[6]);
              gListOnline[foundIdx].HoraLogin   := dtLogin;
              gListOnline[foundIdx].UltimoPing  := dtPing;
            end;
          end;
        end;
      end;

      // Se temos um usuario para registrar ou atualizar o ping agora
      if pAtualizarUserID > 0 then
      begin
        bFound := False;
        for i := 0 to High(gListOnline) do
        begin
          if gListOnline[i].ID = pAtualizarUserID then
          begin
            if pNome <> '' then gListOnline[i].Nome := pNome;
            if pLogin <> '' then gListOnline[i].Login := pLogin;
            if pEmpresa <> '' then gListOnline[i].Empresa := pEmpresa;
            if pIP <> '' then gListOnline[i].IP := pIP;
            if pDispositivo <> '' then gListOnline[i].Dispositivo := pDispositivo;
            if sAv <> '' then gListOnline[i].AvatarURL := sAv;
            gListOnline[i].UltimoPing := Now;
            bFound := True;
            Break;
          end;
        end;

        if not bFound then
        begin
          foundIdx := Length(gListOnline);
          SetLength(gListOnline, foundIdx + 1);
          gListOnline[foundIdx].ID          := pAtualizarUserID;
          gListOnline[foundIdx].Nome        := pNome;
          gListOnline[foundIdx].Login       := pLogin;
          gListOnline[foundIdx].Empresa     := pEmpresa;
          gListOnline[foundIdx].IP          := pIP;
          gListOnline[foundIdx].Dispositivo := pDispositivo;
          gListOnline[foundIdx].AvatarURL   := sAv;
          gListOnline[foundIdx].HoraLogin   := Now;
          gListOnline[foundIdx].UltimoPing  := Now;
        end;
      end;

      // Grava a lista consolidada atualizada no disco para todos os nodes do HyperServer
      for i := 0 to High(gListOnline) do
      begin
        outLines.Add(IntToStr(gListOnline[i].ID) + '|' +
                     rc_EncodeTxtField(gListOnline[i].Nome) + '|' +
                     rc_EncodeTxtField(gListOnline[i].Login) + '|' +
                     rc_EncodeTxtField(gListOnline[i].Empresa) + '|' +
                     rc_EncodeTxtField(gListOnline[i].IP) + '|' +
                     rc_EncodeTxtField(gListOnline[i].Dispositivo) + '|' +
                     rc_EncodeTxtField(gListOnline[i].AvatarURL) + '|' +
                     FormatDateTime('yyyy-mm-dd hh:nn:ss', gListOnline[i].HoraLogin) + '|' +
                     FormatDateTime('yyyy-mm-dd hh:nn:ss', gListOnline[i].UltimoPing));
      end;

      rc_SafeWriteFile(filePath, outLines.Text);
    finally
      outLines.Free;
      parts.Free;
      lines.Free;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

function rc_TotalUsuariosOnline: Integer;
begin
  rc_SincronizaUsuariosOnlineDisco(0, '', '', '', '', '', '', 0);
  Result := Length(gListOnline);
end;

procedure rc_RegistraUsuarioOnline(pID: Integer; pNome, pLogin,
  pEmpresa, pIP, pDispositivo: string; pAvatar: string = '');
begin
  if pID <= 0 then Exit;
  rc_SincronizaUsuariosOnlineDisco(pID, pNome, pLogin, pEmpresa, pIP, pDispositivo, pAvatar, 0);
end;

procedure rc_RemoveUsuarioOnline(pID: Integer);
begin
  if pID <= 0 then Exit;
  rc_SincronizaUsuariosOnlineDisco(0, '', '', '', '', '', '', pID);
end;

// ============================================================
// Envio e Gerenciamento de Mensagens
// ============================================================
procedure rc_AppendNotificacaoPendenteDisco(const msg: TMensagemOnline);
var
  filePath, sLine, fileContent: string;
  lines: TStringList;
begin
  // Mensagem enviada para si mesmo nao gera notificacao pendente nem popup
  if (msg.IDDestinatario > 0) and (msg.IDDestinatario = msg.IDRemetente) then Exit;
  filePath := rc_GetChatLogsDir + 'chat_pending_notifications.txt';
  sLine := IntToStr(msg.MsgID) + '|' +
           FormatDateTime('yyyy-mm-dd hh:nn:ss', msg.DataHora) + '|' +
           IntToStr(msg.IDRemetente) + '|' +
           rc_EncodeTxtField(msg.NomeRemetente) + '|' +
           rc_EncodeTxtField(msg.AvatarRemetente) + '|' +
           IntToStr(msg.IDDestinatario) + '|' +
           rc_EncodeTxtField(msg.Texto) + '|' +
           rc_EncodeTxtField(msg.ImagemURL) + '|' +
           IntToStr(msg.IDRemetente);

  lines := TStringList.Create;
  try
    if rc_SafeReadFile(filePath, fileContent) then
      lines.Text := fileContent;
    lines.Add(sLine);
    rc_SafeWriteFile(filePath, lines.Text);
  finally
    lines.Free;
  end;
end;

procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto, pImagemURL, pAvatarURL: string); overload;
var
  idx: Integer;
  msg: TMensagemOnline;
begin
  gLockOnline.Enter;
  try
    Inc(gMsgSeq);
    idx := Length(gListMensagens);
    SetLength(gListMensagens, idx + 1);

    gListMensagens[idx].MsgID          := gMsgSeq;
    gListMensagens[idx].DataHora       := Now;
    gListMensagens[idx].IDRemetente    := pIDRemet;
    gListMensagens[idx].NomeRemetente  := pRemetente;
    gListMensagens[idx].AvatarRemetente:= rc_ResolveAvatarURL(pAvatarURL);
    gListMensagens[idx].IDDestinatario := pIDDest;
    gListMensagens[idx].Texto          := pTexto;
    gListMensagens[idx].Apagada        := False;
    gListMensagens[idx].ImagemURL      := pImagemURL;
    SetLength(gListMensagens[idx].LidaPor, 1);
    gListMensagens[idx].LidaPor[0]     := pIDRemet;
    SetLength(gListMensagens[idx].NotificadaPara, 1);
    gListMensagens[idx].NotificadaPara[0] := pIDRemet;
    SetLength(gListMensagens[idx].Leituras, 0);

    msg := gListMensagens[idx];
  finally
    gLockOnline.Leave;
  end;

  rc_AppendMensagemArquivo(msg);
  if (msg.IDDestinatario <= 0) or (msg.IDDestinatario <> msg.IDRemetente) then
    rc_AppendNotificacaoPendenteDisco(msg);
end;

procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto, pImagemURL: string); overload;
begin
  rc_EnviaMensagem(pIDDest, pIDRemet, pRemetente, pTexto, pImagemURL, '');
end;

procedure rc_EnviaMensagem(pIDDest, pIDRemet: Integer; pRemetente, pTexto: string); overload;
begin
  rc_EnviaMensagem(pIDDest, pIDRemet, pRemetente, pTexto, '');
end;

procedure rc_EnviaMensagem(pIDDest: Integer; pRemetente, pTexto: string); overload;
begin
  rc_EnviaMensagem(pIDDest, 0, pRemetente, pTexto, '');
end;

procedure rc_EnviaMensagemGrupo(pGroupID, pIDRemet: Integer; pNomeRemet, pTexto, pImagemURL, pAvatarURL: string); overload;
begin
  rc_EnviaMensagem(-100 - pGroupID, pIDRemet, pNomeRemet, pTexto, pImagemURL, pAvatarURL);
end;

procedure rc_EnviaMensagemGrupo(pGroupID, pIDRemet: Integer; pNomeRemet, pTexto, pImagemURL: string); overload;
begin
  rc_EnviaMensagemGrupo(pGroupID, pIDRemet, pNomeRemet, pTexto, pImagemURL, '');
end;

function rc_ApagaMensagem(pMsgID, pUserID: Integer): Boolean;
var
  i, idRemet, idDest: Integer;
  sFileFull: string;
begin
  Result := False;
  idRemet := 0;
  idDest  := 0;

  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if gListMensagens[i].MsgID = pMsgID then
      begin
        if (gListMensagens[i].IDRemetente = pUserID) or (pUserID = 0) then
        begin
          if gListMensagens[i].ImagemURL <> '' then
          begin
            try
              sFileFull := ExtractFilePath(ParamStr(0)) + StringReplace(gListMensagens[i].ImagemURL, '/', '\', [rfReplaceAll]);
              if FileExists(sFileFull) then
                DeleteFile(sFileFull);
            except
            end;
          end;

          gListMensagens[i].Apagada   := True;
          gListMensagens[i].Texto     := '';
          gListMensagens[i].ImagemURL := '';
          idRemet := gListMensagens[i].IDRemetente;
          idDest  := gListMensagens[i].IDDestinatario;
          Result := True;
        end;
        Break;
      end;
    end;
  finally
    gLockOnline.Leave;
  end;

  if Result then
    rc_AtualizaArquivoConversa(idRemet, idDest);
end;

function rc_BuscaMensagemPendente(pIDUser, pChatAbertoID: Integer;
  var vRemetente, vTexto, vImagemURL, vAvatarURL: string): Boolean; overload;
var
  filePath, fileContent, line: string;
  lines, parts, notifList, outLines: TStringList;
  i, nRemet, nDest, gID: Integer;
  dtHora: TDateTime;
  fs: TFormatSettings;
  podeVer, jaNotificada, modified: Boolean;
begin
  Result := False;
  vRemetente := '';
  vTexto     := '';
  vImagemURL := '';
  vAvatarURL := '';

  if pIDUser <= 0 then Exit;

  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-mm-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:nn:ss';

  filePath := rc_GetChatLogsDir + 'chat_pending_notifications.txt';

  gLockOnline.Enter;
  try
    if not rc_SafeReadFile(filePath, fileContent) then Exit;
    if Trim(fileContent) = '' then Exit;

    lines := TStringList.Create;
    parts := TStringList.Create;
    notifList := TStringList.Create;
    outLines := TStringList.Create;
    try
      lines.Text := fileContent;
      parts.StrictDelimiter := True;
      parts.Delimiter := '|';
      notifList.StrictDelimiter := True;
      notifList.Delimiter := ',';
      modified := False;

      for i := 0 to lines.Count - 1 do
      begin
        line := Trim(lines[i]);
        if line = '' then Continue;
        parts.DelimitedText := line;
        if parts.Count >= 9 then
        begin
          try dtHora := StrToDateTime(parts[1], fs); except dtHora := Now; end;

          // Descarta notificacoes mais antigas que 90 segundos
          if (Now - dtHora) * 86400 > 90.0 then
          begin
            modified := True;
            Continue;
          end;

          nRemet := StrToIntDef(parts[2], 0);
          nDest  := StrToIntDef(parts[5], 0);

          notifList.DelimitedText := parts[8];

          if (nRemet <> pIDUser) and (not Result) then
          begin
            podeVer := False;
            if (nDest = -1) or (nDest = 0) then
              podeVer := True
            else if (nDest = pIDUser) then
              podeVer := True
            else if (nDest < -100) then
            begin
              gID := Abs(nDest) - 100;
              podeVer := (gID > 0);
            end;

            if podeVer then
            begin
              jaNotificada := notifList.IndexOf(IntToStr(pIDUser)) >= 0;
              if not jaNotificada then
              begin
                notifList.Add(IntToStr(pIDUser));
                parts[8] := notifList.DelimitedText;
                modified := True;

                // Suprime popup se o chat com este remetente/grupo ja estiver aberto
                if (pChatAbertoID = 0) or
                   ((pChatAbertoID > 0) and (nDest = pIDUser) and (pChatAbertoID <> nRemet)) or
                   ((pChatAbertoID > 0) and (nDest < -100) and (pChatAbertoID <> nDest)) or
                   ((pChatAbertoID = -1) and (nDest > 0) and (nDest <> -1)) then
                begin
                  vRemetente := rc_DecodeTxtField(parts[3]);
                  vAvatarURL := rc_DecodeTxtField(parts[4]);
                  vTexto     := rc_DecodeTxtField(parts[6]);
                  vImagemURL := rc_DecodeTxtField(parts[7]);
                  Result     := True;
                end;
              end;
            end;
          end;

          outLines.Add(parts[0] + '|' + parts[1] + '|' + parts[2] + '|' + parts[3] + '|' +
                       parts[4] + '|' + parts[5] + '|' + parts[6] + '|' + parts[7] + '|' + parts[8]);
        end;
      end;

      if modified then
        rc_SafeWriteFile(filePath, outLines.Text);
    finally
      outLines.Free;
      notifList.Free;
      parts.Free;
      lines.Free;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

function rc_BuscaMensagemPendente(pIDUser: Integer; var vRemetente, vTexto: string): Boolean; overload;
var
  vImg, vAv: string;
begin
  Result := rc_BuscaMensagemPendente(pIDUser, 0, vRemetente, vTexto, vImg, vAv);
end;

function rc_TotalNaoLidas(pIDDest, pIDRemet: Integer): Integer;
var
  i, j: Integer;
  jaLida: Boolean;
begin
  Result := 0;
  if (pIDDest > 0) and (pIDDest = pIDRemet) then Exit;
  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if (gListMensagens[i].IDRemetente = pIDRemet) and
         (gListMensagens[i].IDDestinatario = pIDDest) and
         (not gListMensagens[i].Apagada) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pIDDest then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
          Inc(Result);
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

function rc_TotalNaoLidasGlobal(pUserID: Integer): Integer;
var
  i, j: Integer;
  jaLida: Boolean;
begin
  Result := 0;
  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if ((gListMensagens[i].IDDestinatario = -1) or (gListMensagens[i].IDDestinatario = 0)) and
         (gListMensagens[i].IDRemetente <> pUserID) and
         (not gListMensagens[i].Apagada) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pUserID then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
          Inc(Result);
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

procedure rc_MarcarComoLidasGlobal(pUserID: Integer);
var
  i, j, nLen: Integer;
  jaLida: Boolean;
begin
  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if ((gListMensagens[i].IDDestinatario = -1) or (gListMensagens[i].IDDestinatario = 0)) and
         (gListMensagens[i].IDRemetente <> pUserID) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pUserID then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
        begin
          nLen := Length(gListMensagens[i].LidaPor);
          SetLength(gListMensagens[i].LidaPor, nLen + 1);
          gListMensagens[i].LidaPor[nLen] := pUserID;
        end;
        rc_RegistraLeitura(gListMensagens[i], pUserID);
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;


// ============================================================
// Notificacao estilo MSN Messenger no canto inferior direito
// ============================================================

function rc_ExcluiGrupo(pGroupID, pUserID: Integer; pIsMaster: Boolean): Boolean;
var
  i, j, k, nLen: Integer;
  sLogFile: string;
begin
  Result := False;
  gLockOnline.Enter;
  try
    nLen := Length(gListGrupos);
    for i := 0 to nLen - 1 do
    begin
      if gListGrupos[i].GroupID = pGroupID then
      begin
        if pIsMaster or (gListGrupos[i].CriadorID = pUserID) then
        begin
          for j := i to nLen - 2 do
            gListGrupos[j] := gListGrupos[j + 1];
          SetLength(gListGrupos, nLen - 1);
          Result := True;

          // Remove mensagens do grupo da memoria
          for j := High(gListMensagens) downto 0 do
          begin
            if gListMensagens[j].IDDestinatario = (-100 - pGroupID) then
            begin
              for k := j to High(gListMensagens) - 1 do
                gListMensagens[k] := gListMensagens[k + 1];
              SetLength(gListMensagens, Length(gListMensagens) - 1);
            end;
          end;
          Inc(gMsgSeq);

          Break;
        end;
      end;
    end;
  finally
    gLockOnline.Leave;
  end;

  if Result then
  begin
    rc_SalvaGrupos;
    sLogFile := rc_GetChatLogsDir + 'chat_group_' + IntToStr(pGroupID) + '.txt';
    try
      if FileExists(sLogFile) then
        DeleteFile(sLogFile);
    except
    end;
  end;
end;

function rc_RemoveMembroGrupo(pGroupID, pMemberUID, pUserID: Integer; pIsMaster: Boolean): Boolean;
var
  i, j, k, nLen: Integer;
begin
  Result := False;
  gLockOnline.Enter;
  try
    for i := 0 to High(gListGrupos) do
    begin
      if gListGrupos[i].GroupID = pGroupID then
      begin
        if pIsMaster or (gListGrupos[i].CriadorID = pUserID) then
        begin
          nLen := Length(gListGrupos[i].Membros);
          for j := 0 to nLen - 1 do
          begin
            if gListGrupos[i].Membros[j].UserID = pMemberUID then
            begin
              for k := j to nLen - 2 do
                gListGrupos[i].Membros[k] := gListGrupos[i].Membros[k + 1];
              SetLength(gListGrupos[i].Membros, nLen - 1);
              Result := True;
              Break;
            end;
          end;
        end;
        Break;
      end;
    end;
  finally
    gLockOnline.Leave;
  end;

  if Result then
    rc_SalvaGrupos;
end;

// ============================================================
// Utilitarios de Documentos Anexos (PDF, Word, Excel, Bloco de Notas)
// ============================================================
function rc_IsImagem(const pURL: string): Boolean;
var
  ext: string;
begin
  ext := LowerCase(ExtractFileExt(pURL));
  Result := (ext = '.jpg') or (ext = '.jpeg') or (ext = '.png') or
            (ext = '.webp') or (ext = '.gif') or (ext = '.jfif') or
            (ext = '.bmp');
end;

function rc_IsDocumento(const pURL: string): Boolean;
var
  ext: string;
begin
  // Se for qualquer formato de imagem, NUNCA trata como documento genérico!
  if rc_IsImagem(pURL) then
    Exit(False);

  ext := LowerCase(ExtractFileExt(pURL));
  Result := (ext = '.pdf') or (ext = '.doc') or (ext = '.docx') or
            (ext = '.xls') or (ext = '.xlsx') or (ext = '.csv') or
            (ext = '.txt') or (ext = '.rtf') or
            (Pos('/pdf/', LowerCase(pURL)) > 0) or
            (Pos('/docs/', LowerCase(pURL)) > 0);
end;

procedure rc_GetDocInfo(const pURL: string; var vExt, vBadge, vColor, vIconLabel, vDesc: string);
begin
  vExt := LowerCase(ExtractFileExt(pURL));
  if (vExt = '.pdf') or (Pos('/pdf/', LowerCase(pURL)) > 0) then
  begin
    vBadge     := 'PDF';
    vColor     := '#ef4444';
    vIconLabel := 'PDF';
    vDesc      := 'Arquivo PDF';
  end
  else if (vExt = '.doc') or (vExt = '.docx') or (vExt = '.rtf') then
  begin
    vBadge     := 'DOC';
    vColor     := '#2563eb';
    vIconLabel := 'DOC';
    vDesc      := 'Documento Word';
  end
  else if (vExt = '.xls') or (vExt = '.xlsx') or (vExt = '.csv') then
  begin
    vBadge     := 'XLS';
    vColor     := '#16a34a';
    vIconLabel := 'XLS';
    vDesc      := 'Planilha Excel';
  end
  else if vExt = '.txt' then
  begin
    vBadge     := 'TXT';
    vColor     := '#f59e0b';
    vIconLabel := 'TXT';
    vDesc      := 'Bloco de Notas (TXT)';
  end
  else
  begin
    vBadge     := 'ARQ';
    vColor     := '#64748b';
    vIconLabel := 'ARQ';
    vDesc      := 'Arquivo Anexo';
  end;
end;

procedure rc_ShowMSNPopup(const pRemetente, pTexto: string); overload;
begin
  rc_ShowMSNPopup(pRemetente, pTexto, '', '');
end;

procedure rc_ShowMSNPopup(const pRemetente, pTexto, pImagemURL, pAvatarURL: string); overload;
var
  js, sInit, sNome, sMsg, sExt, sFileName: string;
begin
  sNome := rc_EscapeHTML(pRemetente);

  // Avatar com foto ou iniciais
  if (Trim(pAvatarURL) <> '') and (Pos('default', LowerCase(pAvatarURL)) = 0) then
  begin
    sInit := '<img src="' + rc_EscapeHTML(pAvatarURL) + '" style="width:100%;height:100%;border-radius:50%;object-fit:cover;">';
  end
  else
  begin
    sInit := Copy(Trim(pRemetente), 1, 2);
    if sInit = '' then sInit := 'MS';
    sInit := UpperCase(sInit);
  end;

  sExt := LowerCase(ExtractFileExt(pImagemURL));
  sFileName := rc_EscapeHTML(pTexto);
  if sFileName = '' then sFileName := ExtractFileName(pImagemURL);
  if sFileName = '' then sFileName := 'Arquivo';

  if (sExt = '.pdf') or (Pos('/pdf/', LowerCase(pImagemURL)) > 0) then
  begin
    sMsg := '<div style="display:flex;align-items:center;gap:7px;background:rgba(239,68,68,0.22);border:1px solid #ef4444;border-radius:7px;padding:4px 8px;margin-top:2px;">' +
      '<span style="background:#ef4444;color:#ffffff;font-weight:900;font-size:10px;padding:2px 6px;border-radius:4px;box-shadow:0 1px 4px rgba(239,68,68,0.4);">PDF</span>' +
      '<div style="flex:1;min-width:0;"><div style="font-size:9.5px;font-weight:800;color:#f87171;line-height:1;">ARQUIVO PDF RECEBIDO</div>' +
      '<div style="font-size:11px;color:#ffffff;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.2;margin-top:2px;">' + sFileName + '</div></div></div>';
  end
  else if (sExt = '.doc') or (sExt = '.docx') or (sExt = '.rtf') then
  begin
    sMsg := '<div style="display:flex;align-items:center;gap:7px;background:rgba(37,99,235,0.22);border:1px solid #3b82f6;border-radius:7px;padding:4px 8px;margin-top:2px;">' +
      '<span style="background:#2563eb;color:#ffffff;font-weight:900;font-size:10px;padding:2px 6px;border-radius:4px;box-shadow:0 1px 4px rgba(37,99,235,0.4);">DOC</span>' +
      '<div style="flex:1;min-width:0;"><div style="font-size:9.5px;font-weight:800;color:#93c5fd;line-height:1;">DOCUMENTO WORD RECEBIDO</div>' +
      '<div style="font-size:11px;color:#ffffff;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.2;margin-top:2px;">' + sFileName + '</div></div></div>';
  end
  else if (sExt = '.xls') or (sExt = '.xlsx') or (sExt = '.csv') then
  begin
    sMsg := '<div style="display:flex;align-items:center;gap:7px;background:rgba(22,163,74,0.22);border:1px solid #22c55e;border-radius:7px;padding:4px 8px;margin-top:2px;">' +
      '<span style="background:#16a34a;color:#ffffff;font-weight:900;font-size:10px;padding:2px 6px;border-radius:4px;box-shadow:0 1px 4px rgba(22,163,74,0.4);">XLS</span>' +
      '<div style="flex:1;min-width:0;"><div style="font-size:9.5px;font-weight:800;color:#86efac;line-height:1;">PLANILHA EXCEL RECEBIDA</div>' +
      '<div style="font-size:11px;color:#ffffff;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.2;margin-top:2px;">' + sFileName + '</div></div></div>';
  end
  else if sExt = '.txt' then
  begin
    sMsg := '<div style="display:flex;align-items:center;gap:7px;background:rgba(245,158,11,0.22);border:1px solid #f59e0b;border-radius:7px;padding:4px 8px;margin-top:2px;">' +
      '<span style="background:#f59e0b;color:#ffffff;font-weight:900;font-size:10px;padding:2px 6px;border-radius:4px;box-shadow:0 1px 4px rgba(245,158,11,0.4);">TXT</span>' +
      '<div style="flex:1;min-width:0;"><div style="font-size:9.5px;font-weight:800;color:#fde68a;line-height:1;">BLOCO DE NOTAS RECEBIDO</div>' +
      '<div style="font-size:11px;color:#ffffff;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.2;margin-top:2px;">' + sFileName + '</div></div></div>';
  end
  else if Trim(pImagemURL) <> '' then
  begin
    sMsg := '<div style="display:flex;align-items:center;gap:7px;background:rgba(34,197,94,0.22);border:1px solid #22c55e;border-radius:7px;padding:4px 8px;margin-top:2px;">' +
      '<span style="font-size:13px;">&#128247;</span><div style="flex:1;min-width:0;"><div style="font-size:9.5px;font-weight:800;color:#86efac;line-height:1;">FOTO RECEBIDA</div>' +
      '<div style="font-size:11px;color:#ffffff;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.2;margin-top:2px;">' + sFileName + '</div></div></div>';
  end
  else
  begin
    sMsg := rc_EscapeHTML(pTexto);
    if sMsg = '' then sMsg := 'Nova mensagem recebida';
  end;

  sInit := StringReplace(sInit, '''', '\''', [rfReplaceAll]);

  sNome := StringReplace(sNome, '\', '\\', [rfReplaceAll]);
  sNome := StringReplace(sNome, '''', '\''', [rfReplaceAll]);
  sNome := StringReplace(sNome, #13, ' ', [rfReplaceAll]);
  sNome := StringReplace(sNome, #10, ' ', [rfReplaceAll]);

  sMsg := StringReplace(sMsg, '\', '\\', [rfReplaceAll]);
  sMsg := StringReplace(sMsg, '''', '\''', [rfReplaceAll]);
  sMsg := StringReplace(sMsg, #13, ' ', [rfReplaceAll]);
  sMsg := StringReplace(sMsg, #10, ' ', [rfReplaceAll]);

  js :=
    '(function(){' +
    '  var topDoc = (window.top && window.top.document) ? window.top.document : document;' +
    '  var old = topDoc.getElementById("msnChatToast");' +
    '  if(old) old.remove();' +
    '  var t = topDoc.createElement("div");' +
    '  t.id = "msnChatToast";' +
    '  t.style.cssText = "position:fixed;bottom:22px;right:22px;width:315px;max-width:88vw;' +
    'background:linear-gradient(145deg,#061a13 0%,#0c3325 55%,#08241a 100%);' +
    'border:1px solid #22c55e;border-radius:14px;box-shadow:0 14px 40px rgba(0,0,0,0.75),0 0 18px rgba(34,197,94,0.35);' +
    'z-index:9999999;font-family:Segoe UI,Roboto,sans-serif;color:#f8fafc;' +
    'transform:translateY(130%);transition:transform 0.4s cubic-bezier(0.16,1,0.3,1),opacity 0.4s ease;' +
    'overflow:hidden;cursor:pointer;user-select:none;";' +
    '  t.innerHTML = ' +
    '    ''<div style="padding:8px 12px;background:rgba(4,18,13,0.8);border-bottom:1px solid rgba(34,197,94,0.3);display:flex' + ';align-items:center;justify-content:space-between;">'' +' +
    '      ''<div style="display:flex;align-items:center;gap:6px;font-size:11px;font-weight:700;color:#86efac;letter-spacing:0.4px;">'' +' +
    '        ''<span style="font-size:13px;">&#128172;</span><span>SISGR&Atilde;OS MESSENGER</span>'' +' +
    '      ''</div>'' +' +
    '      ''<span id="msnCloseBtn" style="color:#94a3b8;font-size:18px;font-weight:bold;line-height:1;cursor:pointer;padding' + ':0 4px;" title="Fechar">&times;</span>'' +' +
    '    ''</div>'' +' +
    '    ''<div style="padding:12px 14px;display:flex;gap:12px;align-items:center;">'' +' +
    '      ''<div style="width:42px;height:42px;border-radius:50%;background:#134e38;border:2px solid #22c55e;'' +' +
    '      ''display:flex;align-items:center;justify-content:center;color:#86efac;font-size:15px;font-weight:700;flex-shrink:' + '0;box-shadow:0 0 10px rgba(34,197,94,0.35);">' + sInit + '</div>'' +' +
    '      ''<div style="flex:1;min-width:0;">'' +' +
    '        ''<div style="font-size:13px;font-weight:700;color:#ffffff;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">' + sNome + '</div>'' +' +
    '        ''<div style="font-size:11.5px;color:#cbd5e1;margin-top:3px;overflow:hidden;text-overflow:ellipsis;display:-webk' + 'it-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;line-height:1.35;">' + sMsg + '</div>'' +' +
    '      ''</div>'' +' +
    '    ''</div>'' +' +
    '    ''<div style="padding:7px 12px;background:rgba(19,78,56,0.25);border-top:1px solid rgba(255,255,255,0.06);display:fl' + 'ex;justify-content:flex-end;align-items:center;">'' +' +
    '      ''<span style="font-size:11px;font-weight:700;color:#4ade80;display:inline-flex;align-items:center;gap:4px;">Respo' + 'nder conversa &rarr;</span>'' +' +
    '    ''</div>'';' +
    '  topDoc.body.appendChild(t);' +
    '  try { var snd = new Audio("files/js/toasty/dist/sounds/info/3.mp3"); snd.volume = 0.6; snd.play(); }catch(e){}' +
    '  setTimeout(function(){ t.style.transform = "translateY(0)"; }, 30);' +
    '  var hTimer;' +
    '  function dismiss(){ t.style.transform = "translateY(130%)"; t.style.opacity = "0"; setTimeout(function(){ if(t.parentN' + 'ode) t.parentNode.removeChild(t); }, 420); }' +
    '  function startT(){ hTimer = setTimeout(dismiss, 7500); }' +
    '  startT();' +
    '  t.onmouseenter = function(){ clearTimeout(hTimer); };' +
    '  t.onmouseleave = function(){ startT(); };' +
    '  var cb = topDoc.getElementById("msnCloseBtn");' +
    '  if(cb){ cb.onclick = function(ev){ ev.stopPropagation(); dismiss(); }; }' +
    '  t.onclick = function(ev){ if(ev.target === cb) return; dismiss(); if(window.MainForm && MainForm.htmlFrame){ ajaxReque' + 'st(MainForm.htmlFrame, "_openChat", []); } };' +
    '})();';

  UniSession.AddJS(js);
end;

procedure rc_MarcarComoLidas(pIDDest, pIDRemet: Integer);
var
  i, j, nLen: Integer;
  jaLida: Boolean;
begin
  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if (gListMensagens[i].IDRemetente = pIDRemet) and
         (gListMensagens[i].IDDestinatario = pIDDest) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pIDDest then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
        begin
          nLen := Length(gListMensagens[i].LidaPor);
          SetLength(gListMensagens[i].LidaPor, nLen + 1);
          gListMensagens[i].LidaPor[nLen] := pIDDest;
        end;
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

function rc_TotalNaoLidasGrupo(pGroupID, pUserID: Integer): Integer;
var
  i, j: Integer;
  targetDest: Integer;
  jaLida: Boolean;
begin
  Result := 0;
  targetDest := -100 - pGroupID;

  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if (gListMensagens[i].IDDestinatario = targetDest) and
         (gListMensagens[i].IDRemetente <> pUserID) and
         (not gListMensagens[i].Apagada) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pUserID then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
          Inc(Result);
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

procedure rc_MarcarComoLidasGrupo(pGroupID, pUserID: Integer);
var
  i, j, nLen: Integer;
  targetDest: Integer;
  jaLida: Boolean;
begin
  targetDest := -100 - pGroupID;

  gLockOnline.Enter;
  try
    for i := 0 to High(gListMensagens) do
    begin
      if (gListMensagens[i].IDDestinatario = targetDest) and
         (gListMensagens[i].IDRemetente <> pUserID) then
      begin
        jaLida := False;
        for j := 0 to High(gListMensagens[i].LidaPor) do
        begin
          if gListMensagens[i].LidaPor[j] = pUserID then
          begin
            jaLida := True;
            Break;
          end;
        end;
        if not jaLida then
        begin
          nLen := Length(gListMensagens[i].LidaPor);
          SetLength(gListMensagens[i].LidaPor, nLen + 1);
          gListMensagens[i].LidaPor[nLen] := pUserID;
        end;
        rc_RegistraLeitura(gListMensagens[i], pUserID);
      end;
    end;
  finally
    gLockOnline.Leave;
  end;
end;

// ============================================================
// Form Events
// ============================================================
procedure TfrmUsuariosOnline.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout(Self, True, True, True);
  Self.Left := mm.varI_ScreenWidth + 600;
  if mm.RTL then
    Self.Left := 0
  else
    Self.Left := mm.varI_ScreenWidth + 600;

  FChatUserID := 0;
  rc_CarregaGrupos;
end;

procedure TfrmUsuariosOnline.UniFormReady(Sender: TObject);
begin
  dm_rc.rc_ResizeBlocks(Self, True, True);
  AtualizarLista;
end;

procedure TfrmUsuariosOnline.UniFormShow(Sender: TObject);
begin
  Self.Height := mm.varI_ScreenHeight;
  Self.Top    := 0;
  rc_jQueryAnimate(Self, 'right', IntToStr(Self.Left + Self.Width), '200');

  // Garante icone vermelho moderno de fechar no botao do topo
  labbtnExit.Caption := '<i class="fas fa-times" style="font-size:20px;color:#ef4444;line-height:28px;" title="Fechar"></i>';

  if mm <> nil then
  begin
    rc_RegistraUsuarioOnline(
      mm.varI_User,
      mm.vUserName,
      mm.vUserEmail,
      mm.varC_CompanyName,
      UniSession.RemoteIP,
      mm.vDeviceType
    );
  end;
  AtualizarLista;
  timerRefresh.Enabled := True;
end;

procedure TfrmUsuariosOnline.UniFormDestroy(Sender: TObject);
begin
  timerRefresh.Enabled := False;
end;

procedure TfrmUsuariosOnline.labbtnExitClick(Sender: TObject);
begin
  timerRefresh.Enabled := False;
  mm.varB_Yes := False;
  mm.varB_No  := True;
  Self.ModalResult := mrNone;

  rc_jQueryAnimate(Self, 'left',
    rc_IIF(mm.RTL, IntToStr(Self.Width * (-1)), IntToStr(UniSession.UniApplication.ScreenWidth)),
    '200', '', '', '', '', '',
    'ajaxRequest(' + MainForm.htmlFrame.JSName + ', "_CloseForm", ["form=" + ' + QuotedStr(Self.Name) + ']);');
end;

procedure TfrmUsuariosOnline.timerRefreshTimer(Sender: TObject);
var
  needsRefresh: Boolean;
  nUnread: Integer;
begin
  if mm <> nil then
  begin
    rc_RegistraUsuarioOnline(
      mm.varI_User,
      mm.vUserName,
      mm.vUserEmail,
      mm.varC_CompanyName,
      UniSession.RemoteIP,
      mm.vDeviceType
    );
  end;

  needsRefresh := True;
  if FChatUserID <> 0 then
  begin
    if (gMsgSeq = FLastMsgSeq) and (FChatUserID = FLastChatUserID) then
      needsRefresh := False;
  end
  else
  begin
    nUnread := 0;
    if mm <> nil then
      nUnread := rc_TotalNaoLidasGlobal(mm.varI_User);

    if (Length(gListOnline) = FLastOnlineCount) and
       (Length(gListGrupos) = FLastGroupCount) and
       (gMsgSeq = FLastMsgSeq) and
       (nUnread = FLastUnreadGlobal) then
      needsRefresh := False;
  end;

  if needsRefresh then
    AtualizarLista;
end;

procedure TfrmUsuariosOnline.htmlOnlineAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  nID, nMsgID: Integer;
  cTexto, cUploadDir, cNomeGrp, cMembros: string;
begin
  if EventName = 'open_chat' then
  begin
    nID := StrToIntDef(Params.Values['id'], 0);
    FChatUserID := nID;

    // Carrega todo o historico previo da conversa a partir do arquivo TXT correspondente
    if mm <> nil then
      rc_CarregaHistoricoConversa(mm.varI_User, FChatUserID);

    // Marca mensagens recebidas como lidas
    if mm <> nil then
    begin
      if FChatUserID < -100 then
        rc_MarcarComoLidasGrupo(Abs(FChatUserID) - 100, mm.varI_User)
      else if FChatUserID = -1 then
        rc_MarcarComoLidasGlobal(mm.varI_User)
      else if FChatUserID > 0 then
        rc_MarcarComoLidas(mm.varI_User, FChatUserID);
    end;

    AtualizarLista;
  end
  else if EventName = 'back_list' then
  begin
    FChatUserID := 0;
    UniSession.AddJS('window._chatDraft = "";');
    AtualizarLista;
  end
  else if EventName = 'send_chat' then
  begin
    cTexto := Params.Values['text'];
    cTexto := rc_URLDecode(cTexto);
    cTexto := StringReplace(cTexto, '%20', ' ', [rfReplaceAll]);
    cTexto := Trim(cTexto);

    if cTexto <> '' then
    begin
      if FChatUserID < -100 then
        rc_EnviaMensagemGrupo(Abs(FChatUserID) - 100, mm.varI_User, mm.vUserName, cTexto, '')
      else
        rc_EnviaMensagem(FChatUserID, mm.varI_User, mm.vUserName, cTexto, '');
      AtualizarLista;
    end;
  end
  else if EventName = 'del_msg' then
  begin
    nMsgID := StrToIntDef(Params.Values['id'], 0);
    if nMsgID > 0 then
    begin
      rc_ApagaMensagem(nMsgID, mm.varI_User);
      AtualizarLista;
    end;
  end
  else if EventName = 'pause_timer' then
  begin
    timerRefresh.Enabled := False;
  end
  else if EventName = 'resume_timer' then
  begin
    timerRefresh.Enabled := True;
  end
  else if EventName = 'create_group' then
  begin
    timerRefresh.Enabled := True;
    cNomeGrp := rc_URLDecode(Params.Values['name']);
    cNomeGrp := StringReplace(cNomeGrp, '%20', ' ', [rfReplaceAll]);
    cNomeGrp := StringReplace(cNomeGrp, '+', ' ', [rfReplaceAll]);
    cNomeGrp := Trim(cNomeGrp);
    cMembros := Params.Values['members'];
    if (cNomeGrp <> '') and (mm <> nil) then
      rc_CriaNovoGrupo(cNomeGrp, mm.varI_User, mm.vUserName, cMembros);
    AtualizarLista;
  end
  else if EventName = 'attach_img' then
  begin
    cUploadDir := ExtractFilePath(ParamStr(0)) + 'uploads\chats\';
    ForceDirectories(cUploadDir);
    UniFileUploadChat.TargetFolder := 'uploads\chats';
    UniFileUploadChat.Filter       := 'image/*';
    UniFileUploadChat.Execute;
  end
  else if (EventName = 'attach_doc') or (EventName = 'attach_pdf') then
  begin
    cUploadDir := ExtractFilePath(ParamStr(0)) + 'uploads\chats\docs\';
    ForceDirectories(cUploadDir);
    UniFileUploadPDF.TargetFolder := 'uploads\chats\docs';
    UniFileUploadPDF.Filter       := '.pdf,.doc,.docx,.xls,.xlsx,.csv,.txt';
    UniFileUploadPDF.Execute;
  end;
end;

// ============================================================
// Upload de Imagem no Bate-papo
// ============================================================
procedure TfrmUsuariosOnline.UniFileUploadChatCompleted(Sender: TObject;
  AStream: TFileStream);
var
  origExt, newBaseName, destFull, newRelPath: string;
begin
  try
    origExt := LowerCase(ExtractFileExt(AStream.FileName));
    // Padroniza jfif e variacoes jpeg para .jpg garantindo exibicao e compatibilidade
    if (origExt = '') or (origExt = '.jfif') or (origExt = '.jpe') or (origExt = '.jpeg') then
      origExt := '.jpg'
    else if origExt = '.png' then
      origExt := '.png'
    else if origExt = '.webp' then
      origExt := '.webp'
    else if origExt = '.gif' then
      origExt := '.gif'
    else
      origExt := '.jpg';

    newBaseName := 'chat_' + FormatDateTime('yyyymmdd_hhnnss_', Now) +
      IntToStr(Random(9000) + 1000) + origExt;

    destFull := rc_GetChatBaseDir + 'uploads\chats\' + newBaseName;
    ForceDirectories(ExtractFilePath(destFull));

    if FileExists(AStream.FileName) then
    begin
      Windows.CopyFile(PChar(AStream.FileName), PChar(destFull), False);
      if (rc_GetChatBaseDir <> IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))) then
      begin
        ForceDirectories(ExtractFilePath(ParamStr(0)) + 'uploads\chats\');
        Windows.CopyFile(PChar(AStream.FileName), PChar(ExtractFilePath(ParamStr(0)) + 'uploads\chats\' + newBaseName), False);
      end;
      if (AStream.FileName <> destFull) and (AStream.FileName <> ExtractFilePath(ParamStr(0)) + 'uploads\chats\' + newBaseName) then
        DeleteFile(AStream.FileName);
    end;

    newRelPath := 'uploads/chats/' + newBaseName;

    if FChatUserID < -100 then
      rc_EnviaMensagemGrupo(Abs(FChatUserID) - 100, mm.varI_User, mm.vUserName, '', newRelPath)
    else
      rc_EnviaMensagem(FChatUserID, mm.varI_User, mm.vUserName, '', newRelPath);

    AtualizarLista;
  except
  end;
end;

// ============================================================
// Upload de Documentos no Bate-papo (PDF, Word, Excel, Bloco de Notas)
// ============================================================
procedure TfrmUsuariosOnline.UniFileUploadPDFCompleted(Sender: TObject;
  AStream: TFileStream);
var
  origExt, origName, origNameClean, newBaseName, destFull, newRelPath: string;
  destStream: TFileStream;
begin
  try
    origExt := LowerCase(ExtractFileExt(AStream.FileName));
    if origExt = '' then
      origExt := '.pdf';

    // Se o usuário selecionou uma imagem pelo botão de anexo, trata diretamente como imagem!
    if rc_IsImagem(AStream.FileName) or (origExt = '.jpg') or (origExt = '.jpeg') or (origExt = '.png') or (origExt = '.webp') or (origExt = '.gif') or (origExt = '.jfif') then
    begin
      if (origExt = '') or (origExt = '.jfif') or (origExt = '.jpe') or (origExt = '.jpeg') then
        origExt := '.jpg';

      newBaseName := 'chat_' + FormatDateTime('yyyymmdd_hhnnss_', Now) +
        IntToStr(Random(9000) + 1000) + origExt;

      destFull := rc_GetChatBaseDir + 'uploads\chats\' + newBaseName;
      ForceDirectories(ExtractFilePath(destFull));

      destStream := TFileStream.Create(destFull, fmCreate);
      try
        AStream.Position := 0;
        destStream.CopyFrom(AStream, AStream.Size);
      finally
        destStream.Free;
      end;

      if (rc_GetChatBaseDir <> IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))) then
      begin
        ForceDirectories(ExtractFilePath(ParamStr(0)) + 'uploads\chats\');
        Windows.CopyFile(PChar(destFull), PChar(ExtractFilePath(ParamStr(0)) + 'uploads\chats\' + newBaseName), False);
      end;

      newRelPath := 'uploads/chats/' + newBaseName;

      if FChatUserID < -100 then
        rc_EnviaMensagemGrupo(Abs(FChatUserID) - 100, mm.varI_User, mm.vUserName, '', newRelPath, mm.varC_User_Avatar)
      else
        rc_EnviaMensagem(FChatUserID, mm.varI_User, mm.vUserName, '', newRelPath, mm.varC_User_Avatar);

      AtualizarLista;
      Exit;
    end;

    origName := ExtractFileName(AStream.FileName);
    if origName = '' then
      origName := 'documento' + origExt;

    origNameClean := StringReplace(origName, ' ', '_', [rfReplaceAll]);
    origNameClean := StringReplace(origNameClean, '|', '_', [rfReplaceAll]);
    origNameClean := StringReplace(origNameClean, '~', '_', [rfReplaceAll]);
    origNameClean := StringReplace(origNameClean, '''', '_', [rfReplaceAll]);

    newBaseName := 'chat_doc_' + FormatDateTime('yyyymmdd_hhnnss_', Now) +
      IntToStr(Random(9000) + 1000) + '_' + origNameClean;

    if LowerCase(ExtractFileExt(newBaseName)) <> origExt then
      newBaseName := newBaseName + origExt;

    destFull := rc_GetChatBaseDir + 'uploads\chats\docs\' + newBaseName;
    ForceDirectories(ExtractFilePath(destFull));

    destStream := TFileStream.Create(destFull, fmCreate);
    try
      AStream.Position := 0;
      destStream.CopyFrom(AStream, AStream.Size);
    finally
      destStream.Free;
    end;

    newRelPath := 'uploads/chats/docs/' + newBaseName;

    if FChatUserID < -100 then
      rc_EnviaMensagemGrupo(Abs(FChatUserID) - 100, mm.varI_User, mm.vUserName, origName, newRelPath, mm.varC_User_Avatar)
    else
      rc_EnviaMensagem(FChatUserID, mm.varI_User, mm.vUserName, origName, newRelPath, mm.varC_User_Avatar);

    AtualizarLista;
  except
  end;
end;

// ============================================================
// Montagem do HTML: Tema 100% Escuro Esmeralda
// ============================================================
procedure TfrmUsuariosOnline.AtualizarLista;
var
  i, j, nOnline, nNaoLidas, curGroupID, kLeit: Integer;
  cHTML, jsName, cNomeDest, svgTrash, sReadsAttr: string;
  docExt, docBadge, docColor, docIconLabel, docDesc, sDocName: string;
  isMe, isMaster, canSendGrp, isDoc: Boolean;
  snapUsers: TArrayUsuariosOnline;
  snapMsgs: array of TMensagemOnline;
  snapGrupos: array of TGrupoChat;
  cGroupModalUsers: string;
begin
  // Sincroniza usuarios e grupos gravados no disco para suportar todos os nodes do HyperServer
  if mm <> nil then
    rc_SincronizaUsuariosOnlineDisco(mm.varI_User, mm.vUserName, mm.vUserEmail, mm.varC_CompanyName, UniSession.RemoteIP, mm.vDeviceType, mm.varC_User_Avatar, 0)
  else
    rc_SincronizaUsuariosOnlineDisco(0, '', '', '', '', '', '', 0);

  rc_CarregaGrupos;

  if (mm <> nil) and (FChatUserID <> 0) then
    rc_CarregaHistoricoConversa(mm.varI_User, FChatUserID);

  jsName := Self.htmlOnline.JSName;

  isMaster := False;
  if mm <> nil then
    isMaster := (UpperCase(Trim(mm.vUserMaster)) = 'S') or (mm.vUserMaster = mm.VALUE_YES);

  // SVG da Lixeira em Vermelho
  svgTrash := '<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" ' +
    'fill="none" stroke="#ef4444" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">' +
    '<polyline points="3 6 5 6 21 6"></polyline>' +
    '<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>' +
    '<line x1="10" y1="11" x2="10" y2="17"></line>' +
    '<line x1="14" y1="11" x2="14" y2="17"></line>' +
    '</svg>';

  gLockOnline.Enter;
  try
    nOnline := Length(gListOnline);
    SetLength(snapUsers, nOnline);
    for i := 0 to nOnline - 1 do
      snapUsers[i] := gListOnline[i];

    SetLength(snapMsgs, Length(gListMensagens));
    for i := 0 to High(gListMensagens) do
      snapMsgs[i] := gListMensagens[i];

    SetLength(snapGrupos, Length(gListGrupos));
    for i := 0 to High(gListGrupos) do
      snapGrupos[i] := gListGrupos[i];
  finally
    gLockOnline.Leave;
  end;

  // CSS Base
  // CSS Base - Tonzinho Sofisticado Mint / Sage Sisgraos
  cHTML :=
    '<style>' +
    '*{box-sizing:border-box;margin:0;padding:0;}' +
    'body,html{background:linear-gradient(180deg,#e8f5ed 0%,#f0f8f3 40%,#f7fbf8 100%) !important;color:#0f172a;font-family:-a' + 'pple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Helvetica,Arial,sans-serif;height:100%;overflow:hidden;}' +
    '.chat-container{display:flex;flex-direction:column;height:100%;box-sizing:border-box;background:linear-gradient(180deg,#' + 'e8f5ed 0%,#f0f8f3 40%,#f7fbf8 100%);padding:8px 6px;overflow:hidden;border-left:2px solid #a7f3d0;}' +

    // Cabecalho Principal
    '.top-bar{display:flex;align-items:center;justify-content:space-between;padding:8px 12px;background:#ffffff;border:1px so' + 'lid #a7f3d0;border-top:3px solid #10b981;border-radius:10px;margin-bottom:8px;box-shadow:0 3px 10px rgba(16,185,129,0.08' + ');}' +
    '.top-title{font-size:11.5px;font-weight:800;color:#064e3b;text-transform:uppercase;letter-spacing:0.5px;display:flex;align-items:center;gap:6px;}' +
    '.badge-online{background:#dcfce7;color:#166534;border:1px solid #86efac;padding:3px 9px;border-radius:12px;font-size:11px;font-weight:800;}' +
    '.btn-new-grp{background:linear-gradient(135deg,#10b981 0%,#059669 100%);color:#ffffff !important;border:none;padding:4px' + ' 11px;border-radius:6px;font-size:11px;font-weight:800;text-decoration:none;cursor:pointer;transition:all 0.18s ease;dis' + 'play:inline-flex;align-items:center;gap:4px;box-shadow:0 2px 8px rgba(16,185,129,0.3);}' +
    '.btn-new-grp:hover{background:linear-gradient(135deg,#059669 0%,#047857 100%);transform:scale(1.04);box-shadow:0 4px 12px rgba(16,185,129,0.4);}' +

    // Secoes com chip destacado
    '.sec-title{font-size:10.5px;font-weight:800;color:#047857;text-transform:uppercase;letter-spacing:0.6px;margin:12px 2px ' + '6px 2px;padding:4px 10px;background:#e2f4ea;border-radius:6px;border-left:3px solid #10b981;display:flex;align-items:cen' + 'ter;gap:6px;}' +

    // Lista de Cards
    '.users-scroll{flex:1 1 0;min-height:0;overflow-y:auto;display:flex;flex-direction:column;gap:6px;padding-right:2px;}' +
    '.users-scroll::-webkit-scrollbar{width:4px;}' +
    '.users-scroll::-webkit-scrollbar-thumb{background:#a7f3d0;border-radius:4px;}' +

    // Card de Usuario e Grupo
    '.u-card{background:#ffffff;border:1px solid #d1fae5;border-left:4px solid #059669;border-radius:10px;padding:8px 10px;di' + 'splay:flex;align-items:center;gap:8px;transition:all 0.18s ease;box-shadow:0 2px 6px rgba(0,0,0,0.03);}' +
    '.u-card:hover{background:#f0fdf4;border-color:#10b981;transform:translateY(-2px);box-shadow:0 6px 16px rgba(16,185,129,0.14);}' +
    '.u-card-grp{background:linear-gradient(135deg,#ffffff 0%,#f0f9ff 100%) !important;border:1px solid #bae6fd !important;bo' + 'rder-left:4px solid #0284c7 !important;box-shadow:0 2px 8px rgba(2,132,199,0.08) !important;}' +
    '.u-card-grp:hover{border-color:#0284c7 !important;box-shadow:0 6px 16px rgba(2,132,199,0.18) !important;}' +
    '.u-card-broadcast{background:linear-gradient(135deg,#ffffff 0%,#f0fdf4 100%) !important;border:1px solid #a7f3d0 !import' + 'ant;border-left:4px solid #10b981 !important;box-shadow:0 2px 8px rgba(16,185,129,0.08) !important;}' +
    '.u-card-broadcast:hover{border-color:#059669 !important;box-shadow:0 6px 16px rgba(16,185,129,0.18) !important;}' +
    '.u-card-unread{border-color:#ef4444 !important;border-left-color:#ef4444 !important;background:#fff5f5 !important;box-sh' + 'adow:0 0 10px rgba(239,68,68,0.2) !important;}' +

    // Avatar
    '.u-avatar{width:36px;height:36px;border-radius:50%;background:#ecfdf5;border:2px solid #10b981;display:flex;align-items:' + 'center;justify-content:center;font-weight:800;color:#047857;font-size:13px;flex-shrink:0;position:relative;box-shadow:0 ' + '2px 6px rgba(16,185,129,0.15);}' +
    '.u-avatar-grp{background:linear-gradient(135deg, #0ea5e9, #0284c7) !important;color:#ffffff !important;border-color:#028' + '4c7 !important;font-size:14px;box-shadow:0 2px 6px rgba(2,132,199,0.3) !important;}' +
    '.u-avatar-broadcast{background:linear-gradient(135deg, #10b981, #047857) !important;color:#ffffff !important;border-colo' + 'r:#059669 !important;font-size:15px;box-shadow:0 2px 6px rgba(16,185,129,0.3) !important;}' +
    '.u-status-dot{position:absolute;bottom:0;right:0;width:9px;height:9px;background:#22c55e;border:2px solid #ffffff;border' + '-radius:50%;box-shadow:0 0 6px #22c55e;}' +

    // Dados do Card
    '.u-info{flex:1;min-width:0;}' +
    '.u-name{font-size:12px;font-weight:700;color:#0f172a !important;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;letter-spacing:0.2px;}' +
    '.u-meta{font-size:10px;color:#475569;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;margin-top:1px;}' +
    '.u-unread-pill{display:inline-block;background:#ef4444;color:#ffffff;font-size:9px;font-weight:800;padding:1px 5px;borde' + 'r-radius:10px;margin-left:5px;}' +

    // Botao de Conversar
    '.btn-chat{background:#ecfdf5;color:#047857 !important;border:1px solid #a7f3d0;padding:5px 12px;border-radius:18px;font-' + 'size:11px;font-weight:800;text-decoration:none;cursor:pointer;white-space:nowrap;transition:all 0.18s ease;display:inlin' + 'e-flex;align-items:center;gap:4px;flex-shrink:0;}' +
    '.btn-chat:hover{background:#10b981;color:#ffffff !important;border-color:#10b981;box-shadow:0 2px 8px rgba(16,185,129,0.3);transform:scale(1.04);}' +
    '.btn-chat-grp{background:#f0f9ff !important;color:#0284c7 !important;border-color:#bae6fd !important;}' +
    '.btn-chat-grp:hover{background:#0284c7 !important;color:#ffffff !important;border-color:#0284c7 !important;box-shadow:0 ' + '2px 8px rgba(2,132,199,0.3) !important;}' +
    '.btn-chat-broadcast{background:#10b981 !important;color:#ffffff !important;border-color:#059669 !important;box-shadow:0 ' + '2px 6px rgba(16,185,129,0.25) !important;}' +
    '.btn-chat-broadcast:hover{background:#059669 !important;box-shadow:0 4px 10px rgba(16,185,129,0.35) !important;}' +
    '.btn-chat-unread{background:#ef4444 !important;color:#ffffff !important;border-color:#ef4444 !important;}' +
    '.btn-chat-self{background:#f0fdf4 !important;color:#15803d !important;border:1px solid #86efac !important;}' +
    '.btn-chat-self:hover{background:#16a34a !important;color:#ffffff !important;border-color:#16a34a !important;box-shadow:0 2px 8px rgba(22,163,74,0.3) !important;}' +

    // Area do Bate-papo
    '.chat-box{display:flex;flex-direction:column;height:100%;box-sizing:border-box;position:relative;background:#edf7f2;over' + 'flow:hidden;border-left:2px solid #a7f3d0;}' +
    '.chat-header{display:flex;align-items:center;justify-content:space-between;padding:8px 10px;background:linear-gradient(1' + '35deg,#064e3b 0%,#047857 100%);border-bottom:2px solid #059669;flex-shrink:0;box-shadow:0 2px 8px rgba(6,78,59,0.2);}' +
    '.btn-back{background:rgba(255,255,255,0.18);color:#ffffff !important;border:1px solid rgba(255,255,255,0.35);padding:5px' + ' 10px;border-radius:8px;font-size:11px;font-weight:800;text-decoration:none;cursor:pointer;display:inline-flex;align-ite' + 'ms:center;gap:5px;box-shadow:0 1px 3px rgba(0,0,0,0.1);transition:all 0.18s ease;white-space:nowrap;backdrop-filter:blur' + '(4px);}' +
    '.btn-back:hover{background:rgba(255,255,255,0.3);color:#ffffff !important;transform:translateY(-1px);}' +
    '.chat-target{font-size:12.5px;font-weight:800;color:#ffffff;display:flex;align-items:center;gap:6px;text-shadow:0 1px 2px rgba(0,0,0,0.2);}' +
    '.chat-target .dot{width:8px;height:8px;background:#86efac;border-radius:50%;box-shadow:0 0 6px #86efac;}' +

    // Mensagens
    '.chat-messages{flex:1 1 0;min-height:0;overflow-y:auto;padding:10px 8px;display:flex;flex-direction:column;gap:8px;background:#edf7f2;}' +
    '.chat-messages::-webkit-scrollbar{width:4px;}' +
    '.chat-messages::-webkit-scrollbar-thumb{background:#a7f3d0;border-radius:4px;}' +
    '.msg-row{display:flex;width:100%;}' +
    '.msg-me{justify-content:flex-end;}' +
    '.msg-other{justify-content:flex-start;}' +
    '.bubble{max-width:86%;padding:8px 12px;border-radius:12px;font-size:12px;line-height:1.45;position:relative;word-wrap:br' + 'eak-word;box-shadow:0 2px 6px rgba(0,0,0,0.06);}' +
    '.bubble-me{background:linear-gradient(135deg,#dcfce7 0%,#bbf7d0 100%);color:#0f172a;border:1px solid #86efac;border-bott' + 'om-right-radius:2px;box-shadow:0 2px 6px rgba(16,185,129,0.15);}' +
    '.bubble-other{background:#ffffff;color:#0f172a;border:1px solid #e2e8f0;border-left:3px solid #10b981;border-bottom-left-radius:2px;}' +
    '.bubble-deleted{background:#f8fafc;color:#94a3b8;font-style:italic;border:1px dashed #cbd5e1;padding:6px 10px;border-radius:8px;font-size:11px;}' +
    '.bubble-author{font-size:10px;font-weight:800;color:#047857;margin-bottom:3px;}' +
    '.bubble-bottom{display:flex;align-items:center;justify-content:flex-end;gap:5px;margin-top:4px;}' +
    '.bubble-time{font-size:9px;color:#64748b;}' +

    // Imagem no balao
    '.msg-img-wrap{margin-bottom:6px;border-radius:8px;overflow:hidden;width:100%;max-width:260px;cursor:pointer;position:rel' + 'ative;background:#f8fafc;border:1px solid #e2e8f0;transition:all 0.18s ease;box-shadow:0 2px 6px rgba(0,0,0,0.08);}' +
    '.msg-img-wrap:hover{transform:scale(1.02);border-color:#10b981;box-shadow:0 4px 12px rgba(16,185,129,0.2);}' +
    '.msg-img{display:block;width:100%;max-height:220px;object-fit:contain;background:#f8fafc;border-radius:7px;}' +
    '.img-zoom-hint{position:absolute;bottom:4px;right:4px;background:rgba(15,23,42,0.72);color:#ffffff;font-size:9px;font-we' + 'ight:700;padding:2px 6px;border-radius:4px;backdrop-filter:blur(4px);pointer-events:none;}' +
    '.img-del-overlay{position:absolute;top:6px;right:6px;background:#ef4444;color:#ffffff !important;border:1px solid #dc262' + '6;border-radius:6px;padding:3px 7px;font-size:11px;font-weight:700;line-height:1;text-decoration:none;cursor:pointer;box' + '-shadow:0 2px 6px rgba(0,0,0,0.2);transition:all 0.18s ease;z-index:10;display:inline-flex;align-items:center;gap:3px;}' +
    '.img-del-overlay:hover{background:#dc2626;transform:scale(1.08);}' +

    // Cards de Documentos Anexos (PDF, Word, Excel, TXT)
    '.msg-doc-card{margin-bottom:6px;border-radius:10px;background:rgba(12,40,30,0.85);border:1px solid rgba(34,197,94,0.3);' +
    'padding:10px 12px;display:flex;flex-direction:column;gap:8px;max-width:320px;width:100%;box-shadow:0 4px 12px rgba(0,0,0,0.18);' +
    'transition:all 0.2s ease;box-sizing:border-box;cursor:pointer;}' +
    '.msg-doc-card:hover{border-color:#22c55e;transform:translateY(-1px);box-shadow:0 6px 18px rgba(34,197,94,0.25);}' +
    '.msg-doc-top{display:flex;align-items:center;gap:10px;}' +
    '.msg-doc-icon{width:40px;height:44px;border-radius:6px;display:flex;flex-direction:column;align-items:center;' +
    'justify-content:center;color:#ffffff;font-weight:900;font-size:11px;letter-spacing:0.5px;flex-shrink:0;' +
    'box-shadow:0 3px 8px rgba(0,0,0,0.35);line-height:1;}' +
    '.msg-doc-info{flex:1;min-width:0;}' +
    '.msg-doc-name{font-size:12.5px;font-weight:700;color:#ffffff;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height:1.3;}' +
    '.msg-doc-desc{font-size:10.5px;color:#94a3b8;margin-top:2px;}' +
    '.msg-doc-actions{display:flex;align-items:center;gap:6px;margin-top:2px;border-top:1px solid rgba(255,255,255,0.08);padding-top:6px;}' +
    '.btn-doc-view{background:#166534;color:#bbf7d0 !important;border:1px solid #22c55e;padding:4px 10px;border-radius:6px;' +
    'font-size:11px;font-weight:700;text-decoration:none;display:inline-flex;align-items:center;gap:4px;transition:0.18s;}' +
    '.btn-doc-view:hover{background:#22c55e;color:#052e16 !important;}' +
    '.btn-doc-down{background:rgba(255,255,255,0.08);color:#f1f5f9 !important;border:1px solid rgba(255,255,255,0.2);' +
    'padding:4px 10px;border-radius:6px;font-size:11px;font-weight:600;text-decoration:none;display:inline-flex;align-items:center;gap:4px;transition:0.18s;}' +
    '.btn-doc-down:hover{background:rgba(255,255,255,0.18);color:#ffffff !important;}' +
    '.btn-doc-del{background:rgba(239,68,68,0.18);color:#fca5a5 !important;border:1px solid #ef4444;padding:4px 8px;' +
    'border-radius:6px;font-size:11px;font-weight:700;text-decoration:none;margin-left:auto;display:inline-flex;align-items:center;gap:3px;transition:0.18s;}' +
    '.btn-doc-del:hover{background:#ef4444;color:#ffffff !important;}' +

    // Botao Lixeira em Vermelho, 3 Pontinhos e Editar
    '.btn-del{background:#fee2e2 !important;border:1px solid #fca5a5 !important;border-radius:5px;cursor:pointer;padding:3px ' + '5px;margin-left:6px;display:inline-flex;align-items:center;justify-content:center;text-decoration:none;line-height:1;tra' + 'nsition:all 0.18s ease;}' +
    '.btn-del:hover{background:#ef4444 !important;border-color:#ef4444 !important;transform:scale(1.15);box-shadow:0 0 8px rgba(239,68,68,0.4);}' +
    '.btn-del:hover svg{stroke:#ffffff !important;}' +
    '.btn-msg-dots{background:transparent;border:none;color:#64748b;cursor:pointer;padding:2px 5px;border-radius:4px;display:' + 'inline-flex;align-items:center;justify-content:center;transition:all 0.15s ease;font-size:14px;line-height:1;margin-left' + ':4px;user-select:none;}' +
    '.btn-msg-dots:hover{color:#0f172a;background:rgba(0,0,0,0.08);transform:scale(1.15);}' +
    '.btn-edit-msg{background:transparent;border:none;color:#64748b;cursor:pointer;padding:2px 5px;border-radius:4px;display:' + 'inline-flex;align-items:center;justify-content:center;transition:all 0.15s ease;font-size:13px;line-height:1;margin-left' + ':3px;user-select:none;}' +
    '.btn-edit-msg:hover{color:#10b981;background:rgba(16,185,129,0.12);transform:scale(1.15);}' +

    // Painel de Emojis
    '.emoji-picker{position:absolute;bottom:54px;left:8px;right:8px;max-height:220px;background:#ffffff !important;border:1px' + ' solid #cbd5e1 !important;border-radius:10px;box-shadow:0 -4px 20px rgba(0,0,0,0.15);z-index:1000;display:flex;flex-dire' + 'ction:column;overflow:hidden;}' +
    '.emoji-picker-header{display:flex;justify-content:space-between;align-items:center;padding:7px 12px;background:#f8fafc;b' + 'order-bottom:1px solid #e2e8f0;color:#047857;font-size:11px;font-weight:700;}' +
    '.emoji-close{color:#64748b;font-size:18px;cursor:pointer;line-height:1;}' +
    '.emoji-close:hover{color:#ef4444;}' +
    '.emoji-grid{padding:8px;display:grid;grid-template-columns:repeat(8,1fr);gap:3px;overflow-y:auto;max-height:180px;background:#ffffff;}' +
    '.emoji-item{font-size:20px;text-align:center;padding:4px;cursor:pointer;border-radius:6px;transition:all 0.12s ease;user-select:none;line-height:1.2;}' +
    '.emoji-item:hover{background:#ecfdf5;transform:scale(1.22);}' +

    // Rodape com Textarea Expansivel
    '.chat-footer{position:relative;flex-shrink:0;padding:8px 10px;background:#ffffff;border-top:2px solid #a7f3d0;display:fl' + 'ex;gap:6px;align-items:flex-end;z-index:10;box-shadow:0 -2px 10px rgba(0,0,0,0.04);}' +
    '.chat-footer-readonly{position:relative;flex-shrink:0;padding:12px 14px;background:#f8fafc;border-top:1px solid #e2e8f0;' + 'color:#64748b;font-size:11px;font-style:italic;text-align:center;}' +
    '.btn-attach, .btn-emoji, .btn-expand{color:#047857;background:#f1f5f9;border:1px solid #cbd5e1;width:34px;height:34px;bo' + 'rder-radius:50%;cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:16px;text-decoration:non' + 'e;transition:all 0.18s ease;line-height:1;flex-shrink:0;margin-bottom:2px;}' +
    '.btn-emoji{font-size:17px;}' +
    '.btn-expand{font-size:14px;font-weight:bold;}' +
    '.chat-footer{display:flex;flex-direction:column;gap:6px;padding:8px 10px;background:#ffffff;border-top:1px solid #e2e8f0;position:relative;}' +
    '.chat-input-row{width:100%;display:flex;}' +
    '.chat-input-memo{width:100%;min-height:55px;max-height:240px;border:1px solid #cbd5e1;border-radius:12px;padding:9px 12px;font-size:13px;' +
    'font-family:inherit;outline:none;resize:vertical;background:#f8fafc;color:#0f172a;line-height:1.45;' +
    'transition:border-color 0.2s, background 0.2s;box-sizing:border-box;box-shadow:inset 0 1px 3px rgba(0,0,0,0.03);}' +
    '.chat-input-memo:focus{border-color:#10b981;background:#ffffff;box-shadow:0 0 0 2px rgba(16,185,129,0.18);}' +
    '.chat-tools-row{display:flex;justify-content:space-between;align-items:center;width:100%;gap:8px;}' +
    '.btn-action-trigger{display:flex;align-items:center;gap:6px;background:#f1f5f9;border:1px solid #cbd5e1;border-radius:18px;' +
    'padding:6px 14px;font-size:12px;font-weight:700;color:#334155;cursor:pointer;transition:all 0.18s ease;}' +
    '.btn-action-trigger:hover, .btn-action-trigger.active{background:#ecfdf5;border-color:#10b981;color:#047857;box-shadow:0 2px 8px rgba(16,185,129,0.2);}' +
    '.btn-action-icon{font-size:16px;font-weight:900;line-height:1;}' +
    '.chat-tip-hint{font-size:10.5px;color:#94a3b8;font-weight:500;white-space:nowrap;}' +
    '.btn-send-chat{background:linear-gradient(135deg,#10b981,#059669);color:#ffffff;border:none;width:36px;height:36px;border-radius:50%;' +
    'cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:15px;transition:all 0.18s ease;' +
    'flex-shrink:0;box-shadow:0 2px 8px rgba(16,185,129,0.35);}' +
    '.btn-send-chat:hover{background:linear-gradient(135deg,#059669,#047857);transform:scale(1.08);box-shadow:0 0 12px rgba(16,185,129,0.5);}' +
    '.actions-menu-popup{position:absolute;bottom:54px;left:10px;background:#ffffff;border:1px solid #cbd5e1;border-radius:16px;' +
    'box-shadow:0 12px 28px rgba(0,0,0,0.18);padding:10px 14px;z-index:1000;display:flex;flex-direction:column;gap:8px;' +
    'animation:actionsSlideUp 0.2s cubic-bezier(0.16,1,0.3,1);}' +
    '@keyframes actionsSlideUp{from{opacity:0;transform:translateY(10px) scale(0.94);}to{opacity:1;transform:translateY(0) scale(1);}}' +
    '.actions-menu-title{font-size:10px;font-weight:700;color:#64748b;text-transform:uppercase;letter-spacing:0.5px;' +
    'padding-bottom:4px;border-bottom:1px solid #f1f5f9;}' +
    '.actions-menu-items{display:flex;gap:12px;align-items:center;}' +
    '.action-item{display:flex;flex-direction:column;align-items:center;gap:4px;text-decoration:none;color:#334155;font-size:11px;font-weight:600;cursor:pointer;transition:transform 0.15s ease;}' +
    '.action-item:hover{transform:translateY(-2px);color:#059669;}' +
    '.action-item-icon{width:40px;height:40px;border-radius:50%;background:#f1f5f9;border:1px solid #cbd5e1;display:flex;align-items:center;justify-content:center;font-size:18px;transition:all 0.18s ease;}' +
    '.action-item:hover .action-item-icon{background:#ecfdf5;border-color:#10b981;color:#059669;box-shadow:0 4px 10px rgba(16,185,129,0.25);}' +
    '.btn-msg-dots{color:#94a3b8;font-size:15px;text-decoration:none;padding:1px 4px;cursor:pointer;line-height:1;font-weight:bold;border-radius:4px;transition:all 0.15s ease;margin-left:3px;}' +
    '.btn-msg-dots:hover{color:#047857;background:rgba(16,185,129,0.15);}' +
    '.msg-status{font-size:11px;letter-spacing:-2px;margin-left:4px;margin-right:2px;font-weight:bold;}' +
    '.msg-status.msg-delivered{color:#94a3b8;}' +
    '.msg-status.msg-read{color:#10b981;}' +
    '.msg-info-modal{position:absolute;top:0;left:0;right:0;bottom:0;background:rgba(15,23,42,0.55);backdrop-filter:blur(4px);' +
    'z-index:9500;display:flex;align-items:center;justify-content:center;padding:16px;animation:msgInfoFadeIn 0.15s ease-out;}' +
    '@keyframes msgInfoFadeIn{from{opacity:0;}to{opacity:1;}}' +
    '.msg-info-card{background:#ffffff;border-radius:14px;border:1px solid #cbd5e1;width:100%;max-width:380px;max-height:440px;' +
    'display:flex;flex-direction:column;overflow:hidden;box-shadow:0 16px 36px rgba(0,0,0,0.22);}' +
    '.msg-info-header{padding:10px 14px;background:#f8fafc;border-bottom:1px solid #e2e8f0;display:flex;' +
    'justify-content:space-between;align-items:center;font-size:13px;font-weight:700;color:#047857;}' +
    '.msg-info-close{font-size:20px;cursor:pointer;color:#64748b;line-height:1;}' +
    '.msg-info-close:hover{color:#0f172a;}' +
    '.msg-info-body{padding:12px 14px;overflow-y:auto;display:flex;flex-direction:column;gap:8px;}' +
    '.msg-read-row{display:flex;align-items:center;justify-content:space-between;padding:8px 10px;background:#f8fafc;' +
    'border:1px solid #f1f5f9;border-radius:8px;font-size:12px;}' +
    '.msg-read-user{font-weight:700;color:#1e293b;}' +
    '.msg-read-time{font-size:11px;color:#059669;font-weight:600;}' +

    // Modal de Criacao de Grupo
    '.grp-modal{position:absolute;top:0;left:0;right:0;bottom:0;background:rgba(15,23,42,0.6);backdrop-filter:blur(4px);z-ind' + 'ex:9000;display:flex;flex-direction:column;padding:12px;}' +
    '.grp-modal-box{background:#ffffff;border:1px solid #e2e8f0;border-radius:12px;display:flex;flex-direction:column;height:' + '100%;overflow:hidden;box-shadow:0 8px 24px rgba(0,0,0,0.15);}' +
    '.grp-modal-header{padding:10px 14px;background:#f8fafc;border-bottom:1px solid #e2e8f0;display:flex;justify-content:spac' + 'e-between;align-items:center;color:#047857;font-size:12px;font-weight:700;}' +
    '.grp-modal-body{padding:12px;flex:1;overflow-y:auto;display:flex;flex-direction:column;gap:10px;background:#ffffff;}' +
    '.grp-input-label{font-size:11px;font-weight:700;color:#334155;margin-bottom:2px;}' +
    '.grp-input-text{background:#f8fafc;border:1px solid #cbd5e1;border-radius:8px;padding:8px 12px;color:#0f172a;font-size:12px;outline:none;width:100%;}' +
    '.grp-input-text:focus{border-color:#10b981;background:#ffffff;}' +
    '.grp-users-table{border:1px solid #e2e8f0;border-radius:8px;background:#ffffff;overflow:hidden;max-height:260px;overflow-y:auto;}' +
    '.grp-user-row{display:flex;align-items:center;justify-content:space-between;padding:8px 10px;border-bottom:1px solid #f1f5f9;font-size:11px;}' +
    '.grp-user-row:last-child{border-bottom:none;}' +
    '.grp-user-name{font-weight:700;color:#0f172a;display:flex;align-items:center;gap:6px;}' +
    '.grp-func-badge{background:#ecfdf5;color:#047857;font-size:9px;padding:1px 5px;border-radius:4px;border:1px solid #a7f3d0;}' +
    '.grp-perms{display:flex;gap:8px;}' +
    '.grp-perm-label{font-size:10px;color:#475569;cursor:pointer;display:flex;align-items:center;gap:3px;user-select:none;}' +
    '.grp-modal-footer{padding:10px 12px;background:#f8fafc;border-top:1px solid #e2e8f0;display:flex;gap:8px;justify-content:flex-end;}' +
    '.btn-save-grp{background:#10b981;color:#ffffff;border:none;padding:7px 14px;border-radius:6px;font-size:11px;font-weight' + ':700;cursor:pointer;transition:0.18s;box-shadow:0 2px 6px rgba(16,185,129,0.25);}' +
    '.btn-save-grp:hover{background:#059669;transform:scale(1.04);}' +
    '.btn-cancel-grp{background:#f1f5f9;color:#475569;border:1px solid #cbd5e1;padding:7px 12px;border-radius:6px;font-size:11px;cursor:pointer;}' +
    '.btn-cancel-grp:hover{background:#e2e8f0;color:#0f172a;}' +

    '.empty-state{text-align:center;padding:30px 10px;color:#64748b;font-size:11px;}' +
    '.btn-attach-pdf{background:#fee2e2;border:1px solid #fca5a5;color:#dc2626 !important;font-size:14px;cursor:pointer;paddi' + 'ng:4px 7px;border-radius:6px;transition:all 0.18s ease;display:inline-flex;align-items:center;justify-content:center;}' +
    '.btn-attach-pdf:hover{background:#fecaca;transform:scale(1.08);box-shadow:0 2px 8px rgba(220,38,38,0.25);}' +
    '.msg-pdf-card{display:flex;align-items:center;gap:10px;background:#ffffff;border:1px solid #fca5a5;border-left:4px solid' + ' #ef4444;border-radius:10px;padding:8px 10px;margin-bottom:6px;cursor:pointer;box-shadow:0 2px 6px rgba(239,68,68,0.08);' + 'transition:all 0.18s ease;}' +
    '.msg-pdf-card:hover{background:#fff5f5;border-color:#ef4444;transform:translateY(-1px);box-shadow:0 4px 12px rgba(239,68,68,0.18);}' +
    '.pdf-icon-box{font-size:22px;line-height:1;flex-shrink:0;}' +
    '.pdf-info{flex:1;min-width:0;}' +
    '.pdf-name{font-weight:700;font-size:12px;color:#0f172a;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}' +
    '.pdf-sub{font-size:10px;color:#64748b;margin-top:2px;}' +
    '.pdf-actions{display:flex;align-items:center;gap:4px;flex-shrink:0;}' +
    '.btn-pdf-download{background:#f1f5f9;color:#0f172a !important;border:1px solid #cbd5e1;padding:4px 8px;border-radius:6px' + ';font-size:12px;text-decoration:none;transition:0.18s;}' +
    '.btn-pdf-download:hover{background:#e2e8f0;}' +
    '.pdf-del-link{font-size:10.5px;color:#ef4444 !important;text-decoration:none;font-weight:700;}' +
    '.pdf-del-link:hover{text-decoration:underline;}' +
    '</style>';

  // SE FChatUserID = 0 -> LISTA DE USUARIOS E GRUPOS
  if FChatUserID = 0 then
  begin
    cHTML := cHTML +
      '<div class="chat-container">' +
      '<div class="top-bar">' +
      '<div class="top-title">&#9679; Conectados</div>' +
      '<div style="display:flex;align-items:center;gap:6px;">';

    // Botao "+ Novo Grupo" exclusivo para MASTER
    if isMaster then
      cHTML := cHTML +
        '<a href="javascript:void(0);" onclick="openNewGroupModal();" class="btn-new-grp" title="Criar Novo Grupo de Conversa">+ Grupo</a>';

    cHTML := cHTML +
      '<div class="badge-online">' + IntToStr(nOnline) + ' Online</div>' +
      '</div></div>' +
      '<div class="users-scroll">';

    // Card Sala Geral (Broadcast)
    nNaoLidas := 0;
    if mm <> nil then
      nNaoLidas := rc_TotalNaoLidasGlobal(mm.varI_User);

    cHTML := cHTML +
      '<div class="u-card ' + rc_IIF(nNaoLidas > 0, 'u-card-unread', '') + '">' +
      '<div class="u-avatar">&#128227;<span class="u-status-dot"></span></div>' +
      '<div class="u-info">' +
      '<div class="u-name">Sala Geral (Todos)' +
      rc_IIF(nNaoLidas > 0, '<span class="u-unread-pill">&#9679; ' + IntToStr(nNaoLidas) + '</span>', '') +
      '</div>' +
      '<div class="u-meta">Canal aberto para avisos gerais</div>' +
      '</div>' +
      '<a href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ',''open_chat'',[''id=-1'']);" ' +
      'class="btn-chat ' + rc_IIF(nNaoLidas > 0, 'btn-chat-unread', '') + '">&#128172; Abrir</a>' +
      '</div>';

    // Secao de Grupos
    if Length(snapGrupos) > 0 then
    begin
      cHTML := cHTML + '<div class="sec-title">&#128101; Grupos de Conversa</div>';
      for i := 0 to High(snapGrupos) do
      begin
        curGroupID := snapGrupos[i].GroupID;
        if (mm <> nil) and rc_UsuarioPodeVerGrupo(curGroupID, mm.varI_User, mm.vUserMaster) then
        begin
          nNaoLidas := rc_TotalNaoLidasGrupo(curGroupID, mm.varI_User);

          cHTML := cHTML +
            '<div class="u-card ' + rc_IIF(nNaoLidas > 0, 'u-card-unread', '') + '">' +
            '<div class="u-avatar u-avatar-grp">&#128101;</div>' +
            '<div class="u-info">' +
            '<div class="u-name">' + rc_EscapeHTML(snapGrupos[i].Nome) +
            rc_IIF(nNaoLidas > 0, '<span class="u-unread-pill">&#9679; ' + IntToStr(nNaoLidas) + '</span>', '') +
            '</div>' +
            '<div class="u-meta">' + IntToStr(Length(snapGrupos[i].Membros)) + ' membros</div>' +
            '</div>' +
            '<a href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ',''open_chat'',[''id=-' +
            IntToStr(100 + curGroupID) + ''']);" class="btn-chat ' + rc_IIF(nNaoLidas > 0, 'btn-chat-unread', '') + '">&#128172; Conversar</a>' +
            '</div>';
        end;
      end;
    end;

    // Secao de Usuarios Online
    cHTML := cHTML + '<div class="sec-title">&#128100; Usu&aacute;rios Online</div>';
    if nOnline = 0 then
      cHTML := cHTML + '<div class="empty-state">Nenhum usu&aacute;rio conectado no momento.</div>'
    else
    begin
      for i := 0 to nOnline - 1 do
      begin
        isMe := (mm <> nil) and (snapUsers[i].ID = mm.varI_User);

        nNaoLidas := 0;
        if (mm <> nil) and (not isMe) then
          nNaoLidas := rc_TotalNaoLidas(mm.varI_User, snapUsers[i].ID);

        cHTML := cHTML +
          '<div class="u-card ' + rc_IIF(nNaoLidas > 0, 'u-card-unread', '') + '">' +
          '<div class="u-avatar">' +
          UpperCase(Copy(snapUsers[i].Nome, 1, 2)) +
          '<span class="u-status-dot"></span>' +
          '</div>' +
          '<div class="u-info">' +
          '<div class="u-name">' +
          rc_EscapeHTML(snapUsers[i].Nome) +
          rc_IIF(isMe, ' <span style="color:#86efac;font-size:10px;">(Voc&ecirc;)</span>', '') +
          rc_IIF(nNaoLidas > 0, '<span class="u-unread-pill">&#9679; ' + IntToStr(nNaoLidas) + '</span>', '') +
          '</div>' +
          '<div class="u-meta">' +
          rc_EscapeHTML(snapUsers[i].Empresa) + ' &bull; ' + rc_EscapeHTML(snapUsers[i].Dispositivo) +
          '</div>' +
          '</div>';

        if isMe then
          cHTML := cHTML +
            '<a href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ',''open_chat'',[''id=' +
            IntToStr(snapUsers[i].ID) + ''']);" class="btn-chat btn-chat-self" title="Mensagens salvas, lembretes e anotações para você">&#128221; Conversar (Comigo)</a>'
        else
          cHTML := cHTML +
            '<a href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ',''open_chat'',[''id=' +
            IntToStr(snapUsers[i].ID) + ''']);" class="btn-chat ' + rc_IIF(nNaoLidas > 0, 'btn-chat-unread', '') + '">&#128172; Conversar</a>';

        cHTML := cHTML + '</div>';
      end;
    end;

    cHTML := cHTML + '</div></div>'; // Fecha users-scroll e chat-container

    // Modal de Criacao de Grupo para MASTER
    if isMaster then
    begin
      cGroupModalUsers := '';
      try
        if (dm_rc <> nil) and (mm <> nil) then
        begin
          dm_rc.memTemp.Close;
          dm_rc.memTemp.filtered := False;
          dm_rc.memTemp.Data := dm_rc.rc_GetRecord(mm.varB_Use_FireDac, True,
            'select codigo, nome, codifunc from usuarios where (codifunc is not null) and (codifunc > 0) order by nome');

          if not dm_rc.memTemp.IsEmpty then
          begin
            dm_rc.memTemp.First;
            while not dm_rc.memTemp.Eof do
            begin
              cGroupModalUsers := cGroupModalUsers +
                '<div class="grp-user-row" data-uid="' + dm_rc.memTemp.FieldByName('codigo').AsString + '" data-uname="' + rc_EscapeHTML(dm_rc.memTemp.FieldByName('nome').AsString) + '">' +
                '<div class="grp-user-name">' + rc_EscapeHTML(dm_rc.memTemp.FieldByName('nome').AsString) +
                '<span class="grp-func-badge">Func #' + dm_rc.memTemp.FieldByName('codifunc').AsString + '</span></div>' +
                '<div class="grp-perms">' +
                '<label class="grp-perm-label"><input type="checkbox" id="chk_ver_' + dm_rc.memTemp.FieldByName('codigo').AsString + '" checked> Ver</label>' +
                '<label class="grp-perm-label"><input type="checkbox" id="chk_env_' + dm_rc.memTemp.FieldByName('codigo').AsString + '" checked> Enviar</label>' +
                '</div>' +
                '</div>';
              dm_rc.memTemp.Next;
            end;
          end;
        end;
      except
      end;

      cHTML := cHTML +
        '<div id="grpModal" class="grp-modal" style="display:none;">' +
        '<div class="grp-modal-box">' +
        '<div class="grp-modal-header">' +
        '<span>&#128101; Criar Novo Grupo de Conversa</span>' +
        '<span class="emoji-close" onclick="closeNewGroupModal();" style="cursor:pointer;font-size:22px;line-height:1;">&times;</span>' +
        '</div>' +
        '<div class="grp-modal-body">' +
        '<div class="grp-input-label">&#127991; Nome do Grupo:</div>' +
        '<input type="text" id="newGrpName" class="grp-input-text" placeholder="Digite o nome do grupo (ex: Vendas, Operacional..' + '.)" autocomplete="off" oninput="window._grpNameDraft=this.value;" style="font-size:13px;padding:9px 12px;">' +
        '<div class="grp-input-label" style="margin-top:8px;">&#128101; Selecione os usu&aacute;rios para o grupo:</div>' +
        '<div class="grp-users-table">' +
        rc_IIF(cGroupModalUsers <> '', cGroupModalUsers, '<div style="padding:10px;color:#94a3b8;text-align:center;">Nenhum usu&aacute;rio com CODFUNC encontrado.</div>') +
        '</div>' +
        '</div>' +
        '<div class="grp-modal-footer">' +
        '<button onclick="closeNewGroupModal();" class="btn-cancel-grp">Cancelar</button>' +
        '<button onclick="submitNewGroup();" class="btn-save-grp">&#10004; Criar Grupo</button>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<script>' +
        'window._grpModalOpen = false;' +
        'function openNewGroupModal(){' +
        '  window._grpModalOpen = true;' +
        '  var m = document.getElementById("grpModal");' +
        '  if(m){ m.style.display = "flex"; }' +
        '  var inp = document.getElementById("newGrpName");' +
        '  if(inp){' +
        '    if(window._grpNameDraft) inp.value = window._grpNameDraft;' +
        '    inp.focus();' +
        '    inp.onkeydown = function(e){ if(e.key === "Enter"){ e.preventDefault(); submitNewGroup(); } };' +
        '  }' +
        '  ajaxRequest(' + jsName + ',"pause_timer",[]);' +
        '}' +
        'function closeNewGroupModal(){' +
        '  window._grpModalOpen = false;' +
        '  var m = document.getElementById("grpModal");' +
        '  if(m){ m.style.display = "none"; }' +
        '  ajaxRequest(' + jsName + ',"resume_timer",[]);' +
        '}' +
        'function submitNewGroup(){' +
        '  var inp = document.getElementById("newGrpName");' +
        '  var name = inp ? inp.value.trim() : "";' +
        '  if(!name){ alert("Por favor, digite o nome do grupo!"); if(inp) inp.focus(); return; }' +
        '  var members = [];' +
        '  var rows = document.querySelectorAll(".grp-user-row");' +
        '  rows.forEach(function(r){' +
        '    var uid = r.getAttribute("data-uid");' +
        '    var uname = r.getAttribute("data-uname");' +
        '    var chkVer = document.getElementById("chk_ver_" + uid);' +
        '    var chkEnv = document.getElementById("chk_env_" + uid);' +
        '    if(chkVer && chkVer.checked){' +
        '      members.push(uid + ":" + encodeURIComponent(uname) + ":1:" + (chkEnv && chkEnv.checked ? "1" : "0"));' +
        '    }' +
        '  });' +
        '  if(members.length === 0){ alert("Selecione ao menos um membro para o grupo!"); return; }' +
        '  window._grpNameDraft = "";' +
        '  ajaxRequest(' + jsName + ',"create_group",["name=" + encodeURIComponent(name), "members=" + members.join(",")]);' +
        '  closeNewGroupModal();' +
        '}' +
        '</script>';
    end;
  end
  // SE FChatUserID <> 0 -> CONVERSA ATIVA (Privada, Global ou Grupo)
  else
  begin
    cNomeDest := '';
    canSendGrp := True;

    if FChatUserID = -1 then
      cNomeDest := 'Sala Geral (Todos)'
    else if FChatUserID < -100 then
    begin
      curGroupID := Abs(FChatUserID) - 100;
      for i := 0 to High(snapGrupos) do
      begin
        if snapGrupos[i].GroupID = curGroupID then
        begin
          cNomeDest := snapGrupos[i].Nome;
          Break;
        end;
      end;
      if cNomeDest = '' then cNomeDest := 'Grupo #' + IntToStr(curGroupID);

      if mm <> nil then
        canSendGrp := rc_UsuarioPodeEnviarGrupo(curGroupID, mm.varI_User, mm.vUserMaster);
    end
    else
    begin
      for i := 0 to High(snapUsers) do
      begin
        if snapUsers[i].ID = FChatUserID then
        begin
          cNomeDest := snapUsers[i].Nome;
          Break;
        end;
      end;
      if cNomeDest = '' then
        cNomeDest := 'Usu&aacute;rio #' + IntToStr(FChatUserID);

      if (mm <> nil) and (FChatUserID = mm.varI_User) then
        cNomeDest := cNomeDest + ' (Mensagens Salvas / Voc&ecirc;)';
    end;

    cHTML := cHTML +
      '<div class="chat-box" onclick="hideEmojiPicker();">' +
      '<div class="chat-header">' +
      '<a href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ',''back_list'',[]);" class="btn-back" title="Voltar e ver as pessoas online">&#8592; &#128101; Ver Pessoas Online</a>' +
      '<div class="chat-target">' +
      '<span class="dot"></span>' +
      '<span>' + rc_EscapeHTML(cNomeDest) + '</span>' +
      '</div>' +
      '</div>' +
      '<div id="chatMessages" class="chat-messages">';

    if Length(snapMsgs) = 0 then
    begin
      if (mm <> nil) and (FChatUserID = mm.varI_User) then
        cHTML := cHTML + '<div class="empty-state">&#128221; Espa&ccedil;o para suas anota&ccedil;&otilde;es, lembretes e arquivos salvos. Digite abaixo para guardar!</div>'
      else
        cHTML := cHTML + '<div class="empty-state">Nenhuma mensagem ainda. Digite abaixo para conversar!</div>';
    end
    else
    begin
      for i := 0 to High(snapMsgs) do
      begin
        if ((FChatUserID = -1) and ((snapMsgs[i].IDDestinatario = -1) or (snapMsgs[i].IDDestinatario = 0))) or
           ((FChatUserID < -100) and (snapMsgs[i].IDDestinatario = FChatUserID)) or
           ((FChatUserID > 0) and (
             ((snapMsgs[i].IDRemetente = mm.varI_User) and (snapMsgs[i].IDDestinatario = FChatUserID)) or
             ((snapMsgs[i].IDRemetente = FChatUserID) and (snapMsgs[i].IDDestinatario = mm.varI_User))
           )) then
        begin
          isMe := (mm <> nil) and (snapMsgs[i].IDRemetente = mm.varI_User);

          cHTML := cHTML +
            '<div class="msg-row ' + rc_IIF(isMe, 'msg-me', 'msg-other') + '">';

          if snapMsgs[i].Apagada then
          begin
            cHTML := cHTML +
              '<div class="bubble-deleted">&#128683; Mensagem apagada &bull; ' +
              FormatDateTime('hh:nn', snapMsgs[i].DataHora) + '</div>';
          end
          else
          begin
            cHTML := cHTML +
              '<div class="bubble ' + rc_IIF(isMe, 'bubble-me', 'bubble-other') + '">';

            if not isMe then
              cHTML := cHTML + '<div class="bubble-author">' + rc_EscapeHTML(snapMsgs[i].NomeRemetente) + '</div>';

            // Anexo no balao: Documento (PDF, Word, Excel, Bloco de Notas) ou Imagem
            if snapMsgs[i].ImagemURL <> '' then
            begin
              isDoc := rc_IsDocumento(snapMsgs[i].ImagemURL);
              if isDoc then
              begin
                rc_GetDocInfo(snapMsgs[i].ImagemURL, docExt, docBadge, docColor, docIconLabel, docDesc);
                sDocName := snapMsgs[i].Texto;
                if sDocName = '' then sDocName := ExtractFileName(snapMsgs[i].ImagemURL);
                if sDocName = '' then sDocName := 'Documento';

                cHTML := cHTML +
                  '<div class="msg-doc-card" onclick="openDocViewer(''' + snapMsgs[i].ImagemURL + ''',''' +
                  rc_EscapeHTML(sDocName) + ''',''' + docExt + ''',' + IntToStr(snapMsgs[i].MsgID) + ',' +
                  rc_IIF(isMe, '1', '0') + ');" title="Clique para abrir e visualizar">' +
                  '  <div class="msg-doc-top">' +
                  '    <div class="msg-doc-icon" style="background:' + docColor + ';">' + docIconLabel + '</div>' +
                  '    <div class="msg-doc-info">' +
                  '      <div class="msg-doc-name">' + rc_EscapeHTML(sDocName) + '</div>' +
                  '      <div class="msg-doc-desc">' + docDesc + '</div>' +
                  '    </div>' +
                  '  </div>' +
                  '  <div class="msg-doc-actions" onclick="event.stopPropagation();">' +
                  '    <a href="javascript:void(0);" onclick="openDocViewer(''' + snapMsgs[i].ImagemURL + ''',''' +
                  rc_EscapeHTML(sDocName) + ''',''' + docExt + ''',' + IntToStr(snapMsgs[i].MsgID) + ',' +
                  rc_IIF(isMe, '1', '0') + ');" class="btn-doc-view">&#128065; Visualizar</a>' +
                  '    <a href="' + snapMsgs[i].ImagemURL + '" target="_blank" download class="btn-doc-down">&#11015; Baixar</a>';

                if isMe then
                  cHTML := cHTML +
                    '    <a href="javascript:void(0);" onclick="if(confirm(''Deseja excluir este arquivo permanentemente?'')){ajaxRequest(' +
                    jsName + ',''del_msg'',[''id=' + IntToStr(snapMsgs[i].MsgID) + ''']);}" class="btn-doc-del" title="Excluir arquivo">&#128465;</a>';

                cHTML := cHTML + '  </div></div>';
              end
              else
              begin
                cHTML := cHTML +
                  '<div class="msg-img-wrap" onclick="expandImg(''' + snapMsgs[i].ImagemURL + ''',' + IntToStr(snapMsgs[i].MsgID) + ',' + rc_IIF(isMe, '1', '0') + ');" title="Clique para expandir">' +
                  '<img src="' + snapMsgs[i].ImagemURL + '" class="msg-img" alt="Imagem" loading="lazy">' +
                  '<div class="img-zoom-hint">&#128269; Expandir</div>';

                if isMe then
                  cHTML := cHTML +
                    '<a href="javascript:void(0);" onclick="event.stopPropagation(); if(confirm(''Deseja excluir esta imagem permanentemente?'')){ajaxRequest(' +
                    jsName + ',''del_msg'',[''id=' + IntToStr(snapMsgs[i].MsgID) + ''']);}" class="img-del-overlay" title="Excluir imagem">&#128465; Excluir</a>';

                cHTML := cHTML + '</div>';
              end;
            end;

            if snapMsgs[i].Texto <> '' then
            begin
              // Se for imagem e o texto for o proprio nome do arquivo, omite para exibicao limpa da foto
              if (snapMsgs[i].ImagemURL <> '') and not isDoc and
                 (SameText(snapMsgs[i].Texto, ExtractFileName(snapMsgs[i].ImagemURL)) or rc_IsImagem(snapMsgs[i].Texto)) then
                { Oculta nome tecnico do arquivo da imagem }
              else
                cHTML := cHTML + '<div>' + rc_EscapeHTML(snapMsgs[i].Texto) + '</div>';
            end;

            cHTML := cHTML +
              '<div class="bubble-bottom">' +
              '<span class="bubble-time">' + FormatDateTime('hh:nn', snapMsgs[i].DataHora) + '</span>';

            if isMe then
            begin
              sReadsAttr := '';
              for kLeit := 0 to High(snapMsgs[i].Leituras) do
              begin
                if sReadsAttr <> '' then sReadsAttr := sReadsAttr + '|';
                sReadsAttr := sReadsAttr +
                  rc_EscapeHTML(snapMsgs[i].Leituras[kLeit].Nome) + '*' +
                  FormatDateTime('dd/mm/yyyy hh:nn:ss', snapMsgs[i].Leituras[kLeit].DataHora);
              end;

              if Length(snapMsgs[i].Leituras) > 0 then
                cHTML := cHTML + '<span class="msg-status msg-read" title="Visualizada por ' + IntToStr(Length(snapMsgs[i].Leituras)) + ' pessoa(s)">&#10004;&#10004;</span>'
              else
                cHTML := cHTML + '<span class="msg-status msg-delivered" title="Entregue">&#10004;&#10004;</span>';

              // Botao 3 pontinhos para ver detalhes de quem visualizou
              cHTML := cHTML +
                '<a href="javascript:void(0);" onclick="event.stopPropagation(); showMsgReads(this);" ' +
                'data-reads="' + sReadsAttr + '" ' +
                'data-total="' + IntToStr(Length(snapMsgs[i].Leituras)) + '" ' +
                'data-time="' + FormatDateTime('dd/mm/yyyy hh:nn', snapMsgs[i].DataHora) + '" ' +
                'class="btn-msg-dots" title="Ver quem visualizou e hor&aacute;rios">&#8942;</a>';

              cHTML := cHTML +
                '<a href="javascript:void(0);" onclick="if(confirm(''Deseja apagar esta mensagem?'')){ajaxRequest(' +
                jsName + ',''del_msg'',[''id=' + IntToStr(snapMsgs[i].MsgID) + ''']);}" class="btn-del" title="Apagar mensagem">' +
                svgTrash + '</a>';
            end;

            cHTML := cHTML + '</div></div>';
          end;

          cHTML := cHTML + '</div>';
        end;
      end;
    end;

    cHTML := cHTML + '</div>'; // Fecha chatMessages

    // Painel Seletor de Emojis
    cHTML := cHTML +
      '<div id="emojiPicker" class="emoji-picker" style="display:none;" onclick="event.stopPropagation();">' +
      '<div class="emoji-picker-header">' +
      '<span>Emojis</span>' +
      '<span class="emoji-close" onclick="hideEmojiPicker();">&times;</span>' +
      '</div>' +
      '<div id="emojiGrid" class="emoji-grid"></div>' +
      '</div>';

    // Rodape com Textarea Amplo Acima e Barra de Acoes Animada
    if canSendGrp then
    begin
      cHTML := cHTML +
        '<div class="chat-footer" onclick="event.stopPropagation(); hideActionsMenu();">' +
        '  <div id="actionsMenu" class="actions-menu-popup" style="display:none;" onclick="event.stopPropagation();">' +
        '    <div class="actions-menu-title">Op&ccedil;&otilde;es de Envio</div>' +
        '    <div class="actions-menu-items">' +
        '      <a href="javascript:void(0);" onclick="hideActionsMenu(); ajaxRequest(' + jsName + ',''attach_doc'',[]);" class="action-item" title="Anexar Documento (PDF, Word, Excel, Bloco de Notas)">' +
        '        <span class="action-item-icon">&#128206;</span>' +
        '        <span class="action-item-label">Documento</span>' +
        '      </a>' +
        '      <a href="javascript:void(0);" onclick="hideActionsMenu(); ajaxRequest(' + jsName + ',''attach_img'',[]);" class="action-item" title="Anexar Foto / Imagem">' +
        '        <span class="action-item-icon">&#128247;</span>' +
        '        <span class="action-item-label">Foto</span>' +
        '      </a>' +
        '      <a href="javascript:void(0);" onclick="hideActionsMenu(); toggleEmojiPicker(event);" class="action-item" title="Inserir Emoji">' +
        '        <span class="action-item-icon">&#128512;</span>' +
        '        <span class="action-item-label">Emojis</span>' +
        '      </a>' +
        '      <a href="javascript:void(0);" onclick="hideActionsMenu(); toggleChatInputSize(event);" class="action-item" id="btnExpandChat" title="Aumentar / Diminuir campo">' +
        '        <span class="action-item-icon">&#10530;</span>' +
        '        <span class="action-item-label">Expandir</span>' +
        '      </a>' +
        '    </div>' +
        '  </div>' +
        '  <div class="chat-input-row">' +
        '    <textarea id="chatInput" class="chat-input-memo" rows="2" placeholder="' +
        rc_IIF((mm <> nil) and (FChatUserID = mm.varI_User), 'Digite uma anota&ccedil;&atilde;o ou envie um arquivo para voc&ecirc; mesmo...', 'Digite uma mensagem...') +
        '" onkeydown="handleChatKey(event);" oninput="onChatInput(this);" autocomplete="off"></textarea>' +
        '  </div>' +
        '  <div class="chat-tools-row">' +
        '    <button type="button" onclick="toggleActionsMenu(event);" class="btn-action-trigger" id="btnActionTrigger" title="Clique para abrir op&ccedil;&otilde;es">' +
        '      <span class="btn-action-icon">+</span>' +
        '      <span class="btn-action-text">A&ccedil;&otilde;es</span>' +
        '    </button>' +
        '    <span class="chat-tip-hint">Enter envia &bull; Shift+Enter quebra linha</span>' +
        '    <button onclick="sendChatMsg();" class="btn-send-chat" title="Enviar Mensagem">&#10148;</button>' +
        '  </div>' +
        '</div>';
    end
    else
    begin
      cHTML := cHTML +
        '<div class="chat-footer-readonly">&#128274; Voc&ecirc; possui permiss&atilde;o apenas para visualizar as mensagens deste grupo.</div>';
    end;

    cHTML := cHTML + '</div>'; // Fecha chat-box

    // Modal de Detalhes de Quem Visualizou
    cHTML := cHTML +
      '<div id="msgInfoModal" class="msg-info-modal" style="display:none;" onclick="closeMsgInfo();">' +
      '<div class="msg-info-card" onclick="event.stopPropagation();">' +
      '<div class="msg-info-header">' +
      '<div class="msg-info-title">&#128065; Detalhes da Mensagem</div>' +
      '<span class="msg-info-close" onclick="closeMsgInfo();">&times;</span>' +
      '</div>' +
      '<div class="msg-info-body" id="msgInfoBody"></div>' +
      '</div></div>';

    // Scripts de controle do chat, expansao de imagens e emojis
    cHTML := cHTML +
      '<script>' +
      'var emoList=[' +
      '128512,128515,128516,128513,128518,128517,129315,128514,128578,128579,' +
      '128521,128522,128519,129392,128525,129321,128536,128537,128540,128538,' +
      '128523,128524,128526,129395,129300,129323,128580,128556,128564,128567,' +
      '129312,129299,129488,128077,128078,128076,128588,129309,128074,9996,' +
      '129310,129305,128075,128591,10084,129505,128155,128154,128153,128156,' +
      '128420,128148,128175,128293,10024,127881,128640,127806,127805,128668,' +
      '127793,127970,128002,128004,128014,9749,127867,127942,129351,11088,' +
      '128202,128200,128203,128204,128206,9888,9989,10060,128161,128276,128172' +
      '];' +
      'function renderEmojis(){' +
      '  var g = document.getElementById("emojiGrid");' +
      '  if(g && g.children.length === 0){' +
      '    emoList.forEach(function(cp){' +
      '      var s = document.createElement("span");' +
      '      s.className = "emoji-item";' +
      '      s.textContent = String.fromCodePoint(cp);' +
      '      s.onclick = function(){ insertEmoji(this.textContent); };' +
      '      g.appendChild(s);' +
      '    });' +
      '  }' +
      '}' +
      'renderEmojis();' +
      'function toggleActionsMenu(e){' +
      '  if(e) e.stopPropagation();' +
      '  var m = document.getElementById(''actionsMenu'');' +
      '  var btn = document.getElementById(''btnActionTrigger'');' +
      '  if(!m) return;' +
      '  if(m.style.display === ''none'' || m.style.display === ''''){' +
      '    m.style.display = ''flex'';' +
      '    if(btn) btn.classList.add(''active'');' +
      '  } else {' +
      '    m.style.display = ''none'';' +
      '    if(btn) btn.classList.remove(''active'');' +
      '  }' +
      '}' +
      'function hideActionsMenu(){' +
      '  var m = document.getElementById(''actionsMenu'');' +
      '  var btn = document.getElementById(''btnActionTrigger'');' +
      '  if(m && m.style.display !== ''none'') {' +
      '    m.style.display = ''none'';' +
      '    if(btn) btn.classList.remove(''active'');' +
      '  }' +
      '}' +
      'function showMsgReads(btn){' +
      '  var total = parseInt(btn.getAttribute(''data-total'') || ''0'');' +
      '  var raw = btn.getAttribute(''data-reads'') || '''';' +
      '  var time = btn.getAttribute(''data-time'') || '''';' +
      '  var body = document.getElementById(''msgInfoBody'');' +
      '  var modal = document.getElementById(''msgInfoModal'');' +
      '  if(!body || !modal) return;' +
      '  var h = ''<div style="font-size:11px;color:#64748b;margin-bottom:6px;">Enviada em: <b>'' + time + ''</b></div>'';' +
      '  if(total === 0){' +
      '    h += ''<div style="text-align:center;padding:16px 8px;background:#f8fafc;border-radius:10px;border:1px dashed #cbd5e1;">'' +' +
      '         ''  <div style="font-size:22px;margin-bottom:4px;">&#9203;</div>'' +' +
      '         ''  <div style="font-size:12px;font-weight:700;color:#334155;">Ainda n&atilde;o visualizada</div>'' +' +
      '         ''  <div style="font-size:11px;color:#64748b;margin-top:2px;">A mensagem foi entregue, mas nenhum outro participante a abriu at&eacute; o momento.</div>'' +' +
      '         ''</div>'';' +
      '  } else {' +
      '    h += ''<div style="font-size:12px;font-weight:700;color:#047857;margin-bottom:8px;">&#10004;&#10004; Visualizada por '' + total + '' pessoa'' + (total > 1 ? ''s'' : '''') + '':</div>'';' +
      '    h += ''<div style="display:flex;flex-direction:column;gap:6px;">'';' +
      '    var items = raw.split(''|'');' +
      '    items.forEach(function(item){' +
      '      var parts = item.split(''*'');' +
      '      var nome = parts[0] || ''Usu&aacute;rio'';' +
      '      var dataHora = parts[1] || '''';' +
      '      h += ''<div class="msg-read-row">'' +' +
      '           ''  <div style="display:flex;align-items:center;gap:6px;">'' +' +
      '           ''    <span style="color:#10b981;font-weight:bold;">&#10004;&#10004;</span>'' +' +
      '           ''    <span class="msg-read-user">'' + nome + ''</span>'' +' +
      '           ''  </div>'' +' +
      '           ''  <span class="msg-read-time">'' + dataHora + ''</span>'' +' +
      '           ''</div>'';' +
      '    });' +
      '    h += ''</div>'';' +
      '  }' +
      '  body.innerHTML = h;' +
      '  modal.style.display = ''flex'';' +
      '}' +
      'function closeMsgInfo(){' +
      '  var modal = document.getElementById(''msgInfoModal'');' +
      '  if(modal) modal.style.display = ''none'';' +
      '}' +
      'function onChatInput(el){' +
      '  window._chatDraft = el.value;' +
      '  autoExpandChat(el);' +
      '}' +
      'function toggleChatInputSize(e){' +
      '  if(e) e.stopPropagation();' +
      '  var inp = document.getElementById("chatInput");' +
      '  var btn = document.getElementById("btnExpandChat");' +
      '  if(!inp) return;' +
      '  if(inp.offsetHeight <= 65){' +
      '    inp.style.height = "140px";' +
      '    if(btn) btn.innerHTML = "&#10529;";' +
      '  } else {' +
      '    inp.style.height = "46px";' +
      '    if(btn) btn.innerHTML = "&#10530;";' +
      '  }' +
      '}' +
      'function handleChatKey(e){' +
      '  if(e.key === "Enter" && !e.shiftKey){' +
      '    e.preventDefault();' +
      '    sendChatMsg();' +
      '  }' +
      '}' +
      'function autoExpandChat(el){' +
      '  if(el.style.height && parseInt(el.style.height) > 65) return;' +
      '  el.style.height = "auto";' +
      '  var newH = Math.max(46, Math.min(el.scrollHeight, 140));' +
      '  el.style.height = newH + "px";' +
      '}' +
      'function sendChatMsg(){' +
      '  var inp = document.getElementById("chatInput");' +
      '  hideEmojiPicker();' +
      '  if(inp && inp.value.trim() !== ""){ ' +
      '    ajaxRequest(' + jsName + ',"send_chat",["text=" + encodeURIComponent(inp.value.trim())]);' +
      '    window._chatDraft = "";' +
      '    inp.value = "";' +
      '    inp.style.height = "46px";' +
      '  }' +
      '}' +
      'function openDocViewer(url, fileName, ext, msgId, canDel){' +
      '  try {' +
      '    var topDoc = (window.top && window.top.document) ? window.top.document : document;' +
      '    var exist = topDoc.getElementById("globalDocLightbox");' +
      '    if(!exist){' +
      '      var lb = topDoc.createElement("div");' +
      '      lb.id = "globalDocLightbox";' +
      '      lb.style.cssText = "position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.92);' +
      'backdrop-filter:blur(8px);z-index:9999999;display:flex;flex-direction:column;align-items:center;justify-content:center;' +
      'padding:16px;box-sizing:border-box;";' +
      '      lb.innerHTML = ''<div style="position:relative;width:96vw;max-width:1100px;height:90vh;display:flex;' +
      'flex-direction:column;background:#0d281e;border:1px solid #22c55e;border-radius:14px;box-shadow:0 16px 48px rgba(0,0,0,0.85);' +
      'overflow:hidden;">'' +' +
      '        ''<div style="padding:10px 16px;background:linear-gradient(135deg,#061f16 0%,#0e3828 100%);border-bottom:1px solid #1a563f;' +
      'display:flex;align-items:center;justify-content:space-between;flex-shrink:0;">'' +' +
      '          ''<div style="display:flex;align-items:center;gap:10px;min-width:0;flex:1;">'' +' +
      '            ''<span id="globalDocBadge" style="padding:3px 8px;border-radius:4px;font-size:10px;font-weight:900;' +
      'color:#ffffff;background:#ef4444;letter-spacing:0.5px;">PDF</span>'' +' +
      '            ''<span id="globalDocTitle" style="color:#ffffff;font-size:13.5px;font-weight:700;white-space:nowrap;' +
      'overflow:hidden;text-overflow:ellipsis;">Documento</span>'' +' +
      '          ''</div>'' +' +
      '          ''<div style="display:flex;align-items:center;gap:8px;flex-shrink:0;">'' +' +
      '            ''<a id="globalDocDownload" href="" target="_blank" download style="background:#166534;color:#bbf7d0;' +
      'border:1px solid #22c55e;padding:6px 14px;border-radius:6px;font-size:12px;font-weight:700;text-decoration:none;' +
      'display:inline-flex;align-items:center;gap:6px;">&#11015; Baixar</a>'' +' +
      '            ''<a id="globalDocOpenNew" href="" target="_blank" style="background:#1e293b;color:#f1f5f9;border:1px solid #475569;' +
      'padding:6px 12px;border-radius:6px;font-size:12px;font-weight:600;text-decoration:none;display:inline-flex;' +
      'align-items:center;gap:6px;">&#128279; Nova Aba</a>'' +' +
      '            ''<a id="globalDocDel" href="javascript:void(0);" style="background:#7f1d1d;color:#fecaca;border:1px solid #ef4444;' +
      'padding:6px 10px;border-radius:6px;font-size:12px;font-weight:700;text-decoration:none;display:none;' +
      'align-items:center;gap:4px;cursor:pointer;">&#128465; Excluir</a>'' +' +
      '            ''<span id="globalDocClose" style="color:#cbd5e1;font-size:26px;font-weight:bold;cursor:pointer;line-height:1;' +
      'padding:0 6px;margin-left:4px;" title="Fechar (&Eacute;sc)">&times;</span>'' +' +
      '          ''</div>'' +' +
      '        ''</div>'' +' +
      '        ''<div id="globalDocBody" style="flex:1;width:100%;height:100%;background:#091b14;position:relative;' +
      'overflow:hidden;display:flex;align-items:center;justify-content:center;"></div>'' +' +
      '      ''</div>'';' +
      '      lb.onclick = function(e){ if(e.target === lb || e.target.id === "globalDocClose"){ lb.style.display = "none";' +
      ' var b = topDoc.getElementById("globalDocBody"); if(b) b.innerHTML = ""; } };' +
      '      topDoc.addEventListener("keydown", function(e){ if(e.key === "Escape"){ lb.style.display = "none";' +
      ' var b = topDoc.getElementById("globalDocBody"); if(b) b.innerHTML = ""; } });' +
      '      topDoc.body.appendChild(lb);' +
      '    }' +
      '    var topLb = topDoc.getElementById("globalDocLightbox");' +
      '    var topBadge = topDoc.getElementById("globalDocBadge");' +
      '    var topTitle = topDoc.getElementById("globalDocTitle");' +
      '    var topDown = topDoc.getElementById("globalDocDownload");' +
      '    var topOpen = topDoc.getElementById("globalDocOpenNew");' +
      '    var topDel = topDoc.getElementById("globalDocDel");' +
      '    var topBody = topDoc.getElementById("globalDocBody");' +
      '    ext = (ext || "").toLowerCase();' +
      '    if(topTitle){ topTitle.textContent = fileName || "Documento"; }' +
      '    if(topDown){ topDown.href = url; }' +
      '    if(topOpen){ topOpen.href = url; }' +
      '    var badgeText = "DOC"; var badgeColor = "#2563eb";' +
      '    if(ext === ".pdf" || url.indexOf("/pdf/") >= 0){ badgeText = "PDF"; badgeColor = "#ef4444"; }' +
      '    else if(ext === ".xls" || ext === ".xlsx" || ext === ".csv"){ badgeText = "XLS"; badgeColor = "#16a34a"; }' +
      '    else if(ext === ".txt"){ badgeText = "TXT"; badgeColor = "#f59e0b"; }' +
      '    else if(ext === ".doc" || ext === ".docx"){ badgeText = "DOC"; badgeColor = "#2563eb"; }' +
      '    if(topBadge){ topBadge.textContent = badgeText; topBadge.style.background = badgeColor; }' +
      '    if(topDel){' +
      '      if(canDel && msgId){' +
      '        topDel.style.display = "inline-flex";' +
      '        topDel.onclick = function(e){' +
      '          e.stopPropagation();' +
      '          if(confirm("Tem certeza que deseja excluir este arquivo permanentemente?")){' +
      '            topLb.style.display = "none";' +
      '            if(topBody) topBody.innerHTML = "";' +
      '            ajaxRequest(' + jsName + ',"del_msg",["id=" + msgId]);' +
      '          }' +
      '        };' +
      '      } else {' +
      '        topDel.style.display = "none";' +
      '      }' +
      '    }' +
      '    if(ext === ".pdf" || url.indexOf("/pdf/") >= 0){' +
      '      topBody.innerHTML = ''<iframe src="'' + url + ''#toolbar=1&navpanes=1" style="width:100%;height:100%;border:none;background:#ffffff;"></iframe>'';' +
      '    } else if(ext === ".txt"){' +
      '      topBody.innerHTML = ''<div style="padding:20px;color:#86efac;font-size:13px;">Carregando bloco de notas...</div>'';' +
      '      fetch(url).then(function(r){ return r.text(); }).then(function(txt){' +
      '        var safe = txt.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");' +
      '        topBody.innerHTML = ''<div style="width:100%;height:100%;box-sizing:border-box;overflow:auto;background:#04140e;' +
      'color:#e2e8f0;padding:20px;font-family:Consolas,monospace;font-size:13.5px;line-height:1.6;white-space:pre-wrap;user-select:text;">'' + safe + ''</div>'';' +
      '      }).catch(function(){' +
      '        topBody.innerHTML = ''<iframe src="'' + url + ''" style="width:100%;height:100%;border:none;background:#ffffff;"></iframe>'';' +
      '      });' +
      '    } else if(ext === ".doc" || ext === ".docx"){' +
      '      topBody.innerHTML = ''<div style="max-width:520px;width:92%;background:rgba(12,40,30,0.95);border:1px solid #3b82f6;' +
      'border-radius:14px;padding:28px 24px;text-align:center;box-shadow:0 12px 36px rgba(0,0,0,0.6);">'' +' +
      '        ''<div style="width:68px;height:68px;margin:0 auto 16px;background:linear-gradient(135deg,#2563eb,#1d4ed8);' +
      'border-radius:14px;display:flex;align-items:center;justify-content:center;color:#fff;font-size:24px;font-weight:900;' +
      'box-shadow:0 6px 18px rgba(37,99,235,0.4);">DOC</div>'' +' +
      '        ''<div style="font-size:16px;font-weight:700;color:#ffffff;word-break:break-word;margin-bottom:6px;">'' + (fileName || "Documento Word") + ''</div>'' +' +
      '        ''<div style="font-size:12px;color:#93c5fd;margin-bottom:22px;">Documento do Microsoft Word</div>'' +' +
      '        ''<div style="display:flex;flex-direction:column;gap:10px;align-items:center;">'' +' +
      '          ''<a href="'' + url + ''" target="_blank" download style="width:100%;max-width:280px;background:#2563eb;color:#fff;' +
      'padding:10px 16px;border-radius:8px;font-weight:700;font-size:13px;text-decoration:none;display:inline-flex;' +
      'align-items:center;justify-content:center;gap:8px;box-shadow:0 4px 12px rgba(37,99,235,0.3);">&#11015; Baixar Arquivo Word</a>'' +' +
      '          ''<a href="'' + url + ''" target="_blank" style="width:100%;max-width:280px;background:#1e293b;border:1px solid #3b82f6;' +
      'color:#93c5fd;padding:9px 16px;border-radius:8px;font-weight:600;font-size:12px;text-decoration:none;display:inline-flex;' +
      'align-items:center;justify-content:center;gap:8px;">&#128279; Abrir no Navegador / Nova Aba</a>'' +' +
      '        ''</div></div>'';' +
      '    } else if(ext === ".xls" || ext === ".xlsx" || ext === ".csv"){' +
      '      topBody.innerHTML = ''<div style="max-width:520px;width:92%;background:rgba(12,40,30,0.95);border:1px solid #22c55e;' +
      'border-radius:14px;padding:28px 24px;text-align:center;box-shadow:0 12px 36px rgba(0,0,0,0.6);">'' +' +
      '        ''<div style="width:68px;height:68px;margin:0 auto 16px;background:linear-gradient(135deg,#16a34a,#15803d);' +
      'border-radius:14px;display:flex;align-items:center;justify-content:center;color:#fff;font-size:24px;font-weight:900;' +
      'box-shadow:0 6px 18px rgba(22,163,74,0.4);">XLS</div>'' +' +
      '        ''<div style="font-size:16px;font-weight:700;color:#ffffff;word-break:break-word;margin-bottom:6px;">'' + (fileName || "Planilha Excel") + ''</div>'' +' +
      '        ''<div style="font-size:12px;color:#86efac;margin-bottom:22px;">Planilha do Microsoft Excel</div>'' +' +
      '        ''<div style="display:flex;flex-direction:column;gap:10px;align-items:center;">'' +' +
      '          ''<a href="'' + url + ''" target="_blank" download style="width:100%;max-width:280px;background:#16a34a;color:#fff;' +
      'padding:10px 16px;border-radius:8px;font-weight:700;font-size:13px;text-decoration:none;display:inline-flex;' +
      'align-items:center;justify-content:center;gap:8px;box-shadow:0 4px 12px rgba(22,163,74,0.3);">&#11015; Baixar Planilha Excel</a>'' +' +
      '          ''<a href="'' + url + ''" target="_blank" style="width:100%;max-width:280px;background:#1e293b;border:1px solid #22c55e;' +
      'color:#86efac;padding:9px 16px;border-radius:8px;font-weight:600;font-size:12px;text-decoration:none;display:inline-flex;' +
      'align-items:center;justify-content:center;gap:8px;">&#128279; Abrir no Navegador / Nova Aba</a>'' +' +
      '        ''</div></div>'';' +
      '    } else {' +
      '      topBody.innerHTML = ''<iframe src="'' + url + ''" style="width:100%;height:100%;border:none;background:#ffffff;"></iframe>'';' +
      '    }' +
      '    if(topLb){ topLb.style.display = "flex"; }' +
      '  } catch(e) { window.open(url, "_blank"); }' +
      '}' +
      'function expandImg(url, msgId, canDel){' +
      '  try {' +
      '    var topDoc = (window.top && window.top.document) ? window.top.document : document;' +
      '    var exist = topDoc.getElementById("globalChatLightbox");' +
      '    if(!exist){' +
      '      var lb = topDoc.createElement("div");' +
      '      lb.id = "globalChatLightbox";' +
      '      lb.style.cssText = "position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.92);backdrop-filt' + 'er:blur(8px);z-index:9999999;display:fle' + 'x;flex-direction:column;align-items:center;justify-content:center;padding:20px;box-sizing:border-box;";' +
      '      lb.innerHTML = ''<div style="position:relative;max-width:92vw;max-height:90vh;display:flex;flex-direction:column;align-items:center;">'' +' +
      '        ''<span id="globalChatClose" style="position:absolute;top:-42px;right:-10px;color:#f8fafc;font-size:36px;font-we' + 'ight:bold;cursor:pointer;line-height:1;text-shadow:0 2px 6px #000;user-select:none;">&times;</span>'' +' +
      '        ''<img id="globalChatImg" src="" style="max-width:100%;max-height:82vh;border-radius:8px;object-fit:contain;box-' + 'shadow:0 12px 36px rgba(0,0,0,0.85);border:1px solid rgba(255,255,255,0.2);">'' +' +
      '        ''<div style="margin-top:14px;display:flex;gap:12px;flex-wrap:wrap;justify-content:center;">'' +' +
      '        ''<a id="globalChatLink" href="" target="_blank" download style="background:#102e24;color:#86efac;border:1px sol' + 'id #1a4d3c;padding:8px 18px;border-radius:6px;font-size:12px;'' +' +
      '        ''font-weight:700;text-decoration:none;display:inline-flex;align-items:center;gap:6px;transition:0.2s;">&#128190; Baixar Imagem</a>'' +' +
      '        ''<a id="globalChatOpen" href="" target="_blank" style="background:#1e293b;color:#f1f5f9;border:1px solid #33415' + '5;padding:8px 18px;border-radius:6px;font-size:12px;'' +' +
      '        ''font-weight:700;text-decoration:none;display:inline-flex;align-items:center;gap:6px;transition:0.2s;">&#128279; Abrir em Nova Aba</a>'' +' +
      '        ''<a id="globalChatDel" href="javascript:void(0);" style="background:#7f1d1d;color:#fecaca;border:1px solid #ef4' + '444;padding:8px 18px;border-radius:6px;font-size:12px;'' +' +
      '        ''font-weight:700;text-decoration:none;display:none;align-items:center;gap:6px;cursor:pointer;transition:0.2s;">' + '&#128465; Excluir Imagem</a>'' +' +
      '        ''</div></div>'';' +
      '      lb.onclick = function(e){ if(e.target === lb || e.target.id === "globalChatClose"){ lb.style.display = "none"; } };' +
      '      topDoc.addEventListener("keydown", function(e){ if(e.key === "Escape"){ lb.style.display = "none"; } });' +
      '      topDoc.body.appendChild(lb);' +
      '    }' +
      '    var topLb = topDoc.getElementById("globalChatLightbox");' +
      '    var topImg = topDoc.getElementById("globalChatImg");' +
      '    var topLink = topDoc.getElementById("globalChatLink");' +
      '    var topOpen = topDoc.getElementById("globalChatOpen");' +
      '    var topDel = topDoc.getElementById("globalChatDel");' +
      '    if(topImg){ topImg.src = url; }' +
      '    if(topLink){ topLink.href = url; }' +
      '    if(topOpen){ topOpen.href = url; }' +
      '    if(topDel){' +
      '      if(canDel && msgId){' +
      '        topDel.style.display = "inline-flex";' +
      '        topDel.onclick = function(e){' +
      '          e.stopPropagation();' +
      '          if(confirm("Tem certeza que deseja excluir esta imagem permanentemente?")){' +
      '            topLb.style.display = "none";' +
      '            ajaxRequest(' + jsName + ',"del_msg",["id=" + msgId]);' +
      '          }' +
      '        };' +
      '      } else {' +
      '        topDel.style.display = "none";' +
      '      }' +
      '    }' +
      '    if(topLb){ topLb.style.display = "flex"; }' +
      '  } catch(err) { window.open(url, "_blank"); }' +
      '}' +
      'function toggleEmojiPicker(e){' +
      '  if(e){ e.stopPropagation(); }' +
      '  var p = document.getElementById("emojiPicker");' +
      '  if(p){ p.style.display = (p.style.display === "none" || p.style.display === "") ? "flex" : "none"; }' +
      '}' +
      'function hideEmojiPicker(){' +
      '  var p = document.getElementById("emojiPicker");' +
      '  if(p){ p.style.display = "none"; }' +
      '}' +
      'function insertEmoji(emo){' +
      '  var inp = document.getElementById("chatInput");' +
      '  if(inp){' +
      '    var st = inp.selectionStart || inp.value.length;' +
      '    var en = inp.selectionEnd || inp.value.length;' +
      '    var val = inp.value;' +
      '    inp.value = val.substring(0, st) + emo + val.substring(en);' +
      '    inp.selectionStart = inp.selectionEnd = st + emo.length;' +
      '    autoExpandChat(inp);' +
      '    inp.focus();' +
      '  }' +
      '}' +
      'document.addEventListener("keydown", function(e){ if(e.key==="Escape"){ hideEmojiPicker(); } });' +
      'var b = document.getElementById("chatMessages");' +
      'if(b){ b.scrollTop = b.scrollHeight; }' +
      'var inp = document.getElementById("chatInput");' +
      'if(inp){' +
      '  if(window._chatDraft && window._chatDraft.trim() !== ""){ inp.value = window._chatDraft; }' +
      '  autoExpandChat(inp);' +
      '  inp.focus();' +
      '}' +
      '</script>';
  end;

  FLastMsgSeq       := gMsgSeq;
  FLastChatUserID   := FChatUserID;
  FLastOnlineCount  := Length(gListOnline);
  FLastGroupCount   := Length(gListGrupos);
  if mm <> nil then
    FLastUnreadGlobal := rc_TotalNaoLidasGlobal(mm.varI_User)
  else
    FLastUnreadGlobal := 0;
  htmlOnline.HTML.Text := cHTML;
end;

initialization
  RegisterClass(TfrmUsuariosOnline);
  gLockOnline := TCriticalSection.Create;
  SetLength(gListOnline, 0);
  SetLength(gListMensagens, 0);
  SetLength(gListGrupos, 0);
  gMsgSeq := 0;
  gNextGroupID := 1;

finalization
  gLockOnline.Free;

end.
