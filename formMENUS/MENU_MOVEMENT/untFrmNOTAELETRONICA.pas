unit untFrmNOTAELETRONICA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniEdit, UniButtonEdit, uniLabel,
  uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniDBDateTimePicker,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uniDBEdit, UniButtonDbEdit, uniGUImJSForm, unimScrollBox,
  Vcl.Menus, uniMainMenu, uniMemo, uniDBMemo, uniDBComboBox, uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmNOTAELETRONICA = class(TfrmBase)
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
    UniButtonEditpessoas: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniButtonEditnumero: TUniButtonEdit;
    UniLabel1: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel3: TUniLabel;
    cbxSearchCRUDFieldstatus: TUniComboBox;
    dbgSearchCRUD: TUniDBGrid;
    paBaseRegData1: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    UniPageControlnota: TUniPageControl;
    UniTabSheetgeral: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniComboBoxparaop: TUniComboBox;
    UniLabel8: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniButtonDbEditcodigooperacaomestre: TUniButtonDbEdit;
    UniLabel6: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroVLRTOTAL: TFMTBCDField;
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    dstitulos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    memprodutos: TFDMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    memprodutosPRECO: TFloatField;
    memprodutosTOTAL: TFloatField;
    memprodutosQUANTIDADE: TFloatField;
    memprodutosBASEICMS: TFloatField;
    memprodutosVALORICMS: TFloatField;
    memprodutosPERCICMS: TFloatField;
    memprodutosCST: TStringField;
    memprodutosUNIDADE: TStringField;
    memprodutosPIS: TStringField;
    memprodutosCOFINS: TStringField;
    memprodutosICM0: TFloatField;
    memprodutosICM1: TFloatField;
    memprodutosICM2: TFloatField;
    memprodutosBAS0: TFloatField;
    memprodutosBAS1: TFloatField;
    memprodutosBAS2: TFloatField;
    memprodutosSITUACAOLOCAL: TStringField;
    memprodutosSITUACAOOUTRAS: TStringField;
    memprodutosDESCONTO: TFloatField;
    memprodutosDESPESAS: TFloatField;
    memprodutosNUMERONCM: TStringField;
    memprodutosSERIE: TStringField;
    memprodutosSAFRA: TIntegerField;
    memprodutosNUMERO: TIntegerField;
    memprodutosEMPRESA: TIntegerField;
    memprodutosSEQUENCIA: TIntegerField;
    memprodutosUF: TStringField;
    memprodutosPESSOA: TIntegerField;
    memprodutosMARGEM: TFloatField;
    memprodutosCOMPRA: TFloatField;
    memprodutosNCM: TStringField;
    memprodutosGRUPO: TIntegerField;
    memprodutosPERCIPI: TFloatField;
    memprodutosLIQUIDO: TFloatField;
    memprodutosVALORIPI: TFloatField;
    memprodutosOPERACAO: TIntegerField;
    memprodutosPUREZA: TFloatField;
    memprodutosSALDOPONTO: TFloatField;
    memprodutosTERMOSEMENTE: TStringField;
    memprodutosBOLETIMSEMENTE: TStringField;
    memprodutosVALORCULTURAL: TFloatField;
    memprodutosLOTESEMENTE: TStringField;
    memprodutosLOTEORIGEM: TStringField;
    memprodutosSAFRACAMPO: TStringField;
    memprodutosCAMPO: TStringField;
    memprodutosCOOPERANTE: TIntegerField;
    memprodutosGERMINACAO: TFloatField;
    memprodutosSAFRAVALIDA: TStringField;
    memprodutosLOTEENTRADA: TStringField;
    memprodutosCATEGORIA: TStringField;
    memprodutosCUSTOPONTO: TFloatField;
    memprodutosTOTALPONTO: TFloatField;
    memprodutosPERCREDUCAO: TFloatField;
    memprodutosexclui: TStringField;
    memprodutosbuscaproduto: TStringField;
    memprodutosbuscalote: TStringField;
    memprodutosDESCRICAO_NOTA: TStringField;
    memprodutosCULTIVAR: TStringField;
    memprodutosCANCELADA: TStringField;
    memprodutosESTADO: TStringField;
    memprodutosCONTRATO: TIntegerField;
    memprodutosDOCUMENTO: TIntegerField;
    memprodutosFRETE: TFloatField;
    memprodutosPESOLIQUIDO: TFloatField;
    memprodutosPESOBRUTO: TFloatField;
    memprodutosEMISSAO: TStringField;
    memprodutosCUSTO: TFloatField;
    memprodutosPESOSACO: TFloatField;
    memprodutosVALIDADE: TStringField;
    memprodutosTOTALPIS: TFloatField;
    memprodutosTOTALCOFINS: TFloatField;
    memprodutosVLRPIS: TFloatField;
    memprodutosVLRCOFINS: TFloatField;
    memprodutosPERCCOMISSAO: TFloatField;
    memprodutosSEGURO: TFloatField;
    memprodutosDESPESA: TFloatField;
    memprodutoserro: TStringField;
    memprodutosopcoes: TStringField;
    memprodutosENTREGUE: TFloatField;
    dsprodutos: TDataSource;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniButtonDbEditcodigocondicaomestre: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    UniEditdescricaocondicao: TUniEdit;
    UniLabel10: TUniLabel;
    UniButtonDbEditcodigofuncionariomestre: TUniButtonDbEdit;
    UniLabel11: TUniLabel;
    UniEditnomevendedor: TUniEdit;
    UniLabel12: TUniLabel;
    UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit;
    UniLabel13: TUniLabel;
    rcBlock110: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    UniButtonDbEditcodigopessoas: TUniButtonDbEdit;
    UniLabel14: TUniLabel;
    UniEditnome: TUniEdit;
    UniLabel15: TUniLabel;
    UniEditcpfcnpj: TUniEdit;
    UniLabel16: TUniLabel;
    UniEditinscricao: TUniEdit;
    UniLabel17: TUniLabel;
    UniEditrenasem: TUniEdit;
    UniLabel19: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnCalcReg: TUniBitBtn;
    rcBlock210: TUniContainerPanel;
    UniLabel21: TUniLabel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel32: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniPopupMenudetalhes: TUniPopupMenu;
    UniTabSheetfaturamento: TUniTabSheet;
    UniScrollBox5: TUniScrollBox;
    rcBlock430: TUniContainerPanel;
    UniLabel48: TUniLabel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniLabel50: TUniLabel;
    rcBlock460: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    rcBlock480: TUniContainerPanel;
    rcBlock490: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniDBEdit11: TUniDBEdit;
    UniDBEdit12: TUniDBEdit;
    UniDBEditinscricao: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniDBEdit15: TUniDBEdit;
    UniLabel54: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    UniLabel55: TUniLabel;
    dspessoas: TDataSource;
    FDQrypessoas: TFDQuery;
    rcBlock510: TUniContainerPanel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock540: TUniContainerPanel;
    UniDBEdit17: TUniDBEdit;
    UniDBEdit18: TUniDBEdit;
    UniDBEdit19: TUniDBEdit;
    UniDBEdit20: TUniDBEdit;
    UniLabel56: TUniLabel;
    UniLabel57: TUniLabel;
    UniLabel58: TUniLabel;
    UniLabel59: TUniLabel;
    rcBlock550: TUniContainerPanel;
    rcBlock560: TUniContainerPanel;
    rcBlock570: TUniContainerPanel;
    UniDBEdit21: TUniDBEdit;
    UniLabel60: TUniLabel;
    UniDBEditestado: TUniDBEdit;
    UniLabel61: TUniLabel;
    UniDBEdit23: TUniDBEdit;
    UniLabel62: TUniLabel;
    rcBlock580: TUniContainerPanel;
    UniLabel63: TUniLabel;
    rcBlock590: TUniContainerPanel;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    rcBlock620: TUniContainerPanel;
    UniDBEdit24: TUniDBEdit;
    UniDBEdit25: TUniDBEdit;
    UniDBEdit26: TUniDBEdit;
    UniDBEdit27: TUniDBEdit;
    UniLabel64: TUniLabel;
    UniLabel65: TUniLabel;
    UniLabel66: TUniLabel;
    UniLabel67: TUniLabel;
    rcBlock630: TUniContainerPanel;
    rcBlock640: TUniContainerPanel;
    UniDBEdit28: TUniDBEdit;
    UniDBEdit29: TUniDBEdit;
    UniLabel68: TUniLabel;
    UniLabel69: TUniLabel;
    UniPageControlprodutos: TUniPageControl;
    UniTabSheetProdutos: TUniTabSheet;
    UniDBGridprodutos: TUniDBGrid;
    UniTabSheettransporte: TUniTabSheet;
    rcBlock270: TUniContainerPanel;
    UniLabel20: TUniLabel;
    rcBlock280: TUniContainerPanel;
    UniButtonDbEditTRANSPORTADORA: TUniButtonDbEdit;
    UniLabel35: TUniLabel;
    rcBlock290: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel36: TUniLabel;
    rcBlock300: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock310: TUniContainerPanel;
    UniDBEdit5: TUniDBEdit;
    UniLabel38: TUniLabel;
    rcBlock320: TUniContainerPanel;
    UniLabel47: TUniLabel;
    UniComboBoxtrafrete: TUniComboBox;
    rcBlock650: TUniContainerPanel;
    rcBlock660: TUniContainerPanel;
    rcBlock670: TUniContainerPanel;
    rcBlock680: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel29: TUniLabel;
    UniDBFormattedNumberEditpesobruto: TUniDBFormattedNumberEdit;
    UniLabel33: TUniLabel;
    UniDBFormattedNumberEditpesoliquido: TUniDBFormattedNumberEdit;
    UniLabel34: TUniLabel;
    dbgTITULOS: TUniDBGrid;
    UniTabSheetobs: TUniTabSheet;
    rcBlock350: TUniContainerPanel;
    UniLabel40: TUniLabel;
    rcBlock690: TUniContainerPanel;
    UniTabSheetreferencia: TUniTabSheet;
    rcBlock410: TUniContainerPanel;
    UniLabel45: TUniLabel;
    rcBlock700: TUniContainerPanel;
    UniDBEditdevolucao: TUniDBEdit;
    UniLabel46: TUniLabel;
    UniTabSheetdetalhesnota: TUniTabSheet;
    rcBlock370: TUniContainerPanel;
    UniLabel41: TUniLabel;
    rcBlock380: TUniContainerPanel;
    UniDBEdit6: TUniDBEdit;
    UniLabel42: TUniLabel;
    rcBlock390: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniLabel43: TUniLabel;
    rcBlock400: TUniContainerPanel;
    UniDBEdit8: TUniDBEdit;
    UniLabel44: TUniLabel;
    UniDBMemoobs: TUniDBMemo;
    rcBlock710: TUniContainerPanel;
    UniLabel39: TUniLabel;
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    N1: TUniMenuItem;
    I2: TUniMenuItem;
    N2: TUniMenuItem;
    E1: TUniMenuItem;
    rcBlock720: TUniContainerPanel;
    rcBlock730: TUniContainerPanel;
    rcBlock740: TUniContainerPanel;
    UniDBEdit13: TUniDBEdit;
    UniLabel70: TUniLabel;
    UniDBEdit22: TUniDBEdit;
    UniLabel71: TUniLabel;
    C1: TUniMenuItem;
    C2: TUniMenuItem;
    A1: TUniMenuItem;
    N4: TUniMenuItem;
    N5: TUniMenuItem;
    N7: TUniMenuItem;
    N8: TUniMenuItem;
    D1: TUniMenuItem;
    N9: TUniMenuItem;
    UniPopupMenudetalhesnota: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    UniMemolog: TUniMemo;
    memprodutosSEMENTENOME: TStringField;
    UniDBComboBoxESPECIE: TUniDBComboBox;
    rcBlock750: TUniContainerPanel;
    rcBlock760: TUniContainerPanel;
    rcBlock770: TUniContainerPanel;
    rcBlock780: TUniContainerPanel;
    UniLabel72: TUniLabel;
    UniDBFormattedNumberEditQUANTIDADE: TUniDBFormattedNumberEdit;
    memprodutosPERCCOFINS: TFloatField;
    memprodutosPERCPIS: TFloatField;
    L1: TUniMenuItem;
    d2: TUniMenuItem;
    N6: TUniMenuItem;
    B1: TUniMenuItem;
    FDQryFiltroCODIGOBARRAS: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    btntransp: TUniBitBtn;
    memprodutosCODREFERENCIA: TStringField;
    O1: TUniMenuItem;
    P1: TUniMenuItem;
    N10: TUniMenuItem;
    memprodutosBASESUB: TFloatField;
    memprodutosVALORSUB: TFloatField;
    memprodutosPESOLIQUIDOPRODUTO: TFloatField;
    memprodutosPESOBRUTOPRODUTO: TFloatField;
    UniScreenMask1: TUniScreenMask;
    memprodutosPERCSUB: TFloatField;
    UniPopupMenuopcaoprodutos: TUniPopupMenu;
    D4: TUniMenuItem;
    memprodutosIVA: TFloatField;
    UniLabel73: TUniLabel;
    UniDBFormattedNumberEditVLRBASEST: TUniDBFormattedNumberEdit;
    UniLabel74: TUniLabel;
    UniDBFormattedNumberEditVLRST: TUniDBFormattedNumberEdit;
    memprodutosPERCST: TFloatField;
    N3: TUniMenuItem;
    C3: TUniMenuItem;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure FDQryFiltrostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCalcRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure UniButtonDbEditcodigocondicaomestreButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigocondicaomestreExit(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasExit(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAButtonClick(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure UniDBFormattedNumberEditvlrdespesasExit(Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreButtonClick(
      Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure memprodutosbuscaloteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure D1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure d2Click(Sender: TObject);
    procedure UniButtonEditpessoasButtonClick(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure memprodutosopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btntranspClick(Sender: TObject);
    procedure D4Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  varC_Documento_MvmestreNFE : Integer;
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  ativabusca();
  procedure  carregadados();
  procedure  carregafinanceiro(cempresa,cdocumento,cnumero:integer);
  procedure  carregaitens(cempresa,cdocumento,cnumero:integer);
  procedure  LimpaVars();
  procedure  Calcula_Titulos();
  procedure  GravaMovimento();
  procedure  Calcula_Totais();
  function   CamposValidados :Boolean;
  procedure  gravamemoria();
  procedure  geradescricaonota();
  procedure  carregaprodutos(codigo:string);
  procedure  CarregaParametros();
  procedure  Exclui();
  procedure  Parametrocfoppessoa();
  procedure  Calcula_Documento();

  function  Base_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  function  Aliq_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  procedure Calcula_Icms(F_TIPO:String);
  procedure HabilitaMenuAdiiconais(tipo:Boolean);

  procedure MemoGravaLog();
  procedure CarregaImportacao(const controle:integer);

  procedure ValidaInfoProdutoMemoria(foperacao:real;fproduto,fempresa:integer);
  procedure ReleituraProdutoscfop();

  procedure carregalote(lote:string;produto:integer);
  procedure calcula_st();

  end;

var
  frmNOTAELETRONICA: TfrmNOTAELETRONICA;
  state            : string;

implementation

{$R *.dfm}

uses mkm_func_web, System.TypInfo, MainModule, System.DateUtils, untDM_RC,
  mkm_procedures, uniGUITypes, mkm_funcoes, Vcl.Grids, untFrmPesquisa,
  mkm_impressao, unReportImpressao, untFrmTELAGENERICA,
  untFrmTransfereImportacao, untfrmSEFAZNOTA, untfrmPesquisalote,
  untfrmDeclaracaoretirada, ServerModule, uconsts, Vcl.Clipbrd,
  untFrmDETALHESITENSNOTA, untFrmTRANSPORTADORAMOVIMENTO, untFrmPesquisaProduto,
  untFrmTELACHAVENOTA;

procedure TfrmNOTAELETRONICA.A1Click(Sender: TObject);
begin
  if FDQryFiltro.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error' , false );
      abort
    end
  else
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR AS AUTORIZAÇÃO DE REEMBALO?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Autorizareembalo(mm.varI_Code_Company,
                                                        FDQryFiltro.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

function TfrmNOTAELETRONICA.Aliq_Icms(F_ESTADO, F_INSCRICAO: string;F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '0') then
  result := 0
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm2').AsFloat;

  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsString = '0') then
  begin
  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 0) and (StrContains('2',IntToStr(varC_Documento_MvmestreNFE))) then
  begin
  if not StrEmpty(F_INSCRICAO) then
  result := variif(StrContains('MT#MS#TO#PA#AM#PB#AC#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR#PR',F_ESTADO),memprodutos.FindField('Icm2').AsFloat, memprodutos.FindField('Icm0').AsFloat)
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm1').AsFloat
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
    result := memprodutos.FindField('Icm0').AsFloat
  else
    result := memprodutos.FindField('Icm2').AsFloat;
  end;
  end;

end;

procedure TfrmNOTAELETRONICA.ativabusca;
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

procedure TfrmNOTAELETRONICA.B1Click(Sender: TObject);
var
  M_ANO, M_PATH, M_ARQUIVO : string;
begin
  try
    M_ARQUIVO :=  FDQryFiltroCODIGOBARRAS.AsString + '-nfe.xml';
    M_ANO     :=  FormatDateTime('yyyy',FDQryFiltroEMISSAO.AsDateTime);
    M_PATH    :=  Validacaminho(mm.varI_Code_Company,
                                mm.M_PATHXML,
                                mm.varC_Doc_Customer,
                                'NFe',
                                FDQryFiltroEMISSAO.AsString,
                                '') + FDQryFiltroCODIGOBARRAS.AsString + '-nfe.xml';
    if FDQryFiltroCODIGOBARRAS.AsString <> '' then
      begin
        Downloadremessa(ExtractFilePath(M_PATH),ExtractFileName(M_PATH));
        UniSession.SendFile(sm.FilesFolderPath+M_ARQUIVO);
        DeleteFile(sm.FilesFolderPath+M_ARQUIVO);
      end;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não achei o ARQUIVO XML' , 'error' , false );
  end;
end;

function TfrmNOTAELETRONICA.Base_Icms(F_ESTADO, F_INSCRICAO: string;F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if StrEmpty(F_ESTADO) then
  begin
//    msg('Estado Esta Vazio Verifique');
    abort;
  end;

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsInteger = 0) then
  result := 0
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
    result := memprodutos.FindField('Bas0').AsFloat
  else
    result := memprodutos.FindField('Bas1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  result := memprodutos.FindField('Bas2').AsFloat;
end;

procedure TfrmNOTAELETRONICA.btnCalcRegClick(Sender: TObject);
begin
  inherited;
  //************************************************************************//
  // VERIFICA OS ITENS
  //************************************************************************//
  Parametrocfoppessoa();
  ReleituraProdutoscfop();

  calcula_st();
  Calcula_Totais();
  Calcula_Icms('');
  //************************************************************************//
  dm_rc.rc_ShowYesNo( 'POSSO CALCULAR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
      dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];
      if FDQryCad.FindField('PEDIDO').AsString = '' then
        Calcula_Titulos();
    end;

  Calcula_Documento();
  SetBut(tpCalcular);
end;

procedure TfrmNOTAELETRONICA.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;

   tbtitulos.Close;
   memprodutos.Close;

   LimpaVars;
end;

procedure TfrmNOTAELETRONICA.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin

  if StrContains('A#C',FDQryFiltro.FindField('CANCELADA').AsString) then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO FOI PERMITIDO FAZER A EXCLUSÃO' , 'error' , false );
      abort
    end
  else
    begin
      mm.VarC_Atelagenerica            := 'SENHAEXCLUSAONOTA';
      frmTELAGENERICA.ShowModal();

      if mm.varS_SenhaExclusaoNota_permitido = 'T' then
        begin
          mm.varS_SenhaExclusaoNota_permitido := '';
          Exclui();

            Try
               FDQryCad.Close;

              for i := 0 to  FDQryCad.Params.Count - 1 do
              begin
                Cmp :=  FDQryCad.Params[i].Name;
                 FDQryCad.Params[i].Value :=  FDQryFiltro.FieldByName(Cmp).Value ;
              end;
               FDQryCad.Open;
            Except
              abort;
            End;
        end
      else
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' , false );
          Abort
        end;
    end;


{
  if mm.varS_SenhaExclusaoNota_permitido = 'T' then
    begin
      dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
      if mm.varB_Yes then
        begin
          mm.varS_SenhaExclusaoNota_permitido := '';
          Exclui();
        end
      else
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' , false );
          Abort
        end;

        Try
           FDQryCad.Close;

          for i := 0 to  FDQryCad.Params.Count - 1 do
          begin
            Cmp :=  FDQryCad.Params[i].Name;
             FDQryCad.Params[i].Value :=  FDQryFiltro.FieldByName(Cmp).Value ;
          end;
           FDQryCad.Open;
        Except
          abort;
        End;
    end;
}
end;

procedure TfrmNOTAELETRONICA.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  if FDQryFiltro.FindField('CANCELADA').AsString <> '' then
    begin
      UniPopupMenudetalhesnota.PopupBy( TUniButton( sender ) );
      Abort;
    end;

  UniComboBoxparaop.Enabled          := True;
  pgBaseCadControl.ActivePage        := paBaseRegData1;
  UniPageControlprodutos.ActivePage  := UniTabSheetProdutos;

  SetBut(tpAlterar);

  Try
{
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;
}
    FDQryCad.Edit;

    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

    if FDQryCad.State in [dsInsert] then
    begin
      S := 1;
      tbtitulos.Close;
      tbtitulos.Open;

      memprodutos.Close;
      memprodutos.Open;
    end
    else
      S := memprodutos.RecordCount + 10;

    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    for R := S to S + 25 do
    begin
      memprodutos.Append;
      memprodutos.Post;
    end;

    memprodutos.First;
    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.First;

  Except
   Abort ;
  End ;

  I2.Enabled := True; //CALCULA ICMS

end;

procedure TfrmNOTAELETRONICA.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  labTitleForm.Caption            := 'NOTA ELETRÔNICA';
  UniComboBoxparaop.Enabled       := True;

  FDQrypessoas.Close;
  pgBaseCadControl.ActivePage        := paBaseRegData1;
  UniPageControlprodutos.ActivePage  := UniTabSheetProdutos;

  SetBut(tpIncluir);
  HabilitaMenuAdiiconais(False);
  mm.FDTransaction.StartTransaction;

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  LimpaVars;

  if not( FDQryCad.Active) then
      FDQryCad.Open;

  CarregaParametros();
  SqlPesquisa(' select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_MvmestreNFE) +
              ' and empresa                                                     = ' + IntToStr(mm.varI_Code_Company));

   FDQryCad.Insert ;
   FDQryCad.FindField('PESSOA').AsInteger               := 0;
   FDQryCad.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   FDQryCad.FindField('DOCUMENTO').AsInteger            := varC_Documento_MvmestreNFE;
   FDQryCad.FindField('NUMERO').AsInteger               := 0;
   FDQryCad.FindField('FUNCIONARIO').AsInteger          := 0;
   FDQryCad.FindField('SERIE').AsString                 := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   FDQryCad.FindField('EMISSAO').AsDateTime             := Date;
   FDQryCad.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   FDQryCad.FindField('OPERACAO').AsInteger             := 0;
   FDQryCad.FindField('CONDICAO').AsInteger             := dm_rc.sqlBuscas.FindField('CONDICAO').AsInteger;

   FDQryCad.FindField('VLRDESCONTOS').AsFloat           := 0;
   FDQryCad.FindField('VLRPRODUTOS').AsFloat            := 0;
   FDQryCad.FindField('VLRDESPESAS').AsFloat            := 0;
   FDQryCad.FindField('VLRTOTAL').AsFloat               := 0;
   FDQryCad.FindField('VLRBASEICMS').AsFloat            := 0;
   FDQryCad.FindField('VLRICMS').AsFloat                := 0;

   UniComboBoxtrafrete.ItemIndex                        := 1;
   UniPageControlprodutos.ActivePage                    := UniTabSheetProdutos;

   if mm.M_TIPOPESO = 'Saco' then
     UniDBComboBoxESPECIE.ItemIndex                     := 0
   else
     UniDBComboBoxESPECIE.ItemIndex                     := 1;


  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

//  dbgTITULOS.Options                 := dbgTITULOS.Options - [dgRowSelect];
//  dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];


  if FDQryCad.State in [dsInsert] then
  begin
    S := 1;
    tbtitulos.Close;
    tbtitulos.Open;

    memprodutos.Close;
    memprodutos.Open;
  end
  else
    S := memprodutos.RecordCount + 10;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;

  for R := S to S + 25 do
  begin
    memprodutos.Append;
    memprodutos.Post;
  end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;

//  UniButtonDbEditcodigopessoas.SetFocus;
//  UniButtonDbEditcodigopessoas.SelectAll;
  UniComboBoxparaop.SetFocus;

end;

procedure TfrmNOTAELETRONICA.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmNOTAELETRONICA.btnSaveRegClick(Sender: TObject);
var
  vdup, vtotal:Real;
  M_MARCAM  : TBookMark;
begin
  inherited;
  M_MARCAM  := FDQryCad.GetBookmark;

  if (VerificaDevolucao(StrToInt(UniButtonDbEditcodigooperacaomestre.Text)) = 'Devolucao') and
     (UniDBEditdevolucao.Text = '') then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'FALTA COLOCAR A CHAVE DE REFERÊNCIA' , 'error' , false );
    UniPageControlprodutos.ActivePage := UniTabSheetreferencia;
    abort
  end;
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           FDQryCad.FindField('KEY').AsString          := Gera_Guid;
           FDQryCad.FindField('CODIGO').AsInteger      := Ultimo_Codigo('MVMESTRE','CODIGO',True);
           FDQryCad.FindField('NUMERO').AsInteger      := Ultimo_Numero(mm.varI_Code_Company,1,'GRAVAR');
         end
       else
         begin
           FDQryCad.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
         end;

       FDQryCad.FindField('PARAMETROOPERACAO').AsString := UniComboBoxparaop.Text;
       FDQryCad.FindField('TRAFRETE').AsInteger         := UniComboBoxtrafrete.ItemIndex;
       FDQryCad.FindField('DOCUMENTO').AsInteger        := 1;

       //grava, tabelas principal
       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;


       // grava demais informações
       GravaMovimento();

       try

         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  FDQryCad.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  FDQryCad.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         UniPageControlnota.ActivePage := UniTabSheetgeral;
         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );

       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;
     End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  HabilitaMenuAdiiconais(True);

  FDQryCad.GotoBookmark(M_MARCAM);
  FDQryCad.FreeBookmark(M_MARCAM);

  FDQryFiltro.Refresh;
end;

procedure TfrmNOTAELETRONICA.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmNOTAELETRONICA.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  case cbxSearchCRUDFieldordem.ItemIndex of
    0: M_ORDEM := ' ORDER BY M.EMISSAO';
    1: M_ORDEM := ' ORDER BY M.NUMERO';
    2: M_ORDEM := ' ORDER BY M.PESSOA';
  end;

  CAMPOS  := ' M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELADA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.CODIGOBARRAS,M.VLRTOTAL ';

  M_AND   := ' AND M.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
             ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));

  SQL :=    ' SELECT          ' + CAMPOS +
            ' FROM   MVMESTRE ' +
            ' M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)        ' +
            variif(UniButtonEditpessoas.Text              = '0'    ,'','AND M.PESSOA      = '  + QuotedStr(UniButtonEditpessoas.Text))      +
            variif(UniButtonEditnumero.Text               = '0'    ,'','AND M.NUMERO      = '  + QuotedStr(UniButtonEditnumero.Text))       +
            ' AND M.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company) +
            ' AND M.DOCUMENTO                             = ' + IntToStr(varC_Documento_MvmestreNFE);

  if (UniButtonEditpessoas.Text = '0') and (UniButtonEditnumero.Text = '0') then
    SQL := SQL + M_AND + M_SITUACAO + M_ORDEM
  else
    SQL := SQL + M_SITUACAO + M_ORDEM ;

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL;
  FDQryFiltro.Open();

  FDQryFiltro.Last;
  SetBut(tpListaVazia);

end;

procedure TfrmNOTAELETRONICA.btntranspClick(Sender: TObject);
begin
  inherited;
  mm.varT_code_transportadora      := FDQryCad.FindField('TRANSPORTADORA').AsInteger;
  mm.varT_code_nome_transportadora := FDQryCad.FindField('TRANOME').AsString;
  mm.varT_code_tipo_transportadora := FDQryCad.FindField('TRAFRETE').AsString;
  mm.varT_code_cep_entrega         := FDQryCad.FindField('ENTREGA_CEP').AsString;
  mm.varT_code_ibge_entrega        := FDQryCad.FindField('ENTREGA_IBGE').AsString;
  mm.varT_code_endereco_entrega    := FDQryCad.FindField('ENTREGA_ENDERECO').AsString;
  mm.varT_code_numero_entrega      := FDQryCad.FindField('ENTREGA_NUMERO').AsString;
  mm.varT_code_bairro_entrega      := FDQryCad.FindField('ENTREGA_BAIRRO').AsString;
  mm.varT_code_cidade_entrega      := FDQryCad.FindField('ENTREGA_CIDADE').AsString;
  mm.varT_code_estado_entrega      := FDQryCad.FindField('ENTREGA_ESTADO').AsString;

  frmTRANPORTADORAMOVIMENTO.ShowModal();

  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      FDQryCad.FindField('TRANSPORTADORA').AsInteger  := mm.varT_code_transportadora;
      FDQryCad.FindField('TRANOME').AsString          := mm.varT_code_nome_transportadora;
      FDQryCad.FindField('TRAFRETE').AsInteger        := StrToInt(mm.varT_code_tipo_transportadora);
      FDQryCad.FindField('ENTREGA_CEP').AsString      := mm.varT_code_cep_entrega;
      FDQryCad.FindField('ENTREGA_IBGE').AsString     := mm.varT_code_ibge_entrega;
      FDQryCad.FindField('ENTREGA_ENDERECO').AsString := mm.varT_code_endereco_entrega;
      FDQryCad.FindField('ENTREGA_NUMERO').AsString   := mm.varT_code_numero_entrega;
      FDQryCad.FindField('ENTREGA_BAIRRO').AsString   := mm.varT_code_bairro_entrega;
      FDQryCad.FindField('ENTREGA_CIDADE').AsString   := mm.varT_code_cidade_entrega;
      FDQryCad.FindField('ENTREGA_ESTADO').AsString   := mm.varT_code_estado_entrega;
    end;
end;

procedure TfrmNOTAELETRONICA.C1Click(Sender: TObject);
begin
  if FDQryFiltro.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error' , false );
      abort;
    end
  else
    mm.varC_caminhopdf :=  NOTA_ContratoTranporte(
                           MM.varI_Code_Company,
                           FDQryFiltroNUMERO.AsInteger,
                           1);

  unfImpressao.ShowModal();
end;

procedure TfrmNOTAELETRONICA.C2Click(Sender: TObject);
begin
  if FDQryFiltro.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error' , false );
      abort
    end
  else
  mm.varC_caminhopdf :=  NOTA_ControleEtiqueta(
                         MM.varI_Code_Company,
                         FDQryFiltroNUMERO.AsInteger,
                         1);

  unfImpressao.ShowModal();
end;

procedure TfrmNOTAELETRONICA.C3Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'CONFIRA SE A NOTA NÃO FOI ENVIADA - RESPONSABILIDADE DAS INFORMAÇÕES POR CONTA DO USUÁRIO' , 'warning' , false );

  mm.varI_Code_Documento_Controle := FDQryFiltro.FindField('CODIGO').AsInteger;
  frmTELACHAVENOTA.ShowModal();

  FDQryFiltro.Refresh;
end;

procedure TfrmNOTAELETRONICA.Calcula_Documento;
begin
  //************************************************************************//
  mm.varV_Valor_Documento          := UniDBFormattedNumberEditvlrtotal.value;

  dm_rc.tbtitulos.Close;
  dm_rc.tbtitulos.CopyDataSet(tbtitulos);

  mm.VarC_Atelagenerica := 'FINANCEIRONOTA';
  frmTELAGENERICA.ShowModal();

  tbtitulos.Close;
  tbtitulos.Open;

  tbtitulos.CopyDataSet(dm_rc.tbtitulos);
  dm_rc.tbtitulos.Close;
  //************************************************************************//

end;

procedure TfrmNOTAELETRONICA.Calcula_Icms(F_TIPO: String);
var
  M_MARCA  : TBookMark;
  M_SAIVLP : Real;
  M_SAIVLN : Real;
  M_SAIBIC : Real;
  M_SAIVIC : Real;
  M_SAITOT : Real;
  M_SAIVIP : Real;
  M_RESTOV : Real;
  M_SAIVFI : Real;

begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigooperacaomestre.Text));
  M_MARCA  := memprodutos.GetBookmark;
  M_SAITOT := 0;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.First;

  M_SAIVLP := 0;
  M_SAIVIP := 0;
  M_SAIBIC := 0;
  M_SAIVIC := 0;
  M_SAIVLN := 0;

  while not memprodutos.eof do
    begin
      if memprodutos.FindField('Produto').AsInteger > 0 then  // Zera os campos da tabela para recáculo
        begin
          memprodutos.Edit;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
          memprodutos.FindField('Despesa').AsFloat   :=0;
          memprodutos.FindField('BaseIcms').AsFloat  :=0;
          memprodutos.FindField('PercIcms').AsFloat  :=0;
          memprodutos.FindField('ValorIcms').AsFloat :=0;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
//          memprodutos.FindField('Desconto').AsFloat  :=0;
          memprodutos.Post;
        end;
      memprodutos.next;
    end;

  M_SAITOT := 0;
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('Produto').AsInteger > 0 then
          begin
             M_SAITOT := M_SAITOT + memprodutos.FindField('Total').AsFloat;
//             memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('Total').AsFloat - memprodutos.FindField('DESCONTO').AsFloat
          end;
        memprodutos.next;
        Application.ProcessMessages;
      end;

    if (dm_rc.FDQryoperacoes.FindField('CALCULA_IPI').AsString = '1')  then
      begin
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                if memprodutos.FindField('PercIpi').Value > 0 then
                  begin
                    memprodutos.Edit;
                    memprodutos.FindField('ValorIpi').AsFloat:= MRound(((memprodutos.FindField('TOTAL').Value * 0.01) * memprodutos.FindField('PercIpi').Value), 2);
                    memprodutos.Post;
                  end;
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
      end;

  // calcula rateio de despesas

    if (FDQryCad.findfield('VLRDSPTRIBUTADA').asfloat + FDQryCad.findfield('VLRDSPNTRIBUTADA').asfloat + FDQryCad.findfield('VLRDESPESAS').asfloat) > 0 then
      begin
        memprodutos.First;
        M_SAITOT := 0;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              M_SAITOT := M_SAITOT + memprodutos.FindField('TOTAL').Value;
            memprodutos.next;
          end;
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                memprodutos.Edit;
                memprodutos.FindField('Despesa').AsFloat := MRound(((FDQryCad.findfield('VLRDSPTRIBUTADA').asfloat + FDQryCad.findfield('VLRDSPNTRIBUTADA').asfloat + FDQryCad.findfield('VLRDESPESAS').asfloat) / M_SAITOT) * memprodutos.FindField('TOTAL').Value,2);
                memprodutos.Post;
              end;
            memprodutos.next;
          end;
      end;

//verifica rateio de despesa

  if MRound((FDQryCad.findfield('VLRDSPTRIBUTADA').asfloat + FDQryCad.findfield('VLRDSPNTRIBUTADA').asfloat + FDQryCad.findfield('VLRDESPESAS').asfloat) , 2) > 0 then
    begin
      M_SAITOT := 0;
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
               M_SAITOT := M_SAITOT + MRound(memprodutos.FindField('Despesa').Value, 2);
            end;
          memprodutos.Next;
          Application.ProcessMessages;
        end;
        M_RESTOV := MRound(FDQryCad.findfield('VLRDSPTRIBUTADA').asfloat + FDQryCad.findfield('VLRDSPNTRIBUTADA').asfloat + FDQryCad.findfield('VLRDESPESAS').asfloat, 2) - MRound(M_SAITOT, 2);
        if M_RESTOV <> 0 then
          begin
            memprodutos.First;
            memprodutos.Edit;
            if M_RESTOV > 0 then
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat + M_RESTOV
            else
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat - Abs(M_RESTOV);
            memprodutos.Post;
           end;
    end;

// calcula valor do Icms
  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '1') then
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('PercIcms').AsFloat:=Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text));
              if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS_SOBRE_NOTA').AsString = '1') then
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)),2);

                  if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value) // soma ipi + dsp na base icms
                  else
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value); // soma ipi + dsp na base icms

                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)) = 0, 100, Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)), 2);
                end
              else
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)),2);
                  memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value); // soma ipi + dsp na base icms
                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)) = 0, 100, Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(UniButtonDbEditcodigooperacaomestre.text)), 2);
                end;

              if memprodutos.FindField('ValorIcms').AsFloat = 0 then memprodutos.FindField('BaseIcms').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
        end;

      // calcula totais da nota
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                M_SAIVLP := M_SAIVLP + memprodutos.FindField('Total').AsFloat;
                M_SAIVIP := M_SAIVIP + memprodutos.FindField('ValorIpi').AsFloat;
                M_SAIBIC := M_SAIBIC + memprodutos.FindField('BaseIcms').AsFloat;
                M_SAIVIC := M_SAIVIC + memprodutos.FindField('ValorIcms').AsFloat;
                M_SAIVLN := M_SAIVLN + (memprodutos.FindField('Total').AsFloat + memprodutos.FindField('ValorIpi').AsFloat + memprodutos.FindField('Despesa').AsFloat);
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
    end;

  FDQryCad.edit;
  FDQryCad.findfield('VLRBASEICMS').asfloat := M_SAIBIC;
  FDQryCad.findfield('VLRICMS').asfloat     := M_SAIVIC;
  FDQryCad.findfield('VLRIPI').asfloat      := M_SAIVIP;

  memprodutos.AfterDelete        := memprodutosAfterDelete;
  memprodutos.AfterPost          := memprodutosAfterPost;
  memprodutos.BeforeDelete       := memprodutosBeforeDelete;
  memprodutos.BeforePost         := memprodutosBeforePost;

  memprodutos.EnableControls;
  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.Refresh;

end;

procedure TfrmNOTAELETRONICA.calcula_st;
var
  M_ALQIVA,
  M_SAISUB,
  M_CREDITO,
  M_VALORST,
  M_VALORSUB :real;

begin
  SqlPesquisa('SELECT * FROM OPERACOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigooperacaomestre.Text));

  if dm_rc.sqlBuscas.FindField('CALCULA_ST').AsInteger = 1 then
    begin
      M_ALQIVA   := 0;
      M_SAISUB   := 0;
      M_CREDITO  := 0;
      M_VALORST  := 0;
      M_VALORSUB := 0;

      memprodutos.First;
      while not memprodutos.Eof do
        begin
          if (memprodutos.FindField('PRODUTO').AsInteger > 0) and
             (memprodutos.FindField('IVA').AsInteger     > 0) then
            begin
              if memprodutos.State = dsBrowse then  memprodutos.Edit;
              if dm_rc.sqlBuscas.FindField('CALCULA_ST').AsInteger = 1 then
                begin
                  if FDQrypessoas.FindField('INSCRICAO').AsString <> '' then
                    begin

                      if StrContains('SP#MS',FDQrypessoas.FindField('ESTADO').AsString) then
                        begin
                          M_ALQIVA := memprodutos.FindField('IVA').AsFloat;
                          M_SAISUB := MRound(memprodutos.FindField('TOTAL').AsFloat  + memprodutos.FindField('VALORIPI').AsFloat,2);
                          M_SAISUB := M_SAISUB + MRound(((M_SAISUB * 0.01) * M_ALQIVA),2);
                          M_CREDITO:= MRound(((memprodutos.FindField('TOTAL').AsFloat * 0.01) * 18),2);
                        end;

                      memprodutos.FindField('BASESUB').AsFloat := M_SAISUB;

                      if StrContains('MG#SP#RS#MS',FDQrypessoas.FindField('ESTADO').AsString) then
                        memprodutos.FindField('VALORSUB').AsFloat := MRound(((M_SAISUB * 0.01) * 18),2) - M_CREDITO;

                      memprodutos.Edit;
                      memprodutos.FindField('CST').AsString    := '0202';
                      memprodutos.FindField('PERCSUB').AsFloat := 18;
                      memprodutos.Post;
                    end;
                end;
            end;
              memprodutos.Next;
        end;
        memprodutos.First;
    end;
end;

procedure TfrmNOTAELETRONICA.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigocondicaomestre.Text)) then

  ORDEM      := 0;
  M_PARCELAS := Explode(Trim(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value;
  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,Valor(dm_rc.sqlBuscas.FindField('PARCELAS').AsString));

  if M_PARCELAS.Count <  M_ITENS then
    begin
      for R := M_PARCELAS.Count to M_ITENS -1 do
        begin
          M_PARCELAS.Add(IntToStr(R * 30));
        end;
    end;

  for R := 0 to M_PARCELAS.Count - 1 do
    begin
      inc(ORDEM);

      tbtitulos.Append;
      tbtitulos.FindField('VENCIMENTO').AsDateTime := date + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound(UniDBFormattedNumberEditvlrtotal.Value / M_ITENS,2);
      tbtitulos.FindField('PARCELA').AsInteger     := ORDEM;
      tbtitulos.Post;

      M_RESTO := M_RESTO - tbtitulos.FindField('VALOR').AsFloat;
    end;

  if M_RESTO > 0 then
    begin
      tbtitulos.Last;
      tbtitulos.Edit;
      tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat + Abs(M_RESTO);
      tbtitulos.Post;
    end
  else
    if M_RESTO < 0 then
      begin
        tbtitulos.First;
        tbtitulos.Edit;
        tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat - Abs(M_RESTO);
        tbtitulos.Post;
      end;

  tbtitulos.First;
end;

procedure TfrmNOTAELETRONICA.Calcula_Totais;
var
  M_VLRPRODUTOS, M_VLRDESCONTO, M_VLRLIQUIDO, M_VLRDESPESA, M_VLRTOTAL, M_VLRSERVICOS, M_VLRRESTO, M_FRETE, M_QUANTIDADE: Real;
  M_MARCA: TBookMark;
  M_PESO: Real;
  M_BRUTO: Real;
  M_BASE: Real;
  M_VICM: Real;
  M_BASU: Real;
  M_VSUB: Real;
  M_VIPI: Real;
  M_SACOS: Real;
  M_SEGURO: Real;
  M_VLRIMPOSTO: Real;
  M_TOTIPI: Real;
  M_VALORCICMSF: Real;
  R: Pointer;
begin

  M_MARCA := memprodutos.GetBookmark;
  memprodutos.DisableControls;

  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;
  M_VLRSERVICOS := 0;
  M_VLRDESCONTO := 0;
  M_QUANTIDADE  := 0;
  M_FRETE       := 0;
  M_BASE        := 0;
  M_VICM        := 0;
  M_BASU        := 0;
  M_VSUB        := 0;
  M_VIPI        := 0;
  M_VLRIMPOSTO  := 0;
  M_PESO        := 0;
  M_BRUTO       := 0;
  M_TOTIPI      := 0;
  M_VALORCICMSF := 0;
  M_SACOS       := 0;
  M_SEGURO      := 0;

  //**********************************************************************//
  // CALCULA DESCONTO UNITARIO
  //**********************************************************************//
  if UniDBFormattedNumberEditdescontos.Value > 0 then
  begin
    M_VLRPRODUTOS := 0;
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('PRODUTO').AsInteger > 0 then
          M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
        memprodutos.next;
        Application.ProcessMessages;
      end;
    M_VLRRESTO := UniDBFormattedNumberEditdescontos.Value;
    M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('PRODUTO').AsInteger > 0 then
          begin
            memprodutos.Edit;
            memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat), 2), 2);
            memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('TOTAL').AsFloat - memprodutos.FindField('LIQUIDO').AsFloat;
            memprodutos.Post;
            M_VLRRESTO   := M_VLRRESTO   - memprodutos.FindField('DESCONTO').AsFloat;
            M_VLRLIQUIDO := M_VLRLIQUIDO - memprodutos.FindField('LIQUIDO').AsFloat;
          end;
        memprodutos.next;
        Application.ProcessMessages;
      end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
    if M_VLRLIQUIDO > 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
    else if M_VLRLIQUIDO < 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat - Abs(M_VLRLIQUIDO);
    memprodutos.Post;
  end
  else
  begin
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('PRODUTO').AsInteger > 0 then
          begin
            memprodutos.Edit;
            memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
            memprodutos.FindField('DESCONTO').AsFloat := 0;
            memprodutos.Post;
          end;
        memprodutos.next;
        Application.ProcessMessages;
      end;
  end;

  M_VLRDESPESA := (UniDBFormattedNumberEditvlrdespesas.Value);

  if M_VLRDESPESA >= 0 then
  begin
    memprodutos.First;
    M_VLRLIQUIDO := 0;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('PRODUTO').AsInteger > 0 then
          M_VLRLIQUIDO := M_VLRLIQUIDO + memprodutos.FindField('LIQUIDO').Value;
        memprodutos.next;
      end;
    M_VLRRESTO := M_VLRDESPESA;
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('PRODUTO').AsInteger > 0 then
          begin
            memprodutos.Edit;
            memprodutos.FindField('DESPESA').AsFloat := MRound(((M_VLRDESPESA) / M_VLRLIQUIDO) * memprodutos.FindField('LIQUIDO').Value, 2);
            memprodutos.Post;
            M_VLRRESTO := M_VLRRESTO - memprodutos.FindField('DESPESA').AsFloat;
          end;
        memprodutos.next;
      end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat - Abs(M_VLRRESTO);
    memprodutos.Post;
  end;

  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;

  memprodutos.First;
  while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          //*****************************************************************//
          // PESO LIQUIDO/BRUTO
          //*****************************************************************//
          memprodutos.Edit;
          memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('PESOBRUTOPRODUTO').AsFloat * memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('PESOLIQUIDOPRODUTO').AsFloat * memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.FindField('TOTALPIS').AsFloat    := (memprodutos.FindField('TOTAL').AsFloat * 0.01) * memprodutos.FindField('VLRPIS').AsFloat;
          memprodutos.FindField('TOTALCOFINS').AsFloat := (memprodutos.FindField('TOTAL').AsFloat * 0.01) * memprodutos.FindField('VLRCOFINS').AsFloat;
          memprodutos.Post;


          //*****************************************************************//
          // VALORES TOTAIS
          //*****************************************************************//
          M_BASU        := M_BASU        + memprodutos.FindField('BASESUB').AsFloat;
          M_VSUB        := M_VSUB        + memprodutos.FindField('VALORSUB').AsFloat;
          M_PESO        := M_PESO        + memprodutos.FindField('PESOLIQUIDO').AsFloat;
          M_BRUTO       := M_BRUTO       + memprodutos.FindField('PESOBRUTO').AsFloat;
          M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat;
          M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
          M_VLRDESCONTO := M_VLRDESCONTO + memprodutos.FindField('DESCONTO').AsFloat;
          M_FRETE       := M_FRETE       + memprodutos.FindField('FRETE').AsFloat;
          M_SEGURO      := M_SEGURO      + memprodutos.FindField('SEGURO').AsFloat;
          M_BASE        := M_BASE        + memprodutos.FindField('BASEICMS').AsFloat;
          M_VICM        := M_VICM        + memprodutos.FindField('VALORICMS').AsFloat;
          M_VLRTOTAL    := M_VLRTOTAL    + memprodutos.FindField('LIQUIDO').AsFloat + memprodutos.FindField('VALORSUB').AsFloat +
                                                                                      memprodutos.FindField('FRETE').AsFloat    +
                                                                                      memprodutos.FindField('VALORIPI').AsFloat +
                                                                                      memprodutos.FindField('DESPESA').AsFloat  +
                                                                                      memprodutos.FindField('SEGURO').AsFloat;

          //*****************************************************************//
        end;
      memprodutos.next;
    end;

  UniDBFormattedNumberEditvlrprodutos.Value     := MRound(M_VLRPRODUTOS,2);
  UniDBFormattedNumberEditvlrtotal.Value        := MRound(M_VLRTOTAL,2);
  UniDBFormattedNumberEditpesoliquido.Value     := MRound(M_PESO,2);
  UniDBFormattedNumberEditpesobruto.Value       := MRound(M_BRUTO,2);
  UniDBFormattedNumberEditQUANTIDADE.Value      := MRound(M_QUANTIDADE,2);

  UniDBFormattedNumberEditVLRBASEST.Value       := MRound(M_BASU,2);
  UniDBFormattedNumberEditVLRST.Value           := MRound(M_VSUB,2);


  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.Refresh;
  memprodutos.EnableControls;

end;

function TfrmNOTAELETRONICA.CamposValidados: Boolean;
var
  i,e :Integer;
  Campos :TStrings;
begin
  Try
    Campos := TStringList.Create;
    Campos.Clear ;
    e := 0 ;
    for I:= 0 to ComponentCount -1 do
       begin
         if ( Components[I] is TUniDBEdit )  then
            begin

               If ( TUniDBEdit(Components[i]).Tag = 1 ) then
                 Begin
                   if TUniDBEdit(Components[i]).Text = '' then
                      begin
                        Campos.Add('-' + TUniDBEdit(Components[i]).Field.DisplayName ) ;
                        inc(e) ;
                      end;
                 End;
            end;
       end;

     if e = 0  then
        result := true ;

     If e > 0 then
        Begin
           Campos.Insert(0,'Preencha os campos obrigatórios:');
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' , false );
           FDQryCad.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;

end;

procedure TfrmNOTAELETRONICA.carregadados;
begin
  CarregaParametros();

  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES'   ,IntToStr(FDQryCad.FindField('CONDICAO').AsInteger));
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(FDQryCad.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, CPFCNPJ, INSCRICAO, NOME, CIDADE, ESTADO, TELEFONE FROM PESSOAS WHERE CODIGO = ' + IntToStr(FDQryCad.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcpfcnpj.Text     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditinscricao.Text   := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniEditrenasem.Text     := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
    end;

  carregafinanceiro(mm.varI_Code_Company,FDQryCad.FindField('DOCUMENTO').AsInteger,FDQryCad.FindField('NUMERO').AsInteger);
  carregaitens     (mm.varI_Code_Company,FDQryCad.FindField('DOCUMENTO').AsInteger,FDQryCad.FindField('NUMERO').AsInteger);

  HabilitaMenuAdiiconais(True);
  UniComboBoxparaop.Text          := FDQryCad.FindField('PARAMETROOPERACAO').AsString;
  UniComboBoxtrafrete.ItemIndex   := FDQryCad.FindField('TRAFRETE').AsInteger;

  UniComboBoxparaop.Enabled       := False;

  if FDQryCad.FindField('CANCELADA').AsString = 'A' then
    labTitleForm.Caption := labTitleForm.Caption +  ' -  H O M O L O G A D A ';
  if FDQryCad.FindField('CANCELADA').AsString = 'C' then
    labTitleForm.Caption := labTitleForm.Caption +  ' -  C A N C E L A D A  '
  else
    labTitleForm.Caption := 'NOTA ELETRÔNICA';
end;

procedure TfrmNOTAELETRONICA.carregafinanceiro(cempresa,cdocumento,cnumero:integer);
begin
  TabelaOperacao('select financeiro from operacoes where codigo = ' + QuotedStr(FDQryCad.FindField('OPERACAO').AsString));

  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, VALORORIGINAL FROM '+variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') +
                 ' WHERE NUMERO                                                          = ' + IntToStr(cnumero)   +
                 ' AND DOCUMENTO                                                         = ' + IntToStr(cdocumento)+
                 ' AND EMPRESA                                                           = ' + IntToStr(cempresa)                     +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;
end;

procedure TfrmNOTAELETRONICA.carregaitens(cempresa,cdocumento,cnumero:integer);
var
  M_MARCA: TBookMark;
begin
  M_MARCA := memprodutos.GetBookmark;
  memprodutos.First;
  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(cnumero)    +
                 ' AND DOCUMENTO                        = ' + IntToStr(cdocumento) +
                 ' AND EMPRESA                          = ' + IntToStr(cempresa)   +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.First;
    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger        :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('NUMERONCM').AsString       :=  dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
        memprodutos.FindField('DESCRICAO').AsString       :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('CODREFERENCIA').AsString   :=  dm_rc.sqlBuscas.FindField('CODREFERENCIA').AsString;
        memprodutos.FindField('UNIDADE').AsString         :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString        :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString             :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat            :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat         :=  dm_rc.sqlBuscas.FindField('DESCONTO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat       :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat            :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PESOBRUTO').AsFloat        :=  dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
        memprodutos.FindField('PESOLIQUIDO').AsFloat      :=  dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;

        //********************************************************************//
        // IMPOSTOS
        //********************************************************************//
        memprodutos.FindField('PERCICMS').AsFloat         :=  dm_rc.sqlBuscas.FindField('PERCICMS').AsFloat;
        memprodutos.FindField('VALORICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
        memprodutos.FindField('BASEICMS').AsFloat         :=  dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;
        memprodutos.FindField('BASESUB').AsFloat          :=  dm_rc.sqlBuscas.FindField('BASESUB').AsFloat;
        memprodutos.FindField('VALORSUB').AsFloat         :=  dm_rc.sqlBuscas.FindField('VALORSUB').AsFloat;
        memprodutos.FindField('IVA').AsFloat              :=  dm_rc.sqlBuscas.FindField('IVA').AsFloat;
        memprodutos.FindField('PERCSUB').AsFloat          :=  dm_rc.sqlBuscas.FindField('PERCSUB').AsFloat;

        memprodutos.FindField('PIS').AsString             :=  dm_rc.sqlBuscas.FindField('PIS').AsString;
        memprodutos.FindField('COFINS').AsString          :=  dm_rc.sqlBuscas.FindField('COFINS').AsString;
        memprodutos.FindField('VLRPIS').AsString          :=  dm_rc.sqlBuscas.FindField('VLRPIS').AsString;
        memprodutos.FindField('VLRCOFINS').AsString       :=  dm_rc.sqlBuscas.FindField('VLRCOFINS').AsString;
        memprodutos.FindField('TOTALPIS').AsString        :=  dm_rc.sqlBuscas.FindField('TOTALPIS').AsString;
        memprodutos.FindField('TOTALCOFINS').AsString     :=  dm_rc.sqlBuscas.FindField('TOTALCOFINS').AsString;
        //********************************************************************//

        //********************************************************************//
        // BASE DOS IMPOSTOS
        //********************************************************************//
        if SqlProdutos  ('SELECT PRODUTOS.*,SALDOS.* FROM PRODUTOS JOIN SALDOS ON SALDOS.EMPRESA = ' + IntToStr(cempresa) +
                         'AND SALDOS.PRODUTO = PRODUTOS.CODIGO WHERE PRODUTOS.CODIGO             = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)) then
          begin
            memprodutos.FindField('ICM0').AsFloat               := dm_rc.tbprodutos.Findfield('ICMS0').AsFloat;
            memprodutos.FindField('ICM1').AsFloat               := dm_rc.tbprodutos.Findfield('ICMS1').AsFloat;
            memprodutos.FindField('ICM2').AsFloat               := dm_rc.tbprodutos.Findfield('ICMS2').AsFloat;
            memprodutos.FindField('BAS0').AsFloat               := dm_rc.tbprodutos.Findfield('BASE0').AsFloat;
            memprodutos.FindField('BAS1').AsFloat               := dm_rc.tbprodutos.Findfield('BASE1').AsFloat;
            memprodutos.FindField('BAS2').AsFloat               := dm_rc.tbprodutos.Findfield('BASE2').AsFloat;
            memprodutos.FindField('PESOLIQUIDOPRODUTO').AsFloat := dm_rc.tbprodutos.FindField('PESOLIQUIDO').AsFloat;
            memprodutos.FindField('PESOBRUTOPRODUTO').AsFloat   := dm_rc.tbprodutos.FindField('PESOBRUTO').AsFloat;


            memprodutos.FindField('SEMENTENOME').AsString   := dm_rc.tbprodutos.FindField('SEMENTENOME').AsString;
            memprodutos.FindField('CULTIVAR').AsString      := dm_rc.tbprodutos.Findfield('CULTIVAR').AsString;

          end;
        //********************************************************************//

        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;
  end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.first;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
end;

procedure TfrmNOTAELETRONICA.carregalote(lote: string; produto: integer);
var
  sql:string;
begin
  if lote <> '' then
    begin
      if SqlPesquisa(' select * from sementes where produto = ' + IntToStr(produto) +
                     ' and lote                             = ' + QuotedStr(lote)) then
      begin
        memprodutosLOTESEMENTE.AsString    := lote;
        memprodutosTERMOSEMENTE.AsString   := dm_rc.sqlBuscas.FindField('TERMO').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosBOLETIMSEMENTE.AsString := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
        memprodutosVALORCULTURAL.AsString  := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsString;
        memprodutosVALIDADE.AsString       := dm_rc.sqlBuscas.FindField('VALIDADE').AsString;
        memprodutosCULTIVAR.AsString       := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosSAFRAVALIDA.AsString    := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
        memprodutosPESOSACO.AsFloat        := dm_rc.sqlBuscas.FindField('PESOEMBALAGEM').AsFloat;
      end;

      sql := ' select *                                         ' +
             ' from produtos P                                  ' +
             ' inner join saldos on (p.codigo = saldos.produto) ' +
             ' where P.codigo                                =  ' + IntToStr(produto) +
             ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

      if SqlPesquisa(sql) then
      begin
        memprodutosSEMENTENOME.AsString   := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
      end;

      geradescricaonota();
    end;

end;

procedure TfrmNOTAELETRONICA.CarregaImportacao(const controle: integer);
var i : integer; Cmp:String;
R,S   : Integer;
begin
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(controle));

  FDQryCad.FindField('PESSOA').AsInteger            := DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger;
  FDQryCad.FindField('CONDICAO').AsInteger          := DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger;
  FDQryCad.FindField('FUNCIONARIO').AsInteger       := DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger;

  FDQryCad.FindField('COMISSAOFUNCIONARIO').AsFloat := DM_RC.FDQryMvmestre.FindField('COMISSAOFUNCIONARIO').AsFloat;
  FDQryCad.FindField('EMISSAO').AsDateTime          := Date;
  FDQryCad.FindField('RECEPCAODESPACHO').AsDateTime := Date;

  FDQryCad.FindField('VLRDSPNTRIBUTADA').AsFloat    := DM_RC.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;
  FDQryCad.FindField('VLRDSPTRIBUTADA').AsFloat     := DM_RC.FDQryMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
  FDQryCad.FindField('VLRBASEICMS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
  FDQryCad.FindField('VLRICMS').AsFloat             := DM_RC.FDQryMvmestre.FindField('VLRICMS').AsFloat;
  FDQryCad.FindField('VLRDESCONTOS').AsFloat        := DM_RC.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
  FDQryCad.FindField('VLRDESPESAS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;
  FDQryCad.FindField('VLRPRODUTOS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat;
  FDQryCad.FindField('VLRTOTAL').AsFloat            := DM_RC.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;

  FDQryCad.FindField('PEDIDO').AsString             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
  FDQryCad.FindField('PEDIDO_SERIE').AsString       := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
  FDQryCad.FindField('PEDIDO_DOCUMENTO').AsInteger  := dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger;
  FDQryCad.FindField('NUMERO').AsInteger            := 0;
  FDQryCad.FindField('SERIE').AsString              := 'NFE';
  FDQryCad.FindField('DOCUMENTO').AsInteger         := 1;

  FDQryCad.FindField('TRANSPORTADORA').AsInteger    :=  dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger;
  FDQryCad.FindField('TRANOME').AsString            :=  dm_rc.FDQryMvmestre.FindField('TRANOME').AsString;
  UniComboBoxtrafrete.ItemIndex                     :=  dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger;

  if dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString <> '' then
    begin
      FDQryCad.FindField('TRAFRETE').AsString         := dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsString;
      FDQryCad.FindField('ENTREGA_CEP').AsString      := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
      FDQryCad.FindField('ENTREGA_IBGE').AsString     := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString;
      FDQryCad.FindField('ENTREGA_ENDERECO').AsString := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString;
      FDQryCad.FindField('ENTREGA_NUMERO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
      FDQryCad.FindField('ENTREGA_BAIRRO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
      FDQryCad.FindField('ENTREGA_CIDADE').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
      FDQryCad.FindField('ENTREGA_ESTADO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
    end;

  varC_Documento_MvmestreNFE    := FDQryCad.FindField('DOCUMENTO').AsInteger;
  UniComboBoxparaop.Text        := dm_rc.FDQryMvmestre.FindField('PARAMETROOPERACAO').AsString;

  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES'   ,IntToStr(DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger));
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, CPFCNPJ, INSCRICAO, NOME, CIDADE, ESTADO, TELEFONE FROM PESSOAS WHERE CODIGO = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcpfcnpj.Text     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditinscricao.Text   := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniEditrenasem.Text     := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;

      FDQrypessoas.Close ;
      for i := 0 to  FDQrypessoas.Params.Count - 1 do
      begin
        Cmp :=  FDQrypessoas.Params[i].Name;
         FDQrypessoas.Params[i].Value :=  dm_rc.FDQryMvmestre.FieldbyName(Cmp).Value;
      end;
       FDQrypessoas.Open;
    end;

  memprodutos.Close;
  memprodutos.Open;

  carregaitens     (mm.varI_Code_Company,dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger,dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger);

  if SqlPesquisa(' SELECT *                                    FROM PAGAR ' +
                 ' WHERE NUMERO                                         = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('numero').AsInteger)   +
                 ' AND DOCUMENTO                                        = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('documento').AsInteger)+
                 ' AND EMPRESA                                          = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('empresa').AsInteger)  +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;

  //************************************************************************//
  // VERIFICA OS ITENS
  //************************************************************************//
  Parametrocfoppessoa();
  ReleituraProdutoscfop();
  Calcula_Icms('');
  //************************************************************************//
  dm_rc.FDQryMvmestre.Close;

  end;

procedure TfrmNOTAELETRONICA.CarregaParametros;
begin
  UniComboBoxparaop.Clear;
  if SqlPesquisa('SELECT DESCRICAO FROM PARAMETROSOPERACAO ORDER BY CODIGO') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          UniComboBoxparaop.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.carregaprodutos(codigo: string);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + QuotedStr(codigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning' , false )
  else
    begin
      memprodutos.Edit;
      memprodutos.FindField('PRODUTO').AsInteger       := StrToInt(codigo);
      memprodutos.FindField('DESCRICAO').AsString      := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString +
                                                          variif(dm_rc.sqlBuscas.FindField('ALTURA').AsFloat <> 0,' - ' +
                                                                 formatfloat('0.##',dm_rc.sqlBuscas.FindField('ALTURA').AsFloat)   + ' X ' +
                                                                 formatfloat('0.##',dm_rc.sqlBuscas.FindField('LARGURA').AsFloat)  + ' X ' +
                                                                 formatfloat('0.##',dm_rc.sqlBuscas.FindField('COMPRIMENTO').AsFloat),'');

      memprodutos.FindField('PRECO').AsFloat              := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
      memprodutos.FindField('PESOLIQUIDOPRODUTO').AsFloat := dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;
      memprodutos.FindField('PESOBRUTOPRODUTO').AsFloat   := dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
      memprodutos.FindField('UNIDADE').AsString           := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('NCM').AsString               := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('NUMERONCM').AsString         := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('UNIDADE').AsString           := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('ICM0').AsFloat               := dm_rc.sqlBuscas.FindField('ICMS0').AsFloat;
      memprodutos.FindField('ICM1').AsFloat               := dm_rc.sqlBuscas.FindField('ICMS1').AsFloat;
      memprodutos.FindField('ICM2').AsFloat               := dm_rc.sqlBuscas.FindField('ICMS2').AsFloat;

      memprodutos.FindField('BAS0').AsFloat               := dm_rc.sqlBuscas.FindField('BASE0').AsFloat;
      memprodutos.FindField('BAS1').AsFloat               := dm_rc.sqlBuscas.FindField('BASE1').AsFloat;
      memprodutos.FindField('BAS2').AsFloat               := dm_rc.sqlBuscas.FindField('BASE2').AsFloat;

      memprodutos.FindField('SITUACAOLOCAL').AsString     := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      memprodutos.FindField('SITUACAOOUTRAS').AsString    := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;

      memprodutos.FindField('PIS').AsString               := dm_rc.sqlBuscas.FindField('PIS').AsString;
      memprodutos.FindField('COFINS').AsString            := dm_rc.sqlBuscas.FindField('COFINS').AsString;
      memprodutos.FindField('VLRPIS').AsFloat             := dm_rc.sqlBuscas.FindField('VLRPIS').AsFloat;
      memprodutos.FindField('VLRCOFINS').AsFloat          := dm_rc.sqlBuscas.FindField('VLRCOFINS').AsFloat;
      memprodutos.FindField('IVA').AsFloat                := dm_rc.sqlBuscas.FindField('IVA').AsFloat;
    end;
end;

procedure TfrmNOTAELETRONICA.D1Click(Sender: TObject);
begin
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR AS DUPLICATAS?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Duplicata(mm.varI_Code_Company,
                                                 FDQryFiltro.FindField('CODIGO').AsInteger,
                                                 0);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmNOTAELETRONICA.d2Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltro.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error' , false );
      abort
    end;

  mm.varI_Code_Documento_Controle := FDQryFiltro.FindField('CODIGO').AsInteger;
  frmdeclaracaoretirada.ShowModal();

  mm.varI_Code_Documento_Controle := 0;
end;

procedure TfrmNOTAELETRONICA.D4Click(Sender: TObject);
begin
  inherited;

  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.open;
  //********************************************//
  dm_rc.memprodutos.Append;
  dm_rc.memprodutos.CopyRecord(memprodutos);
  dm_rc.memprodutos.Post;
  //********************************************//
  frmDETALHESITENSNOTA.ShowModal();
  //********************************************//
  memprodutos.Edit;
  memprodutos.CopyRecord(dm_rc.memprodutos);
  memprodutos.Post;
  //********************************************//
end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  if FDQryFiltro.RecordCount > 0 then
    begin
      pgBaseCadControl.ActivePage := paBaseRegData1;

      try
        FDQryCad.Close ;
        for i := 0 to  FDQryCad.Params.Count - 1 do
        begin
          Cmp :=  FDQryCad.Params[i].Name;
           FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
        end;
         FDQryCad.Open;

        FDQrypessoas.Close ;
        for i := 0 to  FDQrypessoas.Params.Count - 1 do
        begin
          Cmp :=  FDQrypessoas.Params[i].Name;
           FDQrypessoas.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
        end;
         FDQrypessoas.Open;

      Except
         FDQryCad.Params[0].AsInteger := -1 ;
         FDQryCad.Open;
      End;

      if not( FDQryCad.Active) then
        begin
          FDQryCad.Open;
        end;

      if FDQryCad.RecordCount > 0 then
        SetBut(tpListacomRegistros);

      pgBaseCadControl.ActivePage := paBaseRegData1;

      carregadados();
    end;
end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmNOTAELETRONICA.E1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := FDQryCad.FindField('CODIGO').AsInteger;
  frmSEFAZNOTA.ShowModal();

  FDQryFiltro.Refresh;
  FDQryCad.Refresh;
end;

procedure TfrmNOTAELETRONICA.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;

  TabelaOperacao('select financeiro from operacoes where codigo = ' + IntToStr(FDQryCad.FindField('OPERACAO').AsInteger));
  executasql    (' update mvitens set mvitens.empresa = 0         ' +
                 ' where numero                       =           ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
                 ' and documento                      =           ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                        =           ' + IntToStr(mm.varI_Code_Company));

  executasql    (' update                               ' + variif(DM_RC.FDQryoperacoes.FindField('financeiro').AsInteger = 1,'receber','pagar')+' set empresa = 0' +
                 ' where numero                       = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
                 ' and documento                      = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                        = ' + IntToStr(mm.varI_Code_Company));
  FDQryCad.Edit;
  FDQryCad.FindField('EMPRESA').AsInteger := 0;
  FDQryCad.Post;

  try
    if  FDQryFiltro.Active then
      FDQryFiltro.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            FDQryCad.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    LimpaVars;
    tbtitulos.Close;
    memprodutos.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmNOTAELETRONICA.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.FDQryFiltrostatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroCANCELADA.AsString = 'A' then
        Text := '<span class="badge badge-success">Homologada</span>'
      else
      if FDQryFiltroCANCELADA.AsString = 'C' then
        Text := '<span class="badge badge-danger">Cancelada</span>'
      else
        Text := '<span class="badge badge-warning">Aguarde</span>';
    end;
end;

procedure TfrmNOTAELETRONICA.geradescricaonota;
begin
  memprodutos.FindField('DESCRICAO_NOTA').AsString := 'Sementes de '  + StrAllTrim(memprodutos.FindField('SEMENTENOME').AsString)          +
                                                      ' CV '          + StrAllTrim(memprodutos.FindField('CULTIVAR').AsString)             + ' - '  +
                                                      'Termo  '       + memprodutos.FindField('TERMOSEMENTE').AsString                     + ' - '  +
                                                      'Lote:  '       + StrAllTrim(memprodutos.FindField('LOTESEMENTE').AsString)          + ' - ' +
                                                      'Categoria: '   + StrAllTrim(memprodutos.FindField('CATEGORIA').AsString);

  if memprodutos.FindField('PESOSACO').AsFloat > 0 then
    begin
      memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;
      memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;
    end;
end;

procedure TfrmNOTAELETRONICA.gravamemoria;
begin
  if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('QUANTIDADE').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque a QUANTIDADE!' , 'warning' , false );
            memprodutos.FindField('QUANTIDADE').FocusControl;
            Abort;
          end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('PRECO').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque o PREÇO!' , 'warning' , false );
            memprodutos.FindField('PRECO').FocusControl;
            Abort;
          end;

      memprodutos.FindField('TOTAL').AsFloat  := memprodutos.FindField('PRECO').AsFloat *
                                                 memprodutos.FindField('QUANTIDADE').AsFloat;

      if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
        begin
          memprodutos.FindField('TOTALPONTO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat *
                                                         memprodutos.FindField('PUREZA').AsFloat;
          geradescricaonota();
        end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          ValidaInfoProdutoMemoria(StrToInt(UniButtonDbEditcodigooperacaomestre.Text),
                                            memprodutos.FindField('PRODUTO').AsInteger,
                                            mm.varI_Code_Company);
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.GravaMovimento;
begin

  TabelaMvitens ('select * from mvitens where codigo            = 0');
  TabelaPontos  ('select * from pontos  where codigo            = 0');
  TabelaOperacao('select *          from operacoes where codigo =  ' + QuotedStr(FDQryCad.FindField('OPERACAO').AsString));
  TabelaTitulos ('select * from                                    ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') + ' where codigo = 0');

  Exclui_Movimento('MVITENS',FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,1,FDQryCad.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS' ,FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,1,FDQryCad.FindField('NUMERO').AsInteger);
  Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,1,FDQryCad.FindField('NUMERO').AsInteger);


  memprodutos.DisableControls;
  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.tbmvitens.Append;
          dm_rc.tbmvitens.FindField('SEQUENCIA').AsInteger      := memprodutos.RecNo;
          dm_rc.tbmvitens.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.tbmvitens.FindField('DOCUMENTO').AsInteger      := FDQryCad.FindField('DOCUMENTO').AsInteger;
          dm_rc.tbmvitens.FindField('NUMERO').AsInteger         := FDQryCad.FindField('NUMERO').AsInteger;
          dm_rc.tbmvitens.FindField('SERIE').AsString           := FDQryCad.FindField('SERIE').AsString;
          dm_rc.tbmvitens.FindField('UF').AsString              := UniDBEditestado.Text;
          dm_rc.tbmvitens.FindField('PESSOA').AsInteger         := FDQryCad.FindField('PESSOA').AsInteger;
          dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;

          dm_rc.tbmvitens.FindField('OPERACAO').AsFloat         := FDQryCad.FindField('OPERACAO').AsFloat;
          dm_rc.tbmvitens.FindField('CODREFERENCIA').AsString   := memprodutos.FindField('CODREFERENCIA').AsString;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NUMERONCM').AsString;
          dm_rc.tbmvitens.FindField('UNIDADE').AsString         := memprodutos.FindField('UNIDADE').AsString;
          dm_rc.tbmvitens.FindField('PRECO').AsFloat            := memprodutos.FindField('PRECO').AsFloat;
          dm_rc.tbmvitens.FindField('DESCONTO').AsFloat         := memprodutos.FindField('DESCONTO').AsFloat;
          dm_rc.tbmvitens.FindField('DESPESAS').AsFloat         := memprodutos.FindField('DESPESA').AsFloat;
          dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat;
          dm_rc.tbmvitens.FindField('TOTAL').AsFloat            := memprodutos.FindField('TOTAL').AsFloat;
          dm_rc.tbmvitens.FindField('CST').AsString             := memprodutos.FindField('CST').AsString;
          dm_rc.tbmvitens.FindField('PERCICMS').AsFloat         := memprodutos.FindField('PERCICMS').AsFloat;
          dm_rc.tbmvitens.FindField('VALORICMS').AsFloat        := memprodutos.FindField('VALORICMS').AsFloat;
          dm_rc.tbmvitens.FindField('BASEICMS').AsFloat         := memprodutos.FindField('BASEICMS').AsFloat;
          dm_rc.tbmvitens.FindField('GRUPO').AsInteger          := memprodutos.FindField('GRUPO').AsInteger;
          dm_rc.tbmvitens.Findfield('CUSTO').AsFloat            := memprodutos.FindField('CUSTO').AsFloat;
          dm_rc.tbmvitens.Findfield('COMPRA').AsFloat           := memprodutos.FindField('COMPRA').AsFloat;
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NCM').AsString;
          dm_rc.tbmvitens.FindField('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('SEGURO').AsFloat           := memprodutos.FindField('SEGURO').AsFloat;
          dm_rc.tbmvitens.Findfield('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('IVA').AsFloat              := memprodutos.FindField('IVA').AsFloat;
          dm_rc.tbmvitens.Findfield('PERCSUB').AsFloat          := memprodutos.FindField('PERCSUB').AsFloat;

          dm_rc.tbmvitens.Findfield('BASESUB').AsFloat          := memprodutos.FindField('BASESUB').AsFloat;
          dm_rc.tbmvitens.Findfield('VALORSUB').AsFloat         := memprodutos.FindField('VALORSUB').AsFloat;

          dm_rc.tbmvitens.Findfield('PIS').AsString             := memprodutos.FindField('PIS').AsString;
          dm_rc.tbmvitens.Findfield('COFINS').AsString          := memprodutos.FindField('COFINS').AsString;
          dm_rc.tbmvitens.Findfield('VLRPIS').AsString          := memprodutos.FindField('VLRPIS').AsString;
          dm_rc.tbmvitens.Findfield('VLRCOFINS').AsString       := memprodutos.FindField('VLRCOFINS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALPIS').AsString        := memprodutos.FindField('TOTALPIS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALCOFINS').AsString     := memprodutos.FindField('TOTALCOFINS').AsString;

          dm_rc.tbmvitens.Findfield('PERCREDUCAO').AsFloat      := memprodutos.FindField('PERCREDUCAO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOBRUTO').AsFloat        := memprodutos.FindField('PESOBRUTO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOLIQUIDO').AsFloat      := memprodutos.FindField('PESOLIQUIDO').AsFloat;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('CANCELADA').AsString          := FDQryCad.FindField('CANCELADA').AsString;
          dm_rc.tbmvitens.FindField('KEY').AsString                := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger            := Ultimo_Codigo('MVITENS','CODIGO',True);

          dm_rc.tbmvitens.Post;
        end;
      memprodutos.Next;
    end;
  memprodutos.First;
  memprodutos.EnableControls;

  TabelaOperacao('select * from operacoes where codigo =  ' + QuotedStr(FDQryCad.FindField('OPERACAO').AsString));
  tbtitulos.DisableControls;
  tbtitulos.First;
  while not tbtitulos.Eof do
    begin
      dm_rc.fdqrytitulos.UpdateOptions.UpdateTableName := variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR');

      dm_rc.fdqrytitulos.Append;
      dm_rc.fdqrytitulos.FindField('NUMERO').AsInteger       := FDQryCad.FindField('NUMERO').AsInteger;
      dm_rc.fdqrytitulos.FindField('DOCUMENTO').AsInteger    := FDQryCad.FindField('DOCUMENTO').AsInteger;
      dm_rc.fdqrytitulos.FindField('SERIE').AsString         := FDQryCad.FindField('SERIE').AsString;
      dm_rc.fdqrytitulos.FindField('PESSOA').AsInteger       := FDQryCad.FindField('PESSOA').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMISSAO').AsDateTime     := FDQryCad.FindField('EMISSAO').AsDateTime;

      dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsInteger    := tbtitulos.FindField('PARCELA').AsInteger;
      dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime  := tbtitulos.FindField('VENCIMENTO').AsDateTime;
      dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat     := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('VALORORIGINAL').AsFloat  := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('CONFIRMABOLETO').AsString:= 'F';
      dm_rc.fdqrytitulos.FindField('SITUACAO').AsString      := 'Aberto';

      dm_rc.fdqrytitulos.FindField('FINANCEIRO').AsInteger   := dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger;
      dm_rc.fdqrytitulos.FindField('FUNCIONARIO').AsInteger  := FDQryCad.FindField('FUNCIONARIO').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;

      dm_rc.fdqrytitulos.FindField('APLICACAO').AsInteger    := 0;
      dm_rc.fdqrytitulos.FindField('PLANOCONTAS').AsInteger  := 0;
      dm_rc.fdqrytitulos.FindField('CARTEIRA').AsInteger     := 00001;
      dm_rc.fdqrytitulos.FindField('PORTADOR').AsInteger     := 9999;


      if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1 then
        begin
          dm_rc.fdqrytitulos.FindField('PEDIDO').AsString      := FDQryCad.FindField('PEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PERCCOMISSAO').AsFloat := FDQryCad.FindField('COMISSAOFUNCIONARIO').AsFloat;
        end;

      dm_rc.fdqrytitulos.FindField('VALORDESCONTOS').AsFloat := 0;
      dm_rc.fdqrytitulos.FindField('VALORJUROS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORTAXAS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORPAGO').AsFloat      := 0;
      dm_rc.fdqrytitulos.FindField('VALORDIVERSOS').AsFloat  := 0;

      dm_rc.fdqrytitulos.FindField('KEY').AsString           := Gera_Guid();
      dm_rc.fdqrytitulos.FindField('CODIGO').AsInteger       := Ultimo_Codigo(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),'CODIGO',True);
      dm_rc.fdqrytitulos.Post;

      tbtitulos.Next;
    end;

  tbtitulos.First;
  tbtitulos.EnableControls;

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];

end;

procedure TfrmNOTAELETRONICA.HabilitaMenuAdiiconais(tipo: Boolean);
begin
  if tipo = False then
    begin
      I1.Enabled := True; //importar documento
      I2.Enabled := True; //imposto diferenciado
      E1.Enabled := False; //envio eletronico
    end;

  if tipo = True then
    begin
      I1.Enabled := False; //importar documento
      I2.Enabled := False; //imposto diferenciado
      E1.Enabled := True; //envio eletronico
    end;
end;

procedure TfrmNOTAELETRONICA.I1Click(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
  if mm.varI_Code_Documento_Controle <> 0 then
    CarregaImportacao(mm.varI_Code_Documento_Controle);
end;

procedure TfrmNOTAELETRONICA.I2Click(Sender: TObject);
begin
  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.CopyDataSet(memprodutos);

  mm.VarC_Atelagenerica            := 'CALCULAICMS';
  frmTELAGENERICA.ShowModal();

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.Close;
  memprodutos.Open;

  dm_rc.memprodutos.First;
  while not dm_rc.memprodutos.eof do
    begin
      if dm_rc.memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          memprodutos.Append;
          memprodutos.CopyRecord(dm_rc.memprodutos);
          memprodutos.Post;
        end;
      dm_rc.memprodutos.Next;
    end;

  dm_rc.memprodutos.Close;

  UniDBFormattedNumberEdit2.Value := mm.varR_Value_BASEICMS;
  UniDBFormattedNumberEdit3.Value := mm.varR_Value_VALORICMS;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;
end;

procedure TfrmNOTAELETRONICA.L1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := FDQryFiltro.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica           := 'LOGNOTAELETRONICA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.LimpaVars;
begin
  UniEditdescricaocondicao.Text := '';
  UniEditnomevendedor.Text      := '';
  UniEditnome.Text              := '';
  UniEditcpfcnpj.Text           := '';
  UniEditinscricao.Text         := '';
  UniEditrenasem.Text           := '';
  UniComboBoxparaop.Clear;
end;

procedure TfrmNOTAELETRONICA.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  SqlPesquisa('select * from mvmestre, pessoas where mvmestre.codigo = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger) +
              ' and mvmestre.pessoa = pessoas.codigo');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

  SqlPesquisa('select * from mvitens where mvitens.numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
              ' and mvitens.documento                     = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
              ' and mvitens.empresa                       = ' + IntToStr(mm.varI_Code_Company)                     +
              ' order by mvitens.sequencia');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

end;

procedure TfrmNOTAELETRONICA.memprodutosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmNOTAELETRONICA.memprodutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmNOTAELETRONICA.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmNOTAELETRONICA.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  gravamemoria();
end;

procedure TfrmNOTAELETRONICA.memprodutosbuscaloteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Lote" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.memprodutosexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.memprodutosopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Produtos" class="fas fa-asterisk" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.Parametrocfoppessoa;
begin
  SqlPesquisa   ('select descricao, op_interna, op_externa from PARAMETROSOPERACAO where descricao = ' + QuotedStr(UniComboBoxparaop.Text));
  TabelaEmpresas('select *     from empresas where codigo                                          = ' + IntToStr(mm.varI_Code_Company));

  FDQryCad.Edit;
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
    FDQryCad.FindField('OPERACAO').AsInteger := dm_rc.sqlBuscas.FindField('OP_INTERNA').AsInteger
  else
    if FDQrypessoas.FindField('ESTADO').AsString = 'EX' then
      FDQryCad.FindField('OPERACAO').AsInteger := 7102
    else
      FDQryCad.FindField('OPERACAO').AsInteger := dm_rc.sqlBuscas.FindField('OP_EXTERNA').AsInteger;
end;

PROcedure TfrmNOTAELETRONICA.ReleituraProdutoscfop;
begin
  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;

  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          memprodutos.Edit;
          ValidaInfoProdutoMemoria(FDQryCad.FindField('OPERACAO').AsFloat,
                                   memprodutos.FindField('PRODUTO').AsInteger,
                                   MM.varI_Code_Company);
          memprodutos.Post;
        end;

      memprodutos.Next;
    end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.Refresh;

  memprodutos.EnableControls;
  memprodutos.First;
end;

procedure TfrmNOTAELETRONICA.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCalcReg.Visible    := True;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := True;
       btntransp.Visible     := True;
       btnOptions.Visible    := True;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btntransp.Visible     := False;
        btnOptions.Visible    := False;
      end
   else if acao in [tpCalcular] then
     begin
        btnNewReg.Visible     := false;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := True;
        btnCancelReg.Visible  := True;
        btnSaveReg.Visible    := True;
        btntransp.Visible     := True;
        btnOptions.Visible    := True;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := True;
        btnDeleteReg.Visible  := True;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btntransp.Visible     := True;
        btnOptions.Visible    := True;
       end;

end;
procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigocondicaomestreButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CONDICOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CONDICAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigocondicaomestreExit(
  Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditdescricaocondicao.Text      := Acha_Item('CONDICOES',FDQryCad.FindField('CONDICAO').AsString);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigofuncionariomestreButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('FUNCIONARIO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigofuncionariomestreExit(
  Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if SqlPesquisa('SELECT NOME, COMISSAO FROM FUNCIONARIOS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigofuncionariomestre.Text)) then
        begin
          UniEditnomevendedor.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
          FDQryCad.FindField('COMISSAOFUNCIONARIO').AsFloat := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigopessoasButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigopessoasExit(Sender: TObject);
var
i:integer;
Cmp:String;
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcodigopessoas.Text <> '') and (UniButtonDbEditcodigopessoas.Text <> '0') then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigopessoas.Text)) then
            begin
              UniEditnome.Text         := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditcpfcnpj.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
              UniEditinscricao.Text    := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
              UniEditrenasem.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;

              FDQrypessoas.Close;
              for i := 0 to  FDQrypessoas.Params.Count - 1 do
                begin
                  Cmp                          :=  FDQrypessoas.Params[i].Name;
                  FDQrypessoas.Params[i].Value :=  FDQryCad.FieldbyName(Cmp).Value;
                end;
              FDQrypessoas.Open;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Pessoa!' , 'warning' , false );
          end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditTRANSPORTADORAButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('TRANSPORTADORA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditTRANSPORTADORA.Text <> '') and (UniButtonDbEditTRANSPORTADORA.Text <> '0') then
        begin
          if SqlPesquisa('SELECT NOME, CPFCNPJ FROM TRANSPORTES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditTRANSPORTADORA.Text)) then
            begin
              FDQryCad.FindField('TRANOME').AsString      := dm_rc.sqlBuscas.FindField('NOME').AsString;
              FDQryCad.FindField('TRACPFCNPJ').AsString   := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Transportadora!' , 'warning' , false );
          end;
    end;

end;

procedure TfrmNOTAELETRONICA.UniButtonEditpessoasButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniDBFormattedNumberEditdescontosExit(
  Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAELETRONICA.UniDBFormattedNumberEditvlrdespesasExit(
  Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAELETRONICA.UniDBGridprodutosCellClick(
  Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
   Linha  := TStringGrid(UniDBGridprodutos).Row;
   Coluna := UniDBGridprodutos.CurrCol;

  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
{
      if Column.FieldName = 'opcoes' then
        begin
          dm_rc.memprodutos.Close;
          dm_rc.memprodutos.open;
          //********************************************//
          dm_rc.memprodutos.Append;
          dm_rc.memprodutos.CopyRecord(memprodutos);
          dm_rc.memprodutos.Post;
          //********************************************//
          frmDETALHESITENSNOTA.ShowModal();
          //********************************************//
          memprodutos.Edit;
          memprodutos.CopyRecord(dm_rc.memprodutos);
          memprodutos.Post;
          //********************************************//
        end;
}
      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              memprodutos.Delete;
            end
        end;

      if Column.FieldName = 'buscaproduto' then
        begin
          MM.Seta_Busca('PRODUTOS');
          UniFfrmPesquisa.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               memprodutos.Edit;
               carregaprodutos(MM.varC_codigo_busca);
             end;
           end);
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniPageControlnota.ActivePage      := UniTabSheetgeral;
  UniPageControlprodutos.ActivePage  := UniTabSheetProdutos;
  labTitleForm.Caption               := 'NOTA ELETRÔNICA';
  varC_Documento_MvmestreNFE         := 1;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  cbxSearchCRUDFieldordem.ItemIndex  := 1;
  cbxSearchCRUDFieldstatus.ItemIndex := 2;
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmNOTAELETRONICA.UniMenuItem1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Documento_Controle  := FDQryFiltro.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica            := 'ALTERADETALHESNOTA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.ValidaInfoProdutoMemoria(foperacao:real; fproduto,fempresa: integer);
begin
  TabelaOperacao('SELECT SUBSTITUICAO,CODIGO,UNICA FROM OPERACOES WHERE CODIGO  = ' + QuotedStr(FloatToStr(foperacao)));
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO                          = ' + IntToStr(fempresa));
  SqlProdutos   ('SELECT SITUACAOLOCAL,SITUACAOOUTRAS FROM SALDOS WHERE PRODUTO = ' + IntToStr(fproduto)+
                'AND EMPRESA                                                    = ' + IntToStr(fempresa));

  if UniDBEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOLOCAL').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsFloat = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
   end
  else
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOOUTRAS').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;

     if UniButtonDbEditcodigooperacaomestre.Text = '7102' then
       begin
         memprodutos.FindField('CST').AsString := '041';
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end;
   end;

end;

initialization
  RegisterClass(TfrmNOTAELETRONICA);
end.
