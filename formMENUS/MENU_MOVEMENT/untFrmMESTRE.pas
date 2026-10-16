unit untFrmMESTRE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniEdit, UniButtonEdit, uniScrollBox,
  uniPageControl, uniLabel, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  UniButtonDbEdit, uniDBDateTimePicker, uniDBEdit, uniMemo, uniDBMemo,
  System.DateUtils, uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);

  TfrmMESTRE = class(TfrmBase)
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
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroVLRTOTAL: TFMTBCDField;
    FDQryFiltroopcoes: TStringField;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    dstitulos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    tbtitulosexclui: TStringField;
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
    UniPopupMenudetalhes: TUniPopupMenu;
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    N1: TUniMenuItem;
    i2: TUniMenuItem;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBDateTimePickeremissao: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniButtonDbEditcodigopessoas: TUniButtonDbEdit;
    UniButtonDbEditcondicao: TUniButtonDbEdit;
    UniLabel6: TUniLabel;
    UniEditdescricaocondicao: TUniEdit;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniEditnome: TUniEdit;
    UniEditclentecpf: TUniEdit;
    UniEditclienterg: TUniEdit;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniButtonEditclientecep: TUniButtonEdit;
    UniEditclienteendereco: TUniEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniEditclientenumero: TUniEdit;
    UniLabel15: TUniLabel;
    UniEditclientebairro: TUniEdit;
    UniLabel16: TUniLabel;
    UniEditclientemunicipio: TUniEdit;
    UniLabel17: TUniLabel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    UniEditclienteestado: TUniEdit;
    UniLabel19: TUniLabel;
    UniEditclientetelefone: TUniEdit;
    UniLabel20: TUniLabel;
    UniEditclientecelular: TUniEdit;
    UniLabel21: TUniLabel;
    UniEditclienteemail: TUniEdit;
    UniLabel22: TUniLabel;
    rcBlock200: TUniContainerPanel;
    UniLabel23: TUniLabel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    UniButtonDbEditvendedor: TUniButtonDbEdit;
    UniLabel24: TUniLabel;
    UniEditnomevendedor: TUniEdit;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel27: TUniLabel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniLabel29: TUniLabel;
    rcBlock270: TUniContainerPanel;
    rcBlock280: TUniContainerPanel;
    UniDBEdittestemunhai: TUniDBEdit;
    UniDBEditcpftestemunhai: TUniDBEdit;
    UniDBEdittestemunhaii: TUniDBEdit;
    UniDBEditcpftestemunhaii: TUniDBEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    rcBlock290: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniDBMemoobservacao: TUniDBMemo;
    rcBlock300: TUniContainerPanel;
    UniLabel33: TUniLabel;
    rcBlock310: TUniContainerPanel;
    dbgTITULOS: TUniDBGrid;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    rcBlock340: TUniContainerPanel;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    UniLabel34: TUniLabel;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    UniLabel35: TUniLabel;
    UniDBFormattedNumberEditvlrentrada: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel36: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel37: TUniLabel;
    UniDBFormattedNumberEditdescontoreal: TUniDBFormattedNumberEdit;
    UniLabel38: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel39: TUniLabel;
    rcBlock380: TUniContainerPanel;
    UniDBGridprodutos: TUniDBGrid;
    memprodutosALTURA: TStringField;
    memprodutosLARGURA: TStringField;
    memprodutosCOMPRIMENTO: TStringField;
    I3: TUniMenuItem;
    C1: TUniMenuItem;
    O1: TUniMenuItem;
    M1: TUniMenuItem;
    M2: TUniMenuItem;
    o2: TUniMenuItem;
    N2: TUniMenuItem;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    N5: TUniMenuItem;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroSTATUS: TStringField;
    P1: TUniMenuItem;
    O3: TUniMenuItem;
    N6: TUniMenuItem;
    memprodutosCODREFERENCIA: TStringField;
    UniScreenMask1: TUniScreenMask;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCalcRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btntranspClick(Sender: TObject);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure UniButtonDbEditcondicaoButtonClick(Sender: TObject);
    procedure UniButtonDbEditcondicaoExit(Sender: TObject);
    procedure UniButtonDbEditvendedorButtonClick(Sender: TObject);
    procedure UniButtonDbEditvendedorExit(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontorealExit(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure I3Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure UniButtonEditclientecepButtonClick(Sender: TObject);
    procedure UniButtonEditclientecepExit(Sender: TObject);
    procedure UniButtonEditpessoasButtonClick(Sender: TObject);
    procedure F1Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  iCurrentPage : integer;
  varC_Documento_Mvmestre : Integer;

  procedure  ativabusca();
  procedure  rc_DefaultTitleForm;
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  LimpaVars();
  procedure  Calcula_Totais();
  procedure  gravamemoria();
  procedure  exclui();
  procedure  Calcula_Titulos();
  function   CamposValidados: Boolean;
  procedure  GravaMovimento();
  procedure  carregaprodutos(codigo: string);
  procedure  carregadados();
  procedure  verificapessoa(const f_codpessoa:integer);
  procedure  CarregaImportacao(const controle: integer);
  procedure  AtualizaDocOrigem(const numero,serie,documento:string);
  procedure  HabilitaCombobox(status:boolean);
  procedure  VerificaEdicao();
  end;

var
  frmMESTRE: TfrmMESTRE;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, mkm_layout, System.TypInfo, untDM_RC,
  mkm_procedures, uniGUITypes, untFrmTELAGENERICA, mkm_funcoes,
  untFrmTRANSPORTADORAMOVIMENTO, untFrmPesquisa, Vcl.Grids,
  untFrmPesquisaProduto, Vcl.Clipbrd, mkm_impressao, unReportImpressao,
  untFrmTransfereImportacao, uniDBComboBox, untFrmPDV;

{ TfrmMESTRE }

procedure TfrmMESTRE.ativabusca;
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

procedure TfrmMESTRE.AtualizaDocOrigem(const numero, serie, documento:string);
var
  sql : string;
begin
  if numero <> '' then
    begin
      sql := ' update mvmestre set status = ' + QuotedStr('Vendido') +
             ' where numero               = ' + QuotedStr(numero)    +
             ' and serie                  = ' + QuotedStr(serie)     +
             ' and documento              = ' + QuotedStr(documento);
      executasql(sql);
    end;
end;

procedure TfrmMESTRE.btnCalcRegClick(Sender: TObject);
begin
  inherited;

  dm_rc.rc_ShowYesNo( 'POSSO CALCULAR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
      if FDQryCad.FindField('CONDICAO').AsInteger = 9999 then
        begin
          mm.varV_Valor_Documento          := UniDBFormattedNumberEditvlrtotal.value;

          dm_rc.tbtitulos.Close;
          dm_rc.tbtitulos.CopyDataSet(tbtitulos);

          mm.VarC_Atelagenerica            := 'PARCELAPGTOMOVIMENTO';
          frmTELAGENERICA.ShowModal();

          tbtitulos.Close;
          tbtitulos.Open;

          tbtitulos.CopyDataSet(dm_rc.tbtitulos);
          dm_rc.tbtitulos.Close;
        end
      else
        begin
          Calcula_Totais();
          Calcula_Titulos();
        end;
    end;

  SetBut(tpCalcular);

  I1.Enabled := False;
  i2.Enabled := False;
end;

procedure TfrmMESTRE.btnCancelRegClick(Sender: TObject);
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

procedure TfrmMESTRE.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
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

procedure TfrmMESTRE.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := paBaseRegData1;

  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;

  Try

    FDQryCad.Edit;

    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];
    dbgTITULOS.Options                 := dbgTITULOS.Options        + [dgEditing];

    if FDQryCad.State in [dsInsert] then
    begin
      S := 1;
      tbtitulos.Close;
      tbtitulos.Open;

      memprodutos.Close;
      memprodutos.Open;
    end
    else
      S := memprodutos.RecordCount + 30;

    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    for R := S to S + 30 do
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

  I1.Enabled := False;
  i2.Enabled := False;
  HabilitaCombobox(False);
end;

procedure TfrmMESTRE.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := paBaseRegData1;

  SetBut(tpIncluir);
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

  SqlPesquisa('select operacao, serie, condicao, pessoa from documentos where documento = ' + IntToStr(varC_Documento_Mvmestre) +
              'and empresa                                                              = ' + IntToStr(mm.varI_Code_Company));

   FDQryCad.Append ;
   FDQryCad.FindField('PESSOA').AsInteger               := 0;
   FDQryCad.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   FDQryCad.FindField('DOCUMENTO').AsInteger            := varC_Documento_Mvmestre;
   FDQryCad.FindField('NUMERO').AsInteger               := 0;
   FDQryCad.FindField('TRAFRETE').AsInteger             := 0;
   FDQryCad.FindField('EMISSAO').AsDateTime             := Date;
   FDQryCad.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   FDQryCad.FindField('SERIE').AsString                 := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   FDQryCad.FindField('OPERACAO').AsString              := dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
   FDQryCad.FindField('CONDICAO').AsString              := dm_rc.sqlBuscas.FindField('CONDICAO').AsString;
   FDQryCad.FindField('PESSOA').AsInteger               := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
   FDQryCad.FindField('FUNCIONARIO').AsInteger          := mm.varI_User;

   FDQryCad.FindField('VLRDESCONTOS').AsFloat           := 0;
   FDQryCad.FindField('VLRPRODUTOS').AsFloat            := 0;
   FDQryCad.FindField('VLRDESPESAS').AsFloat            := 0;
   FDQryCad.FindField('VLRTOTAL').AsFloat               := 0;


  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];
  dbgTITULOS.Options                 := dbgTITULOS.Options        + [dgEditing];


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

  for R := S to S + 100 do
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

  UniButtonDbEditcodigopessoas.SetFocus;
  UniButtonDbEditcodigopessoas.SelectAll;
  UniButtonDbEditvendedor.OnExit(Self);

  I1.Enabled := True;
  i2.Enabled := False;

  HabilitaCombobox(False);
end;

procedure TfrmMESTRE.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmMESTRE.btnSaveRegClick(Sender: TObject);
var
  vdup:real;
  M_MARCAM,
  M_MARCAF  : TBookMark;
begin
  inherited;

  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
           FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo('MVMESTRE','CODIGO',True);
           FDQryCad.FindField('NUMERO').AsInteger := Ultimo_Numero(mm.varI_Code_Company,varC_Documento_Mvmestre,'GRAVAR');
         end;

       verificapessoa(FDQryCad.FindField('PESSOA').AsInteger);

       if mm.varT_code_tipo_transportadora = '' then
         FDQryCad.FindField('TRAFRETE').AsInteger         := 0;

       FDQryCad.Post;

       GravaMovimento();
       if FDQryCad.State in [dsInsert] then
         begin

           AtualizaDocOrigem(FDQryCad.FindField('PEDIDO').AsString,
                             FDQryCad.FindField('PEDIDO_SERIE').AsString,
                             FDQryCad.FindField('PEDIDO_DOCUMENTO').AsString);

         end;

       try
         mm.FDTransaction.CommitRetaining;
         mm.FDTransaction.Commit;

         M_MARCAM  := FDQryCad.GetBookmark;

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;
     End;

  FDQryCad   .GotoBookmark(M_MARCAM);
  FDQryCad   .FreeBookmark(M_MARCAM);

//  FDQryCad.Refresh;
  SetBut(tpListacomRegistros);

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  I1.Enabled := False;
  i2.Enabled := True;
  HabilitaCombobox(True);

end;

procedure TfrmMESTRE.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmMESTRE.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  VerificaEdicao();
  case cbxSearchCRUDFieldordem.ItemIndex of
    0: M_ORDEM := ' ORDER BY M.EMISSAO';
    1: M_ORDEM := ' ORDER BY M.NUMERO';
    2: M_ORDEM := ' ORDER BY M.PESSOA';
  end;

  CAMPOS  := ' M.CODIGO, M.NUMERO,M.DOCUMENTO,M.EMISSAO,M.SERIE,M.CANCELADA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.STATUS,M.VLRTOTAL ';
  M_AND   := ' AND M.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
             ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));;

  SQL :=    ' SELECT          ' + CAMPOS +
            ' FROM   MVMESTRE ' +
            ' M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)        ' +
            variif(UniButtonEditpessoas.Text              = '0'    ,'','AND M.PESSOA      = '  + QuotedStr(UniButtonEditpessoas.Text))      +
            variif(UniButtonEditnumero.Text               = '0'    ,'','AND M.NUMERO      = '  + QuotedStr(UniButtonEditnumero.Text))       +
            ' AND M.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company) +
            ' AND M.DOCUMENTO                             = ' + IntToStr(varC_Documento_Mvmestre);

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL + variif(UniButtonEditpessoas.Text  = '0',M_AND,'') + M_SITUACAO + M_ORDEM;
  FDQryFiltro.Open();

  if FDQryFiltro.RecordCount > 0 then
    begin
      SetBut(tpListacomRegistros);
      FDQryFiltro.Last;
    end
  else
    SetBut(tpListaVazia);
end;

procedure TfrmMESTRE.btntranspClick(Sender: TObject);
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

procedure TfrmMESTRE.C1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_contrato(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmMESTRE.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
  M_TOTAL    : Real;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcondicao.Text)) then

  ORDEM      := 0;
  M_TOTAL    := 0;
  M_PARCELAS := Explode(TRIM(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');

  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value - UniDBFormattedNumberEditvlrentrada.Value;
  M_TOTAL    := UniDBFormattedNumberEditvlrtotal.Value - UniDBFormattedNumberEditvlrentrada.Value;

  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger);


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
      tbtitulos.FindField('VENCIMENTO').AsDateTime := UniDBDateTimePickeremissao.DateTime + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound(M_TOTAL / M_ITENS,2);
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

procedure TfrmMESTRE.Calcula_Totais;
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

  if UniDBFormattedNumberEditdescontoreal.Value > 0 then
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
      M_VLRRESTO   := UniDBFormattedNumberEditdescontoreal.Value ;
      M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontoreal.Value);
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat),2),2);
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
      else
        if M_VLRRESTO < 0 then
          memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
      if M_VLRLIQUIDO > 0 then
        memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
      else
        if M_VLRLIQUIDO < 0 then
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
              memprodutos.FindField('LIQUIDO').AsFloat  := memprodutos.FindField('TOTAL').AsFloat;
              memprodutos.FindField('DESCONTO').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
    end;

  memprodutos.First;
  while not memprodutos.eof do
  begin
    if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
      memprodutos.Post;
    end;
    memprodutos.next;
    Application.ProcessMessages;
  end;


  //**********************************************************************//
  // CALCULA DESCONTO UNITARIO
  //**********************************************************************//
  if UniDBFormattedNumberEditdescontoreal.Value > 0 then
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
    M_VLRRESTO := UniDBFormattedNumberEditdescontoreal.Value;
    M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontoreal.Value);
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
      M_PESO  := M_PESO  + memprodutos.FindField('QUANTIDADE').AsFloat;
      M_BRUTO := M_BRUTO + memprodutos.FindField('QUANTIDADE').AsFloat;

      memprodutos.Edit;
      memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
      memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
      memprodutos.Post;
      //*****************************************************************//

      //*****************************************************************//
      // VALORES
      //*****************************************************************//
      M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat;
      M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
      M_VLRDESCONTO := M_VLRDESCONTO + memprodutos.FindField('DESCONTO').AsFloat;
      M_FRETE       := M_FRETE       + memprodutos.FindField('FRETE').AsFloat;
      M_SEGURO      := M_SEGURO      + memprodutos.FindField('SEGURO').AsFloat;
      M_BASE        := M_BASE        + memprodutos.FindField('BASEICMS').AsFloat;
      M_VICM        := M_VICM        + memprodutos.FindField('VALORICMS').AsFloat;
      M_VLRTOTAL    := M_VLRTOTAL    + memprodutos.FindField('LIQUIDO').AsFloat + memprodutos.FindField('FRETE').AsFloat    +
                                                                                  memprodutos.FindField('VALORIPI').AsFloat +
                                                                                  memprodutos.FindField('DESPESA').AsFloat  +
                                                                                  memprodutos.FindField('SEGURO').AsFloat;

      //*****************************************************************//
    end;
    memprodutos.next;
  end;

  UniDBFormattedNumberEditvlrprodutos.Value     := MRound(M_VLRPRODUTOS,2);
  UniDBFormattedNumberEditvlrtotal.Value        := MRound(M_VLRTOTAL,2);

  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.EnableControls;

end;

function TfrmMESTRE.CamposValidados: Boolean;
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

procedure TfrmMESTRE.carregadados;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES',IntToStr(FDQryCad.FindField('CONDICAO').AsInteger));
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(FDQryCad.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + IntToStr(FDQryCad.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnome.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditclentecpf.Text                     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditclienterg.Text                     := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniButtonEditclientecep.Text              := dm_rc.sqlBuscas.FindField('CEP').AsString;
      UniEditclienteendereco.Text               := dm_rc.sqlBuscas.FindField('ENDERECO').AsString;
      UniEditclientenumero.Text                 := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      UniEditclientebairro.Text                 := dm_rc.sqlBuscas.FindField('BAIRRO').AsString;
      UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      UniEditclientetelefone.Text               := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
      UniEditclientecelular.Text                := dm_rc.sqlBuscas.FindField('CELULAR').AsString;
      UniEditclienteemail.Text                  := dm_rc.sqlBuscas.FindField('EMAIL').AsString;
      UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
    end;

  SqlPesquisa   ('SELECT FINANCEIRO FROM OPERACOES WHERE CODIGO   = ' + IntToStr(FDQryCad.FindField('OPERACAO').AsInteger));
  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, VALORORIGINAL FROM ' + variif(dm_rc.sqlBuscas.FindField('FINANCEIRO').AsInteger = 1,' RECEBER ', ' PAGAR ')+' WHERE NUMERO = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
                 ' AND DOCUMENTO                                                         = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
                 ' AND EMPRESA                                                           = ' + IntToStr(mm.varI_Code_Company)                     +
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

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
                 ' AND DOCUMENTO                        = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
                 ' AND EMPRESA                          = ' + IntToStr(mm.varI_Code_Company)                     +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('CODREFERENCIA').AsString  :=  dm_rc.sqlBuscas.FindField('CODREFERENCIA').AsString;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;

        memprodutos.FindField('ALTURA').AsString         :=  dm_rc.sqlBuscas.FindField('ALTURA').AsString;
        memprodutos.FindField('LARGURA').AsString        :=  dm_rc.sqlBuscas.FindField('LARGURA').AsString;
        memprodutos.FindField('COMPRIMENTO').AsString    :=  dm_rc.sqlBuscas.FindField('COMPRIMENTO').AsString;
        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;

    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.first;
  end;
end;

procedure TfrmMESTRE.CarregaImportacao(const controle: integer);
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

  FDQryCad.FindField('TRANSPORTADORA').AsInteger    :=  dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger;
  FDQryCad.FindField('TRANOME').AsString            :=  dm_rc.FDQryMvmestre.FindField('TRANOME').AsString;


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


  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES'   ,IntToStr(DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger));
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnome.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditclentecpf.Text                     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditclienterg.Text                     := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniButtonEditclientecep.Text              := dm_rc.sqlBuscas.FindField('CEP').AsString;
      UniEditclienteendereco.Text               := dm_rc.sqlBuscas.FindField('ENDERECO').AsString;
      UniEditclientenumero.Text                 := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
      UniEditclientebairro.Text                 := dm_rc.sqlBuscas.FindField('BAIRRO').AsString;
      UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      UniEditclientetelefone.Text               := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
      UniEditclientecelular.Text                := dm_rc.sqlBuscas.FindField('CELULAR').AsString;
      UniEditclienteemail.Text                  := dm_rc.sqlBuscas.FindField('EMAIL').AsString;
      UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
    end;

  memprodutos.Close;
  memprodutos.Open;

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)   +
                 ' AND DOCUMENTO                        = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger)+
                 ' AND EMPRESA                          = ' + IntToStr(mm.varI_Code_Company)                                +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;

        memprodutos.FindField('ALTURA').AsString         :=  dm_rc.sqlBuscas.FindField('ALTURA').AsString;
        memprodutos.FindField('LARGURA').AsString        :=  dm_rc.sqlBuscas.FindField('LARGURA').AsString;
        memprodutos.FindField('COMPRIMENTO').AsString    :=  dm_rc.sqlBuscas.FindField('COMPRIMENTO').AsString;
        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;

    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.first;
  end;

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

  FDQryCad.FindField('PEDIDO').AsString            := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
  FDQryCad.FindField('PEDIDO_SERIE').AsString      := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
  FDQryCad.FindField('PEDIDO_DOCUMENTO').AsString  := dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString;


  //************************************************************************//
  dm_rc.FDQryMvmestre.Close;

end;

procedure TfrmMESTRE.carregaprodutos(codigo: string);
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
      memprodutos.FindField('PRODUTO').AsInteger        := StrToInt(codigo);
      memprodutos.FindField('DESCRICAO').AsString       :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;

      memprodutos.FindField('ALTURA').AsString          := dm_rc.sqlBuscas.FindField('ALTURA').AsString;
      memprodutos.FindField('LARGURA').AsString         := dm_rc.sqlBuscas.FindField('LARGURA').AsString;
      memprodutos.FindField('COMPRIMENTO').AsString     := dm_rc.sqlBuscas.FindField('COMPRIMENTO').AsString;
      memprodutos.FindField('CODREFERENCIA').AsString   := dm_rc.sqlBuscas.FindField('CODIGOREFERENCIA').AsString;


      memprodutos.FindField('PRECO').AsFloat            := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('NCM').AsString             := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('NUMERONCM').AsString       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
      memprodutos.FindField('ICM0').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS0').AsFloat;
      memprodutos.FindField('ICM1').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS1').AsFloat;
      memprodutos.FindField('ICM2').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS2').AsFloat;

      memprodutos.FindField('BAS0').AsFloat             := dm_rc.sqlBuscas.FindField('BASE0').AsFloat;
      memprodutos.FindField('BAS1').AsFloat             := dm_rc.sqlBuscas.FindField('BASE1').AsFloat;
      memprodutos.FindField('BAS2').AsFloat             := dm_rc.sqlBuscas.FindField('BASE2').AsFloat;

      memprodutos.FindField('SITUACAOLOCAL').AsString   := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      memprodutos.FindField('SITUACAOOUTRAS').AsString  := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;
    end;
end;

procedure TfrmMESTRE.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
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

procedure TfrmMESTRE.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  VerificaEdicao();

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
      Except
         FDQryCad.Params[0].AsInteger := -1 ;
         FDQryCad.Open;
      End;

      if not( FDQryCad.Active) then
        begin
          FDQryCad.Open;
        end;

      if FDQryCad.RecordCount > 0 then

      pgBaseCadControl.ActivePage := paBaseRegData1;

      carregadados();
      HabilitaCombobox(True);
    end;
end;

procedure TfrmMESTRE.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmMESTRE.exclui;
begin
  executasql('delete from mvitens where numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
             'and documento                    = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
             'and empresa                      = ' + IntToStr(mm.varI_Code_Company));
  executasql('delete from receber where numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
             'and documento                    = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
             'and empresa                      = ' + IntToStr(mm.varI_Code_Company));

  FDQryCad.Delete;
  try
    if  FDQryFiltro.Active then
      FDQryFiltro.Refresh;

    LimpaVars;
    tbtitulos.Close;
    memprodutos.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmMESTRE.F1Click(Sender: TObject);
begin
  inherited;
  frmPDV.ShowModal();
end;

procedure TfrmMESTRE.FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMESTRE.gravamemoria;
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
    end;
end;

procedure TfrmMESTRE.GravaMovimento;
begin
  TabelaMvitens ('select * from mvitens where codigo   = 0');
  TabelaPontos  ('select * from pontos  where codigo   = 0');
  TabelaOperacao('select * from operacoes where codigo =  ' + QuotedStr(FDQryCad.FindField('OPERACAO').AsString));
  TabelaTitulos ('select * from                           ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') + ' where codigo = 0');

  Exclui_Movimento('MVITENS',FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,FDQryCad.FindField('NUMERO').AsInteger);
  Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,FDQryCad.FindField('NUMERO').AsInteger);

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
          dm_rc.tbmvitens.FindField('UF').AsString              := UniEditclienteestado.Text;
          dm_rc.tbmvitens.FindField('PESSOA').AsInteger         := FDQryCad.FindField('PESSOA').AsInteger;
          dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.tbmvitens.FindField('OPERACAO').AsFloat         := FDQryCad.FindField('OPERACAO').AsFloat;
          dm_rc.tbmvitens.FindField('CODREFERENCIA').AsString   := memprodutos.FindField('CODREFERENCIA').AsString;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;
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

          dm_rc.tbmvitens.Findfield('ALTURA').AsFloat           := StrToFloat(memprodutos.FindField('ALTURA').AsString);
          dm_rc.tbmvitens.Findfield('LARGURA').AsFloat          := StrToFloat(memprodutos.FindField('LARGURA').AsString);
          dm_rc.tbmvitens.Findfield('COMPRIMENTO').AsFloat      := StrToFloat(memprodutos.FindField('COMPRIMENTO').AsString);


          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MVITENS','CODIGO',False);

          dm_rc.tbmvitens.Post;
        end;
      memprodutos.Next;
    end;
  memprodutos.First;
  memprodutos.EnableControls;

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
      dm_rc.fdqrytitulos.FindField('CODIGO').AsInteger       := Ultimo_Codigo(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),'CODIGO',False);
      dm_rc.fdqrytitulos.Post;

      tbtitulos.Next;
    end;

  tbtitulos.First;
  tbtitulos.EnableControls;

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];
  dbgTITULOS.Options                 := dbgTITULOS.Options        - [dgEditing];

  FDQryFiltro.Refresh;

end;


procedure TfrmMESTRE.HabilitaCombobox(status: boolean);
var
  e,i:integer;
begin
  e := 0 ;
  for I:= 0 to ComponentCount -1 do
     begin
       if ( Components[I] is TUniDBComboBox )  then
         begin
           TUniDBEdit(Components[i]).ReadOnly := status;
         end;
     end;
end;

procedure TfrmMESTRE.I1Click(Sender: TObject);
begin
  inherited;
  frmTransfereImportacao.ShowModal();
  if mm.varI_Code_Documento_Controle <> 0 then
    CarregaImportacao(mm.varI_Code_Documento_Controle);
end;

procedure TfrmMESTRE.I3Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_impressao(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmMESTRE.LimpaVars;
begin
  UniEditdescricaocondicao.Text := '';
  UniEditnome.Text              := '';
  UniEditclentecpf.Text         := '';
  UniEditclienterg.Text         := '';
  UniButtonEditclientecep.Text  := '0';
  UniEditclienteendereco.Text   := '';
  UniEditclientenumero.Text     := '';
  UniEditclientebairro.Text     := '';
  UniEditclientemunicipio.Text  := '';
  UniEditclienteestado.Text     := '';
  UniEditclientetelefone.Text   := '';
  UniEditclientecelular.Text    := '';
  UniEditclienteemail.Text      := '';
  UniEditnomevendedor.Text      := '';
end;

procedure TfrmMESTRE.M1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_orsimulado(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger,
                         'MDF');

  unfImpressao.ShowModal();
end;

procedure TfrmMESTRE.M2Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_orsimulado(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger,
                         'METAL');

  unfImpressao.ShowModal();
end;

procedure TfrmMESTRE.memprodutosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmMESTRE.memprodutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmMESTRE.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmMESTRE.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  gravamemoria();
end;

procedure TfrmMESTRE.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmMESTRE.memprodutosexcluiGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';

end;

procedure TfrmMESTRE.rc_DefaultTitleForm;
var
   i : integer;
begin
     i := Pos( ' [ID:', labTitleForm.Caption );
     if ( i > 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
     begin
        labTitleForm.Caption := Copy ( labTitleForm.Caption, 1, i-1 );
        labTitleForm.hint := rc_SetHintProperty( '', 'caption-dots-default:', labTitleForm.hint );
        labTitleForm.hint := StringReplace( labTitleForm.hint, 'caption-dots-default:', '', [rfReplaceAll] );
     end;
end;

procedure TfrmMESTRE.SetBut(Acao: TAcaoCrud);
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
       btnSaveReg.Visible    := true;
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
        btnOptions.Visible    := False;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := True;
       end;
end;

procedure TfrmMESTRE.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
       UniButtonDbEditcodigopessoas.SetFocus;
     end;
   end);
end;

procedure TfrmMESTRE.UniButtonDbEdit2Exit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (FDQryCad.FindField('PESSOA').AsString <> '') and (FDQryCad.FindField('PESSOA').AsString <> '0') then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(FDQryCad.FindField('PESSOA').AsString)) then
            begin
              UniEditnome.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditclentecpf.Text                     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
              UniEditclienterg.Text                     := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
              UniButtonEditclientecep.Text              := dm_rc.sqlBuscas.FindField('CEP').AsString;
              UniEditclienteendereco.Text               := dm_rc.sqlBuscas.FindField('ENDERECO').AsString;
              UniEditclientenumero.Text                 := dm_rc.sqlBuscas.FindField('NUMERO').AsString;
              UniEditclientebairro.Text                 := dm_rc.sqlBuscas.FindField('BAIRRO').AsString;
              UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
              UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
              UniEditclientetelefone.Text               := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
              UniEditclientecelular.Text                := dm_rc.sqlBuscas.FindField('CELULAR').AsString;
              UniEditclienteemail.Text                  := dm_rc.sqlBuscas.FindField('EMAIL').AsString;
              UniEditclientemunicipio.Text              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
              UniEditclienteestado.Text                 := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
            end;
        end;
    end;
end;

procedure TfrmMESTRE.UniButtonDbEditcondicaoButtonClick(Sender: TObject);
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

procedure TfrmMESTRE.UniButtonDbEditcondicaoExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditdescricaocondicao.Text      := Acha_Item('CONDICOES',FDQryCad.FindField('CONDICAO').AsString);
end;

procedure TfrmMESTRE.UniButtonDbEditvendedorButtonClick(Sender: TObject);
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

procedure TfrmMESTRE.UniButtonDbEditvendedorExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditvendedor.Text <> '') and (UniButtonDbEditvendedor.Text <> '0') then
        begin
          if SqlPesquisa('SELECT NOME, COMISSAO FROM FUNCIONARIOS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditvendedor.Text)) then
            begin
              UniEditnomevendedor.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
              FDQryCad.FindField('COMISSAOFUNCIONARIO').AsFloat := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
            end;
        end;
    end;
end;

procedure TfrmMESTRE.UniButtonEditclientecepButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditclientecep.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmMESTRE.UniButtonEditclientecepExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonEditclientecep.Text <> '') and (UniButtonEditclientecep.Text <> '0') then
        begin
          SqlPesquisa('select DESCRICAO, UF, CODIIBGE from cidades where cep = ' + QuotedStr(UniButtonEditclientecep.Text));
            UniEditclientemunicipio.Text     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
            UniEditclienteestado.Text        := dm_rc.sqlBuscas.Findfield('UF').asstring;
        end;
    end;
end;

procedure TfrmMESTRE.UniButtonEditpessoasButtonClick(Sender: TObject);
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

procedure TfrmMESTRE.UniDBFormattedNumberEditdescontorealExit(Sender: TObject);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      Calcula_Totais();
    end;
end;

procedure TfrmMESTRE.UniDBFormattedNumberEditdescontosExit(Sender: TObject);
var
  PERC : Real;
begin
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      PERC                                      := 0;
      PERC                                      := MRound((UniDBFormattedNumberEditvlrprodutos.Value * UniDBFormattedNumberEditdescontos.Value) / 100,2);

      FDQryCad.Edit;
      FDQryCad.FindField('VLRDESCONTOS').AsFloat:= PERC;

      Calcula_Totais();
    end;
end;

procedure TfrmMESTRE.UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
   Linha  := TStringGrid(UniDBGridprodutos).Row;
   Coluna := UniDBGridprodutos.CurrCol;

  if FDQryCad.State in [dsInsert,dsEdit] then
    begin

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
          frmpesquisaproduto.showmodal(
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

procedure TfrmMESTRE.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  cbxSearchCRUDFieldordem.ItemIndex  := 1;
  cbxSearchCRUDFieldstatus.ItemIndex := 2;

  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmMESTRE.VerificaEdicao;
begin
  if  FDQryCad.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlert('ATENÇÃO',labTitleForm.Caption + ' - REGISTRO AINDA ESTA EM ABERTO - CANCELE OU SALVE', 'error' , false );
       pgBaseCadControl.ActivePage := paBaseRegData1;
       abort ;
     end;
end;

procedure TfrmMESTRE.verificapessoa(const f_codpessoa: integer);
begin
  mm.FDTransaction.StartTransaction;
  if  not TabelaPessoas('SELECT * FROM PESSOAS WHERE CODIGO = ' + IntToStr(f_codpessoa)) then
    begin
      dm_rc.FDQryPessoas.Append;
      dm_rc.FDQryPessoas.FindField('CODIGO').AsInteger    := Ultimo_Codigo('PESSOAS','CODIGO',True);
      dm_rc.FDQryPessoas.FindField('KEY').AsString        := Gera_Guid;
      dm_rc.FDQryPessoas.FindField('ATIVO').AsString      := 'F';
      dm_rc.FDQryPessoas.FindField('NOME').AsString       := UniEditnome.Text;
      dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString    := UniEditclentecpf.Text;
      dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString  := UniEditclienterg.Text;
      dm_rc.FDQryPessoas.FindField('CEP').AsString        := UniButtonEditclientecep.Text;
      dm_rc.FDQryPessoas.FindField('ENDERECO').AsString   := UniEditclienteendereco.Text;
      dm_rc.FDQryPessoas.FindField('NUMERO').AsString     := UniEditclientenumero.Text;
      dm_rc.FDQryPessoas.FindField('BAIRRO').AsString     := UniEditclientebairro.Text;
      dm_rc.FDQryPessoas.FindField('CIDADE').AsString     := UniEditclientemunicipio.Text;
      dm_rc.FDQryPessoas.FindField('ESTADO').AsString     := UniEditclienteestado.Text;
      dm_rc.FDQryPessoas.FindField('TELEFONE').AsString   := UniEditclientetelefone.Text;
      dm_rc.FDQryPessoas.FindField('CELULAR').AsString    := UniEditclientecelular.Text;
      dm_rc.FDQryPessoas.FindField('EMAIL').AsString      := UniEditclienteemail.Text;
      dm_rc.FDQryPessoas.Post;
    end
  else
    begin
      dm_rc.FDQryPessoas.Edit;
      dm_rc.FDQryPessoas.FindField('NOME').AsString       := UniEditnome.Text;
      dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString    := UniEditclentecpf.Text;
      dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString  := UniEditclienterg.Text;
      dm_rc.FDQryPessoas.FindField('CEP').AsString        := UniButtonEditclientecep.Text;
      dm_rc.FDQryPessoas.FindField('ENDERECO').AsString   := UniEditclienteendereco.Text;
      dm_rc.FDQryPessoas.FindField('NUMERO').AsString     := UniEditclientenumero.Text;
      dm_rc.FDQryPessoas.FindField('BAIRRO').AsString     := UniEditclientebairro.Text;
      dm_rc.FDQryPessoas.FindField('CIDADE').AsString     := UniEditclientemunicipio.Text;
      dm_rc.FDQryPessoas.FindField('ESTADO').AsString     := UniEditclienteestado.Text;
      dm_rc.FDQryPessoas.FindField('TELEFONE').AsString   := UniEditclientetelefone.Text;
      dm_rc.FDQryPessoas.FindField('CELULAR').AsString    := UniEditclientecelular.Text;
      dm_rc.FDQryPessoas.FindField('EMAIL').AsString      := UniEditclienteemail.Text;
      dm_rc.FDQryPessoas.Post;
    end;
  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;

  FDQryCad.Edit;
  FDQryCad.FindField('PESSOA').AsInteger := dm_rc.FDQryPessoas.FindField('CODIGO').AsInteger;
end;

end.
