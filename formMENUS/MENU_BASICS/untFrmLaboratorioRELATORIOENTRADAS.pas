unit untFrmLaboratorioRELATORIOENTRADAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniScrollBox, uniPageControl, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRELATORIOENTRADAS = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
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
    dbgSearchCRUD: TUniDBGrid;
    TB_RELAMOSTRA: TFDMemTable;
    TB_RELAMOSTRAAMOSTRAS: TStringField;
    TB_RELAMOSTRADATACLINICA: TStringField;
    TB_RELAMOSTRADATAAMOSTRAGEM: TStringField;
    TB_RELAMOSTRAREQUERENTE: TStringField;
    TB_RELAMOSTRAAMOSTRADOR: TStringField;
    TB_RELAMOSTRACPFCNPJ: TStringField;
    TB_RELAMOSTRASAFRAVALIDA: TStringField;
    TB_RELAMOSTRAESPECIE: TStringField;
    TB_RELAMOSTRACULTIVAR: TStringField;
    TB_RELAMOSTRALOTE: TStringField;
    TB_RELAMOSTRACATEGORIA: TStringField;
    TB_RELAMOSTRAREPRESENTATIVIDADE: TStringField;
    TB_RELAMOSTRAPROCEDENCIA: TStringField;
    TB_RELAMOSTRADATARECEBIMENTO: TStringField;
    TB_RELAMOSTRANUMEROIR: TStringField;
    TB_RELAMOSTRADATAEMISSAO: TStringField;
    TB_RELAMOSTRATIPO: TStringField;
    TB_RELAMOSTRABOLETIM: TStringField;
    dsamostra: TDataSource;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure BuscaENTRADAS();
  end;

var
  frmRELATORIOENTRADAS: TfrmRELATORIOENTRADAS;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, mkm_funcoes, System.DateUtils, mkm_procedures,
  untDM_RC, mkm_impressao, unReportImpressao;

procedure TfrmRELATORIOENTRADAS.ativabusca;
begin
  if not ( dsamostra.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;

end;

procedure TfrmRELATORIOENTRADAS.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if TB_RELAMOSTRA.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  LABORATORIO_ENTRADAS(edSearchCRUDDtIni.Text,
                                                  edSearchCRUDDtEnd.Text,
                                                  mm.varI_Code_Company,
                                                  TB_RELAMOSTRA);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmRELATORIOENTRADAS.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmRELATORIOENTRADAS.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  BuscaENTRADAS();
end;

procedure TfrmRELATORIOENTRADAS.BuscaENTRADAS;
var
  M_SQL : string;
begin
  TB_RELAMOSTRA.Close;
  TB_RELAMOSTRA.Open;

  M_SQL := ' SELECT * FROM PROTOCOLO WHERE EMPRESA = ' + IntToStr(mm.varI_Code_Company)               +
           ' AND DATARECEBIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
           ' AND                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
           ' ORDER BY AMOSTRA ASC';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          TB_RELAMOSTRA.Append;
          TB_RELAMOSTRA.FindField('AMOSTRAS').AsString             := dm_rc.sqlBuscas.FindField('AMOSTRA').AsString;
          TB_RELAMOSTRA.FindField('DATACLINICA').AsString          := dm_rc.sqlBuscas.FindField('DATACRITICA').AsString;
          TB_RELAMOSTRA.FindField('REQUERENTE').AsString           := dm_rc.sqlBuscas.FindField('NOMEPESSOA').AsString;
          TB_RELAMOSTRA.FindField('AMOSTRADOR').AsString           := variif(dm_rc.sqlBuscas.FindField('NOMERESPONSAVEL').AsString = '','-0-',dm_rc.sqlBuscas.FindField('NOMERESPONSAVEL').AsString);
          TB_RELAMOSTRA.FindField('CPFCNPJ').AsString              := variif(dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString = '','-0-',dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString);
          TB_RELAMOSTRA.FindField('SAFRAVALIDA').AsString          := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
          TB_RELAMOSTRA.FindField('ESPECIE').AsString              := dm_rc.sqlBuscas.FindField('ESPECIE').AsString;
          TB_RELAMOSTRA.FindField('CULTIVAR').AsString             := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
          TB_RELAMOSTRA.FindField('LOTE').AsString                 := dm_rc.sqlBuscas.FindField('LOTE').AsString;
          TB_RELAMOSTRA.FindField('CATEGORIA').AsString            := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;

          if dm_rc.sqlBuscas.FindField('REPRESENTATIVIDADE').AsFloat > 0 then
            begin
              TB_RELAMOSTRA.FindField('REPRESENTATIVIDADE').AsString := dm_rc.sqlBuscas.FindField('REPRESENTATIVIDADE').AsString
            end
          else
          if dm_rc.sqlBuscas.FindField('REPRESENTA_ESCRITA').AsString <> '' then
            begin
              TB_RELAMOSTRA.FindField('REPRESENTATIVIDADE').AsString := dm_rc.sqlBuscas.FindField('REPRESENTA_ESCRITA').AsString;
            end
          else
            begin
              TB_RELAMOSTRA.FindField('REPRESENTATIVIDADE').AsString := '-0-';
            end;

          TB_RELAMOSTRA.FindField('PROCEDENCIA').AsString          := variif(dm_rc.sqlBuscas.FindField('PROCEDENCIA').AsString = '','-0-',dm_rc.sqlBuscas.FindField('PROCEDENCIA').AsString);
          TB_RELAMOSTRA.FindField('DATARECEBIMENTO').AsString      := dm_rc.sqlBuscas.FindField('DATARECEBIMENTO').AsString;
          TB_RELAMOSTRA.FindField('DATAAMOSTRAGEM').AsString       := dm_rc.sqlBuscas.FindField('DATAAMOSTRAGEM').AsString;
          TB_RELAMOSTRA.FindField('DATAEMISSAO').AsString          := dm_rc.sqlBuscas.FindField('DATAEMISSAO').AsString;
          TB_RELAMOSTRA.FindField('NUMEROIR').AsString             := variif(dm_rc.sqlBuscas.FindField('NUMEROIR').AsString        = '' ,'-0-',dm_rc.sqlBuscas.FindField('NUMEROIR').AsString);
          TB_RELAMOSTRA.FindField('BOLETIM').AsString              := variif(dm_rc.sqlBuscas.FindField('BOLETIM').AsString         = '' ,'-0-',dm_rc.sqlBuscas.FindField('BOLETIM').AsString);
          TB_RELAMOSTRA.FindField('TIPO').AsString                 := variif(dm_rc.sqlBuscas.FindField('PUREZA').AsString          = 'T','PU'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('TETRAZOLIO').AsString  = 'T','TZ'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('DOSN').AsString        = 'T','DOSN','')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('GERMINACAO').AsString  = 'T','GE'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('UMIDADE').AsString     = 'T','UM'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('VE').AsString          = 'T','VE'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('PMS').AsString         = 'T','PMS' ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('SI').AsString          = 'T','SI'  ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('VOC').AsString         = 'T','VOC' ,'')   +
                                                                                      variif(dm_rc.sqlBuscas.FindField('VIGOR').AsString       = 'T','VI'  ,'');

          TB_RELAMOSTRA.Post;

          dm_rc.sqlBuscas.Next;
        end;
    end;

end;

procedure TfrmRELATORIOENTRADAS.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmRELATORIOENTRADAS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text          := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text          := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));

  ativabusca();

end;
initialization
  RegisterClass(TfrmRELATORIOENTRADAS);

end.
