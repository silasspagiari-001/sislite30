unit untFrmAVISOFINANCEIRO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniHTMLFrame,
  uMsgInfo, uniPanel, StrUtils;

type
  TfrmAVISOFINANCEIRO = class(TUniForm)
    htmlAvisoFinanceiro: TUniHTMLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlAvisoFinanceiroAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    { Private declarations }
    FCodigoReceber : Integer;
    FContrato      : string;
    FDocumento     : string;
    FValor         : string;
    FVencimento    : string;
    FDiasAtraso    : Integer;
    FDiasTolerancia: Integer;

    function GerarHTMLInterno: string;
  public
    { Public declarations }
    procedure CarregaAviso(ACodigo: Integer; AContrato, ADocumento, AValor, AVencimento: string; ADiasAtraso, ADiasTolerancia: Integer);
  end;

function frmAVISOFINANCEIRO: TfrmAVISOFINANCEIRO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, Main;

function frmAVISOFINANCEIRO: TfrmAVISOFINANCEIRO;
begin
  Result := TfrmAVISOFINANCEIRO(mm.GetFormInstance(TfrmAVISOFINANCEIRO));
end;

procedure TfrmAVISOFINANCEIRO.UniFormCreate(Sender: TObject);
begin
  Self.BorderStyle := bsNone;
  Self.Position := poScreenCenter;
  Self.Width := 560;
  Self.Height := 630;
  with Self.Constraints do
  begin
    MinWidth := 560;
    MaxWidth := 560;
    MinHeight := 630;
    MaxHeight := 630;
  end;
end;

procedure TfrmAVISOFINANCEIRO.UniFormShow(Sender: TObject);
begin
  htmlAvisoFinanceiro.HTML.Text := GerarHTMLInterno;
end;

procedure TfrmAVISOFINANCEIRO.CarregaAviso(ACodigo: Integer; AContrato, ADocumento, AValor, AVencimento: string; ADiasAtraso, ADiasTolerancia: Integer);
begin
  FCodigoReceber  := ACodigo;
  FContrato       := AContrato;
  FDocumento      := ADocumento;
  FValor          := AValor;
  FVencimento     := AVencimento;
  FDiasAtraso     := ADiasAtraso;
  FDiasTolerancia := ADiasTolerancia;
  if htmlAvisoFinanceiro <> nil then
    htmlAvisoFinanceiro.HTML.Text := GerarHTMLInterno;
end;

procedure TfrmAVISOFINANCEIRO.htmlAvisoFinanceiroAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if SameText(EventName, '_confirmar_ciente') then
  begin
    try
      if (FCodigoReceber > 0) and (Trim(FContrato) <> '') then
        ConfirmaCienciaFinanceiro(FCodigoReceber, FContrato, mm.vUserName);
    except
    end;

    // Apos dar ciencia no financeiro, rearma o timer em 800ms para abrir as demais mensagens pendentes
    try
      if MainForm <> nil then
      begin
        MainForm.UniTimerverificaweb.Enabled  := False;
        MainForm.UniTimerverificaweb.Interval := 800;
        MainForm.UniTimerverificaweb.RunOnce  := True;
        MainForm.UniTimerverificaweb.Enabled  := True;
      end;
    except
    end;

    ModalResult := mrOK;
  end;
end;

function TfrmAVISOFINANCEIRO.GerarHTMLInterno: string;
var
  sJsTarget: string;
  iPct: Integer;
  sPct, sDocVal, sVlrVal, sVencVal, sCtrVal, sPluralAtraso, sPluralTolerancia: string;
begin
  sJsTarget := htmlAvisoFinanceiro.JSName;

  sDocVal  := FDocumento;
  if sDocVal = '' then sDocVal := 'PARCELA MENSAL';

  sVlrVal  := FValor;
  if sVlrVal = '' then sVlrVal := '0,00';

  sVencVal := FVencimento;
  if sVencVal = '' then sVencVal := FormatDateTime('dd/mm/yyyy', Date);

  sCtrVal  := FContrato;
  if sCtrVal = '' then sCtrVal := 'S/N';

  sPluralAtraso := '';
  if FDiasAtraso > 1 then sPluralAtraso := 's';

  sPluralTolerancia := '';
  if FDiasTolerancia > 1 then sPluralTolerancia := 's';

  iPct := (FDiasAtraso * 100) div 5;
  if iPct < 15 then iPct := 15;
  if iPct > 100 then iPct := 100;
  sPct := IntToStr(iPct) + '%';

  Result :=
    '<!DOCTYPE html>' +
    '<html lang="pt-BR">' +
    '<head>' +
    '  <meta charset="UTF-8">' +
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' +
    '  <title>Aviso - Financeiro Pendente</title>' +
    '  <link rel="preconnect" href="https://fonts.googleapis.com">' +
    '  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' +
    '  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@600;700&family=Outfit:wgh' +
    't@400;500;600;700;800;900&display=swap" rel="stylesheet">' +
    '  <style>' +
    '    :root {' +
    '      --menu-green-dark: #022c22;' +
    '      --menu-green-base: #064e3b;' +
    '      --menu-green-brand: #047857;' +
    '      --menu-green-light: #10b981;' +
    '      --menu-green-accent: #34d399;' +
    '      --menu-green-tint: rgba(16, 185, 129, 0.15);' +
    '      --menu-border-glow: rgba(52, 211, 153, 0.4);' +
    '    }' +
    '    * {' +
    '      box-sizing: border-box;' +
    '      margin: 0;' +
    '      padding: 0;' +
    '      user-select: none;' +
    '    }' +
    '    body {' +
    '      background: #0a0b10;' +
    '      font-family: ''Outfit'', -apple-system, BlinkMacSystemFont, sans-serif;' +
    '      color: #f8fafc;' +
    '      height: 100vh;' +
    '      width: 100%;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      overflow: hidden;' +
    '    }' +
    '    .warning-modal-wrapper {' +
    '      width: 560px;' +
    '      height: 630px;' +
    '      background: rgba(12, 22, 18, 0.96);' +
    '      backdrop-filter: blur(24px);' +
    '      -webkit-backdrop-filter: blur(24px);' +
    '      border: 1.5px solid var(--menu-border-glow);' +
    '      border-radius: 20px;' +
    '      overflow: hidden;' +
    '      box-shadow: ' +
    '        0 25px 60px -15px rgba(0, 0, 0, 0.9),' +
    '        0 0 40px -5px rgba(16, 185, 129, 0.25);' +
    '      display: flex;' +
    '      flex-direction: column;' +
    '      position: relative;' +
    '      animation: modalFadeIn 0.4s cubic-bezier(0.16, 1, 0.3, 1) forwards;' +
    '    }' +
    '    @keyframes modalFadeIn {' +
    '      0% { opacity: 0; transform: scale(0.92) translateY(15px); }' +
    '      100% { opacity: 1; transform: scale(1) translateY(0); }' +
    '    }' +
    '    /* Linha de Led Neon Verde no Topo */' +
    '    .top-beacon-bar {' +
    '      height: 5px;' +
    '      width: 100%;' +
    '      background: linear-gradient(90deg, #047857, #10b981, #6ee7b7, #10b981, #047857);' +
    '      background-size: 200% 100%;' +
    '      animation: sweepGlow 3.5s linear infinite;' +
    '      box-shadow: 0 0 12px rgba(16, 185, 129, 0.8);' +
    '    }' +
    '    @keyframes sweepGlow {' +
    '      0% { background-position: 100% 0; }' +
    '      100% { background-position: -100% 0; }' +
    '    }' +
    '    /* Topo Banner no Estilo Verde do Menu SisGrãos */' +
    '    .card-banner {' +
    '      background: linear-gradient(135deg, rgba(2, 44, 34, 0.98) 0%, rgba(6, 78, 59, 0.94) 100%);' +
    '      padding: 16px 22px 14px 22px;' +
    '      border-bottom: 1px solid rgba(52, 211, 153, 0.25);' +
    '      flex-shrink: 0;' +
    '      position: relative;' +
    '    }' +
    '    .card-banner::after {' +
    '      content: '''';' +
    '      position: absolute;' +
    '      top: 0;' +
    '      right: 0;' +
    '      width: 140px;' +
    '      height: 100%;' +
    '      background: radial-gradient(circle at 100% 0%, rgba(52, 211, 153, 0.2) 0%, transparent 70%);' +
    '      pointer-events: none;' +
    '    }' +
    '    .badge-master-row {' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: space-between;' +
    '      margin-bottom: 10px;' +
    '    }' +
    '    .badge-master {' +
    '      background: rgba(16, 185, 129, 0.18);' +
    '      border: 1px solid rgba(52, 211, 153, 0.5);' +
    '      color: #6ee7b7;' +
    '      font-size: 11px;' +
    '      font-weight: 800;' +
    '      letter-spacing: 0.8px;' +
    '      text-transform: uppercase;' +
    '      padding: 3px 10px;' +
    '      border-radius: 20px;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      gap: 6px;' +
    '    }' +
    '    .badge-master-dot {' +
    '      width: 7px;' +
    '      height: 7px;' +
    '      border-radius: 50%;' +
    '      background: #34d399;' +
    '      box-shadow: 0 0 8px #34d399;' +
    '      animation: pulseDot 2s infinite;' +
    '    }' +
    '    @keyframes pulseDot {' +
    '      0%, 100% { opacity: 1; transform: scale(1); }' +
    '      50% { opacity: 0.5; transform: scale(0.85); }' +
    '    }' +
    '    .badge-contrato {' +
    '      font-family: ''JetBrains Mono'', monospace;' +
    '      font-size: 11px;' +
    '      color: #a7f3d0;' +
    '      background: rgba(2, 44, 34, 0.8);' +
    '      padding: 3px 10px;' +
    '      border-radius: 6px;' +
    '      border: 1px solid rgba(52, 211, 153, 0.3);' +
    '      font-weight: 700;' +
    '    }' +
    '    .banner-title-group {' +
    '      display: flex;' +
    '      align-items: center;' +
    '      gap: 12px;' +
    '    }' +
    '    .icon-alert-box {' +
    '      width: 44px;' +
    '      height: 44px;' +
    '      border-radius: 12px;' +
    '      background: linear-gradient(135deg, rgba(5, 150, 105, 0.35) 0%, rgba(4, 120, 87, 0.55) 100%);' +
    '      border: 1.5px solid rgba(52, 211, 153, 0.6);' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      color: #a7f3d0;' +
    '      flex-shrink: 0;' +
    '      box-shadow: 0 0 15px rgba(16, 185, 129, 0.35);' +
    '    }' +
    '    .banner-text h1 {' +
    '      font-size: 19px;' +
    '      font-weight: 800;' +
    '      color: #ffffff;' +
    '      letter-spacing: -0.3px;' +
    '    }' +
    '    .banner-text p {' +
    '      font-size: 12px;' +
    '      color: #a7f3d0;' +
    '      font-weight: 500;' +
    '      margin-top: 1px;' +
    '    }' +
    '    /* Corpo do Card */' +
    '    .card-body {' +
    '      padding: 18px 22px;' +
    '      flex: 1 1 auto;' +
    '      overflow-y: auto;' +
    '    }' +
    '    .invoice-highlight-box {' +
    '      background: rgba(6, 78, 59, 0.22);' +
    '      border: 1px solid rgba(52, 211, 153, 0.25);' +
    '      border-radius: 14px;' +
    '      padding: 14px 16px;' +
    '      margin-bottom: 14px;' +
    '      display: grid;' +
    '      grid-template-columns: 1fr 1fr;' +
    '      gap: 12px;' +
    '    }' +
    '    .invoice-item label {' +
    '      display: block;' +
    '      font-size: 10.5px;' +
    '      font-weight: 600;' +
    '      color: #94a3b8;' +
    '      text-transform: uppercase;' +
    '      letter-spacing: 0.5px;' +
    '      margin-bottom: 3px;' +
    '    }' +
    '    .invoice-item .val-destaque {' +
    '      font-size: 20px;' +
    '      font-weight: 800;' +
    '      color: #34d399;' +
    '      font-family: ''JetBrains Mono'', monospace;' +
    '      text-shadow: 0 0 10px rgba(52, 211, 153, 0.3);' +
    '    }' +
    '    .invoice-item .val-vencimento {' +
    '      font-size: 14.5px;' +
    '      font-weight: 700;' +
    '      color: #fca5a5;' +
    '    }' +
    '    .invoice-item .val-info {' +
    '      font-size: 13px;' +
    '      font-weight: 600;' +
    '      color: #e2e8f0;' +
    '    }' +
    '    /* Box de Contagem Regressiva e Tolerancia */' +
    '    .danger-countdown-box {' +
    '      background: linear-gradient(135deg, rgba(239, 68, 68, 0.12) 0%, rgba(6, 78, 59, 0.25) 100%);' +
    '      border: 1.5px solid rgba(239, 68, 68, 0.35);' +
    '      border-left: 5px solid #ef4444;' +
    '      border-radius: 12px;' +
    '      padding: 12px 14px;' +
    '      margin-bottom: 14px;' +
    '    }' +
    '    .countdown-header {' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: space-between;' +
    '      margin-bottom: 6px;' +
    '    }' +
    '    .countdown-title {' +
    '      font-size: 12px;' +
    '      font-weight: 800;' +
    '      color: #fca5a5;' +
    '      text-transform: uppercase;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      gap: 6px;' +
    '    }' +
    '    .countdown-pill {' +
    '      background: #dc2626;' +
    '      color: #ffffff;' +
    '      font-size: 10.5px;' +
    '      font-weight: 800;' +
    '      padding: 2px 7px;' +
    '      border-radius: 10px;' +
    '    }' +
    '    .countdown-msg {' +
    '      font-size: 12px;' +
    '      line-height: 1.5;' +
    '      color: #f1f5f9;' +
    '    }' +
    '    .countdown-msg strong {' +
    '      color: #fca5a5;' +
    '      font-weight: 700;' +
    '    }' +
    '    .progress-bar-container {' +
    '      margin-top: 8px;' +
    '      background: rgba(2, 44, 34, 0.8);' +
    '      height: 7px;' +
    '      border-radius: 8px;' +
    '      overflow: hidden;' +
    '      border: 1px solid rgba(52, 211, 153, 0.2);' +
    '    }' +
    '    .progress-bar-fill {' +
    '      height: 100%;' +
    '      width: ' + sPct + ';' +
    '      background: linear-gradient(90deg, #10b981, #f59e0b, #ef4444);' +
    '      border-radius: 8px;' +
    '    }' +
    '    .progress-legend {' +
    '      display: flex;' +
    '      justify-content: space-between;' +
    '      font-size: 10px;' +
    '      color: #94a3b8;' +
    '      margin-top: 4px;' +
    '      font-family: ''JetBrains Mono'', monospace;' +
    '    }' +
    '    /* Linha de Suporte / Contato */' +
    '    .contact-bar {' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: space-between;' +
    '      background: rgba(2, 44, 34, 0.5);' +
    '      border: 1px solid rgba(52, 211, 153, 0.2);' +
    '      border-radius: 10px;' +
    '      padding: 9px 12px;' +
    '      margin-bottom: 6px;' +
    '    }' +
    '    .contact-bar-text {' +
    '      font-size: 11.5px;' +
    '      color: #cbd5e1;' +
    '    }' +
    '    .contact-bar-text span {' +
    '      color: #34d399;' +
    '      font-weight: 700;' +
    '    }' +
    '    .btn-wpp-link {' +
    '      background: #16a34a;' +
    '      color: #ffffff;' +
    '      text-decoration: none;' +
    '      font-size: 11px;' +
    '      font-weight: 700;' +
    '      padding: 5px 10px;' +
    '      border-radius: 7px;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      gap: 5px;' +
    '      transition: background 0.2s;' +
    '    }' +
    '    .btn-wpp-link:hover {' +
    '      background: #15803d;' +
    '    }' +
    '    /* Rodapé com Botão Único ''ESTOU CIENTE'' */' +
    '    .modal-footer {' +
    '      background: rgba(2, 44, 34, 0.95);' +
    '      border-top: 1px solid rgba(52, 211, 153, 0.25);' +
    '      padding: 14px 22px;' +
    '      display: flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      flex-shrink: 0;' +
    '    }' +
    '    .btn-estou-ciente {' +
    '      width: 100%;' +
    '      height: 46px;' +
    '      background: linear-gradient(135deg, #10b981 0%, #047857 100%);' +
    '      color: #ffffff;' +
    '      font-family: ''Outfit'', sans-serif;' +
    '      font-size: 14px;' +
    '      font-weight: 800;' +
    '      letter-spacing: 0.6px;' +
    '      text-transform: uppercase;' +
    '      border: 1px solid rgba(255, 255, 255, 0.3);' +
    '      border-radius: 12px;' +
    '      cursor: pointer;' +
    '      display: inline-flex;' +
    '      align-items: center;' +
    '      justify-content: center;' +
    '      gap: 8px;' +
    '      box-shadow: 0 4px 18px rgba(16, 185, 129, 0.45);' +
    '      transition: all 0.2s;' +
    '    }' +
    '    .btn-estou-ciente:hover {' +
    '      background: linear-gradient(135deg, #34d399 0%, #059669 100%);' +
    '      transform: translateY(-1px);' +
    '      box-shadow: 0 6px 24px rgba(52, 211, 153, 0.6);' +
    '    }' +
    '    .btn-estou-ciente:active {' +
    '      transform: translateY(1px);' +
    '    }' +
    '  </style>' +
    '</head>' +
    '<body>' +
    '  <div class="warning-modal-wrapper">' +
    '    <div class="top-beacon-bar"></div>' +
    '    <div class="card-banner">' +
    '      <div class="badge-master-row">' +
    '        <div class="badge-master">' +
    '          <span class="badge-master-dot"></span>' +
    '          Aviso Master &bull; Gestao Financeira' +
    '        </div>' +
    '        <div class="badge-contrato">CTR: #' + sCtrVal + '</div>' +
    '      </div>' +
    '      <div class="banner-title-group">' +
    '        <div class="icon-alert-box">' +
    '          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-w' +
    'idth="2.3" stroke-linecap="round" stroke-linejoin="round">' +
    '            <path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>' +
    '          </svg>' +
    '        </div>' +
    '        <div class="banner-text">' +
    '          <h1>FINANCEIRO PENDENTE</h1>' +
    '          <p>Regularizacao necessária para continuidade do servico</p>' +
    '        </div>' +
    '      </div>' +
    '    </div>' +
    '    <div class="card-body">' +
    '      <div class="invoice-highlight-box">' +
    '        <div class="invoice-item">' +
    '          <label>Valor da Parcela</label>' +
    '          <div class="val-destaque">R$ ' + sVlrVal + '</div>' +
    '        </div>' +
    '        <div class="invoice-item">' +
    '          <label>Data de Vencimento</label>' +
    '          <div class="val-vencimento">' + sVencVal + '</div>' +
    '        </div>' +
    '        <div class="invoice-item">' +
    '          <label>Título / Documento</label>' +
    '          <div class="val-info">' + sDocVal + '</div>' +
    '        </div>' +
    '        <div class="invoice-item">' +
    '          <label>Situacao</label>' +
    '          <div class="val-info" style="color:#34d399;">Em Aberto (' + IntToStr(FDiasAtraso) + ' dia' + sPluralAtraso + ')</div>' +
    '        </div>' +
    '      </div>' +
    '      <div class="danger-countdown-box">' +
    '        <div class="countdown-header">' +
    '          <div class="countdown-title">' +
    '            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke' +
    '-width="2.5" stroke-linecap="round" stroke-linejoin="round">' +
    '              <circle cx="12" cy="12" r="10"></circle>' +
    '              <polyline points="12 6 12 12 16 14"></polyline>' +
    '            </svg>' +
    '            Prazo de Tolerancia de Acesso' +
    '          </div>' +
    '          <span class="countdown-pill">' + IntToStr(FDiasTolerancia) + ' DIA' + UpperCase(sPluralTolerancia) + ' RESTANTE' + UpperCase(sPluralTolerancia) + '</span>' +
    '        </div>' +
    '        <p class="countdown-msg">' +
    '          Identificamos parcela vencida ha <strong>' + IntToStr(FDiasAtraso) + ' dia' + sPluralAtraso +
    '</strong>. Conforme as diretrizes contratuais, apos <strong>5 dias</strong> de atraso o sistema entr' +
    'ara em <strong>bloqueio operacional automatico</strong>.' +
    '        </p>' +
    '        <div class="progress-bar-container">' +
    '          <div class="progress-bar-fill"></div>' +
    '        </div>' +
    '        <div class="progress-legend">' +
    '          <span>Dia 1</span>' +
    '          <span>Hoje (Dia ' + IntToStr(FDiasAtraso) + ')</span>' +
    '          <span>Bloqueio (Dia 5)</span>' +
    '        </div>' +
    '      </div>' +
    '      <div class="contact-bar">' +
    '        <div class="contact-bar-text">' +
    '          Duvidas ou envio de comprovante: <span>Setor Financeiro</span>' +
    '        </div>' +
    '        <a href="https://wa.me/5518997344798?text=Ola,%20sou%20o%20Master%20e%20gostaria%20de%20info' +
    'rmacoes%20sobre%20a%20mensalidade%20pendente." target="_blank" class="btn-wpp-link">' +
    '          <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor">' +
    '            <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.89' +
    '1 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338' +
    ' 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591' +
    ' 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.' +
    '889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.198' +
    '-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165-.' +
    '173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297' +
    '-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.075' +
    '-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1.0' +
    '16-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.712' +
    '.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/>' +
    '          </svg>' +
    '          WhatsApp Financeiro' +
    '        </a>' +
    '      </div>' +
    '    </div>' +
    '    <div class="modal-footer">' +
    '      <button type="button" class="btn-estou-ciente" onclick="try{ajaxRequest(' + sJsTarget + ',''_confirmar_ciente'',[]);}catch(e){}">' +
    '        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-wid' +
    'th="2.5" stroke-linecap="round" stroke-linejoin="round">' +
    '          <polyline points="20 6 9 17 4 12"></polyline>' +
    '        </svg>' +
    '        Estou Ciente' +
    '      </button>' +
    '    </div>' +
    '  </div>' +
    '</body>' +
    '</html>' ;
end;

end.
