unit untFrmRELATORIOQTDEPRODUTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniDateTimePicker,
  uniButton, uniBitBtn, uniLabel, uniEdit, UniButtonEdit, uniGUIBaseClasses,
  uniPanel;

type
  TFrmRELATORIOQTDEPRODUTO = class(TUniForm)
    UniContainerPanel2: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edSearchpessoasINI: TUniButtonEdit;
    UniLabelDtIni: TUniLabel;
    rcBlock20: TUniContainerPanel;
    edSearchpessoasFIN: TUniButtonEdit;
    UniLabel1: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel1: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniLabel3: TUniLabel;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edSearchpessoasINIButtonClick(Sender: TObject);
    procedure edSearchpessoasFINButtonClick(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmRELATORIOQTDEPRODUTO: TFrmRELATORIOQTDEPRODUTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, mkm_impressao, mkm_relatorios,
  unReportImpressao;

function FrmRELATORIOQTDEPRODUTO: TFrmRELATORIOQTDEPRODUTO;
begin
  Result := TFrmRELATORIOQTDEPRODUTO(mm.GetFormInstance(TFrmRELATORIOQTDEPRODUTO));
end;
procedure TFrmRELATORIOQTDEPRODUTO.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_VENDASTOTALQTDEPRODUTO( mm.varI_Code_Company,
                                          cbxtipo.ItemIndex,
                                          edSearchpessoasINI.Text,
                                          edSearchpessoasfin.Text,
                                          edSearchCRUDDtIni.Text,
                                          edSearchCRUDDtEnd.Text);

  mm.varC_caminhopdf :=  RELATORIO_VENDASQTEPRODUTO(mm.varI_Code_Company,
                                                   cbxtipo.Text,
                                                    psql,
                                                    edSearchpessoasINI.Text,
                                                    edSearchpessoasfin.Text,
                                                    edSearchCRUDDtIni.Text,
                                                    edSearchCRUDDtEnd.Text);

  unfImpressao.ShowModal();
end;

procedure TFrmRELATORIOQTDEPRODUTO.edSearchpessoasFINButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchpessoasfin.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmRELATORIOQTDEPRODUTO.edSearchpessoasINIButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchpessoasINI.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmRELATORIOQTDEPRODUTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmRELATORIOQTDEPRODUTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmRELATORIOQTDEPRODUTO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TFrmRELATORIOQTDEPRODUTO.UniFormShow(Sender: TObject);
begin
  edSearchCRUDDtIni.DateTime        := Date;
  edSearchCRUDDtEnd.DateTime        := Date;
end;

Initialization
   RegisterClass( TFrmRELATORIOQTDEPRODUTO );
end.
