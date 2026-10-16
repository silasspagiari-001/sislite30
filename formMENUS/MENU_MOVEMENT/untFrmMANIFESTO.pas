unit untFrmMANIFESTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniEdit, UniButtonEdit, uniLabel, uniScrollBox,
  uniBasicGrid, uniDBGrid, uniPageControl, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniDBEdit, UniButtonDbEdit, uniDBDateTimePicker,
  uniDBComboBox, uniMemo, Vcl.Menus, uniMainMenu;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmMANIFESTO = class(TfrmBase)
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEdittransportadora: TUniButtonEdit;
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
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
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
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroTRANSPORTADORA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroCPFCNPJ: TStringField;
    UniContainerPanel2: TUniContainerPanel;
    UniScrollBox3: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniButtonDbEditTRANSPORTADORA: TUniButtonDbEdit;
    UniDBEditTRANSPORTADORA: TUniDBEdit;
    UniLabel36: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBEditcpfcnpj: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniLabel47: TUniLabel;
    UniComboBoxtrafrete: TUniComboBox;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniComboBoxtipocarga: TUniComboBox;
    UniLabel11: TUniLabel;
    UniComboBoxtipoveiculo: TUniComboBox;
    UniComboBoxtipocarroceria: TUniComboBox;
    UniLabel12: TUniLabel;
    UniComboBoxtipoemitente: TUniComboBox;
    UniLabel13: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniPageControlmanifesto: TUniPageControl;
    UniTabSheetcarregamentodestino: TUniTabSheet;
    UniContainerPanel4: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniButtonDbEditibgecarregamento: TUniButtonDbEdit;
    UniLabel19: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    rcBlock180: TUniContainerPanel;
    UniDBEdit6: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniTabSheetnotasconhecimento: TUniTabSheet;
    TB_MANIFESTO: TFDMemTable;
    TB_MANIFESTONUMERO: TStringField;
    TB_MANIFESTOCHAVE: TStringField;
    TB_MANIFESTOIBGE: TIntegerField;
    TB_MANIFESTOCIDADE: TStringField;
    TB_MANIFESTOESTADO: TStringField;
    TB_MANIFESTOPESOLIQUIDO: TFloatField;
    TB_MANIFESTOPESOBRUTO: TFloatField;
    TB_MANIFESTOTIPO: TStringField;
    TB_MANIFESTOSTATUS: TStringField;
    TB_MANIFESTOTOTAL: TFloatField;
    TB_MANIFESTOCONTROLE: TIntegerField;
    TB_MANIFESTObuscanota: TStringField;
    TB_MANIFESTOexcluinota: TStringField;
    TB_MANIFESTObuscaentrega: TStringField;
    DS_MANIFESTO: TDataSource;
    UniTabSheetveiculos: TUniTabSheet;
    UniTabSheetsegurador: TUniTabSheet;
    UniContainerPanel5: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    rcBlock340: TUniContainerPanel;
    rcBlock350: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel21: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniDBComboBox4: TUniDBComboBox;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    UniLabel34: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniDBEdit11: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock370: TUniContainerPanel;
    rcBlock380: TUniContainerPanel;
    rcBlock390: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    UniLabel40: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    rcBlock400: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    rcBlock460: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    UniDBGridmanifestos: TUniDBGrid;
    UniDBEdit15: TUniDBEdit;
    UniDBEdit16: TUniDBEdit;
    UniDBEdit17: TUniDBEdit;
    UniLabel41: TUniLabel;
    UniLabel42: TUniLabel;
    UniLabel43: TUniLabel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit;
    UniLabel44: TUniLabel;
    UniLabel45: TUniLabel;
    UniLabel46: TUniLabel;
    UniLabel48: TUniLabel;
    rcBlock480: TUniContainerPanel;
    rcBlock490: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel50: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel51: TUniLabel;
    UniDBComboBox6: TUniDBComboBox;
    UniMemolog: TUniMemo;
    UniPopupMenudetalhes: TUniPopupMenu;
    L1: TUniMenuItem;
    UniPopupMenuopcoes: TUniPopupMenu;
    E1: TUniMenuItem;
    UniTabSheetvalores: TUniTabSheet;
    UniContainerPanel8: TUniContainerPanel;
    UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit;
    UniLabel52: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure FDQryFiltrostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniButtonEdittransportadoraButtonClick(Sender: TObject);
    procedure TB_MANIFESTOexcluinotaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TB_MANIFESTObuscanotaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniDBGridmanifestosCellClick(Column: TUniDBGridColumn);
    procedure TB_MANIFESTOAfterPost(DataSet: TDataSet);
    procedure TB_MANIFESTOAfterDelete(DataSet: TDataSet);
    procedure UniButtonDbEditibgecarregamentoButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAButtonClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure L1Click(Sender: TObject);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure UniDBEditcpfcnpjExit(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  varC_Documento_MvmestreMFE : Integer;
  procedure  SetBut(Acao:TAcaoCrud);
  procedure  ativabusca();
  procedure  carregadados();
  procedure  LimpaVars;
  procedure  CarregaNota(f_codigo:integer);
  procedure  CalculaPeso();
  procedure  CarregaTransportes(f_codigo:integer);
  procedure  GravaManifesto();
  procedure  MemoGravaLog();
  procedure  Exclui;
  function   CamposValidados :Boolean;  
  end;

var
  frmMANIFESTO: TfrmMANIFESTO;
  state       : string;  

implementation

uses
  System.DateUtils, mkm_func_web, MainModule, System.TypInfo, untFrmPesquisa,
  mkm_procedures, untDM_RC, uniGUITypes, mkm_funcoes, Vcl.Grids,
  untFrmTELAGENERICA, untfrmSEFAZMANIFESTO, unReportImpressao;

{$R *.dfm}
procedure TfrmMANIFESTO.ativabusca;
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

procedure TfrmMANIFESTO.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;

   TB_MANIFESTO.Close;

   LimpaVars;
end;

procedure TfrmMANIFESTO.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;
  if StrContains('A#C#E',FDQryFiltro.FindField('CANCELADA').AsString) then
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
end;

procedure TfrmMANIFESTO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  if StrContains('A#C#E',FDQryFiltro.FindField('CANCELADA').AsString) then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO FOI PERMITIDO FAZER A ALTERAÇÃO' , 'error' , false );
      abort
    end;
  
  pgBaseCadControl.ActivePage        := tabRegister;


  SetBut(tpAlterar);

  Try
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;

    FDQryCad.Edit;

    UniDBGridmanifestos.Options          := UniDBGridmanifestos.Options - [dgRowSelect];
    UniDBGridmanifestos.Options          := UniDBGridmanifestos.Options + [dgEditing];

    if FDQryCad.State in [dsInsert] then
    begin
      S := 1;

      TB_MANIFESTO.Close;
      TB_MANIFESTO.Open;
    end
    else
      S := TB_MANIFESTO.RecordCount + 10;

    TB_MANIFESTO.DisableControls;
    TB_MANIFESTO.AfterPost    := nil;
    TB_MANIFESTO.AfterDelete  := nil;

    for R := S to S + 25 do
    begin
      TB_MANIFESTO.Append;
      TB_MANIFESTO.Post;
    end;

    TB_MANIFESTO.First;
    TB_MANIFESTO.AfterPost    := TB_MANIFESTOAfterPost;
    TB_MANIFESTO.AfterDelete  := TB_MANIFESTOAfterDelete;
    TB_MANIFESTO.EnableControls;

    UniPageControlmanifesto.ActivePage := UniTabSheetnotasconhecimento;
  Except
   Abort ;
  End ;

end;

procedure TfrmMANIFESTO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
  S, R: Integer;
begin
  inherited;

  labTitleForm.Caption               := 'MANIFESTO ELETRÔNICO';
  pgBaseCadControl.ActivePage        := tabRegister;

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

  SqlPesquisa(' select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_MvmestreMFE) +
              ' and empresa                                                     = ' + IntToStr(mm.varI_Code_Company));
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));

   FDQryCad.Insert ;
   FDQryCad.FindField('TRANSPORTADORA').AsInteger       := 0;
   FDQryCad.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   FDQryCad.FindField('DOCUMENTO').AsInteger            := varC_Documento_MvmestreMFE;
   FDQryCad.FindField('NUMERO').AsInteger               := 0;
   FDQryCad.FindField('EMISSAO').AsDateTime             := Date;
   FDQryCad.FindField('SERIE').AsString                 := 'MFE';

   FDQryCad.FindField('ESTADOINI').AsString             := dm_rc.tbempresas.FindField('ESTADO').AsString;
   FDQryCad.FindField('ESTADOFIN').AsString             := dm_rc.tbempresas.FindField('ESTADO').AsString;

   FDQryCad.FindField('IBGECARREGAMENTO').AsString      := dm_rc.tbempresas.FindField('IBGE').AsString;
   FDQryCad.FindField('CIDADECARREGAMENTO').AsString    := dm_rc.tbempresas.FindField('CIDADE').AsString;
   FDQryCad.FindField('UFCARRREGAMENTO').AsString       := dm_rc.tbempresas.FindField('ESTADO').AsString;
   FDQryCad.FindField('VLRCONTRATADO').asfloat          := 0.00;

   UniComboBoxtipoemitente.ItemIndex   := 1;

  UniDBGridmanifestos.Options          := UniDBGridmanifestos.Options - [dgRowSelect];
  UniDBGridmanifestos.Options          := UniDBGridmanifestos.Options + [dgEditing];


  if FDQryCad.State in [dsInsert] then
  begin
    S := 1;

    TB_MANIFESTO.Close;
    TB_MANIFESTO.Open;
  end
  else
    S := TB_MANIFESTO.RecordCount + 10;

  TB_MANIFESTO.DisableControls;
  TB_MANIFESTO.AfterPost    := nil;
  TB_MANIFESTO.AfterDelete  := nil;

  for R := S to S + 25 do
  begin
    TB_MANIFESTO.Append;
    TB_MANIFESTO.Post;
  end;

  TB_MANIFESTO.First;
  TB_MANIFESTO.AfterPost    := TB_MANIFESTOAfterPost;
  TB_MANIFESTO.AfterDelete  := TB_MANIFESTOAfterDelete;
  TB_MANIFESTO.EnableControls;
  UniButtonDbEditTRANSPORTADORA.SetFocus;

  UniPageControlmanifesto.ActivePage := UniTabSheetnotasconhecimento;
end;

procedure TfrmMANIFESTO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmMANIFESTO.btnSaveRegClick(Sender: TObject);
begin
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           FDQryCad.FindField('KEY').AsString          := Gera_Guid;
           FDQryCad.FindField('CODIGO').AsInteger      := Ultimo_Codigo('MFMESTRE','CODIGO',False);
           FDQryCad.FindField('NUMERO').AsInteger      := Ultimo_Numero(mm.varI_Code_Company,20,'GRAVAR');
         end
       else
         begin
           FDQryCad.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
         end;

       FDQryCad.FindField('TIPOFRETE').AsInteger      := UniComboBoxtrafrete.ItemIndex;
       FDQryCad.FindField('TIPOCARGA').AsInteger      := UniComboBoxtipocarga.ItemIndex;
       FDQryCad.FindField('TIPOVEICULO').AsInteger    := UniComboBoxtipoveiculo.ItemIndex;
       FDQryCad.FindField('TIPOCARROCERIA').AsInteger := UniComboBoxtipocarroceria.ItemIndex;
       FDQryCad.FindField('TIPOEMITENTE').AsInteger   := UniComboBoxtipoemitente.ItemIndex;

       CalculaPeso();       

       //grava tabelas principal
       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;


       // grava demais informações
       GravaManifesto();

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

         
         UniPageControlcadastros.ActivePage := UniTabSheetnotasconhecimento;
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

end;

procedure TfrmMANIFESTO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmMANIFESTO.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  case cbxSearchCRUDFieldordem.ItemIndex of
    0: M_ORDEM := ' ORDER BY M.EMISSAO';
    1: M_ORDEM := ' ORDER BY M.NUMERO';
    2: M_ORDEM := ' ORDER BY M.PESSOA';
  end;

  CAMPOS  := ' M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELADA,M.transportadora,P.CIDADE,P.ESTADO,P.NOME, P.CPFCNPJ ';
  M_AND   := ' AND M.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
             ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));;

  SQL :=    ' SELECT          ' + CAMPOS +
            ' FROM   MFMESTRE ' +
            ' M INNER JOIN TRANSPORTES P ON (M.transportadora = P.CODIGO)        ' +
            variif(UniButtonEdittransportadora.Text       = '0'    ,'','AND M.transportadora   = '  + QuotedStr(UniButtonEdittransportadora.Text))      +
            variif(UniButtonEditnumero.Text               = '0'    ,'','AND M.NUMERO           = '  + QuotedStr(UniButtonEditnumero.Text))       +
            ' AND M.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company) +
            ' AND M.DOCUMENTO                             = ' + IntToStr(varC_Documento_MvmestreMFE);

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL + M_AND + M_SITUACAO + M_ORDEM;
  FDQryFiltro.Open();

  if FDQryFiltro.RecordCount > 0 then
    begin
      SetBut(tpListacomRegistros);
      FDQryFiltro.Last;
    end
  else
    SetBut(tpListaVazia);
end;

procedure TfrmMANIFESTO.CalculaPeso;
var
  pesoliquido, pesobruto, total:Real;
  conhecimento,nota     :Integer;
begin
  pesoliquido := 0;
  pesobruto   := 0;
  conhecimento:= 0;
  nota        := 0;
  total       := 0;

  TB_MANIFESTO.DisableControls;
  TB_MANIFESTO.First;
  while not TB_MANIFESTO.Eof do
    begin
      if TB_MANIFESTO.FindField('NUMERO').AsString <> '' then
        begin
          pesoliquido := pesoliquido + TB_MANIFESTO.FindField('PESOLIQUIDO').AsFloat;
          pesobruto   := pesobruto   + TB_MANIFESTO.FindField('PESOBRUTO').AsFloat;
          total       := total       + TB_MANIFESTO.FindField('TOTAL').AsFloat;

          if TB_MANIFESTOTIPO.AsString = 'NFE' then
            nota := nota +1
          else
            conhecimento := conhecimento +1;

        end;
      TB_MANIFESTO.Next;
    end;
    TB_MANIFESTO.First;
    TB_MANIFESTO.EnableControls;

  FDQryCad.FindField('PESOLIQUIDO').AsFloat      := pesoliquido;
  FDQryCad.FindField('PESOBRUTO').AsFloat        := pesobruto;
  FDQryCad.FindField('CONHECIMENTO').AsInteger   := conhecimento;
  FDQryCad.FindField('NOTA').AsInteger           := nota;
  FDQryCad.FindField('TOTAL').AsFloat            := total;
end;

function TfrmMANIFESTO.CamposValidados: Boolean;
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

procedure TfrmMANIFESTO.carregadados;
begin
  TB_MANIFESTO.Close;
  TB_MANIFESTO.Open;

  TB_MANIFESTO.DisableControls;
  TB_MANIFESTO.AfterPost    := nil;
  TB_MANIFESTO.AfterDelete  := nil;

  TabelaMfmestre  ('select * from mfmestre where codigo = ' + IntToStr(FDQryFiltro.FindField('codigo').AsInteger));
  if TabelaMfitens(' select * from mfitens where numero = ' + IntToStr(dm_rc.fdqrymfmestre.FindField('numero').AsInteger)   +
                   ' and documento                      = ' + IntToStr(dm_rc.fdqrymfmestre.FindField('documento').AsInteger)+
                   ' and empresa                        = ' + IntToStr(mm.varI_Code_Company) +
                   ' order by sequencia') then
  begin
    dm_rc.fdqrymfitens.First;
    while not dm_rc.fdqrymfitens.Eof do
      begin

        TB_MANIFESTO.Append;
        TB_MANIFESTO.FindField('NUMERO').AsInteger     := dm_rc.fdqrymfitens.FindField('NOTA').AsInteger;
        TB_MANIFESTO.FindField('CHAVE').AsString       := dm_rc.fdqrymfitens.FindField('CODIGOBARRAS').AsString;
        TB_MANIFESTO.FindField('IBGE').AsString        := dm_rc.fdqrymfitens.FindField('IBGE').AsString;
        TB_MANIFESTO.FindField('ESTADO').AsString      := dm_rc.fdqrymfitens.FindField('ESTADO').AsString;
        TB_MANIFESTO.FindField('CIDADE').AsString      := dm_rc.fdqrymfitens.FindField('CIDADE').AsString;
        TB_MANIFESTO.FindField('TIPO').AsString        := dm_rc.fdqrymfitens.FindField('TIPO').AsString;
        TB_MANIFESTO.FindField('PESOLIQUIDO').AsFloat  := dm_rc.fdqrymfitens.FindField('PESOLIQUIDO').AsFloat;
        TB_MANIFESTO.FindField('PESOBRUTO').AsFloat    := dm_rc.fdqrymfitens.FindField('PESOBRUTO').AsFloat;
        TB_MANIFESTO.FindField('TOTAL').AsFloat        := dm_rc.fdqrymfitens.FindField('TOTAL').AsFloat;
        TB_MANIFESTO.Post;

        dm_rc.fdqrymfitens.Next;
      end;
  end;

  TB_MANIFESTO.First;
  TB_MANIFESTO.AfterPost    := TB_MANIFESTOAfterPost;
  TB_MANIFESTO.AfterDelete  := TB_MANIFESTOAfterDelete;
  TB_MANIFESTO.EnableControls;

  UniComboBoxtrafrete.ItemIndex       := dm_rc.fdqrymfmestre.FindField('TIPOFRETE').AsInteger;
  UniComboBoxtipocarga.ItemIndex      := dm_rc.fdqrymfmestre.FindField('TIPOCARGA').AsInteger;
  UniComboBoxtipoveiculo.ItemIndex    := dm_rc.fdqrymfmestre.FindField('TIPOVEICULO').AsInteger;
  UniComboBoxtipocarroceria.ItemIndex := dm_rc.fdqrymfmestre.FindField('TIPOCARROCERIA').AsInteger;
  UniComboBoxtipoemitente.ItemIndex   := dm_rc.fdqrymfmestre.FindField('TIPOEMITENTE').AsInteger;

  UniPageControlmanifesto.ActivePage  := UniTabSheetnotasconhecimento;
end;

procedure TfrmMANIFESTO.CarregaNota(f_codigo: integer);
begin
  if SqlPesquisa(' SELECT P.CODIGO, P.NUMERO, P.EMPRESA, P.CODIGOBARRAS, PESSOAS.IBGE, PESSOAS.ESTADO, PESSOAS.CIDADE, P.TRAPESOBRUTO, P.TRAPESOLIQUIDO, P.VLRTOTAL    ' +
                 ' FROM MVMESTRE P                                          ' +
                 ' INNER JOIN PESSOAS ON (P.PESSOA = PESSOAS.CODIGO)        ' +
                 ' WHERE P.CODIGO                                         = ' + IntToStr(f_codigo)) then
    begin
      TB_MANIFESTO.FindField('CONTROLE').AsInteger  := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
      TB_MANIFESTO.FindField('NUMERO').AsInteger    := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
      TB_MANIFESTO.FindField('IBGE').AsString       := dm_rc.sqlBuscas.FindField('IBGE').AsString;
      TB_MANIFESTO.FindField('CHAVE').AsString      := dm_rc.sqlBuscas.FindField('CODIGOBARRAS').AsString;
      TB_MANIFESTO.FindField('CIDADE').AsString     := dm_rc.sqlBuscas.FindField('CIDADE').AsString;
      TB_MANIFESTO.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      TB_MANIFESTO.FindField('PESOBRUTO').AsFloat   := dm_rc.sqlBuscas.FindField('TRAPESOBRUTO').AsFloat;
      TB_MANIFESTO.FindField('PESOLIQUIDO').AsFloat := dm_rc.sqlBuscas.FindField('TRAPESOLIQUIDO').AsFloat;
      TB_MANIFESTO.FindField('TOTAL').AsFloat       := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsFloat;
      TB_MANIFESTO.FindField('TIPO').AsString       := 'NFE';
    end;
end;

procedure TfrmMANIFESTO.CarregaTransportes(f_codigo:integer);
begin
  if SqlPesquisa('select * from transportes where codigo = ' + IntToStr(f_codigo)) then
    begin
      FDQryCad.FindField('TRANSPORTADORA').AsInteger := f_codigo ;
      FDQryCad.FindField('NOMETRANSPORTADORA').AsString         := dm_rc.sqlBuscas.FindField('NOME').AsString;
      FDQryCad.FindField('CPFCNPJ').AsString         := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      FDQryCad.FindField('CIOT').AsString            := dm_rc.sqlBuscas.FindField('CIOT').AsString;
      FDQryCad.FindField('RNTC').AsString            := dm_rc.sqlBuscas.FindField('RNTC').AsString;
      FDQryCad.FindField('RENAVAM').AsString         := dm_rc.sqlBuscas.FindField('RENAVAM').AsString;

      FDQryCad.FindField('PLACATRATOR').AsString     := dm_rc.sqlBuscas.FindField('PLACA').AsString;
      FDQryCad.FindField('ESTADOTRATOR').AsString    := dm_rc.sqlBuscas.FindField('PLACAESTADO').AsString;
      FDQryCad.FindField('TRATORTARA').AsFloat       := dm_rc.sqlBuscas.FindField('TRATORTARA').AsFloat;
      FDQryCad.FindField('TRATORKG').AsFloat         := dm_rc.sqlBuscas.FindField('TRATORKG').AsFloat;
      FDQryCad.FindField('TRATORM3').AsFloat         := dm_rc.sqlBuscas.FindField('TRATORM3').AsFloat;

      FDQryCad.FindField('PLACACARRETA').AsString    := dm_rc.sqlBuscas.FindField('PLACACARRETA').AsString;
      FDQryCad.FindField('ESTADOCARRETA').AsString   := dm_rc.sqlBuscas.FindField('ESTADOCARRETA').AsString;
      FDQryCad.FindField('CARRETATARA').AsFloat      := dm_rc.sqlBuscas.FindField('CARRETATARA').AsFloat;
      FDQryCad.FindField('CARRETAKG').AsFloat        := dm_rc.sqlBuscas.FindField('CARRETAKG').AsFloat;
      FDQryCad.FindField('CARRETAM3').AsFloat        := dm_rc.sqlBuscas.FindField('CARRETAM3').AsFloat;

      FDQryCad.FindField('PLACAREBOQUE').AsString    := dm_rc.sqlBuscas.FindField('PLACAREBOQUE').AsString;
      FDQryCad.FindField('ESTADOREBOQUE').AsString   := dm_rc.sqlBuscas.FindField('ESTADOREBOQUE').AsString;
      FDQryCad.FindField('REBOQUETARA').AsFloat      := dm_rc.sqlBuscas.FindField('REBOQUETARA').AsFloat;
      FDQryCad.FindField('REBOQUEKG').AsFloat        := dm_rc.sqlBuscas.FindField('REBOQUEKG').AsFloat;
      FDQryCad.FindField('REBOQUEM3').AsFloat        := dm_rc.sqlBuscas.FindField('REBOQUEM3').AsFloat;
    end;
{
  if ValidadorAcbr(FDQryCad.FindField('CPFCNPJ').AsString,'CPFCNPJ') <> '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', ValidadorAcbr(FDQryCad.FindField('CPFCNPJ').AsString,'CPFCNPJ') , 'error' , false );
      UniDBEditcpfcnpj.SetFocus;
    end;
}
end;

procedure TfrmMANIFESTO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-160,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmMANIFESTO.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
if FDQryFiltro.RecordCount > 0 then
  begin
    pgBaseCadControl.ActivePage := tabRegister;

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

    pgBaseCadControl.ActivePage := tabRegister;

    carregadados();
  end;
end;

procedure TfrmMANIFESTO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmMANIFESTO.E1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := FDQryCad.FindField('CODIGO').AsInteger;
  frmSEFAZMANIFESTO.ShowModal();

  FDQryFiltro.Refresh;
  FDQryCad.Refresh;
end;

procedure TfrmMANIFESTO.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;

  executasql    (' update mfitens set mfitens.empresa = 0         ' +
                 ' where numero                       =           ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
                 ' and documento                      =           ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                        =           ' + IntToStr(mm.varI_Code_Company));

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
    TB_MANIFESTO.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmMANIFESTO.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmMANIFESTO.FDQryFiltrostatusGetText(Sender: TField;
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
      if FDQryFiltroCANCELADA.AsString = 'E' then
        Text := '<span class="badge badge-info">Encerrada</span>'
      else
        Text := '<span class="badge badge-warning">Aguarde</span>';
    end;
end;

procedure TfrmMANIFESTO.GravaManifesto;
begin
  TabelaMfitens('select * from mfitens where codigo = 0');
  executasql(' delete from mfitens where numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   + 
             ' and documento                    = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
             ' and empresa                      = ' + IntToStr(mm.varI_Code_Company));

  TB_MANIFESTO.DisableControls;
  TB_MANIFESTO.First;            
  while not TB_MANIFESTO.Eof do
    begin
      if TB_MANIFESTO.FindField('NUMERO').AsString <> '' then
        begin
          dm_rc.fdqrymfitens.Append;
          dm_rc.fdqrymfitens.FindField('SEQUENCIA').AsInteger    := TB_MANIFESTO.RecNo;            
          dm_rc.fdqrymfitens.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;
          dm_rc.fdqrymfitens.FindField('CODIGO').AsInteger       := Ultimo_Codigo('MFITENS','CODIGO',True);
          dm_rc.fdqrymfitens.FindField('KEY').AsString           := Gera_Guid();
          dm_rc.fdqrymfitens.FindField('TIPO').AsString          := TB_MANIFESTO.FindField('TIPO').AsString;
          dm_rc.fdqrymfitens.FindField('NOTA').AsInteger         := TB_MANIFESTO.FindField('NUMERO').AsInteger;      
          dm_rc.fdqrymfitens.FindField('DOCUMENTO').AsInteger    := FDQryCad.FindField('DOCUMENTO').AsInteger;
          dm_rc.fdqrymfitens.FindField('NUMERO').AsInteger       := FDQryCad.FindField('NUMERO').AsInteger;
          dm_rc.fdqrymfitens.FindField('CODIGOBARRAS').AsString  := TB_MANIFESTO.FindField('CHAVE').AsString;
          dm_rc.fdqrymfitens.FindField('IBGE').AsString          := TB_MANIFESTO.FindField('IBGE').AsString;
          dm_rc.fdqrymfitens.FindField('CIDADE').AsString        := TB_MANIFESTO.FindField('CIDADE').AsString;
          dm_rc.fdqrymfitens.FindField('ESTADO').AsString        := TB_MANIFESTO.FindField('ESTADO').AsString;
          dm_rc.fdqrymfitens.FindField('PESOBRUTO').AsFloat      := TB_MANIFESTO.FindField('PESOBRUTO').AsFloat;
          dm_rc.fdqrymfitens.FindField('PESOLIQUIDO').AsFloat    := TB_MANIFESTO.FindField('PESOLIQUIDO').AsFloat;
          dm_rc.fdqrymfitens.FindField('TOTAL').AsFloat          := TB_MANIFESTO.FindField('TOTAL').AsFloat;
          dm_rc.fdqrymfitens.Post;  
        end;

      TB_MANIFESTO.Next; 
    end;
    
  TB_MANIFESTO.First;
  TB_MANIFESTO.EnableControls;      
end;

procedure TfrmMANIFESTO.L1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := FDQryFiltro.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica           := 'LOGMANIFESTO';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmMANIFESTO.LimpaVars;
begin
  UniComboBoxtrafrete.ItemIndex       := 0;
  UniComboBoxtipocarga.ItemIndex      := 0;
  UniComboBoxtipoveiculo.ItemIndex    := 2;
  UniComboBoxtipocarroceria.ItemIndex := 2;
  UniComboBoxtipoemitente.ItemIndex   := 0;
end;

procedure TfrmMANIFESTO.MemoGravaLog;
begin
  UniMemolog.Clear;
  SqlPesquisa('select * from mfmestre, transportes where mfmestre.codigo = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger) +
              ' and mfmestre.transportadora = transportes.codigo');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

  SqlPesquisa('select * from mfitens where mfitens.numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger)   +
              ' and mfitens.documento                     = ' + IntToStr(FDQryCad.FindField('DOCUMENTO').AsInteger)+
              ' and mfitens.empresa                       = ' + IntToStr(mm.varI_Code_Company)                     +
              ' order by mfitens.sequencia');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

end;

procedure TfrmMANIFESTO.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := True;
       btnOptions.Visible    := True;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := False;
      end
   else if acao in [tpCalcular] then
     begin
        btnNewReg.Visible     := false;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := True;
        btnSaveReg.Visible    := True;
        btnOptions.Visible    := True;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
        btnOptions.Visible    := True;
       end;
end;

procedure TfrmMANIFESTO.TB_MANIFESTOAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculaPeso();
end;

procedure TfrmMANIFESTO.TB_MANIFESTOAfterPost(DataSet: TDataSet);
begin
  inherited;
  CalculaPeso();
end;

procedure TfrmMANIFESTO.TB_MANIFESTObuscanotaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmMANIFESTO.TB_MANIFESTOexcluinotaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';

end;

procedure TfrmMANIFESTO.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('IBGEDESCARREGAMENTO').AsString := MM.varC_codigo_busca;
       
       if SqlPesquisa('SELECT * FROM CIDADES WHERE CODIIBGE = ' + QuotedStr(MM.varC_codigo_busca)) then
         begin
           FDQryCad.FindField('CIDADEDESCARREGAMENTO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
           FDQryCad.FindField('UFDESCARREGAMENTO').AsString     := dm_rc.sqlBuscas.FindField('UF').AsString;
         end;
     end;
   end);

end;

procedure TfrmMANIFESTO.UniButtonDbEditibgecarregamentoButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('IBGECARREGAMENTO').AsString := MM.varC_codigo_busca;
       
       if SqlPesquisa('SELECT * FROM CIDADES WHERE CODIIBGE = ' + QuotedStr(MM.varC_codigo_busca)) then
         begin
           FDQryCad.FindField('CIDADECARREGAMENTO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
           FDQryCad.FindField('UFCARRREGAMENTO').AsString    := dm_rc.sqlBuscas.FindField('UF').AsString;
         end;
     end;
   end);
end;

procedure TfrmMANIFESTO.UniButtonDbEditTRANSPORTADORAButtonClick(
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

procedure TfrmMANIFESTO.UniButtonDbEditTRANSPORTADORAExit(Sender: TObject);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then  
    CarregaTransportes(FDQryCad.FindField('TRANSPORTADORA').AsInteger);
end;

procedure TfrmMANIFESTO.UniButtonEdittransportadoraButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEdittransportadora.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmMANIFESTO.UniDBEditcpfcnpjExit(Sender: TObject);
begin
  inherited;

  if  Length(FDQryCad.FindField('CPFCNPJ').AsString) > 11 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'COLOQUE APENAS CPF DO MOTORISTA' , 'error' , false );
      ABORT;
    end ;
    {
  else
    begin
      if ValidadorAcbr(FDQryCad.FindField('CPFCNPJ').AsString,'CPFCNPJ') <> '' then
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', ValidadorAcbr(FDQryCad.FindField('CPFCNPJ').AsString,'CPFCNPJ') , 'error' , false );
          ABORT;
        end;
    end;
    }
end;

procedure TfrmMANIFESTO.UniDBGridmanifestosCellClick(Column: TUniDBGridColumn);
begin
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'excluinota' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              TB_MANIFESTO.Delete;
            end
        end;

      if Column.FieldName = 'buscanota' then
        begin
          MM.Seta_Busca('NOTAELETRONICA');
          UniFfrmPesquisa.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               TB_MANIFESTO.Edit;
               CarregaNota(StrToInt(MM.varC_codigo_busca));
             end;
           end);
        end;
    end;
end;

procedure TfrmMANIFESTO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  labTitleForm.Caption               := 'MANIFESTO ELETRÔNICO';
  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  cbxSearchCRUDFieldordem.ItemIndex  := 1;
  cbxSearchCRUDFieldstatus.ItemIndex := 2;
  varC_Documento_MvmestreMFE         := 20;
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmMANIFESTO.UniFrameDestroy(Sender: TObject);
begin
  inherited;
  dm_rc.fdqrymfmestre.Close;
  dm_rc.fdqrymfitens.Close;  
end;

initialization
  RegisterClass(TfrmMANIFESTO);
end.
