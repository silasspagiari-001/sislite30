unit untFrmAVISOCOMUNICADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniHTMLFrame,
  uMsgInfo, uniPanel;

type
  TfrmAVISOCOMUNICADO = class(TUniForm)
    htmlAviso: TUniHTMLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlAvisoAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    { Private declarations }
    FCodigoMsg: Integer;
    FTitulo: string;
    FCorpo: string;
    FImagemUrl: string;
    FPrioridade: string;
    FDataInicio: string;
    FExibirPopup: string;
    FExigirConfirmacao: string;
    FContratoNumero: string;
    FContratoSituacao: string;
    FModoConsulta: Boolean;

    function GerarHTMLModal: string;
  public
    { Public declarations }
    procedure CarregaMensagem(AMsg: TMsgInfo; AModoConsulta: Boolean = False);
  end;

function frmAVISOCOMUNICADO: TfrmAVISOCOMUNICADO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, Main;

function frmAVISOCOMUNICADO: TfrmAVISOCOMUNICADO;
begin
  Result := TfrmAVISOCOMUNICADO(mm.GetFormInstance(TfrmAVISOCOMUNICADO));
end;

procedure TfrmAVISOCOMUNICADO.UniFormCreate(Sender: TObject);
begin
  Self.BorderStyle := bsNone;
  Self.Position    := poScreenCenter;
  Self.Width       := 560;
  Self.Height      := 630;
end;

procedure TfrmAVISOCOMUNICADO.UniFormShow(Sender: TObject);
begin
  Self.Width    := 560;
  Self.Height   := 630;
  Self.Position := poScreenCenter;

  // Garante que o fundo do ExtJS seja 100% transparente para que apenas o card flutue
  UniSession.AddJS(
    'try {' +
    '  var w = ' + Self.WebForm.JSName + ';' +
    '  if (w) {' +
    '    if (w.el) {' +
    '      w.el.setStyle("background", "transparent");' +
    '      w.el.setStyle("box-shadow", "none");' +
    '      w.el.setStyle("border", "none");' +
    '    }' +
    '    if (w.body) {' +
    '      w.body.setStyle("background", "transparent");' +
    '      w.body.setStyle("border", "none");' +
    '    }' +
    '  }' +
    '} catch(e){}'
  );
end;

procedure TfrmAVISOCOMUNICADO.CarregaMensagem(AMsg: TMsgInfo; AModoConsulta: Boolean);
begin
  if AMsg = nil then Exit;

  FCodigoMsg         := AMsg.Codigo;
  FTitulo            := AMsg.Titulo;
  FCorpo             := AMsg.Corpo;
  FImagemUrl         := AMsg.ImagemUrl;
  FPrioridade        := AMsg.Prioridade;
  FDataInicio        := AMsg.DataInicio;
  FExibirPopup       := AMsg.ExibirPopup;
  FExigirConfirmacao := AMsg.ExigirConfirmacao;
  FContratoNumero    := AMsg.ContratoNumero;
  FContratoSituacao  := AMsg.ContratoSituacao;
  FModoConsulta      := AModoConsulta;

  htmlAviso.HTML.Text := GerarHTMLModal;
end;

function TfrmAVISOCOMUNICADO.GerarHTMLModal: string;
var
  sHtml, sBannerHtml, sBadgePreviewHTML, sCorpoFormatado: string;
  sImgFinal, sBaseApi, sBtnConfirmar, sBtnFechar, sCornerClose, sJsTarget: string;
  p1, p2: Integer;
begin
  sJsTarget := htmlAviso.JSName;

  // 1. Trata prioridade e badge exatamente como no cadastro de RadCoreAdmSisgraos
  if (Pos('VENCE HOJE', UpperCase(FTitulo)) > 0) or (Pos('VENCE HOJE', UpperCase(FCorpo)) > 0) then
  begin
    sBadgePreviewHTML :=
      '<span class="rc-badge-pill rc-badge-urgente">' +
      '&#9888; CONTRATO VENCE HOJE</span>';
  end
  else if UpperCase(Trim(FPrioridade)) = 'URGENTE' then
  begin
    sBadgePreviewHTML :=
      '<span class="rc-badge-pill rc-badge-urgente">' +
      '&#9888; URGENTE</span>';
  end
  else if (UpperCase(Trim(FPrioridade)) = 'IMPORTANTE') or (UpperCase(Trim(FPrioridade)) = 'DESTAQUE') then
  begin
    sBadgePreviewHTML :=
      '<span class="rc-badge-pill rc-badge-importante">' +
      '&#11088; DESTAQUE</span>';
  end
  else
  begin
    sBadgePreviewHTML :=
      '<span class="rc-badge-pill rc-badge-comunicado">' +
      '&#128227; COMUNICADO</span>';
  end;

  // 2. Trata imagem do banner com proporcao e altura alinhadas ao cadastro do Sisgraos Adm
  sImgFinal := Trim(FImagemUrl);
  if sImgFinal <> '' then
  begin
    if (Pos('http://', LowerCase(sImgFinal)) = 0) and (Pos('https://', LowerCase(sImgFinal)) = 0) then
    begin
      sBaseApi := Caminho('HTTPGETFINANCEIRO=');
      if (Copy(sBaseApi, Length(sBaseApi), 1) = '/') and (Copy(sImgFinal, 1, 1) = '/') then
        Delete(sImgFinal, 1, 1)
      else if (Copy(sBaseApi, Length(sBaseApi), 1) <> '/') and (Copy(sImgFinal, 1, 1) <> '/') and (sBaseApi <> '') then
        sBaseApi := sBaseApi + '/';
      sImgFinal := sBaseApi + sImgFinal;
    end;

    sBannerHtml :=
      '<div class="modal-banner-wrap">' +
      '  <img src="' + sImgFinal + '" class="modal-banner-img" onerror="onBannerError(this);" />' +
      '  <div class="banner-badge-box">' + sBadgePreviewHTML + '</div>' +
      '</div>';
  end
  else
  begin
    sBannerHtml :=
      '<div class="modal-banner-wrap modal-banner-agro">' +
      '  <div class="banner-overlay">' +
      '    <span class="banner-agro-tag"><svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor">' +
      '<path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg> ' +
      'COMUNICADO OFICIAL SISGR&#195;OS</span>' +
      '  </div>' +
      '  <div class="banner-badge-box">' + sBadgePreviewHTML + '</div>' +
      '</div>';
  end;

  // 3. Formata corpo da mensagem (se ja contem HTML estruturado, nao adicionar <br> extras)
  if (Pos('<div', LowerCase(FCorpo)) > 0) or (Pos('<style', LowerCase(FCorpo)) > 0) or
     (Pos('<table', LowerCase(FCorpo)) > 0) or (Pos('<p', LowerCase(FCorpo)) > 0) then
    sCorpoFormatado := FCorpo
  else
  begin
    sCorpoFormatado := FCorpo;
    // Formata markdown **negrito** (estilo WhatsApp)
    while True do
    begin
      p1 := Pos('**', sCorpoFormatado);
      if p1 <= 0 then Break;
      p2 := Pos('**', Copy(sCorpoFormatado, p1 + 2, Length(sCorpoFormatado)));
      if p2 <= 0 then Break;
      p2 := p1 + 1 + p2;
      sCorpoFormatado := Copy(sCorpoFormatado, 1, p1 - 1) + '<b>' + Copy(sCorpoFormatado, p1 + 2, p2 - p1 - 2) + '</b>' + Copy(sCorpoFormatado, p2 + 2, Length(sCorpoFormatado));
    end;
    sCorpoFormatado := StringReplace(sCorpoFormatado, #13#10, '<br>', [rfReplaceAll]);
    sCorpoFormatado := StringReplace(sCorpoFormatado, #10, '<br>', [rfReplaceAll]);
  end;

  // 4. Botoes de acao essenciais
  sCornerClose := '<button type="button" class="btn-close-corner" onclick="fnModalFechar();" title="Fechar">&#10005;</button>';

  // Botoes de acao: 'Estou Ciente e Fechar' e 'Fechar'
  if (Pos('VENCE HOJE', UpperCase(FTitulo)) > 0) or (Pos('VENCE HOJE', UpperCase(FCorpo)) > 0) then
  begin
    sBtnConfirmar :=
      '<button type="button" class="btn-confirmar" ' +
      'style="background:linear-gradient(135deg,#f59e0b,#d97706) !important; ' +
      'border:1px solid #fde68a !important; box-shadow:0 4px 12px rgba(217,119,6,0.35) !important;" ' +
      'onclick="fnModalConfirmar();">' +
      '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round">' +
      '<path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>' +
      '<line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>' +
      '<span>&#9888; Estou Ciente e Fechar</span></button>';
  end
  else
  begin
    sBtnConfirmar :=
      '<button type="button" class="btn-confirmar" onclick="fnModalConfirmar();">' +
      '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
      'stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round">' +
      '<polyline points="20 6 9 17 4 12"></polyline></svg>' +
      '<span>&#10004; Estou Ciente e Fechar</span></button>';
  end;
  sBtnFechar := '<button type="button" class="btn-fechar" onclick="fnModalFechar();">Fechar</button>';
  // Se a prioridade for URGENTE ou exigir confirmacao, obriga o usuario a clicar em 'Estou Ciente'
  if (UpperCase(Trim(FPrioridade)) = 'URGENTE') or (UpperCase(Trim(FExigirConfirmacao)) = 'S') then
  begin
    sCornerClose := '';
    sBtnFechar   := '';
  end;

  sHtml :=
    '<!DOCTYPE html>' +
    '<html lang="pt-BR">' +
    '<head>' +
    '  <meta charset="utf-8">' +
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' +
    '  <style>' +
    '    @import url("https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700;800&display=swap");' +
    '    * { box-sizing: border-box; margin: 0; padding: 0; }' +
    '    body, html {' +
    '      margin: 0; padding: 0;' +
    '      background: transparent !important;' +
    '      font-family: "Plus Jakarta Sans", "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;' +
    '      color: #1e293b;' +
    '      height: 100%; width: 100%;' +
    '      overflow: hidden;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '    }' +
    '    .modal-frame-outer {' +
    '      width: 100%;' +
    '      height: 630px !important;' +
    '      max-height: 630px !important;' +
    '      padding: 6px;' +
    '      box-sizing: border-box;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '    }' +
    '    .modal-card {' +
    '      width: 100% !important;' +
    '      height: 618px !important;' +
    '      max-height: 618px !important;' +
    '      min-height: 618px !important;' +
    '      background: #ffffff;' +
    '      border-radius: 20px;' +
    '      overflow: hidden !important;' +
    '      display: flex !important;' +
    '      flex-direction: column !important;' +
    '      box-shadow: 0 20px 45px -8px rgba(0, 0, 0, 0.42), 0 8px 18px -4px rgba(0, 0, 0, 0.18);' +
    '      border: 1px solid rgba(226, 232, 240, 0.95);' +
    '      position: relative !important;' +
    '    }' +
    '    /* Banner com proporcao e altura alinhadas ao cadastro do Sisgraos Adm */' +
    '    .modal-banner-wrap {' +
    '      flex: 0 0 170px !important;' +
    '      height: 170px !important;' +
    '      max-height: 170px !important;' +
    '      width: 100% !important;' +
    '      position: relative;' +
    '      overflow: hidden;' +
    '      background: #f8fafc;' +
    '      border-radius: 20px 20px 0 0;' +
    '      margin: 0;' +
    '      padding: 0;' +
    '    }' +
    '    .modal-banner-img {' +
    '      width: 100%;' +
    '      height: 100%;' +
    '      object-fit: cover;' +
    '      object-position: center;' +
    '      display: block;' +
    '      margin: 0;' +
    '      padding: 0;' +
    '    }' +
    '    .banner-badge-box {' +
    '      position: absolute;' +
    '      top: 12px;' +
    '      right: 50px;' +
    '      z-index: 5;' +
    '    }' +
    '    .rc-badge-pill {' +
    '      font-size: 11px;' +
    '      font-weight: 800;' +
    '      padding: 4px 11px;' +
    '      border-radius: 12px;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      gap: 5px;' +
    '      letter-spacing: 0.2px;' +
    '      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.12);' +
    '    }' +
    '    .rc-badge-comunicado {' +
    '      background: #ecfdf5;' +
    '      border: 1px solid #a7f3d0;' +
    '      color: #065f46;' +
    '      box-shadow: 0 2px 6px rgba(6, 95, 70, 0.18);' +
    '    }' +
    '    .rc-badge-urgente {' +
    '      background: #fee2e2;' +
    '      border: 1px solid #fca5a5;' +
    '      color: #991b1b;' +
    '      box-shadow: 0 2px 6px rgba(185, 28, 28, 0.25);' +
    '    }' +
    '    .rc-badge-importante {' +
    '      background: #fef3c7;' +
    '      border: 1px solid #fcd34d;' +
    '      color: #92400e;' +
    '      box-shadow: 0 2px 6px rgba(180, 83, 9, 0.25);' +
    '    }' +
    '    .btn-close-corner {' +
    '      position: absolute;' +
    '      top: 10px;' +
    '      right: 10px;' +
    '      width: 32px;' +
    '      height: 32px;' +
    '      border-radius: 50%;' +
    '      background: rgba(15, 23, 42, 0.45);' +
    '      backdrop-filter: blur(8px);' +
    '      -webkit-backdrop-filter: blur(8px);' +
    '      border: 1px solid rgba(255, 255, 255, 0.4);' +
    '      color: #ffffff;' +
    '      font-size: 13px;' +
    '      font-weight: 700;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      cursor: pointer;' +
    '      transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);' +
    '      z-index: 10;' +
    '      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);' +
    '    }' +
    '    .btn-close-corner:hover {' +
    '      background: rgba(15, 23, 42, 0.85);' +
    '      transform: scale(1.08);' +
    '      border-color: #ffffff;' +
    '    }' +
    '    .modal-banner-agro {' +
    '      background: linear-gradient(135deg, rgba(27, 77, 62, 0.95) 0%, rgba(13, 50, 36, 0.98) 100%),' +
    '                  url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv_UtP3CAzqk3peLlbvDRz7QBHJ0E1yhkGBNqciqCy9e-6eSzZAcgo-Y7_&s=10") center center / cover no-repeat;' +
    '      display: flex;' +
    '      align-items: flex-end;' +
    '      padding: 12px 16px;' +
    '    }' +
    '    .banner-overlay {' +
    '      position: relative;' +
    '      z-index: 2;' +
    '    }' +
    '    .banner-agro-tag {' +
    '      background: rgba(255,255,255,0.22);' +
    '      backdrop-filter: blur(8px);' +
    '      -webkit-backdrop-filter: blur(8px);' +
    '      color: #ffffff;' +
    '      font-size: 10.5px;' +
    '      font-weight: 800;' +
    '      letter-spacing: 0.7px;' +
    '      padding: 5px 12px;' +
    '      border-radius: 20px;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      gap: 6px;' +
    '      border: 1px solid rgba(255,255,255,0.3);' +
    '    }' +
    '    /* Linha do Titulo */' +
    '    .modal-header-row {' +
    '      flex: 0 0 auto;' +
    '      padding: 12px 20px 4px 20px;' +
    '      display: flex;' +
    '      align-items: center;' +
    '    }' +
    '    .modal-title {' +
    '      font-size: 16px;' +
    '      font-weight: 800;' +
    '      color: #064e3b;' +
    '      text-transform: uppercase;' +
    '      letter-spacing: -0.2px;' +
    '      line-height: 1.35;' +
    '      flex: 1;' +
    '      white-space: nowrap;' +
    '      overflow: hidden;' +
    '      text-overflow: ellipsis;' +
    '    }' +
    '    /* CORPO DA MENSAGEM: OCUPA O ESPACO DISPONIVEL E ROLA SUAVEMENTE */' +
    '    .modal-body-scroll {' +
    '      flex: 1 1 0 !important;' +
    '      min-height: 0 !important;' +
    '      overflow-y: scroll !important;' +
    '      overflow-x: hidden !important;' +
    '      padding: 8px 20px 14px 20px !important;' +
    '      font-size: 13.5px !important;' +
    '      line-height: 1.65 !important;' +
    '      color: #334155 !important;' +
    '      box-sizing: border-box !important;' +
    '      scrollbar-width: thin !important;' +
    '      scrollbar-color: #94a3b8 #f1f5f9 !important;' +
    '    }' +
    '    .modal-body-scroll::-webkit-scrollbar {' +
    '      width: 7px !important;' +
    '    }' +
    '    .modal-body-scroll::-webkit-scrollbar-track {' +
    '      background: #f8fafc !important;' +
    '      border-radius: 8px !important;' +
    '      margin: 4px 0 !important;' +
    '    }' +
    '    .modal-body-scroll::-webkit-scrollbar-thumb {' +
    '      background: #94a3b8 !important;' +
    '      border-radius: 8px !important;' +
    '      border: 1px solid #f8fafc !important;' +
    '    }' +
    '    .modal-body-scroll::-webkit-scrollbar-thumb:hover {' +
    '      background: #059669 !important;' +
    '    }' +
    '    /* Callout compacto */' +
    '    .modal-callout {' +
    '      flex: 0 0 auto;' +
    '      background: #fffbeb;' +
    '      border: 1px solid #fef08a;' +
    '      border-left: 3px solid #f59e0b;' +
    '      border-radius: 8px;' +
    '      padding: 5px 10px;' +
    '      margin: 3px 20px 6px 20px;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      gap: 8px;' +
    '      font-size: 11px;' +
    '      color: #78350f;' +
    '      font-weight: 600;' +
    '    }' +
    '    .modal-callout-icon {' +
    '      font-size: 13px;' +
    '      color: #d97706;' +
    '      flex-shrink: 0;' +
    '    }' +
    '    /* RODA-PE SEMPRE FIXO NA BASE - ESTILO LAYOUT BUTTON BAR */' +
    '    .modal-footer {' +
    '      flex: 0 0 65px !important;' +
    '      height: 65px !important;' +
    '      min-height: 65px !important;' +
    '      max-height: 65px !important;' +
    '      margin-top: auto !important;' +
    '      padding: 10px 18px !important;' +
    '      display: flex !important;' +
    '      align-items: center !important;' +
    '      justify-content: space-between !important;' +
    '      background: #f8fafc !important;' +
    '      border-top: 1px solid #e2e8f0 !important;' +
    '      border-radius: 0 0 20px 20px !important;' +
    '      gap: 12px !important;' +
    '      box-sizing: border-box !important;' +
    '      box-shadow: 0 -3px 12px rgba(0, 0, 0, 0.05) !important;' +
    '      z-index: 10 !important;' +
    '    }' +
    '    .btn-confirmar {' +
    '      flex: 1;' +
    '      height: 44px;' +
    '      background: linear-gradient(135deg, #10b981 0%, #059669 100%);' +
    '      color: #ffffff;' +
    '      font-size: 13px;' +
    '      font-weight: 700;' +
    '      padding: 0 16px;' +
    '      border-radius: 12px;' +
    '      border: none;' +
    '      cursor: pointer;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      gap: 8px;' +
    '      transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);' +
    '      box-shadow: 0 3px 10px rgba(16, 185, 129, 0.35);' +
    '      white-space: nowrap;' +
    '    }' +
    '    .btn-confirmar:hover {' +
    '      background: linear-gradient(135deg, #059669 0%, #047857 100%);' +
    '      transform: translateY(-1px);' +
    '      box-shadow: 0 5px 14px rgba(16, 185, 129, 0.45);' +
    '    }' +
    '    .btn-confirmar:active {' +
    '      transform: translateY(0);' +
    '    }' +
    '    .btn-fechar {' +
    '      min-width: 95px;' +
    '      height: 44px;' +
    '      background: #ffffff;' +
    '      color: #475569;' +
    '      font-size: 13px;' +
    '      font-weight: 600;' +
    '      padding: 0 16px;' +
    '      border-radius: 12px;' +
    '      border: 1px solid #cbd5e1;' +
    '      cursor: pointer;' +
    '      transition: all 0.2s ease;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      white-space: nowrap;' +
    '      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);' +
    '    }' +
    '    .btn-fechar:hover {' +
    '      background: #f1f5f9;' +
    '      color: #0f172a;' +
    '      border-color: #94a3b8;' +
    '    }' +
    '  </style>' +
    '</head>' +
    '<body>' +
    '  <div class="modal-frame-outer">' +
    '    <div class="modal-card">' +
           sBannerHtml +
           sCornerClose +
    '      <div class="modal-header-row">' +
    '        <div class="modal-title" title="' + FTitulo + '">' + FTitulo + '</div>' +
    '      </div>' +
    '      <div class="modal-body-scroll">' +
    '        ' + sCorpoFormatado +
    '      </div>' +
    '      <div class="modal-footer">' +
             sBtnConfirmar +
             sBtnFechar +
    '      </div>' +
    '    </div>' +
    '  </div>' +
    '  <script>' +
    '    function onBannerError(img) {' +
    '      try {' +
    '        img.style.display = "none";' +
    '        if (img.parentElement) { img.parentElement.className = "modal-banner-wrap modal-banner-agro"; }' +
    '      } catch(e){}' +
    '    }' +
    '    function fnModalConfirmar() {' +
    '      try { ajaxRequest(' + sJsTarget + ', "_confirmar", []); } catch(e){}' +
    '    }' +
    '    function fnModalFechar() {' +
    '      try { ajaxRequest(' + sJsTarget + ', "_fechar", []); } catch(e){}' +
    '    }' +
    '  </script>' +
    '</body>' +
    '</html>';

  Result := sHtml;
end;

procedure TfrmAVISOCOMUNICADO.htmlAvisoAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  sIdContrato: string;
begin
  if SameText(EventName, '_confirmar') then
  begin
    if (FCodigoMsg > 0) and (mm.vMensagensLidas <> nil) then
    begin
      if mm.vMensagensLidas.IndexOf(IntToStr(FCodigoMsg)) = -1 then
        mm.vMensagensLidas.Add(IntToStr(FCodigoMsg));
    end;

    if mm.vUltimoAvisoMsg <> nil then
    begin
      mm.vUltimoAvisoMsg.Lido := True;
      mm.vUltimoAvisoMsg.Lida := 'S';
    end;

    try
      if MainForm <> nil then
        MainForm.rc_UpdateNotificationsBadge(0);
    except
    end;

    try
      sIdContrato := mm.GetContratoAtivo;
      if Trim(sIdContrato) = '' then
        sIdContrato := mm.varC_Doc_Customer;

      if FCodigoMsg > 0 then
        ConfirmaLeituraMensagem(FCodigoMsg, sIdContrato, mm.vUserName);
    except
    end;

    try
      if MainForm <> nil then
      begin
        // Rearma verificacao em 800ms para abrir a proxima mensagem pendente se houver
        MainForm.UniTimerverificaweb.Enabled  := False;
        MainForm.UniTimerverificaweb.Interval := 800;
        MainForm.UniTimerverificaweb.RunOnce  := True;
        MainForm.UniTimerverificaweb.Enabled  := True;
      end;
    except
    end;

    ModalResult := mrOK;
  end
  else if SameText(EventName, '_fechar') then
  begin
    ModalResult := mrCancel;
  end;
end;

end.
