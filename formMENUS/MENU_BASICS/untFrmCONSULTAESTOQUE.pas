unit untFrmCONSULTAESTOQUE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, uniButton, uniBitBtn,
  uniMultiItem, uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUITypes;

type
  TfrmCONSULTAESTOQUE = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpproduto: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    UniButtonEditpprodutoFIN: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    dsfiltro: TDataSource;
    tbfiltro: TFDMemTable;
    tbfiltroGRUPO: TIntegerField;
    tbfiltroGRUPO_DESCRICAO: TStringField;
    tbfiltroCODIGO: TIntegerField;
    tbfiltroDISPONIVEL: TFloatField;
    tbfiltroDESCRICAO: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniButtonEditpprodutoButtonClick(Sender: TObject);
    procedure UniButtonEditpprodutoFINButtonClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  end;

var
  frmCONSULTAESTOQUE: TfrmCONSULTAESTOQUE;

implementation

{$R *.dfm}

uses MainModule, mkm_funcoes, mkm_func_web, mkm_procedures, untDM_RC,
  untFrmPesquisa, mkm_impressao, unReportImpressao;

procedure TfrmCONSULTAESTOQUE.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmCONSULTAESTOQUE.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if tbfiltro.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  RELATORIO_CONSULTAESTOQUE(
                                                      mm.varI_Code_Company,
                                                      StrToInt(UniButtonEditpproduto.Text),
                                                      StrToInt(UniButtonEditpprodutofin.Text),
                                                      cbxSearchCRUDFieldordem.ItemIndex);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );
end;

procedure TfrmCONSULTAESTOQUE.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCONSULTAESTOQUE.btnSearchCRUDClick(Sender: TObject);
var
  order :string;
  grupo :Integer;
begin

  case cbxSearchCRUDFieldordem.ItemIndex of
    0 : order := ' order by p.grupo, p.descricao  asc';
    1 : order := ' order by p.grupo, p.codigo     asc';
    2 : order := ' order by p.grupo, s.disponivel asc';
    3 : order := ' order by p.grupo, s.disponivel desc';
  end;

  inherited;
  if SqlPesquisa(' SELECT * FROM PRODUTOS P   ' +
                 ' INNER JOIN SALDOS S ON (P.CODIGO = S.PRODUTO)' +
                 ' WHERE P.CODIGO BETWEEN                       ' + QuotedStr(UniButtonEditpproduto.Text)    +
                 ' AND                                          ' + QuotedStr(UniButtonEditpprodutoFIN.Text) +
                 ' AND S.EMPRESA                             =  ' + IntToStr(MM.varI_Code_Company) + order) then
  begin
    tbfiltro.Close;
    tbfiltro.Open;

    grupo := 0;

    tbfiltro.DisableControls;
    dm_rc.sqlBuscas.first;
    while not dm_rc.sqlBuscas.eof do
      begin

        if grupo <> dm_rc.sqlBuscas.FindField('GRUPO').AsInteger then
          begin
            tbfiltro.Append;
            tbfiltro.FindField('GRUPO').AsInteger          := dm_rc.sqlBuscas.FindField('GRUPO').AsInteger;
            tbfiltro.FindField('GRUPO_DESCRICAO').AsString := Acha_Item('GRUPOS',IntToStr(dm_rc.sqlBuscas.FindField('GRUPO').AsInteger));
            tbfiltro.Post;
          end;

        tbfiltro.Append;
        tbfiltro.FindField('CODIGO').AsInteger         := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        tbfiltro.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        tbfiltro.FindField('DISPONIVEL').AsFloat       := dm_rc.sqlBuscas.FindField('DISPONIVEL').AsFloat;
        tbfiltro.Post;

        grupo := dm_rc.sqlBuscas.FindField('GRUPO').AsInteger;

        dm_rc.sqlBuscas.Next;
      end;

    tbfiltro.First;
    tbfiltro.EnableControls;
  end;

end;

procedure TfrmCONSULTAESTOQUE.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (tbfiltroGRUPO.AsInteger <> 0 ) then
    Attribs.Color:= clSilver;
end;

procedure TfrmCONSULTAESTOQUE.UniButtonEditpprodutoButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpproduto.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCONSULTAESTOQUE.UniButtonEditpprodutoFINButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpprodutoFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCONSULTAESTOQUE.UniFrameCreate(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldordem.ItemIndex := 0;
end;

initialization
  RegisterClass(TfrmCONSULTAESTOQUE);
end.
