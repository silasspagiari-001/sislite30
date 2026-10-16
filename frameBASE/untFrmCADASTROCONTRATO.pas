unit untFrmCADASTROCONTRATO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniHTMLFrame,
  uniPanel, StrUtils, IniFiles, FireDAC.Comp.Client, uMsgInfo;

type
  TfrmCADASTROCONTRATO = class(TUniForm)
    htmlCadastroContrato: TUniHTMLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure htmlCadastroContratoAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    { Private declarations }
    FEmpresaID      : Integer;
    FEmpresaNome    : string;
    FEmpresaCNPJ    : string;
    FContratoAtual  : string;
    FTentativaAtual : Integer;
    FBloqueado      : Boolean;
    FMsgErro        : string;

    function GerarHTMLInterno: string;
  public
    { Public declarations }
    procedure CarregaDados(AEmpresaID: Integer; const AEmpresaNome, AEmpresaCNPJ, AContrato: string; ATentativa: Integer; ABloqueado: Boolean; const AMsgErro: string = '');
  end;

function frmCADASTROCONTRATO: TfrmCADASTROCONTRATO;

function rc_GetTentativasContrato(AEmpresaID: Integer): Integer;
procedure rc_SetTentativasContrato(AEmpresaID, AQtd: Integer);

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, Main, untDM_RC;

function frmCADASTROCONTRATO: TfrmCADASTROCONTRATO;
begin
  Result := TfrmCADASTROCONTRATO(mm.GetFormInstance(TfrmCADASTROCONTRATO));
end;

function rc_GetTentativasContrato(AEmpresaID: Integer): Integer;
var
  sIniPath: string;
  Ini: TIniFile;
begin
  Result := 0;
  try
    sIniPath := ExtractFilePath(Application.ExeName) + 'files\control\contrato_tentativas.ini';
    if FileExists(sIniPath) then
    begin
      Ini := TIniFile.Create(sIniPath);
      try
        Result := Ini.ReadInteger('EMPRESA_' + IntToStr(AEmpresaID), 'TENTATIVAS', 0);
      finally
        Ini.Free;
      end;
    end;
  except
    on E: Exception do
      Result := 0;
  end;
end;

procedure rc_SetTentativasContrato(AEmpresaID, AQtd: Integer);
var
  sDir, sIniPath: string;
  Ini: TIniFile;
begin
  try
    sDir := ExtractFilePath(Application.ExeName) + 'files\control';
    if not DirectoryExists(sDir) then
      ForceDirectories(sDir);
    sIniPath := sDir + '\contrato_tentativas.ini';
    Ini := TIniFile.Create(sIniPath);
    try
      Ini.WriteInteger('EMPRESA_' + IntToStr(AEmpresaID), 'TENTATIVAS', AQtd);
    finally
      Ini.Free;
    end;
  except
    on E: Exception do
      gera_log('rc_SetTentativasContrato Erro: ' + E.Message);
  end;
end;

procedure TfrmCADASTROCONTRATO.UniFormCreate(Sender: TObject);
begin
  Self.KeyPreview  := True;
  Self.BorderStyle := bsNone;
  Self.Position    := poScreenCenter;
  Self.Width       := 580;
  Self.Height      := 630;
  with Self.Constraints do
  begin
    MinWidth  := 580;
    MaxWidth  := 580;
    MinHeight := 630;
    MaxHeight := 630;
  end;
  FEmpresaID      := 1;
  FEmpresaNome    := '';
  FEmpresaCNPJ    := '';
  FContratoAtual  := '';
  FTentativaAtual := 1;
  FBloqueado      := False;
  FMsgErro        := '';
end;

procedure TfrmCADASTROCONTRATO.UniFormShow(Sender: TObject);
begin
  Self.KeyPreview := True;
  if (FBloqueado or (FTentativaAtual >= 5)) and (mm.varI_User <> 9999) then
  begin
    Self.BorderIcons := [];
  end;
  htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
end;

procedure TfrmCADASTROCONTRATO.UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Impede fechamento por ESC quando o sistema estiver bloqueado ou na ultima tentativa
  if (Key = VK_ESCAPE) and (FBloqueado or (FTentativaAtual >= 5)) and (mm.varI_User <> 9999) then
  begin
    Key := 0;
  end;
end;

procedure TfrmCADASTROCONTRATO.UniFormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // Se estiver bloqueado ou na ultima tentativa, so permite fechar se o contrato foi validado e salvo com sucesso (mrOk)
  if (FBloqueado or (FTentativaAtual >= 5)) and (ModalResult <> mrOk) and (mm.varI_User <> 9999) then
  begin
    CanClose := False;
  end;
end;

procedure TfrmCADASTROCONTRATO.CarregaDados(AEmpresaID: Integer; const AEmpresaNome, AEmpresaCNPJ, AContrato: string; ATentativa: Integer; ABloqueado: Boolean; const AMsgErro: string = '');
begin
  FEmpresaID      := AEmpresaID;
  FEmpresaNome    := AEmpresaNome;
  FEmpresaCNPJ    := AEmpresaCNPJ;
  FContratoAtual  := AContrato;
  FTentativaAtual := ATentativa;
  if FTentativaAtual < 1 then FTentativaAtual := 1;
  if FTentativaAtual >= 5 then
    FBloqueado := True
  else
    FBloqueado := ABloqueado;

  FMsgErro := AMsgErro;

  if FBloqueado and (mm.varI_User <> 9999) then
  begin
    Self.BorderIcons := [];
  end;

  if htmlCadastroContrato <> nil then
    htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
end;

procedure TfrmCADASTROCONTRATO.htmlCadastroContratoAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  vContrato, sBaseApi, sMsgRetorno: string;
  FinInfo: TAvisoFinanceiroInfo;
  FDQ: TFDQuery;
  bValido: Boolean;
begin
  if SameText(EventName, '_skip_contrato') then
  begin
    if (not FBloqueado) and (FTentativaAtual < 5) then
    begin
      rc_SetTentativasContrato(FEmpresaID, FTentativaAtual);
      try mm.varB_ContratoIgnoradoSessao := True; except end;
      ModalResult := mrCancel;
      Close;
      try
        if MainForm <> nil then
        begin
          MainForm.UniTimerverificaweb.Enabled  := False;
          MainForm.UniTimerverificaweb.Interval := 180000;
          MainForm.UniTimerverificaweb.RunOnce  := True;
          MainForm.UniTimerverificaweb.Enabled  := True;
        end;
      except
      end;
    end;
    Exit;
  end;

  if SameText(EventName, '_salvar_contrato') then
  begin
    vContrato := Trim(Params.Values['contrato']);
    FContratoAtual := vContrato;

    if (vContrato = '') or (Length(vContrato) < 3) then
    begin
      FMsgErro := 'Informe um numero de contrato valido (minimo de 3 caracteres).';
      htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
      Exit;
    end;

    if Length(vContrato) > 25 then
    begin
      FMsgErro := 'O numero de contrato nao pode ultrapassar 25 caracteres.';
      htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
      Exit;
    end;

    // 1. Validacao com o servidor financeiro
    sBaseApi := Caminho('HTTPGETFINANCEIRO=');
    if Trim(sBaseApi) = '' then
      sBaseApi := 'http://127.0.0.1:8089/v1/api/';
    if (Copy(sBaseApi, Length(sBaseApi), 1) <> '/') then
      sBaseApi := sBaseApi + '/';

    FinInfo := nil;
    bValido := False;
    sMsgRetorno := '';
    try
      FinInfo := HttpGetFinanceiro(sBaseApi + 'financeirosistema/' + vContrato);
      if (FinInfo <> nil) then
      begin
        if (FinInfo.Status = 'Bloqueia Total') or SameText(FinInfo.Motivo, 'Contrato Inexistente') then
        begin
          bValido := False;
          if SameText(FinInfo.Motivo, 'Contrato Inexistente') then
            sMsgRetorno := 'Contrato ' + vContrato + ' nao localizado no servidor SisGraos. Verifique o numero informado.'
          else
            sMsgRetorno := 'O contrato ' + vContrato + ' encontra-se BLOQUEADO no servidor SisGraos. Regularize junto ao suporte ou informe outro contrato.';
        end
        else
        begin
          bValido := True;
        end;
      end
      else
      begin
        bValido := False;
        sMsgRetorno := 'Nao foi possivel validar o contrato junto ao servidor central. Verifique a conexao e tente novamente.';
      end;
    except
      on E: Exception do
      begin
        gera_log('Erro na validacao do contrato: ' + E.Message);
        bValido := False;
        sMsgRetorno := 'Erro ao comunicar com o servidor: ' + E.Message;
      end;
    end;
    if Assigned(FinInfo) then FreeAndNil(FinInfo);

    if not bValido then
    begin
      // Falha na validacao: permanece bloqueado e exibe o erro
      FMsgErro := sMsgRetorno;
      FBloqueado := True;
      FTentativaAtual := 5;
      htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
      Exit;
    end;

    // 2. Grava no banco de dados local na tabela EMPRESAS
    try
      FDQ := TFDQuery.Create(nil);
      try
        FDQ.Connection := mm.SQLConn;
        FDQ.SQL.Text := 'UPDATE EMPRESAS SET CONTRATO = :CONTRATO WHERE CODIGO = :CODIGO';
        FDQ.ParamByName('CONTRATO').AsString := vContrato;
        FDQ.ParamByName('CODIGO').AsInteger  := FEmpresaID;
        FDQ.ExecSQL;

        if FEmpresaID <> 1 then
        begin
          FDQ.SQL.Text := 'UPDATE EMPRESAS SET CONTRATO = :CONTRATO WHERE CODIGO = 1 AND (COALESCE(CONTRATO, '''') = '''')';
          FDQ.ParamByName('CONTRATO').AsString := vContrato;
          FDQ.ExecSQL;
        end;
      finally
        FDQ.Free;
      end;
    except
      on E: Exception do
      begin
        FMsgErro := 'Erro ao gravar contrato na base: ' + E.Message;
        FBloqueado := True;
        FTentativaAtual := 5;
        htmlCadastroContrato.HTML.Text := GerarHTMLInterno;
        Exit;
      end;
    end;

    // 3. Atualiza na sessao ativa
    mm.varC_Contrato := vContrato;

    // 4. Zera o contador de tentativas
    rc_SetTentativasContrato(FEmpresaID, 0);

    // 5. Desbloqueia e define sucesso
    FBloqueado := False;
    ModalResult := mrOk;

    try
      dm_rc.rc_ShowSweetAlert(mm.MSG_SUCCESS, 'Contrato vinculado e validado com sucesso!', 'success');
    except
    end;

    Close;

    // 6. Reativa timer de verificacao no Main
    try
      if MainForm <> nil then
      begin
        MainForm.UniTimerverificaweb.Enabled  := False;
        MainForm.UniTimerverificaweb.Interval := 1500;
        MainForm.UniTimerverificaweb.RunOnce  := True;
        MainForm.UniTimerverificaweb.Enabled  := True;
      end;
    except
    end;
  end;
end;

function TfrmCADASTROCONTRATO.GerarHTMLInterno: string;
var
  sJsTarget, sEmpNome, sEmpCNPJ, sCtrVal, sMsgErrVal: string;
  sTitle, sSubtitle, sBadgeMasterText, sBadgeStatusText: string;
  sBeaconGrad, sAttemptsTitle, sAttemptsDesc, sStepBarHTML, sFooterBtnHTML, sErrHTML: string;
  iStep, iRestantes: Integer;
begin
  sJsTarget := Self.htmlCadastroContrato.JSName;
  sEmpNome  := FEmpresaNome;
  if sEmpNome = '' then sEmpNome := 'EMPRESA ATIVA';
  sEmpCNPJ  := FEmpresaCNPJ;
  if sEmpCNPJ = '' then sEmpCNPJ := 'NAO INFORMADO';
  sCtrVal   := FContratoAtual;
  sMsgErrVal:= FMsgErro;

  if (FBloqueado or (FTentativaAtual >= 5)) and (mm.varI_User <> 9999) then
  begin
    sBeaconGrad       := 'linear-gradient(90deg, #b91c1c, #ef4444, #fca5a5, #ef4444, #b91c1c)';
    sBadgeMasterText  := 'ACESSO BLOQUEADO &bull; VINCULACAO OBRIGATORIA';
    sBadgeStatusText  := 'ACESSO BLOQUEADO';
    sTitle            := 'SISTEMA EM BLOQUEIO DE SEGURANCA';
    sSubtitle         := 'Informe e ative um contrato valido para desbloquear o sistema';
    sAttemptsTitle    := 'SISTEMA BLOQUEADO';
    if Trim(FContratoAtual) <> '' then
      sAttemptsDesc   := 'O contrato informado encontra-se irregular ou inexistente no servidor. O acesso esta BLOQUEADO ate validar um contrato regular.'
    else
      sAttemptsDesc   := 'O limite de tentativas foi alcancado. O acesso esta BLOQUEADO ate informar e ativar um contrato valido.';
    sStepBarHTML      := '<div class="attempt-step danger"></div><div class="attempt-step danger"></div><div class="attempt-step danger"></div><div class="attempt-step danger"></div><div class="attempt-step danger"></div>';
    sFooterBtnHTML    := '<button type="button" id="btnSalvarContrato" class="btn-save btn-full" onclick="doSalvarContrato();">' +
                         '  Salvar e Ativar Contrato' +
                         '</button>';
  end
  else
  begin
    sBeaconGrad       := 'linear-gradient(90deg, #047857, #10b981, #6ee7b7, #10b981, #047857)';
    sBadgeMasterText  := 'ACESSO EXCLUSIVO: USUARIO MASTER';
    sBadgeStatusText  := 'CONTRATO PENDENTE';
    sTitle            := 'Vincular Numero de Contrato';
    sSubtitle         := 'Identificacao obrigatoria da empresa para sincronizacao em nuvem';
    sAttemptsTitle    := 'TOLERANCIA DE PREENCHIMENTO';
    iRestantes        := 5 - FTentativaAtual;
    sAttemptsDesc     := 'Voce pode preencher mais tarde ate <strong>' + IntToStr(iRestantes) + ' vez(es) restante(s)</strong>. Na 5a tentativa o sistema ficara bloqueado.';
    sStepBarHTML      := '';
    for iStep := 1 to 5 do
    begin
      if iStep <= FTentativaAtual then
        sStepBarHTML := sStepBarHTML + '<div class="attempt-step used"></div>'
      else
        sStepBarHTML := sStepBarHTML + '<div class="attempt-step available"></div>';
    end;
    sFooterBtnHTML    := '<button type="button" class="btn-skip" onclick="doSkipContrato();">' +
                         '  Preencher Mais Tarde (' + IntToStr(FTentativaAtual) + '/5)' +
                         '</button>' +
                         '<button type="button" class="btn-save" onclick="doSalvarContrato();">' +
                         '  Salvar e Ativar Contrato' +
                         '</button>';
  end;

  sErrHTML := '';
  if sMsgErrVal <> '' then
  begin
    sErrHTML := '<div class="error-banner">' +
                '  <span>' + sMsgErrVal + '</span>' +
                '</div>';
  end;

  Result :=
    '<!DOCTYPE html><html lang="pt-BR"><head><meta charset="UTF-8">' +
    '<link rel="preconnect" href="https://fonts.googleapis.com">' +
    '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' +
    '<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@600;700&family=Outfit:wght@' +
    '500;600;700;800&display=swap" rel="stylesheet">' +
    '<style>' +
    '* { box-sizing: border-box; margin: 0; padding: 0; user-select: none; }' +
    'body { background: transparent; font-family: "Outfit", sans-serif; color: #f8fafc; overflow: ' +
    'hidden; }' +
    '.modal-wrapper { width: 580px; height: 630px; background: rgba(10, 22, 17, 0.98); border: 1.5px ' +
    'solid rgba(52, 211, 153, 0.45); border-radius: 20px; display: flex; flex-direction: column; ' +
    'overflow: hidden; box-shadow: 0 25px 60px rgba(0, 0, 0, 0.9), 0 0 45px rgba(16, 185, 129, 0.25); }' +
    '    .top-beacon { height: 5px; width: 100%; background: ' + sBeaconGrad + '; background-size: 200% 100%; box-shadow: 0 0 14px rgba(16, 185, 129, 0.8); }' +
    '.card-banner { background: linear-gradient(135deg, rgba(2, 44, 34, 0.98) 0%, rgba(6, 78, 59, 0.95) ' +
    '100%); padding: 16px 22px; border-bottom: 1px solid rgba(52, 211, 153, 0.25); flex-shrink: 0; }' +
    '.badge-row { display: flex; align-items: center; justify-content: space-between; margin-bottom: ' +
    '10px; }' +
    '.badge-master { background: rgba(16, 185, 129, 0.2); border: 1px solid rgba(52, 211, 153, 0.55); ' +
    'color: #6ee7b7; font-size: 11px; font-weight: 800; letter-spacing: 0.8px; padding: 4px 10px; ' +
    'border-radius: 20px; display: inline-flex; align-items: center; gap: 6px; }' +
    '.badge-dot { width: 7px; height: 7px; border-radius: 50%; background: #34d399; box-shadow: 0 0 8px ' +
    '#34d399; }' +
    '.badge-status { font-family: "JetBrains Mono", monospace; font-size: 11px; color: #fde68a; ' +
    'background: rgba(180, 83, 9, 0.35); padding: 4px 9px; border-radius: 6px; border: 1px solid ' +
    'rgba(245, 158, 11, 0.45); font-weight: 700; }' +
    '.banner-title-group { display: flex; align-items: center; gap: 12px; }' +
    '.icon-box { width: 44px; height: 44px; border-radius: 12px; background: rgba(5, 150, 105, 0.4); ' +
    'border: 1.5px solid rgba(52, 211, 153, 0.65); display: flex; align-items: center; justify-content: ' +
    'center; flex-shrink: 0; color: #34d399; font-size: 20px; }' +
    '.banner-text h1 { font-size: 18px; font-weight: 800; color: #ecfdf5; letter-spacing: -0.3px; ' +
    'line-height: 1.25; }' +
    '.banner-text p { font-size: 12px; color: #a7f3d0; margin-top: 2px; }' +
    '.modal-body { padding: 18px 22px; display: flex; flex-direction: column; gap: 14px; flex-grow: 1; ' +
    'overflow-y: auto; }' +
    '.company-card { background: rgba(6, 44, 32, 0.55); border: 1px solid rgba(52, 211, 153, 0.25); ' +
    'border-radius: 12px; padding: 12px 14px; display: flex; align-items: center; justify-content: ' +
    'space-between; gap: 12px; flex-shrink: 0; }' +
    '.company-left { display: flex; align-items: center; gap: 10px; }' +
    '.company-avatar { width: 34px; height: 34px; border-radius: 8px; background: rgba(16, 185, 129, ' +
    '0.15); border: 1px solid rgba(52, 211, 153, 0.35); display: flex; align-items: center; ' +
    'justify-content: center; color: #34d399; font-size: 16px; }' +
    '.company-details .label { font-size: 10px; font-weight: 700; text-transform: uppercase; color: ' +
    '#6ee7b7; letter-spacing: 0.5px; }' +
    '.company-details .name { font-size: 13px; font-weight: 700; color: #f1f5f9; }' +
    '.company-cnpj { font-family: "JetBrains Mono", monospace; font-size: 11px; color: #94a3b8; ' +
    'background: rgba(0, 0, 0, 0.35); padding: 4px 8px; border-radius: 5px; border: 1px solid rgba(255, ' +
    '255, 255, 0.08); white-space: nowrap; }' +
    '.input-section { background: rgba(2, 44, 34, 0.35); border: 1px solid rgba(52, 211, 153, 0.3); ' +
    'border-radius: 14px; padding: 14px 16px; flex-shrink: 0; }' +
    '.input-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: ' +
    '6px; }' +
    '.input-header label { font-size: 12px; font-weight: 700; color: #6ee7b7; display: flex; ' +
    'align-items: center; gap: 6px; }' +
    '.hint-badge { font-size: 10px; color: #94a3b8; font-weight: 600; }' +
    '.input-container { position: relative; display: flex; align-items: center; margin-top: 6px; }' +
    '.input-icon-left { position: absolute; left: 14px; color: #10b981; font-weight: 800; font-size: ' +
    '16px; font-family: "JetBrains Mono", monospace; pointer-events: none; }' +
    '.contract-input { width: 100%; height: 48px; background: rgba(1, 24, 17, 0.95); border: 1.5px solid ' +
    'rgba(52, 211, 153, 0.45); border-radius: 10px; padding: 0 16px 0 38px; font-family: "JetBrains ' +
    'Mono", monospace; font-size: 17px; font-weight: 700; letter-spacing: 0.8px; color: #34d399; ' +
    'outline: none; transition: border-color 0.2s; }' +
    '.contract-input:focus { border-color: #34d399; box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.25); }' +
    '.input-tip { font-size: 10.5px; color: #94a3b8; margin-top: 6px; line-height: 1.35; }' +
    '.error-banner { background: rgba(185, 28, 28, 0.25); border: 1px solid rgba(239, 68, 68, 0.55); ' +
    'color: #fca5a5; font-size: 11.5px; font-weight: 600; border-radius: 8px; padding: 8px 12px; ' +
    'display: flex; align-items: center; gap: 8px; }' +
    '.attempts-box { background: linear-gradient(135deg, rgba(180, 83, 9, 0.12) 0%, rgba(245, 158, 11, ' +
    '0.08) 100%); border: 1px solid rgba(245, 158, 11, 0.35); border-radius: 12px; padding: 12px 14px; ' +
    'flex-shrink: 0; }' +
    '.attempts-header { display: flex; align-items: center; justify-content: space-between; ' +
    'margin-bottom: 6px; }' +
    '.attempts-title { font-size: 11.5px; font-weight: 800; color: #fde68a; display: flex; align-items: ' +
    'center; gap: 6px; }' +
    '.attempts-counter { font-family: "JetBrains Mono", monospace; font-size: 10.5px; font-weight: 800; ' +
    'color: #f59e0b; background: rgba(0, 0, 0, 0.4); padding: 2px 7px; border-radius: 5px; border: 1px ' +
    'solid rgba(245, 158, 11, 0.3); }' +
    '.attempts-steps-bar { display: flex; gap: 6px; margin: 8px 0; }' +
    '.attempt-step { flex: 1; height: 6px; border-radius: 4px; background: rgba(255, 255, 255, 0.1); }' +
    '.attempt-step.used { background: #f59e0b; box-shadow: 0 0 6px rgba(245, 158, 11, 0.6); }' +
    '.attempt-step.danger { background: #ef4444; box-shadow: 0 0 6px rgba(239, 68, 68, 0.7); }' +
    '.attempt-step.available { background: rgba(52, 211, 153, 0.35); }' +
    '.attempts-desc { font-size: 10.5px; color: #fcd34d; line-height: 1.35; }' +
    '.modal-footer { background: rgba(2, 44, 34, 0.8); border-top: 1px solid rgba(52, 211, 153, 0.25); ' +
    'padding: 14px 22px; display: flex; align-items: center; justify-content: space-between; gap: 10px; ' +
    'flex-shrink: 0; }' +
    '.btn-skip { background: rgba(255, 255, 255, 0.06); color: #94a3b8; border: 1px solid rgba(255, 255, ' +
    '255, 0.15); border-radius: 9px; padding: 10px 16px; font-size: 12px; font-weight: 700; cursor: ' +
    'pointer; display: inline-flex; align-items: center; gap: 7px; transition: all 0.2s; }' +
    '.btn-skip:hover { background: rgba(255, 255, 255, 0.12); color: #f1f5f9; }' +
    '.btn-save { background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: #ffffff; border: ' +
    'none; border-radius: 9px; padding: 10px 20px; font-size: 13px; font-weight: 800; cursor: pointer; ' +
    'display: inline-flex; align-items: center; justify-content: center; gap: 8px; box-shadow: 0 4px ' +
    '14px rgba(16, 185, 129, 0.45); transition: all 0.2s; }' +
    '.btn-save:hover { background: linear-gradient(135deg, #34d399 0%, #047857 100%); transform: ' +
    'translateY(-1px); }' +
    '.btn-save.btn-full { width: 100%; height: 44px; font-size: 14px; }' +
    '</style></head><body>' +
    '<div class="modal-wrapper">' +
    '  <div class="top-beacon"></div>' +
    '  <div class="card-banner">' +
    '    <div class="badge-row">' +
      '      <div class="badge-master"><span class="badge-dot"></span>' + sBadgeMasterText + '</div>' +
      '      <div class="badge-status">' + sBadgeStatusText + '</div>' +
    '    </div>' +
    '    <div class="banner-title-group">' +
    '      <div class="icon-box">#</div>' +
    '      <div class="banner-text">' +
        '        <h1>' + sTitle + '</h1>' +
        '        <p>' + sSubtitle + '</p>' +
    '      </div>' +
    '    </div>' +
    '  </div>' +
    '  <div class="modal-body">' +
    '    <div class="company-card">' +
    '      <div class="company-left">' +
    '        <div class="company-avatar">EMP</div>' +
        '        <div class="company-details"><div class="label">Empresa Ativa</div><div class="name">' + sEmpNome + '</div></div>' +
    '      </div>' +
      '      <div class="company-cnpj">CNPJ: ' + sEmpCNPJ + '</div>' +
    '    </div>' +
    '    <div class="input-section">' +
    '      <div class="input-header">' +
    '        <label>NUMERO DO CONTRATO SISGRAOS</label>' +
    '        <span class="hint-badge">Ate 25 caracteres</span>' +
    '      </div>' +
    '      <div class="input-container">' +
    '        <span class="input-icon-left">#</span>' +
        '        <input type="text" id="inputContrato" class="contract-input" placeholder="Ex: CTR-2026-9842" maxlength="25" value="' + sCtrVal + '" autocomplete="off" spellcheck="false" onkeydown="if(event.key===''Enter''){doSalvarContrato();}">' +
    '      </div>' +
    '      <div class="input-tip">Este numero conecta esta instalacao com a nuvem SisGraos para checagem ' +
    'financeira e servicos.</div>' +
    '    </div>' +
    '    ' + sErrHTML +
    '    <div class="attempts-box">' +
    '      <div class="attempts-header">' +
        '        <div class="attempts-title">' + sAttemptsTitle + '</div>' +
        '        <div class="attempts-counter">TENTATIVA ' + IntToStr(FTentativaAtual) + ' DE 5</div>' +
    '      </div>' +
      '      <div class="attempts-steps-bar">' + sStepBarHTML + '</div>' +
      '      <div class="attempts-desc">' + sAttemptsDesc + '</div>' +
    '    </div>' +
    '  </div>' +
  '  <div class="modal-footer">' + sFooterBtnHTML + '</div>' +
    '</div>' +
    '<script>' +
    '  function doSalvarContrato() {' +
    '    var inp = document.getElementById("inputContrato");' +
    '    if(!inp) return;' +
    '    var val = inp.value.trim();' +
    '    if(!val) {' +
    '      alert("Por favor, informe o numero do contrato.");' +
    '      inp.focus();' +
    '      return;' +
    '    }' +
    '    var btn = document.getElementById("btnSalvarContrato");' +
    '    if(!btn) btn = document.querySelector(".btn-save");' +
    '    if(btn) {' +
    '      btn.disabled = true;' +
    '      btn.innerText = "Validando contrato...";' +
    '    }' +
    '    try { ajaxRequest(' + sJsTarget + ', "_salvar_contrato", ["contrato=" + encodeURIComponent(val)]); } catch(e) {}' +
    '  }' +
    '  function doSkipContrato() {' +
    '    try { ajaxRequest(' + sJsTarget + ', "_skip_contrato", []); } catch(e) {}' +
    '  }' +
    '  window.addEventListener("keydown", function(e) {' +
    '    if (e.key === "Escape") { e.preventDefault(); e.stopPropagation(); }' +
    '  });' +
    '  setTimeout(function(){ var inp = document.getElementById("inputContrato"); if(inp) { inp.focus(); ' +
    'inp.select(); } }, 300);' +
    '</script>' +
    '</body></html>';
end;

end.
