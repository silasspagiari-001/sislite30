unit untFrmRELATORIO_LOTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniLabel, uniEdit, UniButtonEdit, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox;

type
  TfrmRELATORIO_LOTE = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    edSearchprodutoINI: TUniButtonEdit;
    edSearchprodutoFIN: TUniButtonEdit;
    UniLabelDtIni: TUniLabel;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    cbxsaldos: TUniComboBox;
    UniLabel2: TUniLabel;
    cbxopcoes: TUniComboBox;
    UniLabel3: TUniLabel;
    cbxcategoria: TUniComboBox;
    UniLabel4: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edSearchprodutoINIButtonClick(Sender: TObject);
    procedure edSearchprodutoFINButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELATORIO_LOTE: TfrmRELATORIO_LOTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_relatorios, mkm_impressao,
  unReportImpressao, untFrmPesquisa;

function frmRELATORIO_LOTE: TfrmRELATORIO_LOTE;
begin
  Result := TfrmRELATORIO_LOTE(mm.GetFormInstance(TfrmRELATORIO_LOTE));
end;
procedure TfrmRELATORIO_LOTE.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  psql := RELATORIO_LOTEBAS(
  mm.varI_Code_Company,
  edSearchprodutoINI.Text,
  edSearchprodutoFIN.Text,
  IntToStr(cbxsaldos.ItemIndex),
  IntToStr(cbxopcoes.ItemIndex),
  cbxcategoria.Text);

  mm.varC_caminhopdf :=  RELATORIO_ESTOQUELOTE(
                         MM.varI_Code_Company,
                         psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELATORIO_LOTE.edSearchprodutoFINButtonClick(Sender: TObject);
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

procedure TfrmRELATORIO_LOTE.edSearchprodutoINIButtonClick(Sender: TObject);
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

procedure TfrmRELATORIO_LOTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRELATORIO_LOTE.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELATORIO_LOTE.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmRELATORIO_LOTE.UniFormShow(Sender: TObject);
begin
  cbxcategoria.ItemIndex := 3;
  cbxopcoes.ItemIndex    := 4;
  cbxsaldos.ItemIndex    := 3;
end;

Initialization
   RegisterClass( TfrmRELATORIO_LOTE );
end.
