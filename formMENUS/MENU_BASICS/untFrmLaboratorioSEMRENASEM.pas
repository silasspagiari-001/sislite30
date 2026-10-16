unit untFrmLaboratorioSEMRENASEM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniLabel, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniEdit, UniButtonEdit, uniDateTimePicker,
  uniScrollBox, uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSEMRENASEM = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
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
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditcodresponsavel: TUniButtonEdit;
    dbgSearchCRUD: TUniDBGrid;
    TB_IDENTIFICACAO: TFDMemTable;
    TB_IDENTIFICACAONOME: TStringField;
    TB_IDENTIFICACAOCNPJ: TStringField;
    TB_IDENTIFICACAOCIDADE: TStringField;
    TB_IDENTIFICACAOESTADO: TStringField;
    TB_IDENTIFICACAOCEP: TStringField;
    TB_IDENTIFICACAOENDERECO: TStringField;
    TB_IDENTIFICACAOANALISE: TStringField;
    TB_IDENTIFICACAOESPECIE: TStringField;
    TB_IDENTIFICACAOCULTIVAR: TStringField;
    dsidentificacao: TDataSource;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure BuscaSEMRENASEM();
  end;

var
  frmSEMRENASEM: TfrmSEMRENASEM;

implementation

{$R *.dfm}

uses mkm_procedures, mkm_func_web, MainModule, untDM_RC, mkm_funcoes,
  System.DateUtils, mkm_impressao, unReportImpressao;

{ TfrmSEMRENASEM }

procedure TfrmSEMRENASEM.ativabusca;
begin
  if not ( dsidentificacao.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;

end;

procedure TfrmSEMRENASEM.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if TB_IDENTIFICACAO.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  LABORATORIO_SEMRENASEM  (edSearchCRUDDtIni.Text,
                                                      edSearchCRUDDtEnd.Text,
                                                      mm.varI_Code_Company,
                                                      StrToInt(UniButtonEditcodresponsavel.Text),
                                                      TB_IDENTIFICACAO);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmSEMRENASEM.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmSEMRENASEM.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  BuscaSEMRENASEM();
end;

procedure TfrmSEMRENASEM.BuscaSEMRENASEM;
var
  M_SQL : string;
begin
  TB_IDENTIFICACAO.Close;
  TB_IDENTIFICACAO.Open;

  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(mm.varI_Code_Company));

  M_SQL := ' select pessoas.codigo,  protocolo.especie_codigo, protocolo.cultivar_codigo, PROTOCOLO.tetrazolio, PROTOCOLO.PUREZA from pessoas, protocolo where pessoas.codigo = protocolo.pessoa ' +
           ' and pessoas.renasem is null                                              ' +
           ' and protocolo.dataemissao between                                        ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
           ' and                                                                      ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
           ' and protocolo.empresa  =                                                 ' + IntToStr(mm.varI_Code_Company)                                          +
           ' group by 1,2,3,4,5';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          TabelaPessoas('SELECT * FROM PESSOAS WHERE CODIGO = ' + IntToStr(dm_rc.sqlBuscas.FindField('CODIGO').AsInteger));

          TB_IDENTIFICACAO.Append;
          TB_IDENTIFICACAO.FindField('NOME').AsString       := PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          TB_IDENTIFICACAO.FindField('CNPJ').AsString       := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          TB_IDENTIFICACAO.FindField('CEP').AsString        := FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          TB_IDENTIFICACAO.FindField('ENDERECO').AsString   := PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString) + ' nº ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString + ' ' +
                                                                               PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString);
          TB_IDENTIFICACAO.FindField('CIDADE').AsString     := PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('CIDADE').AsString) + '/' + dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          TB_IDENTIFICACAO.FindField('ESPECIE').AsString    := variif(dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString  <> '', Acha_Item('ESPECIE', dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString),'');
          TB_IDENTIFICACAO.FindField('CULTIVAR').AsString   := variif(dm_rc.sqlBuscas.FindField('CULTIVAR_CODIGO').AsString <> '', Acha_Item('CULTIVAR',dm_rc.sqlBuscas.FindField('CULTIVAR_CODIGO').AsString),'');
          TB_IDENTIFICACAO.FindField('ANALISE').AsString    := variif(dm_rc.sqlBuscas.FindField('PUREZA').AsString = 'T','PU','') + '/' + variif(dm_rc.sqlBuscas.FindField('TETRAZOLIO').AsString = 'T','TZ','');
          TB_IDENTIFICACAO.Post;

          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmSEMRENASEM.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmSEMRENASEM.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text          := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text          := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));

  ativabusca();
end;
initialization
  RegisterClass(TfrmSEMRENASEM);

end.
