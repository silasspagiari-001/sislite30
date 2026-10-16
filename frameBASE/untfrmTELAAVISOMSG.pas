unit untfrmTELAAVISOMSG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniButton, uniBitBtn, uniLabel, uniHTMLFrame, uMsgInfo;

type
  TfrmTELAAVISOMSG = class(TUniForm)
    paContainer: TUniContainerPanel;
    paHeader: TUniContainerPanel;
    labBadge: TUniLabel;
    UniLabeltitulo: TUniLabel;
    paBody: TUniContainerPanel;
    htmlCorpo: TUniHTMLFrame;
    paFooter: TUniContainerPanel;
    btnConfirmar: TUniBitBtn;
    btnFechar: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FCodigoMsg: Integer;
    FModoConsulta: Boolean;
    function FormatarCorpoHTML(const ATitulo, ACorpo, AImagem, APrioridade, AData: string): string;
  public
    { Public declarations }
    procedure CarregaMensagem(AMsg: TMsgInfo; AModoConsulta: Boolean = False);
  end;

function frmTELAAVISOMSG: TfrmTELAAVISOMSG;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures;

function frmTELAAVISOMSG: TfrmTELAAVISOMSG;
begin
  Result := TfrmTELAAVISOMSG(mm.GetFormInstance(TfrmTELAAVISOMSG));
end;

function TfrmTELAAVISOMSG.FormatarCorpoHTML(const ATitulo, ACorpo, AImagem, APrioridade, AData: string): string;
var
  sHtml, sImgHtml, sCorpoFormatado, sBadgeBg, sBadgeColor, sBadgeBorder: string;
  sImgUrl, sBaseApi: string;
begin
  sCorpoFormatado := StringReplace(ACorpo, #13#10, '<br>', [rfReplaceAll]);
  sCorpoFormatado := StringReplace(sCorpoFormatado, #10, '<br>', [rfReplaceAll]);

  if UpperCase(APrioridade) = 'URGENTE' then
  begin
    sBadgeBg := '#fef2f2';
    sBadgeColor := '#b91c1c';
    sBadgeBorder := '#fecaca';
  end
  else if (UpperCase(APrioridade) = 'DESTAQUE') or (UpperCase(APrioridade) = 'IMPORTANTE') then
  begin
    sBadgeBg := '#fffbeb';
    sBadgeColor := '#b45309';
    sBadgeBorder := '#fde68a';
  end
  else
  begin
    sBadgeBg := '#ecfdf5';
    sBadgeColor := '#065f46';
    sBadgeBorder := '#a7f3d0';
  end;

  sImgHtml := '';
  if Trim(AImagem) <> '' then
  begin
    sImgUrl := Trim(AImagem);
    if (Pos('http://', LowerCase(sImgUrl)) = 0) and (Pos('https://', LowerCase(sImgUrl)) = 0) then
    begin
      sBaseApi := Caminho('HTTPGETFINANCEIRO=');
      if (Copy(sBaseApi, Length(sBaseApi), 1) = '/') and (Copy(sImgUrl, 1, 1) = '/') then
        Delete(sImgUrl, 1, 1)
      else if (Copy(sBaseApi, Length(sBaseApi), 1) <> '/') and (Copy(sImgUrl, 1, 1) <> '/') and (sBaseApi <> '') then
        sBaseApi := sBaseApi + '/';
      sImgUrl := sBaseApi + sImgUrl;
    end;

    sImgHtml :=
      '<div style="text-align:center; margin-bottom:18px; border-radius:12px; overflow:hidden;' +
      ' box-shadow:0 6px 18px rgba(0,0,0,0.08); border:1px solid #e2e8f0;">' +
      '  <img src="' + sImgUrl + '" style="width:100%; max-height:260px; object-fit:cover; display:block;" onerror="this.parentElement.style.display=''none'';" />' +
      '</div>';
  end;

  sHtml :=
    '<style>' +
    '  @import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap");' +
    '  body, html {' +
    '    margin: 0; padding: 0;' +
    '    font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;' +
    '    background: #ffffff; color: #1e293b; overflow-x: hidden;' +
    '  }' +
    '  .msg-container {' +
    '    padding: 16px 20px;' +
    '    background: #ffffff;' +
    '  }' +
    '  .msg-meta-bar {' +
    '    display: flex; justify-content: space-between; align-items: center;' +
    '    margin-bottom: 14px; padding-bottom: 10px;' +
    '    border-bottom: 1px solid #f1f5f9;' +
    '  }' +
    '  .badge-prio {' +
    '    background: ' + sBadgeBg + ';' +
    '    color: ' + sBadgeColor + ';' +
    '    border: 1px solid ' + sBadgeBorder + ';' +
    '    font-weight: 800; padding: 4px 12px; border-radius: 14px;' +
    '    font-size: 10.5px; text-transform: uppercase; letter-spacing: 0.5px;' +
    '    display: inline-flex; align-items: center; gap: 5px;' +
    '  }' +
    '  .date-text {' +
    '    font-size: 11.5px; color: #64748b; font-weight: 600;' +
    '    display: flex; align-items: center; gap: 4px;' +
    '  }' +
    '  .msg-title {' +
    '    font-size: 18px; font-weight: 800; color: #0f172a;' +
    '    margin-bottom: 14px; line-height: 1.35; letter-spacing: -0.2px;' +
    '  }' +
    '  .msg-body-text {' +
    '    font-size: 13.5px; line-height: 1.7; color: #334155;' +
    '    margin-bottom: 16px;' +
    '  }' +
    '  .msg-callout-box {' +
    '    background: #f0fdf4; border: 1px solid #bbf7d0; border-left: 4px solid #10b981;' +
    '    padding: 12px 16px; border-radius: 8px;' +
    '    margin-top: 18px; font-size: 12px; color: #166534; font-weight: 600;' +
    '    display: flex; align-items: center; gap: 8px;' +
    '  }' +
    '</style>' +
    '<div class="msg-container">' +
    '  <div class="msg-meta-bar">' +
    '    <span class="badge-prio">&#9679; ' + APrioridade + '</span>' +
    '    <span class="date-text">&#128197; ' + AData + '</span>' +
    '  </div>' +
    sImgHtml +
    '  <div class="msg-body-text">' + sCorpoFormatado + '</div>' +
    '  <div class="msg-callout-box">' +
    '    <span>&#128236; <b>Nota:</b> Este comunicado fica salvo na sua <b>Caixa de Entrada (Sininho)</b>' +     ' para releitura.</span>' +
    '  </div>' +
    '</div>';

  Result := sHtml;
end;

procedure TfrmTELAAVISOMSG.CarregaMensagem(AMsg: TMsgInfo; AModoConsulta: Boolean);
var
  sData, sPrio: string;
begin
  if AMsg = nil then Exit;

  FCodigoMsg := AMsg.Codigo;
  FModoConsulta := AModoConsulta;

  UniLabeltitulo.TextConversion := txtHTML;
  UniLabeltitulo.Caption := AMsg.Titulo;

  sData := AMsg.DataInicio;
  if sData = '' then sData := DateToStr(Date);

  sPrio := AMsg.Prioridade;
  if sPrio = '' then sPrio := 'COMUNICADO';

  labBadge.Caption := ' ' + sPrio + ' ';

  htmlCorpo.HTML.Text := FormatarCorpoHTML(AMsg.Titulo, AMsg.Corpo, AMsg.ImagemUrl, sPrio, sData);

  if FModoConsulta then
  begin
    btnConfirmar.Caption := 'Fechar';
    btnFechar.Visible := False;
  end
  else
  begin
    btnConfirmar.Caption := #10004 + ' Confirmar Leitura / Estou Ciente';
    btnFechar.Visible := True;
  end;
end;

procedure TfrmTELAAVISOMSG.btnConfirmarClick(Sender: TObject);
var
  sIdContrato: string;
begin
  if not FModoConsulta then
  begin
    if (FCodigoMsg > 0) and (mm.vMensagensLidas <> nil) then
    begin
      if mm.vMensagensLidas.IndexOf(IntToStr(FCodigoMsg)) = -1 then
        mm.vMensagensLidas.Add(IntToStr(FCodigoMsg));
    end;

    if mm.vUltimoAvisoMsg <> nil then
      mm.vUltimoAvisoMsg.Lido := True;

    try
      sIdContrato := mm.GetContratoAtivo;
      if Trim(sIdContrato) = '' then sIdContrato := mm.varC_Doc_Customer;
      ConfirmaLeituraMensagem(FCodigoMsg, sIdContrato, mm.vUserName);
    except
    end;
  end;

  ModalResult := mrOK;
end;

procedure TfrmTELAAVISOMSG.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTELAAVISOMSG.UniFormResize(Sender: TObject);
begin
  Self.Height := 580;
  Self.Width  := 740;
  Self.Position := poScreenCenter;
end;

procedure TfrmTELAAVISOMSG.UniFormShow(Sender: TObject);
begin
  UniFormResize(Sender);
end;

end.
