unit untFrmRELATORIOPRODUTOPESSOA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniLabel, uniEdit, UniButtonEdit, uniGUIBaseClasses, uniPanel,
  uniDateTimePicker;

type
  TFrmRELATORIOPRODUTOPESSOA = class(TUniForm)
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
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure edSearchpessoasINIButtonClick(Sender: TObject);
    procedure edSearchpessoasFINButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmRELATORIOPRODUTOPESSOA: TFrmRELATORIOPRODUTOPESSOA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_impressao, mkm_relatorios,
  unReportImpressao, untFrmPesquisa;

function FrmRELATORIOPRODUTOPESSOA: TFrmRELATORIOPRODUTOPESSOA;
begin
  Result := TFrmRELATORIOPRODUTOPESSOA(mm.GetFormInstance(TFrmRELATORIOPRODUTOPESSOA));
end;
procedure TFrmRELATORIOPRODUTOPESSOA.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := ESCRITA_VENDASPORPRODUTO( mm.varI_Code_Company,
                                    cbxtipo.ItemIndex,
                                    edSearchpessoasINI.Text,
                                    edSearchpessoasfin.Text,
                                    edSearchCRUDDtIni.Text,
                                    edSearchCRUDDtEnd.Text);

  mm.varC_caminhopdf :=  RELATORIO_VENDASPORPRODUTO(mm.varI_Code_Company,
                                                    psql,
                                                    edSearchpessoasINI.Text,
                                                    edSearchpessoasfin.Text,
                                                    edSearchCRUDDtIni.Text,
                                                    edSearchCRUDDtEnd.Text);

  unfImpressao.ShowModal();
end;

procedure TFrmRELATORIOPRODUTOPESSOA.edSearchpessoasFINButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchpessoasFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmRELATORIOPRODUTOPESSOA.edSearchpessoasINIButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchpessoasINI.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmRELATORIOPRODUTOPESSOA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmRELATORIOPRODUTOPESSOA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmRELATORIOPRODUTOPESSOA.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TFrmRELATORIOPRODUTOPESSOA.UniFormShow(Sender: TObject);
begin
  edSearchCRUDDtIni.DateTime        := Date;
  edSearchCRUDDtEnd.DateTime        := Date;
end;

Initialization
   RegisterClass( TFrmRELATORIOPRODUTOPESSOA );
end.
