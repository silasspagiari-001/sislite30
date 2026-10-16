unit untFrmRELATORIO_PRODUTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniLabel, uniEdit,
  UniButtonEdit, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmRELATORIO_PRODUTOS = class(TUniForm)
    rcBlock60: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edSearchprodutoINI: TUniButtonEdit;
    UniLabelDtIni: TUniLabel;
    rcBlock20: TUniContainerPanel;
    edSearchprodutoFIN: TUniButtonEdit;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniLabel2: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    cbxordem: TUniComboBox;
    UniLabel3: TUniLabel;
    procedure edSearchprodutoINIButtonClick(Sender: TObject);
    procedure edSearchprodutoFINButtonClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIO_PRODUTOS: TfrmRELATORIO_PRODUTOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, mkm_impressao,
  unReportImpressao;

function frmRELATORIO_PRODUTOS: TfrmRELATORIO_PRODUTOS;
begin
  Result := TfrmRELATORIO_PRODUTOS(mm.GetFormInstance(TfrmRELATORIO_PRODUTOS));
end;

procedure TfrmRELATORIO_PRODUTOS.btnimpressaoClick(Sender: TObject);
begin
  mm.varC_caminhopdf :=  RELATORIO_LISTAPRODUTO(
                         MM.varI_Code_Company,
                         strtoint(edSearchprodutoINI.text),
                         strtoint(edSearchprodutoFIN.text),
                         cbxtipo.itemindex,
                         cbxordem.itemindex);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIO_PRODUTOS.edSearchprodutoFINButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchprodutoFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIO_PRODUTOS.edSearchprodutoINIButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchprodutoINI.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELATORIO_PRODUTOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRELATORIO_PRODUTOS.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIO_PRODUTOS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmRELATORIO_PRODUTOS.UniFormShow(Sender: TObject);
begin
  cbxtipo.ItemIndex    := 3;
  cbxordem.ItemIndex   := 0;
end;
Initialization
   RegisterClass( TfrmRELATORIO_PRODUTOS );
end.
