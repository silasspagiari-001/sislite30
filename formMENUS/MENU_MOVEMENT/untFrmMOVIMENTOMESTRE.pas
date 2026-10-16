unit untFrmMOVIMENTOMESTRE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDateTimePicker,
  uniEdit, UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, uniButton,
  uniBitBtn, uniMultiItem, uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu, uniDBGrid,
  uniDBEdit, UniButtonDbEdit, uniDBDateTimePicker, uniMemo, uniDBMemo;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);

  TfrmMOVIMENTOMESTRE = class(TfrmBase)
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
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel3: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    paBaseRegData1: TUniTabSheet;
    cbxSearchCRUDFieldordem: TUniComboBox;
    UniButtonEditnumero: TUniButtonEdit;
    UniLabel1: TUniLabel;
    cbxSearchCRUDFieldstatus: TUniComboBox;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
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
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_PK: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    dbgExport: TUniDBGrid;
    ed_PKS: TUniEdit;
    ed_OLDPKS: TUniEdit;
    UniPopupMenudetalhes: TUniPopupMenu;
    FDQryCad: TFDQuery;
    dscrud: TDataSource;
    UniScrollBox2: TUniScrollBox;
    rcBlock500: TUniContainerPanel;
    UniEditnomepessoa: TUniEdit;
    UniLabel6: TUniLabel;
    rcBlock490: TUniContainerPanel;
    UniButtonDbEditcodigopessoas: TUniButtonDbEdit;
    UniLabel5: TUniLabel;
    rcBlock480: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock470: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock510: TUniContainerPanel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock540: TUniContainerPanel;
    UniEditcidade: TUniEdit;
    UniLabel7: TUniLabel;
    UniEditestado: TUniEdit;
    UniLabel9: TUniLabel;
    UniButtonDbEditcodigocondicao: TUniButtonDbEdit;
    UniLabel10: TUniLabel;
    UniEditdescricaocondicao: TUniEdit;
    UniLabel11: TUniLabel;
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
    UniDBDateTimePickeremissao: TUniDBDateTimePicker;
    btnCalcReg: TUniBitBtn;
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    i2: TUniMenuItem;
    N1: TUniMenuItem;
    rcBlock590: TUniContainerPanel;
    UniDBGridprodutos: TUniDBGrid;
    rcBlock580: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock550: TUniContainerPanel;
    UniDBMemoobservacao: TUniDBMemo;
    UniLabel15: TUniLabel;
    rcBlock560: TUniContainerPanel;
    dbgTITULOS: TUniDBGrid;
    rcBlock570: TUniContainerPanel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel16: TUniLabel;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    rcBlock620: TUniContainerPanel;
    UniButtonDbEditvendedor: TUniButtonDbEdit;
    UniLabel17: TUniLabel;
    UniLabel19: TUniLabel;
    UniEditnomevendedor: TUniEdit;
    UniLabel20: TUniLabel;
    UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit;
    tbtitulosexclui: TStringField;
    UniComboBoxparaop: TUniComboBox;
    UniLabel21: TUniLabel;
    btntransp: TUniBitBtn;
    btnimpressao: TUniBitBtn;
    procedure UniButtonEditpessoasButtonClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure FDQryFiltrostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure UniButtonDbEditcodigopessoasButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasExit(Sender: TObject);
    procedure UniButtonDbEditcodigocondicaoButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigocondicaoExit(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure UniDBFormattedNumberEditvlrdespesasExit(Sender: TObject);
    procedure btnCalcRegClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure UniButtonDbEditvendedorButtonClick(Sender: TObject);
    procedure UniButtonDbEditvendedorExit(Sender: TObject);
    procedure btntranspClick(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  iCurrentPage : integer;
  varC_Documento_Mvmestre : Integer;

  procedure  ativabusca();
  procedure  rc_DefaultTitleForm;
  procedure  carregadados();
  procedure  carregaprodutos(codigo:string);
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  LimpaVars();
  procedure  gravamemoria();
  function   CamposValidados :Boolean;
  procedure  Calcula_Totais();
  procedure  GravaMovimento();
  procedure  Calcula_Titulos();
  procedure  Exclui();
  procedure  CarregaParametros();
  procedure  VerificaEdicao();


  end;

var
  frmMOVIMENTOMESTRE: TfrmMOVIMENTOMESTRE;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_funcoes, mkm_func_web, Vcl.Clipbrd,
  System.DateUtils, untDM_RC, untFrmLookUp_Lite, mkm_layout, Vcl.Grids
, mkm_procedures, System.TypInfo, uniGUITypes, mkm_impressao, unReportImpressao,
  untFrmTransfereImportacao, untFrmTELAGENERICA, untFrmTRANSPORTADORAMOVIMENTO,
  untFrmFORMAPAGAMENTO;

Procedure TfrmMOVIMENTOMESTRE.ativabusca;
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

procedure TfrmMOVIMENTOMESTRE.btnCalcRegClick(Sender: TObject);
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
        Calcula_Titulos();
    end;

  SetBut(tpCalcular);

  I1.Enabled := False;
  i2.Enabled := False;
end;

procedure TfrmMOVIMENTOMESTRE.btnCancelRegClick(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.btnDeleteRegClick(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;
  mm.var_vlr_totalcupom := 0;
  mm.var_vlr_dinheiro   := 0;
  mm.var_vlr_debito     := 0;
  mm.var_vlr_credito    := 0;

  CarregaParametros();
  pgBaseCadControl.ActivePage := paBaseRegData1;

  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;

  Try
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;

    FDQryCad.Edit;

    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

//    dbgTITULOS.Options                 := dbgTITULOS.Options - [dgRowSelect];
    dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];

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
  UniComboBoxparaop.Text          := FDQryCad.FindField('PARAMETROOPERACAO').AsString;
  UniButtonDbEditcodigopessoas.SetFocus;
  UniButtonDbEditcodigopessoas.SelectAll;
end;

procedure TfrmMOVIMENTOMESTRE.btnimpressaoClick(Sender: TObject);
begin
  inherited;
  if FDQryFiltro.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  RELATORIO_Movimento(labTitleForm.Caption,
                                                 edSearchCRUDDtIni.Text,
                                                 edSearchCRUDDtEnd.Text,
                                                 mm.varI_Code_Company,
                                                 FDQryFiltro);

      unfImpressao.ShowModal();
    end;
end;

procedure TfrmMOVIMENTOMESTRE.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  mm.var_vlr_totalcupom := 0;
  mm.var_vlr_dinheiro   := 0;
  mm.var_vlr_debito     := 0;
  mm.var_vlr_credito    := 0;
  CarregaParametros();

  if (varC_Documento_Mvmestre = 3) then //Orcamento
    UniComboBoxparaop.ItemIndex := 9
  else
    if (varC_Documento_Mvmestre = 4) then //Pedido
      UniComboBoxparaop.ItemIndex := 8
  else
    if (varC_Documento_Mvmestre = 10) then //NFCE
      UniComboBoxparaop.Text := 'NFCE'  ;

  pgBaseCadControl.ActivePage := paBaseRegData1;

  SetBut(tpIncluir);

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

  SqlPesquisa('select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_Mvmestre) +
              'and empresa                                                     = ' + IntToStr(mm.varI_Code_Company));

   FDQryCad.Append ;
   FDQryCad.FindField('PESSOA').AsInteger               := 0;
   FDQryCad.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   FDQryCad.FindField('DOCUMENTO').AsInteger            := varC_Documento_Mvmestre;
   FDQryCad.FindField('NUMERO').AsInteger               := 0;
   FDQryCad.FindField('TRAFRETE').AsInteger             := 0;
   FDQryCad.FindField('SERIE').AsString                 := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   FDQryCad.FindField('EMISSAO').AsDateTime             := Date;
   FDQryCad.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   FDQryCad.FindField('OPERACAO').AsString              := dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
   FDQryCad.FindField('CONDICAO').AsString              := dm_rc.sqlBuscas.FindField('CONDICAO').AsString;

   FDQryCad.FindField('VLRDESCONTOS').AsFloat           := 0;
   FDQryCad.FindField('VLRPRODUTOS').AsFloat            := 0;
   FDQryCad.FindField('VLRDESPESAS').AsFloat            := 0;
   FDQryCad.FindField('VLRTOTAL').AsFloat               := 0;


  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];
  dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];


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

  UniButtonDbEditcodigopessoas.SetFocus;
  UniButtonDbEditcodigopessoas.SelectAll;


  I1.Enabled := True;
  i2.Enabled := False;

end;

procedure TfrmMOVIMENTOMESTRE.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmMOVIMENTOMESTRE.btnSaveRegClick(Sender: TObject);
var
  vdup:real;
begin
  inherited;
  vdup:=0;
  tbtitulos.First;
  tbtitulos.DisableControls;
  while not tbtitulos.Eof do
    begin
      vdup := vdup + tbtitulosVALOR.AsFloat;
      tbtitulos.Next;
    end;
  tbtitulos.First;
  tbtitulos.EnableControls;
{
  if vdup <> UniDBFormattedNumberEditvlrtotal.Value then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'VALOR DO FINANCEIRO NÃO CONFERE COM O TOTAL DO MOVIMENTO' , 'error' , false );
      abort
    end;

  if UniComboBoxparaop.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'DEFINA COMO VAI SER A VENDA' , 'error' , false );
      UniComboBoxparaop.SetFocus;
      abort
    end;
}

  if (StrContains('10',IntToStr(varC_Documento_Mvmestre))) then
    begin
      //*************************************************************************//
      // FORMA DE PGTO
      //*************************************************************************//
      mm.var_vlr_totalcupom := UniDBFormattedNumberEditvlrtotal.Value;
      mm.var_vlr_dinheiro   := FDQryCad.FindField('DINHEIRO').AsFloat;
      mm.var_vlr_debito     := FDQryCad.FindField('DEBITO').AsFloat;
      mm.var_vlr_credito    := FDQryCad.FindField('CREDITO').AsFloat;
      mm.var_cpf_cliente    := FDQryCad.FindField('CPFCNPJ').AsString;

      frmFORMAPAGAMENTO.ShowModal();

      FDQryCad.FindField('DINHEIRO').AsFloat := mm.var_vlr_dinheiro;
      FDQryCad.FindField('DEBITO').AsFloat   := mm.var_vlr_debito;
      FDQryCad.FindField('CREDITO').AsFloat  := mm.var_vlr_credito;
      FDQryCad.FindField('CPFCNPJ').AsString := mm.var_cpf_cliente;
      //*************************************************************************//
    end;


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

       FDQryCad.FindField('PARAMETROOPERACAO').AsString := UniComboBoxparaop.Text;
       if mm.varT_code_tipo_transportadora = '' then
         FDQryCad.FindField('TRAFRETE').AsInteger         := 0;

       FDQryCad.Post;

       GravaMovimento();

       mm.var_vlr_totalcupom := 0;
       mm.var_vlr_dinheiro   := 0;
       mm.var_vlr_debito     := 0;
       mm.var_vlr_credito    := 0;

       try
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

  I1.Enabled := False;
  i2.Enabled := True;
end;

procedure TfrmMOVIMENTOMESTRE.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmMOVIMENTOMESTRE.btnSearchCRUDClick(Sender: TObject);
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

  CAMPOS  := ' M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELADA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.VLRTOTAL ';

  M_AND   := ' AND M.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
             ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));

  SQL :=    ' SELECT          ' + CAMPOS +
            ' FROM   MVMESTRE ' +
            ' M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)        ' +
            variif(UniButtonEditpessoas.Text              = '0'    ,'','AND M.PESSOA      = '  + QuotedStr(UniButtonEditpessoas.Text))      +
            variif(UniButtonEditnumero.Text               = '0'    ,'','AND M.NUMERO      = '  + QuotedStr(UniButtonEditnumero.Text))       +
            ' AND M.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company) +
            ' AND M.DOCUMENTO                             = ' + IntToStr(varC_Documento_Mvmestre);

  if (UniButtonEditpessoas.Text = '0') and (UniButtonEditnumero.Text = '0') then
    SQL := SQL + M_AND + M_SITUACAO + M_ORDEM
  else
    SQL := SQL + M_SITUACAO + M_ORDEM;

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL;
  FDQryFiltro.Open();

  FDQryFiltro.Last;
  SetBut(tpListaVazia);
end;

procedure TfrmMOVIMENTOMESTRE.btntranspClick(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigocondicao.Text)) then

  ORDEM      := 0;
  M_PARCELAS := Explode(TRIM(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value;
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

procedure TfrmMOVIMENTOMESTRE.Calcula_Totais;
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
      M_VLRRESTO   := UniDBFormattedNumberEditdescontos.Value ;
      M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
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

function TfrmMOVIMENTOMESTRE.CamposValidados: Boolean;
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

procedure TfrmMOVIMENTOMESTRE.carregadados;
begin
  CarregaParametros();
  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES',IntToStr(FDQryCad.FindField('CONDICAO').AsInteger));
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(FDQryCad.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, NOME, CIDADE, ESTADO FROM PESSOAS WHERE CODIGO = ' + IntToStr(FDQryCad.FindField('PESSOA').AsInteger)) then
    begin
      UniEditnomepessoa.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcidade.Text     := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      UniEditestado.Text     := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
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
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PERCICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('PERCICMS').AsFloat;
        memprodutos.FindField('VALORICMS').AsFloat       :=  dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
        memprodutos.FindField('BASEICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;
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
  UniComboBoxparaop.Text          := FDQryCad.FindField('PARAMETROOPERACAO').AsString;
end;

procedure TfrmMOVIMENTOMESTRE.CarregaParametros;
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

procedure TfrmMOVIMENTOMESTRE.carregaprodutos(codigo: string);
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
      memprodutos.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
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

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;
{
  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-160,posicao_y, dbgSearchCRUD);
    end;
}
end;

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDDblClick(Sender: TObject);
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
        SetBut(tpListacomRegistros);

      pgBaseCadControl.ActivePage := paBaseRegData1;

      carregadados();
    end;
end;

procedure TfrmMOVIMENTOMESTRE.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmMOVIMENTOMESTRE.Exclui;
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

procedure TfrmMOVIMENTOMESTRE.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.FDQryFiltrostatusGetText(Sender: TField;
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

procedure TfrmMOVIMENTOMESTRE.gravamemoria;
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

procedure TfrmMOVIMENTOMESTRE.GravaMovimento;
begin

  TabelaMvitens ('select * from mvitens where codigo   = 0');
  TabelaPontos  ('select * from pontos  where codigo   = 0');
  TabelaOperacao('select * from operacoes where codigo =  ' + QuotedStr(FDQryCad.FindField('OPERACAO').AsString));
  TabelaTitulos ('select * from                           ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') + ' where codigo = 0');

  Exclui_Movimento('MVITENS',FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,FDQryCad.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS' ,FDQryCad.FindField('SERIE').AsString,MM.varI_Code_Company,varC_Documento_Mvmestre,FDQryCad.FindField('NUMERO').AsInteger);
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
          dm_rc.tbmvitens.FindField('UF').AsString              := UniEditestado.Text;
          dm_rc.tbmvitens.FindField('PESSOA').AsInteger         := FDQryCad.FindField('PESSOA').AsInteger;
          dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;

          dm_rc.tbmvitens.FindField('OPERACAO').AsFloat         := memprodutos.FindField('OPERACAO').AsFloat;
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

          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MVITENS','CODIGO',False);
          dm_rc.tbmvitens.Post;

          Calcula_SaldoProduto(mm.varI_Code_Company,
                               memprodutos.FindField('PRODUTO').AsInteger);

{
          //******************************************************************//
          // CONTROLE DE ESTOQUE
          //******************************************************************//
          dm_rc.fdqrypontos.Append;
          dm_rc.fdqrypontos.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.fdqrypontos.FindField('CODIGO').AsInteger         := Ultimo_Codigo('PONTOS','CODIGO',False);
          dm_rc.fdqrypontos.FindField('DATA').AsDateTime          := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger      := FDQryCad.FindField('DOCUMENTO').AsInteger;
          dm_rc.fdqrypontos.FindField('NUMERO').AsInteger         := FDQryCad.FindField('NUMERO').AsInteger;
          dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger      := memprodutos.RecNo;
          dm_rc.fdqrypontos.FindField('SERIE').AsString           := FDQryCad.FindField('SERIE').AsString;
          dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrypontos.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;
          dm_rc.fdqrypontos.FindField('OPERACAO').AsFloat         := memprodutos.FindField('OPERACAO').AsFloat;
          dm_rc.fdqrypontos.FindField('PESSOA').AsInteger         := FDQryCad.FindField('PESSOA').AsInteger;
          dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat;

          if dm_rc.FDQryoperacoes.FindField('ESTOQUE').AsInteger <> 2  then
            dm_rc.fdqrypontos.FindField('TIPO').AsString            := variif(dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 0,'ENTRADA','SAIDA')
          else
            dm_rc.fdqrypontos.FindField('TIPO').AsString            := 'NULLO';

          dm_rc.fdqrypontos.Post;

          Calcula_SaldoProduto(mm.varI_Code_Company,
                               memprodutos.FindField('PRODUTO').AsInteger);
}
          //******************************************************************//
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

end;

procedure TfrmMOVIMENTOMESTRE.I1Click(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
end;

procedure TfrmMOVIMENTOMESTRE.i2Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_impressao(mm.varI_Code_Company,
                                                   FDQryCad.FindField('NUMERO').AsInteger,
                                                   FDQryCad.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmMOVIMENTOMESTRE.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';

  ed_Table_Status_OLD.Text := '';

  if pgBaseCadControl.ActivePage = paBaseRegData1 then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if ( ed_CodMaster.Tag = 0 ) or ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
     begin
           // v. 3.2.0.0
           //btnSearchCRUDClick( self );
           if iCurrentPage <> -1 then
              UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');')
           else
              btnSearchCRUDClick( self );
     end;
     rc_DefaultTitleForm; // v. 3.2.0.0
  end
  else
  begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end;
end;

procedure TfrmMOVIMENTOMESTRE.LimpaVars;
begin
  UniEditnomepessoa.Text        := '';
  UniEditcidade.Text            := '';
  UniEditestado.Text            := '';
  UniEditdescricaocondicao.Text := '';
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  gravamemoria();
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.memprodutosexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmMOVIMENTOMESTRE.rc_DefaultTitleForm;
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

procedure TfrmMOVIMENTOMESTRE.SetBut(Acao: TAcaoCrud);
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
       btntransp.Visible     := False;
       btnOptions.Visible    := True;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := False;
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
        btntransp.Visible     := False;
        btnimpressao.Visible  := True;
       end;
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditvendedorButtonClick(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditvendedorExit(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigocondicaoButtonClick(
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

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigocondicaoExit(
  Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditdescricaocondicao.Text      := Acha_Item('CONDICOES',FDQryCad.FindField('CONDICAO').AsString);
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigopessoasButtonClick(
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
       UniButtonDbEditcodigopessoas.SetFocus;
     end;
   end);
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonDbEditcodigopessoasExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcodigopessoas.Text <> '')  and
         (UniButtonDbEditcodigopessoas.Text <> '0')  then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigopessoas.Text)) then
            begin
              if  (StrContains('1',IntToStr(varC_Documento_Mvmestre))) then
                begin
                  if Pos('-',dm_rc.sqlBuscas.FindField('CEP').AsString) <> 0 then
                    begin
                      dm_rc.rc_ShowSweetAlert( 'ALERTA', 'CEP NÃO SERÁ VALIDO - AJUSTAR NO CADASTRO' , 'error' , false );
                      Abort;
                    end;

                  if dm_rc.sqlBuscas.FindField('ESTADO').AsString = '' then
                    begin
                      dm_rc.rc_ShowSweetAlert( 'ALERTA', 'UF INVALIDA - AJUSTAR NO CADASTRO' , 'error' , false );
                      Abort;
                    end;

                  if dm_rc.sqlBuscas.FindField('SITUACAO').AsString = '' then
                    begin
                      dm_rc.rc_ShowSweetAlert( 'ALERTA', 'INFORMAR NO CADASTRO SE O CLIENTE É - ISENTO - NÃO CONTRUINTE - CONSUMIDOR' , 'error' , false );
                      Abort;
                    end;
                end;

              UniEditnomepessoa.Text                          := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditcidade.Text                              := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
              UniEditestado.Text                              := dm_rc.sqlBuscas.FindField('ESTADO').AsString;

              FDQryCad.FindField('FUNCIONARIO').AsInteger     := dm_rc.sqlBuscas.FindField('FUNCIONARIO').AsInteger;
              FDQryCad.FindField('ENTREGA_CEP').AsString      := dm_rc.sqlBuscas.FindField('CEPENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_IBGE').AsString     := dm_rc.sqlBuscas.FindField('IBGEENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_ENDERECO').AsString := dm_rc.sqlBuscas.FindField('ENDERECOENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_NUMERO').AsString   := dm_rc.sqlBuscas.FindField('NUMEROENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_BAIRRO').AsString   := dm_rc.sqlBuscas.FindField('BAIRROENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_CIDADE').AsString   := dm_rc.sqlBuscas.FindField('CIDADEENTREGA').AsString;
              FDQryCad.FindField('ENTREGA_ESTADO').AsString   := dm_rc.sqlBuscas.FindField('ESTADOENTREGA').AsString;
            end
          else
            begin
              dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'CLIENTE NÃO ENCONTRADO, BUSQUE NOVAMENTE' , 'error' , false );
              Abort
            end;

        end;
    end;
end;

procedure TfrmMOVIMENTOMESTRE.UniButtonEditpessoasButtonClick(Sender: TObject);
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

procedure TfrmMOVIMENTOMESTRE.UniDBFormattedNumberEditdescontosExit(
  Sender: TObject);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then
    Calcula_Totais;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBFormattedNumberEditvlrdespesasExit(
  Sender: TObject);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then
    Calcula_Totais;
end;

procedure TfrmMOVIMENTOMESTRE.UniDBGridprodutosCellClick(
  Column: TUniDBGridColumn);
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

procedure TfrmMOVIMENTOMESTRE.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  cbxSearchCRUDFieldordem.ItemIndex  := 1;
  cbxSearchCRUDFieldstatus.ItemIndex := 2;
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmMOVIMENTOMESTRE.VerificaEdicao;
begin
  if  FDQryCad.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlert('ATENÇÃO',labTitleForm.Caption + ' - REGISTRO AINDA ESTA EM ABERTO - CANCELE OU SALVE', 'error' , false );
       pgBaseCadControl.ActivePage := paBaseRegData1;
       abort ;
     end;
end;

end.
