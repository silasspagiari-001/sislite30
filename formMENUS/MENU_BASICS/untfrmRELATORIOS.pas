unit untfrmRELATORIOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl, uniEdit, UniButtonEdit, uniDateTimePicker, uniLabel,
  uniMultiItem, uniComboBox, uniCheckBox;

type
  TfrmRELATORIOS = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniPageControl: TUniPageControl;
    UniTabSheetvendas: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchDATAINIVEN: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    edSearchDATAFINVEN: TUniDateTimePicker;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edSearchPESSOAINIVEN: TUniButtonEdit;
    UniLabel3: TUniLabel;
    edSearchPESSOAFINVEN: TUniButtonEdit;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniLabelFd1: TUniLabel;
    cbxordem: TUniComboBox;
    cbxstatus: TUniComboBox;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    rcBlock110: TUniContainerPanel;
    UniCheckBoxVENDAS: TUniCheckBox;
    UniCheckBoxDEVOLUCAO: TUniCheckBox;
    UniCheckBoxVENDASEF: TUniCheckBox;
    UniCheckBoxBONIFICACAO: TUniCheckBox;
    UniCheckBoxTROCA: TUniCheckBox;
    UniCheckBoxOUTROS: TUniCheckBox;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure edSearchPESSOAINIVENButtonClick(Sender: TObject);
    procedure edSearchPESSOAFINVENButtonClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchDATAINIVENExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Ativa_page(Const F_CADASTROS:String; F_PAGINAS:array of String);

  end;

function frmRELATORIOS: TfrmRELATORIOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web, mkm_funcoes, untDM_RC,
  mkm_layout, untFrmPesquisa, mkm_impressao, unReportImpressao, mkm_relatorios,
  System.DateUtils;
function frmRELATORIOS: TfrmRELATORIOS;
begin
  Result := TfrmRELATORIOS(mm.GetFormInstance(TfrmRELATORIOS));
end;

procedure TfrmRELATORIOS.Ativa_page(const F_CADASTROS: String;F_PAGINAS: array of String);
var
 x,R : Integer;
begin
  for R := 0 to ComponentCount - 1 do
    if (Components[R] is TUniTabSheet ) then
      begin
        if Busca_Array(Copy((Components[R] as TUniTabSheet).Name,11,12),F_PAGINAS) then
          begin
             if (Components[R] as TUniTabSheet).TabVisible = False then
               (Components[R] as TUniTabSheet).TabVisible := True;
          end
        else
          (Components[R] as TUniTabSheet).TabVisible := False;
      end;

  for R:=0 to High(F_PAGINAS) do
    begin
      if 'VENNOTAEMITIDA'              = F_PAGINAS[R] then UniTabSheetvendas.TabVisible              := True;
    end;

  if F_CADASTROS = 'VENNOTAEMITIDA'               then UniPageControl.ActivePage := UniTabSheetvendas         else

end;

procedure TfrmRELATORIOS.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_VENDASPERIODO(mm.varI_Code_Company,
                                  edSearchDATAINIVEN.Text,
                                  edSearchDATAFINVEN.text,
                                  edSearchPESSOAINIVEN.Text,
                                  edSearchPESSOAFINVEN.Text,
                                  IntToStr(cbxtipo.ItemIndex),
                                  IntToStr(cbxordem.ItemIndex),
                                  IntToStr(cbxstatus.ItemIndex),
                                  variif(UniCheckBoxVENDAS.Checked      = True,'T','F'),
                                  variif(UniCheckBoxDEVOLUCAO.Checked   = True,'T','F'),
                                  variif(UniCheckBoxVENDASEF.Checked    = True,'T','F'),
                                  variif(UniCheckBoxBONIFICACAO.Checked = True,'T','F'),
                                  variif(UniCheckBoxTROCA.Checked       = True,'T','F'),
                                  variif(UniCheckBoxTROCA.Checked       = True,'T','F'));

  mm.varC_caminhopdf :=  RELATORIO_Vendasporperiodo(
                         MM.varI_Code_Company,
                         psql,
                         edSearchDATAINIVEN.Text,
                         edSearchDATAFINVEN.text,
                         IntToStr(cbxstatus.ItemIndex));

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIOS.edSearchDATAINIVENExit(Sender: TObject);
begin
  edSearchDATAFINVEN.DateTime   := EndofTheMonth(edSearchDATAINIVEN.DateTime);
end;

procedure TfrmRELATORIOS.edSearchPESSOAFINVENButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchPESSOAFINVEN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIOS.edSearchPESSOAINIVENButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchPESSOAINIVEN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;
procedure TfrmRELATORIOS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIOS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmRELATORIOS.UniFormShow(Sender: TObject);
begin
  frmRELATORIOS.Caption := 'Relatório de Vendas';

  edSearchDATAINIVEN.DateTime         := StartofTheMonth(date);
  edSearchDATAFINVEN.DateTime         := Date;

  cbxtipo.ItemIndex     := 0;
  cbxordem.ItemIndex    := 0;
  cbxstatus.ItemIndex   := 0;

  UniCheckBoxVENDAS.Checked    := True;
  UniCheckBoxDEVOLUCAO.Checked := True;
end;

Initialization
   RegisterClass( TfrmRELATORIOS );
end.
