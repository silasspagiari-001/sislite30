unit untFrmMENUNOTIFICACOES;

// ============================================================
// Form: Central de Notificacoes - Caixa de Entrada (Sidebar Lateral)
// - Estilo: 100% alinhado a RT Assinatura e Bate-papo Conectados
// - Paleta Dark Emerald & Mint (#064e3b, #047857, #10b981, #edf7f2)
// - Cards clicaveis que abrem o comunicado / mensagem completa
// - Mensagem de contrato restrita a usuarios MASTER (S)
// ============================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses,
  uniPanel, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniHTMLFrame;

type
  TfrmMENUNOTIFICACOES = class(TUniForm)
    UniContainerPanel1 : TUniContainerPanel;
    paTitulo           : TUniContainerPanel;
    paSearchContent1   : TUniContainerPanel;
    labTitleFrm        : TUniLabel;
    labbtnExit         : TUniLabel;
    htmlNotificacoes   : TUniHTMLFrame;
    timerRefresh       : TUniTimer;

    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure labbtnExitClick(Sender: TObject);
    procedure timerRefreshTimer(Sender: TObject);
    procedure htmlNotificacoesAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);

  private
    procedure AtualizarLista;
  public
    procedure CarregaNotificacoes;
  end;

function frmMENUNOTIFICACOES: TfrmMENUNOTIFICACOES;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, mkm_anim, mkm_func_web,
  Main, untDM_RC, mkm_procedures, untFrmAVISOCOMUNICADO, uMsgInfo;

function rc_IIF(ACond: Boolean; const ATrue, AFalse: string): string;
begin
  if ACond then Result := ATrue else Result := AFalse;
end;

function frmMENUNOTIFICACOES: TfrmMENUNOTIFICACOES;
begin
  Result := TfrmMENUNOTIFICACOES(mm.GetFormInstance(TfrmMENUNOTIFICACOES));
end;

procedure TfrmMENUNOTIFICACOES.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout(Self, True, True, True);
  Self.Left := mm.varI_ScreenWidth + 600;
  if mm.RTL then
    Self.Left := 0
  else
    Self.Left := mm.varI_ScreenWidth + 600;
end;

procedure TfrmMENUNOTIFICACOES.UniFormReady(Sender: TObject);
begin
  dm_rc.rc_ResizeBlocks(Self, True, True);
end;

procedure TfrmMENUNOTIFICACOES.UniFormShow(Sender: TObject);
begin
  Self.Height := mm.varI_ScreenHeight;
  Self.Top    := 0;
  rc_jQueryAnimate(Self, 'right', IntToStr(Self.Left + Self.Width), '200');

  // Top bar com gradiente esmeralda padrao RT / Bate-papo
  try
    paTitulo.JSInterface.JSCall('setStyle', ['background', 'linear-gradient(135deg, #064e3b 0%, #047857 50%, #059669 100%)']);
    paTitulo.JSInterface.JSCall('setStyle', ['boxShadow', '0 2px 8px rgba(6,78,59,0.25)']);
    paSearchContent1.JSInterface.JSCall('setStyle', ['background', 'transparent']);
  except
  end;

  labTitleFrm.TextConversion := txtHTML;
  labTitleFrm.Caption :=
    '<span style="display:flex;align-items:center;gap:7px;color:#ffffff;font-weight:800;font-size:13.5px;letter-spacing:0.3px;">' +
    '<i class="fas fa-bell" style="color:#86efac;font-size:15px;"></i> Central de Notifica&ccedil;&otilde;es</span>';

  labbtnExit.Caption := '<i class="fas fa-times" style="font-size:20px;color:#fca5a5;line-height:28px;" title="Fechar"></i>';

  AtualizarLista;
  timerRefresh.Enabled := False;
end;

procedure TfrmMENUNOTIFICACOES.UniFormDestroy(Sender: TObject);
begin
  timerRefresh.Enabled := False;
end;

procedure TfrmMENUNOTIFICACOES.labbtnExitClick(Sender: TObject);
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

procedure TfrmMENUNOTIFICACOES.timerRefreshTimer(Sender: TObject);
begin
  AtualizarLista;
end;

procedure TfrmMENUNOTIFICACOES.CarregaNotificacoes;
begin
  AtualizarLista;
end;

procedure TfrmMENUNOTIFICACOES.AtualizarLista;
var
  cHTML, sDateStr, jsName, sTituloLimpo, sCorpoLimpo: string;
  bHasMsg, bEhMaster, bEhMsgContrato, bExibirMsgServidor: Boolean;
  nTotalPendente: Integer;
begin
  jsName := htmlNotificacoes.JSName;

  bHasMsg := (mm.vUltimoAvisoMsg <> nil) and (mm.vUltimoAvisoMsg.Registro = 1);
  bEhMaster := (UpperCase(Trim(mm.vari_masteruser)) = 'S') or (mm.varI_User = 9999);

  bEhMsgContrato := bHasMsg and
    ((SameText(Trim(mm.vUltimoAvisoMsg.Tipo), 'CONTRATO')) or
     (Pos('SAUDE DO CONTRATO', UpperCase(mm.vUltimoAvisoMsg.Titulo)) > 0) or
     (Pos('SAUDE DO CONTRATO', UpperCase(mm.vUltimoAvisoMsg.Corpo)) > 0) or
     (Pos('CONTRATO', UpperCase(mm.vUltimoAvisoMsg.Titulo)) > 0) or
     (Pos('VENCE HOJE', UpperCase(mm.vUltimoAvisoMsg.Titulo)) > 0) or
     (StrToIntDef(Trim(mm.vUltimoAvisoMsg.ContratoNumero), 0) > 0));

  // Notificacao de saude de contrato removida - exibir somente comunicados e mensagens reais
  if bEhMsgContrato then
    bExibirMsgServidor := False
  else
    bExibirMsgServidor := bHasMsg;

  nTotalPendente := 2; // Novidades + Suporte como informativos
  if bExibirMsgServidor and (not mm.vUltimoAvisoMsg.Lido) then
  begin
    if mm.vUltimoAvisoMsg.Pendentes > 0 then
      Inc(nTotalPendente, mm.vUltimoAvisoMsg.Pendentes)
    else
      Inc(nTotalPendente);
  end;

  if bExibirMsgServidor and (Trim(mm.vUltimoAvisoMsg.DataInicio) <> '') then
    sDateStr := mm.vUltimoAvisoMsg.DataInicio
  else
    sDateStr := 'Hoje';

  cHTML :=
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
    '<meta charset="utf-8">' +
    '<style>' +
    '*{box-sizing:border-box;margin:0;padding:0;}' +
    'html,body{' +
    '  background-color:#edf7f2 !important;background:#edf7f2 !important;' +
    '  color:#0f172a !important;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;' +
    '  font-size:12px;height:100% !important;min-height:100% !important;width:100% !important;overflow:hidden !important;position:relative;' +
    '}' +
    '::-webkit-scrollbar{width:4px;}' +
    '::-webkit-scrollbar-track{background:#edf7f2;}' +
    '::-webkit-scrollbar-thumb{background:#a7f3d0;border-radius:4px;}' +
    '::-webkit-scrollbar-thumb:hover{background:#6ee7b7;}' +

    // Container padrao RT / Bate-papo
    '.view-container{' +
    '  padding:10px 10px 30px 10px;height:100%;min-height:100vh;overflow-y:auto;' +
    '  background-color:#edf7f2 !important;background:#edf7f2 !important;' +
    '}' +

    // Top Bar padrao Bate-papo Conectados
    '.top-bar{' +
    '  background:#ffffff !important;border:1px solid #d1fae5 !important;' +
    '  border-radius:10px;padding:8px 10px;margin-bottom:8px;' +
    '  display:flex;justify-content:space-between;align-items:center;' +
    '  box-shadow:0 2px 6px rgba(0,0,0,0.03) !important;' +
    '}' +
    '.top-title{font-size:11.5px;font-weight:800;color:#064e3b !important;text-transform:uppercase;letter-spacing:0.5px;display:flex;align-items:center;gap:6px;}' +
    '.dot{width:7px;height:7px;border-radius:50%;background:#22c55e;box-shadow:0 0 6px #22c55e;display:inline-block;}' +
    '.badge-pending{background:#dcfce7;color:#166534;border:1px solid #86efac;padding:3px 9px;border-radius:12px;font-size:10.5px;font-weight:800;}' +

    // Secoes com chip destacado padrao Bate-papo
    '.sec-title{font-size:10.5px;font-weight:800;color:#047857;text-transform:uppercase;letter-spacing:0.6px;' +
    'margin:10px 2px 8px 2px;padding:4px 10px;background:#e2f4ea;border-radius:6px;border-left:3px solid #10b981;display:flex;align-items:center;gap:6px;}' +

    // Cards estilo RT Assinatura
    '.card-item{' +
    '  background-color:#ffffff !important;background:#ffffff !important;' +
    '  border:1px solid #d1fae5 !important;border-left:4px solid #059669 !important;' +
    '  border-radius:10px;padding:10px 12px;margin-bottom:10px;' +
    '  box-shadow:0 2px 6px rgba(0,0,0,0.03) !important;transition:all 0.18s ease;' +
    '  cursor:pointer;' +
    '}' +
    '.card-item:hover{' +
    '  background-color:#f0fdf4 !important;background:#f0fdf4 !important;' +
    '  border-color:#10b981 !important;transform:translateY(-2px);box-shadow:0 6px 16px rgba(16,185,129,0.14) !important;' +
    '}' +
    '.card-header{display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;gap:6px;}' +
    '.sample-title{font-weight:800;color:#0f172a !important;font-size:13px !important;letter-spacing:0.2px;display:flex;align-items:center;gap:6px;line-height:1.3;}' +
    '.badge-doc{font-size:9.5px;font-weight:800;padding:2px 7px;border-radius:10px;letter-spacing:0.4px;text-transform:uppercase;white-space:nowrap;}' +
    '.badge-comunicado{background:#e0f2fe;color:#0284c7;border:1px solid #bae6fd;}' +
    '.badge-novidade{background:#fef3c7;color:#d97706;border:1px solid #fde68a;}' +
    '.badge-suporte{background:#dcfce7;color:#15803d;border:1px solid #bbf7d0;}' +
    '.badge-unread{background:#fffbeb;color:#b45309;border:1px solid #fde68a;font-size:9px;font-weight:800;padding:1px 6px;border-radius:8px;}' +

    // Linhas de informacao e data
    '.card-desc{font-size:11.5px;color:#475569;line-height:1.45;margin-bottom:8px;}' +
    '.date-line{color:#64748b;font-size:10.5px;display:flex;justify-content:space-between;border-top:1px solid #f1f5f9;padding-top:6px;margin-top:6px;margin-bottom:8px;}' +

    // Botao Visualizar padrao RT [Visualizar]
    '.btn-actions{display:flex;gap:8px;margin-top:4px;}' +
    '.btn-view{' +
    '  background:#ecfdf5;color:#047857 !important;border:1px solid #a7f3d0;' +
    '  padding:6px 14px;border-radius:18px;font-weight:800;font-size:11px;' +
    '  text-align:center;width:100%;text-decoration:none;cursor:pointer;transition:all 0.18s ease;' +
    '  display:flex;align-items:center;justify-content:center;gap:6px;box-shadow:0 1px 3px rgba(0,0,0,0.03);' +
    '}' +
    '.btn-view:hover{background:linear-gradient(135deg,#10b981 0%,#059669 100%) !important;color:#ffffff !important;border-color:#10b981;box-shadow:0 4px 12px rgba(16,185,129,0.3);transform:scale(1.02);}' +

    '.bottom-actions{display:flex;justify-content:space-between;align-items:center;padding:10px 4px 14px 4px;}' +
    '.link-mark-read{color:#047857;font-size:11px;font-weight:700;text-decoration:none;cursor:pointer;display:inline-flex;align-items:center;gap:4px;}' +
    '.link-mark-read:hover{text-decoration:underline;color:#064e3b;}' +
    '</style>' +
    '</head>' +
    '<body>' +
    '<div class="view-container">' +

    // Top Bar
    '<div class="top-bar">' +
    '  <div class="top-title">' +
    '    <span class="dot"></span>' +
    '    <span>MENSAGENS &amp; NOTIFICA&Ccedil;&Otilde;ES</span>' +
    '  </div>' +
    '  <span class="badge-pending">' + IntToStr(nTotalPendente) + ' DISPON&Iacute;VEIS</span>' +
    '</div>';

  // 1. CARD PRINCIPAL DO SERVIDOR / COMUNICADO OFICIAL
  if bExibirMsgServidor then
  begin
    sTituloLimpo := mm.vUltimoAvisoMsg.Titulo;
    sCorpoLimpo  := mm.vUltimoAvisoMsg.Corpo;

    // Remove bloco inteiro de <style>...</style> se houver
    while (Pos('<style', LowerCase(sCorpoLimpo)) > 0) and (Pos('</style>', LowerCase(sCorpoLimpo)) > Pos('<style', LowerCase(sCorpoLimpo))) do
      Delete(sCorpoLimpo, Pos('<style', LowerCase(sCorpoLimpo)), (Pos('</style>', LowerCase(sCorpoLimpo)) + 8) - Pos('<style', LowerCase(sCorpoLimpo)));

    // Remove bloco inteiro de <script>...</script> se houver
    while (Pos('<script', LowerCase(sCorpoLimpo)) > 0) and (Pos('</script>', LowerCase(sCorpoLimpo)) > Pos('<script', LowerCase(sCorpoLimpo))) do
      Delete(sCorpoLimpo, Pos('<script', LowerCase(sCorpoLimpo)), (Pos('</script>', LowerCase(sCorpoLimpo)) + 9) - Pos('<script', LowerCase(sCorpoLimpo)));

    // Remove todas as tags html <...>
    while Pos('<', sCorpoLimpo) > 0 do
    begin
      if (Pos('>', sCorpoLimpo) > Pos('<', sCorpoLimpo)) then
        Delete(sCorpoLimpo, Pos('<', sCorpoLimpo), Pos('>', sCorpoLimpo) - Pos('<', sCorpoLimpo) + 1)
      else
        Break;
    end;

    sCorpoLimpo := StringReplace(sCorpoLimpo, '&nbsp;', ' ', [rfReplaceAll]);
    sCorpoLimpo := StringReplace(sCorpoLimpo, #13#10, ' ', [rfReplaceAll]);
    sCorpoLimpo := StringReplace(sCorpoLimpo, #10, ' ', [rfReplaceAll]);
    sCorpoLimpo := Trim(sCorpoLimpo);
    sCorpoLimpo := Copy(sCorpoLimpo, 1, 110);

    cHTML := cHTML +
      '<div class="sec-title">' +
      '  <span>&#128276;</span>' +
      '  <span>COMUNICADO OFICIAL</span>' +
      '</div>' +

      '<div class="card-item" onclick="ajaxRequest(' + jsName + ', ''view_msg'', [''card=servidor'']);">' +
      '  <div class="card-header">' +
      '    <div class="sample-title">' +
      '      <span>&#128227;</span>' +
      '      <span>' + sTituloLimpo + '</span>' +
      '    </div>' +
      '    <div style="display:flex;align-items:center;gap:4px;">' +
      '      <span class="badge-doc badge-comunicado">COMUNICADO</span>' +
      rc_IIF(not mm.vUltimoAvisoMsg.Lido, '<span class="badge-unread">&#9888; NOVO</span>', '') +
      '    </div>' +
      '  </div>' +
      '  <div class="card-desc">' + sCorpoLimpo + '...</div>' +
      '  <div class="date-line">' +
      '    <span>Data: <strong>' + sDateStr + '</strong></span>' +
      '    <span style="color:#047857;font-weight:700;">Sisgr&atilde;os Nuvem</span>' +
      '  </div>' +
      '  <div class="btn-actions">' +
      '    <a class="btn-view" href="javascript:void(0);" onclick="event.stopPropagation(); ajaxRequest(' + jsName + ', ''view_msg'', [''card=servidor'']);">' +
      '      <span>&#128065; Visualizar Comunicado</span>' +
      '    </a>' +
      '  </div>' +
      '</div>';
  end;

  // 2. SECAO INFORMATIVOS DO SISTEMA
  cHTML := cHTML +
    '<div class="sec-title">' +
    '  <span>&#128172;</span>' +
    '  <span>INFORMATIVOS &amp; ATUALIZA&Ccedil;&Otilde;ES</span>' +
    '</div>' +

    // CARD NOVIDADES
    '<div class="card-item" onclick="ajaxRequest(' + jsName + ', ''view_msg'', [''card=novidades'']);">' +
    '  <div class="card-header">' +
    '    <div class="sample-title">' +
    '      <span>&#11088;</span>' +
    '      <span>Portal de Notifica&ccedil;&otilde;es & Contratos</span>' +
    '    </div>' +
    '    <span class="badge-doc badge-novidade">NOVIDADE</span>' +
    '  </div>' +
    '  <div class="card-desc">Fique por dentro das atualiza&ccedil;&otilde;es regulat&oacute;rias, sa&uacute;de de contratos e alertas operacionais em tempo real.</div>' +
    '  <div class="date-line">' +
    '    <span>Vers&atilde;o: <strong>Sisgr&atilde;os 2026</strong></span>' +
    '    <span style="color:#d97706;font-weight:700;">Destaque</span>' +
    '  </div>' +
    '  <div class="btn-actions">' +
    '    <a class="btn-view" href="javascript:void(0);" onclick="event.stopPropagation(); ajaxRequest(' + jsName + ', ''view_msg'', [''card=novidades'']);">' +
    '      <span>&#128065; Ver Informa&ccedil;&otilde;es</span>' +
    '    </a>' +
    '  </div>' +
    '</div>' +

    // CARD SUPORTE
    '<div class="card-item" onclick="ajaxRequest(' + jsName + ', ''view_msg'', [''card=suporte'']);">' +
    '  <div class="card-header">' +
    '    <div class="sample-title">' +
    '      <span>&#128222;</span>' +
    '      <span>Suporte T&eacute;cnico Especializado</span>' +
    '    </div>' +
    '    <span class="badge-doc badge-suporte">ATENDIMENTO</span>' +
    '  </div>' +
    '  <div class="card-desc">Equipe de suporte dispon&iacute;vel para aux&iacute;lio nos m&oacute;dulos de laborat&oacute;rio, sementes, pastagem e gest&atilde;o.</div>' +
    '  <div class="date-line">' +
    '    <span>Hor&aacute;rio: <strong>Seg a Sex (08h &agrave;s 18h)</strong></span>' +
    '    <span style="color:#15803d;font-weight:700;">Ativo</span>' +
    '  </div>' +
    '  <div class="btn-actions">' +
    '    <a class="btn-view" href="javascript:void(0);" onclick="event.stopPropagation(); ajaxRequest(' + jsName + ', ''view_msg'', [''card=suporte'']);">' +
    '      <span>&#128065; Ver Detalhes do Suporte</span>' +
    '    </a>' +
    '  </div>' +
    '</div>' +

    // Acoes inferiores
    '<div class="bottom-actions">' +
    '  <span style="font-size:10px;color:#64748b;font-weight:600;">Central Sisgr&atilde;os</span>' +
    '  <a class="link-mark-read" href="javascript:void(0);" onclick="ajaxRequest(' + jsName + ', ''mark_read'', []);">' +
    '    &#10004; Marcar como Lida' +
    '  </a>' +
    '</div>' +

    '</div>' +
    '</body>' +
    '</html>';

  htmlNotificacoes.HTML.Text := cHTML;
end;

procedure TfrmMENUNOTIFICACOES.htmlNotificacoesAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  sCard: string;
  msgInfo: TMsgInfo;
begin
  if SameText(EventName, 'view_msg') then
  begin
    sCard := Params.Values['card'];

    if SameText(sCard, 'novidades') then
    begin
      msgInfo := TMsgInfo.Create;
      try
        msgInfo.Codigo            := 99001;
        msgInfo.Titulo            := 'Portal de Notifica' + #231 + #245 + 'es & Contratos';
        msgInfo.Corpo             :=
          'Bem-vindo ao Portal de Notifica' + #231 + #245 + 'es da Plataforma Sisgr' + #227 + 'os 2026!' + #13#10 + #13#10 +
          'Aqui voc' + #234 + ' tem acesso centralizado a todos os comunicados operacionais, alertas e avisos importantes em tempo real.' + #13#10 + #13#10 +
          #8226 + ' Acompanhamento e controle dos contratos ativos' + #13#10 +
          #8226 + ' Notifica' + #231 + #245 + 'es de vencimento e sa' + #250 + 'de da licen' + #231 + 'a' + #13#10 +
          #8226 + ' Registro seguro de ci' + #234 + 'ncia e confirma' + #231 + #227 + 'o de leitura integrado' + #13#10 +
          #8226 + ' Canal direto para novidades regulat' + #243 + 'rias do agroneg' + #243 + 'cio.';
        msgInfo.Prioridade        := 'IMPORTANTE';
        msgInfo.ImagemUrl         := '';
        msgInfo.ExibirPopup       := 'N';
        msgInfo.ExigirConfirmacao := 'S';
        msgInfo.Lida              := 'S';
        msgInfo.Lido              := True;

        frmAVISOCOMUNICADO.CarregaMensagem(msgInfo, False);
        frmAVISOCOMUNICADO.ShowModal();
      finally
        msgInfo.Free;
      end;
    end
    else if SameText(sCard, 'suporte') then
    begin
      msgInfo := TMsgInfo.Create;
      try
        msgInfo.Codigo            := 99002;
        msgInfo.Titulo            := 'Central de Atendimento & Suporte Sisgr' + #227 + 'os';
        msgInfo.Corpo             :=
          'Nossa equipe de suporte t' + #233 + 'cnico especializado est' + #225 + ' dispon' + #237 + 'vel para atender sua empresa!' + #13#10 + #13#10 +
          #8226 + ' Hor' + #225 + 'rio de Atendimento: Segunda a Sexta, das 08h ' + #224 + 's 18h' + #13#10 +
          #8226 + ' WhatsApp Oficial de Suporte e Plant' + #227 + 'o T' + #233 + 'cnico' + #13#10 +
          #8226 + ' Atendimento para laborat' + #243 + 'rios de an' + #225 + 'lises, sementes, pastagem e financeiro' + #13#10 +
          #8226 + ' Apoio com emiss' + #227 + 'o de laudos, integra' + #231 + #245 + 'es e atualiza' + #231 + #245 + 'es.';
        msgInfo.Prioridade        := 'NORMAL';
        msgInfo.ImagemUrl         := '';
        msgInfo.ExibirPopup       := 'N';
        msgInfo.ExigirConfirmacao := 'S';
        msgInfo.Lida              := 'S';
        msgInfo.Lido              := True;

        frmAVISOCOMUNICADO.CarregaMensagem(msgInfo, False);
        frmAVISOCOMUNICADO.ShowModal();
      finally
        msgInfo.Free;
      end;
    end
    else
    begin
      // Mensagem do servidor
      if (mm.vUltimoAvisoMsg <> nil) and (mm.vUltimoAvisoMsg.Registro = 1) then
      begin
        frmAVISOCOMUNICADO.CarregaMensagem(mm.vUltimoAvisoMsg, False);
        frmAVISOCOMUNICADO.ShowModal();
      end;
    end;
  end
  else if SameText(EventName, 'mark_read') then
  begin
    if mm.vUltimoAvisoMsg <> nil then
    begin
      mm.vUltimoAvisoMsg.Lido := True;
      mm.vUltimoAvisoMsg.Lida := 'S';

      if (mm.vUltimoAvisoMsg.Codigo > 0) and (mm.vMensagensLidas <> nil) then
      begin
        if mm.vMensagensLidas.IndexOf(IntToStr(mm.vUltimoAvisoMsg.Codigo)) = -1 then
          mm.vMensagensLidas.Add(IntToStr(mm.vUltimoAvisoMsg.Codigo));
      end;

      try
        ConfirmaLeituraMensagem(mm.vUltimoAvisoMsg.Codigo, mm.GetContratoAtivo, mm.vUserName);
      except
      end;
    end;

    try
      if MainForm <> nil then
        MainForm.rc_UpdateNotificationsBadge(0);
    except
    end;

    AtualizarLista;
  end;
end;

end.
