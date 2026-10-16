unit untFrmBLOQUEIOSISTEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniHTMLFrame;

type
  TfrmBLOQUEIOSISTEMA = class(TUniForm)
    htmlBloqueio: TUniHTMLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function GerarHTMLBloqueio: string;
  public
    { Public declarations }
    cFormModal: TUniForm;
  end;

function frmBLOQUEIOSISTEMA: TfrmBLOQUEIOSISTEMA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmBLOQUEIOSISTEMA: TfrmBLOQUEIOSISTEMA;
begin
  Result := TfrmBLOQUEIOSISTEMA(mm.GetFormInstance(TfrmBLOQUEIOSISTEMA));
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormCreate(Sender: TObject);
begin
  Self.BorderStyle := bsNone;
  htmlBloqueio.HTML.Text := GerarHTMLBloqueio;
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Impede fechamento por ESC ou qualquer tecla de saida
  if Key = VK_ESCAPE then
    Key := 0;
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormResize(Sender: TObject);
begin
  frmBLOQUEIOSISTEMA.WindowState := wsMaximized;
end;

procedure TfrmBLOQUEIOSISTEMA.UniFormShow(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
  Self.WindowState := wsMaximized;
  htmlBloqueio.HTML.Text := GerarHTMLBloqueio;
end;

function TfrmBLOQUEIOSISTEMA.GerarHTMLBloqueio: string;
var
  sArquivo: string;
  sl: TStringList;
begin
  sArquivo := ExtractFilePath(ParamStr(0)) + 'files' + PathDelim + 'modelo_bloqueio_sistema.html';
  if not FileExists(sArquivo) then
    sArquivo := ExtractFilePath(ParamStr(0)) + 'modelo_bloqueio_sistema.html';

  if FileExists(sArquivo) then
  begin
    sl := TStringList.Create;
    try
      try
        sl.LoadFromFile(sArquivo, TEncoding.UTF8);
        Result := sl.Text;
        Exit;
      except
      end;
    finally
      sl.Free;
    end;
  end;

  // Fallback embutido caso o arquivo fisico nao seja encontrado
  Result := 
    '<!DOCTYPE html>' + sLineBreak +
    '<html lang="pt-BR">' + sLineBreak +
    '<head>' + sLineBreak +
    '  <meta charset="UTF-8">' + sLineBreak +
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' + sLineBreak +
    '  <title>Sistema Bloqueado - Aviso de Segurança</title>' + sLineBreak +
    '  <link rel="preconnect" href="https://fonts.googleapis.com">' + sLineBreak +
    '  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' + sLineBreak +
    '  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800;900&fa' + sLineBreak +
    'mily=JetBrains+Mono:wght@500;700&display=swap" rel="stylesheet">' + sLineBreak +
    '  <style>' + sLineBreak +
    '    :root {' + sLineBreak +
    '      --primary-red: #ef4444;' + sLineBreak +
    '      --deep-red: #b91c1c;' + sLineBreak +
    '      --dark-crimson: #7f1d1d;' + sLineBreak +
    '      --bg-dark: #0a0b10;' + sLineBreak +
    '      --card-bg: rgba(18, 16, 26, 0.88);' + sLineBreak +
    '      --card-border: rgba(239, 68, 68, 0.35);' + sLineBreak +
    '      --text-main: #f8fafc;' + sLineBreak +
    '      --text-muted: #94a3b8;' + sLineBreak +
    '      --whatsapp-color: #22c55e;' + sLineBreak +
    '      --whatsapp-glow: rgba(34, 197, 94, 0.3);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    * {' + sLineBreak +
    '      box-sizing: border-box;' + sLineBreak +
    '      margin: 0;' + sLineBreak +
    '      padding: 0;' + sLineBreak +
    '      user-select: none;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    body, html {' + sLineBreak +
    '      width: 100% !important;' + sLineBreak +
    '      height: 100% !important;' + sLineBreak +
    '      min-height: 100vh !important;' + sLineBreak +
    '      margin: 0 !important;' + sLineBreak +
    '      padding: 0 !important;' + sLineBreak +
    '      overflow: hidden !important;' + sLineBreak +
    '      font-family: ''Plus Jakarta Sans'', -apple-system, BlinkMacSystemFont, sans-serif;' + sLineBreak +
    '      background-color: var(--bg-dark);' + sLineBreak +
    '      color: var(--text-main);' + sLineBreak +
    '      display: flex !important;' + sLineBreak +
    '      align-items: center !important;' + sLineBreak +
    '      justify-content: center !important;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Fundo com Malha Cibernética e Alarme Pulsante */' + sLineBreak +
    '    .emergency-backdrop {' + sLineBreak +
    '      position: fixed;' + sLineBreak +
    '      inset: 0;' + sLineBreak +
    '      background: ' + sLineBreak +
    '        radial-gradient(circle at 50% 50%, rgba(185, 28, 28, 0.22) 0%, rgba(10, 11, 16, 0.95) 75%),' + sLineBreak +
    '        repeating-linear-gradient(0deg, transparent, transparent 2px, rgba(0, 0, 0, 0.3) 2px, rgba(0' + sLineBreak +
    ', 0, 0, 0.3) 4px);' + sLineBreak +
    '      z-index: 1;' + sLineBreak +
    '      pointer-events: none;' + sLineBreak +
    '      animation: alertAmbient 3.5s ease-in-out infinite alternate;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes alertAmbient {' + sLineBreak +
    '      0% {' + sLineBreak +
    '        background-color: #08080d;' + sLineBreak +
    '        filter: brightness(0.95);' + sLineBreak +
    '      }' + sLineBreak +
    '      100% {' + sLineBreak +
    '        background-color: #12070a;' + sLineBreak +
    '        filter: brightness(1.15);' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Faixas de Alerta (Hazard Tape) Animadas no Topo e Base */' + sLineBreak +
    '    .hazard-stripe-top, .hazard-stripe-bottom {' + sLineBreak +
    '      position: fixed;' + sLineBreak +
    '      left: 0;' + sLineBreak +
    '      right: 0;' + sLineBreak +
    '      height: 10px;' + sLineBreak +
    '      z-index: 10;' + sLineBreak +
    '      background: repeating-linear-gradient(' + sLineBreak +
    '        -45deg,' + sLineBreak +
    '        #dc2626,' + sLineBreak +
    '        #dc2626 14px,' + sLineBreak +
    '        #1e1b24 14px,' + sLineBreak +
    '        #1e1b24 28px' + sLineBreak +
    '      );' + sLineBreak +
    '      box-shadow: 0 0 15px rgba(220, 38, 38, 0.6);' + sLineBreak +
    '      animation: hazardMove 20s linear infinite;' + sLineBreak +
    '    }' + sLineBreak +
    '    .hazard-stripe-top { top: 0; }' + sLineBreak +
    '    .hazard-stripe-bottom { bottom: 0; }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes hazardMove {' + sLineBreak +
    '      from { background-position: 0 0; }' + sLineBreak +
    '      to { background-position: 500px 0; }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Viewport de Centralização Absoluta para qualquer navegador / UniGUI */' + sLineBreak +
    '    .lockout-viewport-center {' + sLineBreak +
    '      position: fixed !important;' + sLineBreak +
    '      inset: 0 !important;' + sLineBreak +
    '      top: 0 !important;' + sLineBreak +
    '      left: 0 !important;' + sLineBreak +
    '      right: 0 !important;' + sLineBreak +
    '      bottom: 0 !important;' + sLineBreak +
    '      width: 100vw !important;' + sLineBreak +
    '      height: 100vh !important;' + sLineBreak +
    '      display: flex !important;' + sLineBreak +
    '      flex-direction: column !important;' + sLineBreak +
    '      align-items: center !important;' + sLineBreak +
    '      justify-content: center !important;' + sLineBreak +
    '      z-index: 15 !important;' + sLineBreak +
    '      padding: 24px !important;' + sLineBreak +
    '      box-sizing: border-box !important;' + sLineBreak +
    '      pointer-events: none !important;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Container Principal Centralizado */' + sLineBreak +
    '    .lockout-wrapper {' + sLineBreak +
    '      position: relative !important;' + sLineBreak +
    '      z-index: 20 !important;' + sLineBreak +
    '      width: 100% !important;' + sLineBreak +
    '      max-width: 660px !important;' + sLineBreak +
    '      margin: 0 auto !important;' + sLineBreak +
    '      pointer-events: auto !important;' + sLineBreak +
    '      animation: modalDropIn 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards !important;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes modalDropIn {' + sLineBreak +
    '      0% {' + sLineBreak +
    '        opacity: 0;' + sLineBreak +
    '        transform: scale(0.85) translateY(25px);' + sLineBreak +
    '      }' + sLineBreak +
    '      100% {' + sLineBreak +
    '        opacity: 1;' + sLineBreak +
    '        transform: scale(1) translateY(0);' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Card de Bloqueio com Vidro Fumê e Brilho Vermelho */' + sLineBreak +
    '    .lockout-card {' + sLineBreak +
    '      background: var(--card-bg);' + sLineBreak +
    '      backdrop-filter: blur(20px);' + sLineBreak +
    '      -webkit-backdrop-filter: blur(20px);' + sLineBreak +
    '      border: 1.5px solid var(--card-border);' + sLineBreak +
    '      border-radius: 24px;' + sLineBreak +
    '      box-shadow: ' + sLineBreak +
    '        0 0 0 1px rgba(255, 255, 255, 0.05) inset,' + sLineBreak +
    '        0 25px 60px -10px rgba(0, 0, 0, 0.85),' + sLineBreak +
    '        0 0 45px rgba(220, 38, 38, 0.28);' + sLineBreak +
    '      overflow: hidden;' + sLineBreak +
    '      position: relative;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Linha de Led Pulsante no Topo do Card */' + sLineBreak +
    '    .neon-beacon-bar {' + sLineBreak +
    '      height: 5px;' + sLineBreak +
    '      width: 100%;' + sLineBreak +
    '      background: linear-gradient(90deg, #991b1b, #ef4444, #f87171, #ef4444, #991b1b);' + sLineBreak +
    '      background-size: 200% 100%;' + sLineBreak +
    '      animation: neonFlow 2.8s linear infinite;' + sLineBreak +
    '      box-shadow: 0 0 16px rgba(239, 68, 68, 0.9);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes neonFlow {' + sLineBreak +
    '      0% { background-position: 0% 50%; }' + sLineBreak +
    '      100% { background-position: 200% 50%; }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .card-content {' + sLineBreak +
    '      padding: 38px 36px 32px 36px;' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      flex-direction: column;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      text-align: center;' + sLineBreak +
    '      position: relative;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* ÍCONE DE INTERROGAÇÃO ALARMANTE COM EFEITO DE SONAR / RIPPLE */' + sLineBreak +
    '    .question-beacon-container {' + sLineBreak +
    '      position: relative;' + sLineBreak +
    '      width: 110px;' + sLineBreak +
    '      height: 110px;' + sLineBreak +
    '      margin-bottom: 24px;' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      justify-content: center;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Ondas de choque pulsantes ao redor do ícone */' + sLineBreak +
    '    .sonar-wave {' + sLineBreak +
    '      position: absolute;' + sLineBreak +
    '      inset: -12px;' + sLineBreak +
    '      border-radius: 50%;' + sLineBreak +
    '      border: 2px solid rgba(239, 68, 68, 0.6);' + sLineBreak +
    '      animation: sonarPulse 2s cubic-bezier(0, 0.2, 0.8, 1) infinite;' + sLineBreak +
    '      opacity: 0;' + sLineBreak +
    '    }' + sLineBreak +
    '    .sonar-wave.delay-1 {' + sLineBreak +
    '      animation-delay: 0.65s;' + sLineBreak +
    '    }' + sLineBreak +
    '    .sonar-wave.delay-2 {' + sLineBreak +
    '      animation-delay: 1.3s;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes sonarPulse {' + sLineBreak +
    '      0% {' + sLineBreak +
    '        transform: scale(0.65);' + sLineBreak +
    '        opacity: 0.9;' + sLineBreak +
    '        border-color: rgba(239, 68, 68, 0.9);' + sLineBreak +
    '      }' + sLineBreak +
    '      50% {' + sLineBreak +
    '        opacity: 0.45;' + sLineBreak +
    '      }' + sLineBreak +
    '      100% {' + sLineBreak +
    '        transform: scale(1.65);' + sLineBreak +
    '        opacity: 0;' + sLineBreak +
    '        border-color: rgba(220, 38, 38, 0);' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .beacon-circle {' + sLineBreak +
    '      width: 95px;' + sLineBreak +
    '      height: 95px;' + sLineBreak +
    '      border-radius: 50%;' + sLineBreak +
    '      background: radial-gradient(circle at 35% 30%, #ef4444 0%, #b91c1c 55%, #450a0a 100%);' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      justify-content: center;' + sLineBreak +
    '      box-shadow: ' + sLineBreak +
    '        0 0 28px rgba(239, 68, 68, 0.75),' + sLineBreak +
    '        0 10px 25px rgba(0, 0, 0, 0.6);' + sLineBreak +
    '      border: 3px solid #fecaca;' + sLineBreak +
    '      animation: beaconFloat 3s ease-in-out infinite alternate;' + sLineBreak +
    '      position: relative;' + sLineBreak +
    '      z-index: 2;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes beaconFloat {' + sLineBreak +
    '      0% {' + sLineBreak +
    '        transform: translateY(0) scale(1);' + sLineBreak +
    '        box-shadow: 0 0 24px rgba(239, 68, 68, 0.6);' + sLineBreak +
    '      }' + sLineBreak +
    '      100% {' + sLineBreak +
    '        transform: translateY(-4px) scale(1.03);' + sLineBreak +
    '        box-shadow: 0 0 38px rgba(239, 68, 68, 0.95);' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .question-mark-glyph {' + sLineBreak +
    '      font-size: 58px;' + sLineBreak +
    '      font-weight: 900;' + sLineBreak +
    '      color: #ffffff;' + sLineBreak +
    '      line-height: 1;' + sLineBreak +
    '      text-shadow: ' + sLineBreak +
    '        0 2px 8px rgba(0, 0, 0, 0.7),' + sLineBreak +
    '        0 0 16px rgba(255, 255, 255, 0.6);' + sLineBreak +
    '      transform: translateY(-2px);' + sLineBreak +
    '      letter-spacing: -1px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* BADGE DE SEGURANÇA SUPERIOR */' + sLineBreak +
    '    .status-pill {' + sLineBreak +
    '      display: inline-flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      gap: 7px;' + sLineBreak +
    '      background: rgba(239, 68, 68, 0.15);' + sLineBreak +
    '      border: 1px solid rgba(239, 68, 68, 0.45);' + sLineBreak +
    '      padding: 5px 14px;' + sLineBreak +
    '      border-radius: 20px;' + sLineBreak +
    '      font-size: 11px;' + sLineBreak +
    '      font-weight: 800;' + sLineBreak +
    '      letter-spacing: 0.8px;' + sLineBreak +
    '      text-transform: uppercase;' + sLineBreak +
    '      color: #fca5a5;' + sLineBreak +
    '      margin-bottom: 14px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .status-dot-blink {' + sLineBreak +
    '      width: 7px;' + sLineBreak +
    '      height: 7px;' + sLineBreak +
    '      border-radius: 50%;' + sLineBreak +
    '      background: #ef4444;' + sLineBreak +
    '      box-shadow: 0 0 8px #ef4444;' + sLineBreak +
    '      animation: blinkDot 1s ease-in-out infinite;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    @keyframes blinkDot {' + sLineBreak +
    '      0%, 100% { opacity: 1; transform: scale(1); }' + sLineBreak +
    '      50% { opacity: 0.3; transform: scale(0.7); }' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* TÍTULO E SUBTÍTULO ALARMOSOS */' + sLineBreak +
    '    .lockout-title {' + sLineBreak +
    '      font-size: 30px;' + sLineBreak +
    '      font-weight: 900;' + sLineBreak +
    '      letter-spacing: -0.5px;' + sLineBreak +
    '      color: #ffffff;' + sLineBreak +
    '      margin-bottom: 8px;' + sLineBreak +
    '      text-transform: uppercase;' + sLineBreak +
    '      line-height: 1.15;' + sLineBreak +
    '      background: linear-gradient(135deg, #ffffff 30%, #fca5a5 70%, #ef4444 100%);' + sLineBreak +
    '      -webkit-background-clip: text;' + sLineBreak +
    '      -webkit-text-fill-color: transparent;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .lockout-subtitle {' + sLineBreak +
    '      font-size: 15px;' + sLineBreak +
    '      font-weight: 700;' + sLineBreak +
    '      color: #f87171;' + sLineBreak +
    '      margin-bottom: 18px;' + sLineBreak +
    '      text-transform: uppercase;' + sLineBreak +
    '      letter-spacing: 0.4px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .lockout-description {' + sLineBreak +
    '      font-size: 13.5px;' + sLineBreak +
    '      line-height: 1.6;' + sLineBreak +
    '      color: var(--text-muted);' + sLineBreak +
    '      max-width: 520px;' + sLineBreak +
    '      margin-bottom: 26px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .lockout-description strong {' + sLineBreak +
    '      color: #f1f5f9;' + sLineBreak +
    '      font-weight: 700;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* CARD DE CONTATO COM O FINANCEIRO */' + sLineBreak +
    '    .contact-card-box {' + sLineBreak +
    '      width: 100%;' + sLineBreak +
    '      background: rgba(15, 23, 42, 0.7);' + sLineBreak +
    '      border: 1px solid rgba(148, 163, 184, 0.15);' + sLineBreak +
    '      border-radius: 18px;' + sLineBreak +
    '      padding: 20px 22px;' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      flex-direction: column;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      gap: 14px;' + sLineBreak +
    '      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.35);' + sLineBreak +
    '      position: relative;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .contact-label-row {' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      gap: 8px;' + sLineBreak +
    '      font-size: 12px;' + sLineBreak +
    '      font-weight: 700;' + sLineBreak +
    '      color: #94a3b8;' + sLineBreak +
    '      text-transform: uppercase;' + sLineBreak +
    '      letter-spacing: 0.5px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* BOTÃO DO WHATSAPP DO SUPORTE FINANCEIRO */' + sLineBreak +
    '    .whatsapp-action-btn {' + sLineBreak +
    '      display: inline-flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      justify-content: center;' + sLineBreak +
    '      gap: 12px;' + sLineBreak +
    '      background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%);' + sLineBreak +
    '      color: #ffffff;' + sLineBreak +
    '      text-decoration: none;' + sLineBreak +
    '      padding: 13px 26px;' + sLineBreak +
    '      border-radius: 12px;' + sLineBreak +
    '      font-size: 15px;' + sLineBreak +
    '      font-weight: 800;' + sLineBreak +
    '      letter-spacing: 0.3px;' + sLineBreak +
    '      box-shadow: ' + sLineBreak +
    '        0 4px 15px rgba(34, 197, 94, 0.4),' + sLineBreak +
    '        0 0 0 1px rgba(255, 255, 255, 0.2) inset;' + sLineBreak +
    '      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);' + sLineBreak +
    '      cursor: pointer;' + sLineBreak +
    '      width: 100%;' + sLineBreak +
    '      max-width: 440px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .whatsapp-action-btn:hover {' + sLineBreak +
    '      background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);' + sLineBreak +
    '      transform: translateY(-2px);' + sLineBreak +
    '      box-shadow: ' + sLineBreak +
    '        0 8px 24px rgba(34, 197, 94, 0.55),' + sLineBreak +
    '        0 0 0 1px rgba(255, 255, 255, 0.35) inset;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .whatsapp-action-btn svg {' + sLineBreak +
    '      width: 22px;' + sLineBreak +
    '      height: 22px;' + sLineBreak +
    '      fill: currentColor;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .contact-instruction {' + sLineBreak +
    '      font-size: 12px;' + sLineBreak +
    '      font-weight: 600;' + sLineBreak +
    '      color: #cbd5e1;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .contact-instruction span {' + sLineBreak +
    '      background: rgba(239, 68, 68, 0.2);' + sLineBreak +
    '      color: #fca5a5;' + sLineBreak +
    '      padding: 2px 7px;' + sLineBreak +
    '      border-radius: 6px;' + sLineBreak +
    '      font-weight: 800;' + sLineBreak +
    '      border: 1px solid rgba(239, 68, 68, 0.35);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* RODAPÉ DO CARD COM METADADOS DO TERMINAL */' + sLineBreak +
    '    .lockout-footer {' + sLineBreak +
    '      width: 100%;' + sLineBreak +
    '      margin-top: 22px;' + sLineBreak +
    '      padding-top: 16px;' + sLineBreak +
    '      border-top: 1px solid rgba(255, 255, 255, 0.08);' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      justify-content: space-between;' + sLineBreak +
    '      font-size: 11px;' + sLineBreak +
    '      color: #64748b;' + sLineBreak +
    '      font-family: ''JetBrains Mono'', monospace;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .terminal-tag {' + sLineBreak +
    '      display: flex;' + sLineBreak +
    '      align-items: center;' + sLineBreak +
    '      gap: 6px;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    .clock-live {' + sLineBreak +
    '      color: #94a3b8;' + sLineBreak +
    '      font-weight: 700;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    /* Alerta Inferior Fixo de Proibição */' + sLineBreak +
    '    .prohibition-notice {' + sLineBreak +
    '      position: fixed !important;' + sLineBreak +
    '      bottom: 22px !important;' + sLineBreak +
    '      left: 50% !important;' + sLineBreak +
    '      transform: translateX(-50%) !important;' + sLineBreak +
    '      margin: 0 auto !important;' + sLineBreak +
    '      z-index: 30 !important;' + sLineBreak +
    '      font-size: 11px !important;' + sLineBreak +
    '      font-weight: 700 !important;' + sLineBreak +
    '      color: #f87171 !important;' + sLineBreak +
    '      text-transform: uppercase !important;' + sLineBreak +
    '      letter-spacing: 0.9px !important;' + sLineBreak +
    '      display: flex !important;' + sLineBreak +
    '      align-items: center !important;' + sLineBreak +
    '      justify-content: center !important;' + sLineBreak +
    '      gap: 6px !important;' + sLineBreak +
    '      opacity: 0.85 !important;' + sLineBreak +
    '      white-space: nowrap !important;' + sLineBreak +
    '      text-align: center !important;' + sLineBreak +
    '      pointer-events: none !important;' + sLineBreak +
    '    }' + sLineBreak +
    '  </style>' + sLineBreak +
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '' + sLineBreak +
    '  <!-- Fundo de Emergência Cibernética -->' + sLineBreak +
    '  <div class="emergency-backdrop"></div>' + sLineBreak +
    '' + sLineBreak +
    '  <!-- Faixas Hazard no Topo e Base -->' + sLineBreak +
    '  <div class="hazard-stripe-top"></div>' + sLineBreak +
    '  <div class="hazard-stripe-bottom"></div>' + sLineBreak +
    '' + sLineBreak +
    '  <!-- Viewport de Centralização Absoluta -->' + sLineBreak +
    '  <div class="lockout-viewport-center">' + sLineBreak +
    '    <!-- Wrapper Principal da Janela -->' + sLineBreak +
    '    <main class="lockout-wrapper" role="alertdialog" aria-modal="true" aria-labelledby="lockoutTitle' + sLineBreak +
    '">' + sLineBreak +
    '    <div class="lockout-card">' + sLineBreak +
    '      ' + sLineBreak +
    '      <!-- Linha Superior de Neon em Fluxo -->' + sLineBreak +
    '      <div class="neon-beacon-bar"></div>' + sLineBreak +
    '' + sLineBreak +
    '      <div class="card-content">' + sLineBreak +
    '        ' + sLineBreak +
    '        <!-- Pílula de Status de Bloqueio -->' + sLineBreak +
    '        <div class="status-pill">' + sLineBreak +
    '          <span class="status-dot-blink"></span>' + sLineBreak +
    '          Terminal Bloqueado &bull; Acesso Restrito' + sLineBreak +
    '        </div>' + sLineBreak +
    '' + sLineBreak +
    '        <!-- Ícone com Interrogação Alvoroçado e Ondas Sonar -->' + sLineBreak +
    '        <div class="question-beacon-container" aria-hidden="true">' + sLineBreak +
    '          <div class="sonar-wave"></div>' + sLineBreak +
    '          <div class="sonar-wave delay-1"></div>' + sLineBreak +
    '          <div class="sonar-wave delay-2"></div>' + sLineBreak +
    '          ' + sLineBreak +
    '          <div class="beacon-circle">' + sLineBreak +
    '            <span class="question-mark-glyph">?</span>' + sLineBreak +
    '          </div>' + sLineBreak +
    '        </div>' + sLineBreak +
    '' + sLineBreak +
    '        <!-- Títulos de Advertência -->' + sLineBreak +
    '        <h1 id="lockoutTitle" class="lockout-title">SISTEMA BLOQUEADO</h1>' + sLineBreak +
    '        <h2 class="lockout-subtitle">&#9888; Regularização Financeira Necessária</h2>' + sLineBreak +
    '' + sLineBreak +
    '        <!-- Descrição Alarmosa -->' + sLineBreak +
    '        <p class="lockout-description">' + sLineBreak +
    '          O acesso a todas as funcionalidades do sistema foi <strong>temporariamente interrompido</s' + sLineBreak +
    'trong> por pendência administrativa ou vencimento de contrato.<br>' + sLineBreak +
    '          Para restabelecer a operação, contate nosso setor responsável:' + sLineBreak +
    '        </p>' + sLineBreak +
    '' + sLineBreak +
    '        <!-- Caixa de Contato Rápido e WhatsApp -->' + sLineBreak +
    '        <section class="contact-card-box" aria-label="Informações de Contato">' + sLineBreak +
    '          <div class="contact-label-row">' + sLineBreak +
    '            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke' + sLineBreak +
    '-width="2.5" stroke-linecap="round" stroke-linejoin="round">' + sLineBreak +
    '              <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>' + sLineBreak +
    '              <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>' + sLineBreak +
    '              <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>' + sLineBreak +
    '            </svg>' + sLineBreak +
    '            <span>Central de Atendimento ao Cliente</span>' + sLineBreak +
    '          </div>' + sLineBreak +
    '' + sLineBreak +
    '          <!-- Botão WhatsApp com Ação Direta -->' + sLineBreak +
    '          <a href="https://wa.me/5518997344798?text=Ola,%20solicito%20atendimento%20para%20desbloque' + sLineBreak +
    'io%20do%20sistema%20no%20setor%20Financeiro." ' + sLineBreak +
    '             target="_blank" ' + sLineBreak +
    '             rel="noopener noreferrer"' + sLineBreak +
    '             class="whatsapp-action-btn"' + sLineBreak +
    '             id="btnWhatsappSuporte"' + sLineBreak +
    '             title="Falar no WhatsApp com o Financeiro">' + sLineBreak +
    '            <svg viewBox="0 0 24 24">' + sLineBreak +
    '              <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.' + sLineBreak +
    '891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.3' + sLineBreak +
    '38 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.5' + sLineBreak +
    '91 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-' + sLineBreak +
    '9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.1' + sLineBreak +
    '98-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165' + sLineBreak +
    '-.173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.2' + sLineBreak +
    '97-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.0' + sLineBreak +
    '75-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1' + sLineBreak +
    '.016-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.7' + sLineBreak +
    '12.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/>' + sLineBreak +
    '            </svg>' + sLineBreak +
    '            <span>(18) 99734-4798 &bull; WhatsApp</span>' + sLineBreak +
    '          </a>' + sLineBreak +
    '' + sLineBreak +
    '          <div class="contact-instruction">' + sLineBreak +
    '            Ao ligar ou enviar mensagem, selecione: <span>OPÇÃO 3 - FINANCEIRO</span>' + sLineBreak +
    '          </div>' + sLineBreak +
    '        </section>' + sLineBreak +
    '' + sLineBreak +
    '        <!-- Informações Técnicas do Terminal (Sem botão de fechar) -->' + sLineBreak +
    '        <footer class="lockout-footer">' + sLineBreak +
    '          <div class="terminal-tag">' + sLineBreak +
    '            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke' + sLineBreak +
    '-width="2.5" stroke-linecap="round" stroke-linejoin="round">' + sLineBreak +
    '              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>' + sLineBreak +
    '              <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>' + sLineBreak +
    '            </svg>' + sLineBreak +
    '            <span>STATUS: BLOQUEIO TOTAL ATIVO</span>' + sLineBreak +
    '          </div>' + sLineBreak +
    '          <div class="clock-live" id="clockElement">--:--:--</div>' + sLineBreak +
    '        </footer>' + sLineBreak +
    '' + sLineBreak +
    '      </div>' + sLineBreak +
    '    </div>' + sLineBreak +
    '  </main>' + sLineBreak +
    '  </div>' + sLineBreak +
    '' + sLineBreak +
    '  <!-- Aviso de Segurança Inferior -->' + sLineBreak +
    '  <aside class="prohibition-notice">' + sLineBreak +
    '    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="' + sLineBreak +
    '2.5" stroke-linecap="round" stroke-linejoin="round">' + sLineBreak +
    '      <circle cx="12" cy="12" r="10"></circle>' + sLineBreak +
    '      <line x1="4.93" y1="4.93" x2="19.07" y2="19.07"></line>' + sLineBreak +
    '    </svg>' + sLineBreak +
    '    <span>Operações suspensas até liberação pela administração</span>' + sLineBreak +
    '  </aside>' + sLineBreak +
    '' + sLineBreak +
    '  <script>' + sLineBreak +
    '    // Atualização em tempo real do relógio do terminal' + sLineBreak +
    '    function updateClock() {' + sLineBreak +
    '      const now = new Date();' + sLineBreak +
    '      const hours = String(now.getHours()).padStart(2, ''0'');' + sLineBreak +
    '      const minutes = String(now.getMinutes()).padStart(2, ''0'');' + sLineBreak +
    '      const seconds = String(now.getSeconds()).padStart(2, ''0'');' + sLineBreak +
    '      const clockEl = document.getElementById(''clockElement'');' + sLineBreak +
    '      if (clockEl) {' + sLineBreak +
    '        clockEl.textContent = `${hours}:${minutes}:${seconds}`;' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '    setInterval(updateClock, 1000);' + sLineBreak +
    '    updateClock();' + sLineBreak +
    '' + sLineBreak +
    '    // Bloqueio de teclas de escape ou atalhos para manter a tela fixa' + sLineBreak +
    '    window.addEventListener(''keydown'', function(e) {' + sLineBreak +
    '      if (e.key === ''Escape'' || e.keyCode === 27) {' + sLineBreak +
    '        e.preventDefault();' + sLineBreak +
    '      }' + sLineBreak +
    '    });' + sLineBreak +
    '  </script>' + sLineBreak +
    '</body>' + sLineBreak +
    '</html>' + sLineBreak ;
end;

end.
