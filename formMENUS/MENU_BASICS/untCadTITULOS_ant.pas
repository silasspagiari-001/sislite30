unit untCadTITULOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniEdit, uniDBEdit,
  uniLabel, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UniButtonDbEdit,
  UniButtonEdit, uniBasicGrid, uniDBGrid, uniDateTimePicker, uniScrollBox,
  uniPageControl, uniButton, uniBitBtn, uniMultiItem, uniComboBox, clipbrd,
  Vcl.Menus, uniMainMenu, uniDBComboBox, uniSpeedButton, uniDBDateTimePicker,
  uniMemo;

type

  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmBaseTITULOS = class(TfrmBase)
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
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    paSearchOp1: TUniContainerPanel;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniButtonEditpbancos: TUniButtonEdit;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxSearchCRUDField2: TUniComboBox;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniComboBoxSTATUS: TUniComboBox;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroVENCIMENTO: TDateField;
    FDQryFiltroPAGAMENTO: TDateField;
    FDQryFiltroVALORATUAL: TFMTBCDField;
    FDQryFiltroSITUACAO: TStringField;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
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
    popMenuOptions: TUniPopupMenu;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBEditnumero: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcDBComboBox50: TUniDBComboBox;
    UniLabel7: TUniLabel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    edSearchCRUD2: TUniEdit;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniLabel40: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniLabel17: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniLabel49: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniLabel50: TUniLabel;
    UniEditportadordescricao: TUniEdit;
    UniEditplanodescricao: TUniEdit;
    UniEditnomevendedor: TUniEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBEdit6: TUniDBEdit;
    UniLabel12: TUniLabel;
    FDQryFiltroCODIGO: TIntegerField;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniButtonDbEdit4: TUniButtonDbEdit;
    rcBlock270: TUniContainerPanel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel13: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    rcBlock310: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    rcBlock340: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel26: TUniLabel;
    UniLabelTOTALTITULOS: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniButtonEditppessoas: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniButtonEditpnumero: TUniButtonEdit;
    UniLabel2: TUniLabel;
    UniDBEditsequencia: TUniDBEdit;
    UniLabel27: TUniLabel;
    UniMemolog: TUniMemo;
    G1: TUniMenuItem;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniComboBoxserie: TUniComboBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure FDQryFiltroSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure labExitClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);

    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure UniButtonDbEdit3Exit(Sender: TObject);
    procedure UniButtonDbEdit4Exit(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit4ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1Exit(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditppessoasButtonClick(Sender: TObject);
    procedure cbxSearchCRUDField2Change(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure G1Click(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  iCurrentPage : integer;

  procedure ativabusca();
  procedure rc_DefaultTitleForm;

  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure Exclui();
  procedure LimpaVars();
  procedure CarregaDados();
  procedure SomaTotal();

  procedure MemoGravaLog();

  end;

var
  frmBaseTITULOS: TfrmBaseTITULOS;
  state           : string;

implementation

{$R *.dfm}

uses untDM_RC, MainModule, mkm_func_web, untFrmLookUp_Lite, mkm_layout,
  mkm_procedures, mkm_funcoes, System.TypInfo, uconsts, untFrmPesquisa,
  untfrmImpressaoFinanceiro, untFrmTELAGENERICA, mkm_impressao,
  unReportImpressao;

procedure TfrmBaseTITULOS.ativabusca;
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

procedure TfrmBaseTITULOS.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;
   LimpaVars;
end;

procedure TfrmBaseTITULOS.btnCloseFormClick(Sender: TObject);
begin
  inherited;
  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseTITULOS.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'POSSO EXCLUIR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
      Exclui();
    end;
end;

procedure TfrmBaseTITULOS.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;

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
  Except
   Abort ;
  End ;

end;

procedure TfrmBaseTITULOS.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

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

   FDQryCad.Insert ;
   FDQryCad.FindField('CODIGO').AsInteger      := 0;
   FDQryCad.FindField('SEQUENCIA').AsInteger   := 1;
   FDQryCad.FindField('PORTADOR').AsInteger    := 0;
   FDQryCad.FindField('DOCUMENTO').AsInteger   := 30;
   FDQryCad.FindField('PLANOCONTAS').AsInteger := 0;
   FDQryCad.FindField('FUNCIONARIO').AsInteger := 0;
   FDQryCad.FindField('VALORDESCONTOS').AsFloat:= 0;
   FDQryCad.FindField('VALORTAXAS').AsFloat    := 0;
   FDQryCad.FindField('VALORJUROS').AsFloat    := 0;
   FDQryCad.FindField('VALORATUAL').AsFloat    := 0;
   FDQryCad.FindField('VALORORIGINAL').AsFloat := 0;
   FDQryCad.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
   FDQryCad.FindField('SITUACAO').AsString     := 'Aberto';
   FDQryCad.FindField('SERIE').AsString        := 'DUP';
   FDQryCad.FindField('EMISSAO').AsDateTime    := Date;
   FDQryCad.FindField('FINANCEIRO').AsInteger  := varIIF(FDQryCad.UpdateOptions.UpdateTableName = 'PAGAR',0,1);

end;

procedure TfrmBaseTITULOS.btnOptionsClick(Sender: TObject);
begin
  dm_rc.tbgenerico.Close;
  dm_rc.tbgenerico.CopyDataSet(FDQryFiltro,[coStructure, coRestart, coAppend]);

  mm.varSR_Dataini := edSearchCRUDDtIni.Text;
  mm.varSR_Datafin := edSearchCRUDDtEnd.Text;
  mm.varSR_tipo    := variif(FDQryCad.UpdateOptions.UpdateTableName = 'RECEBER','1','0');

  if dm_rc.tbgenerico.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Financeiro(
                             MM.varSR_tipo,
                             mm.varSR_Dataini,
                             mm.varSR_Datafin,
                             mm.varI_Code_Company,
                             0,
                             dm_rc.tbgenerico);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmBaseTITULOS.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);
           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
         end;

       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;
       mm.FDTransaction.CommitRetaining;
       mm.FDTransaction.Commit;

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

procedure TfrmBaseTITULOS.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmBaseTITULOS.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  if UniButtonEditpbancos.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Bancos ou deixa "0"', 'warning' ) ;
      UniButtonEditpbancos.SetFocus;
      abort
    end;

  if UniButtonEditppessoas.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Pessoas ou deixa "0"', 'warning' ) ;
      UniButtonEditppessoas.SetFocus;
      abort;
    end;

  if UniButtonEditpnumero.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Numero ou deixa "0"', 'warning' ) ;
      UniButtonEditpnumero.SetFocus;
      abort;
    end;


  CAMPOS := ' T.KEY, T.CODIGO, T.NUMERO, T.DOCUMENTO, T.EMPRESA, T.SERIE, T.SEQUENCIA,T.PESSOA,P.NOME,T.EMISSAO,T.VENCIMENTO,T.PAGAMENTO,T.VALORATUAL,T.VALORORIGINAL,T.VALORPAGO,T.OBSERVACOES,T.SITUACAO ';

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_ORDEM := ' ORDER BY T.EMISSAO';
    1: M_ORDEM := ' ORDER BY T.VENCIMENTO';
    2: M_ORDEM := ' ORDER BY T.PAGAMENTO';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;


  SQL :=    ' SELECT ' + CAMPOS +
            ' FROM   ' + FDQryCad.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryCad.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA      = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR    = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO      = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniComboBoxserie.Text                  = 'TT'   ,'','AND T.SERIE       = ' + QuotedStr(UniComboBoxserie.Text))             +
            ' AND T.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company);

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL + M_AND + M_SITUACAO + M_ORDEM;
  FDQryFiltro.Open();

  //CLIPBOARD.AsText :=  SQL + M_AND + M_SITUACAO + M_ORDEM;

  SomaTotal();
  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

function TfrmBaseTITULOS.CamposValidados: Boolean;
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

procedure TfrmBaseTITULOS.CarregaDados;
begin
  if SqlPesquisa('SELECT CODIGO, NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(FDQryCad.FindField('PESSOA').AsString)) then
    begin
      edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
    end;

  UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,FDQryCad.FindField('PORTADOR').AsString);
  UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,FDQryCad.FindField('PLANOCONTAS').AsString);
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',FDQryCad.FindField('FUNCIONARIO').AsString);

end;

procedure TfrmBaseTITULOS.cbxSearchCRUDField2Change(Sender: TObject);
begin
  inherited;
  if cbxSearchCRUDField2.ItemIndex = 2 then
    UniComboBoxSTATUS.ItemIndex := 1;  
end;

procedure TfrmBaseTITULOS.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  pgBaseCadControl.ActivePage := tabRegister;
  LimpaVars();

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
    begin
      CarregaDados();
    end;

  pgBaseCadControl.ActivePage := tabRegister;
end;

procedure TfrmBaseTITULOS.Excel1Click(Sender: TObject);
var url, filename, reportname : String;
    //exportExcel: TDataSetToExcel;
    i: integer;
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseTITULOS.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;
  FDQryCad.Delete;

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

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
  SomaTotal();
end;

procedure TfrmBaseTITULOS.FDQryFiltroSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge badge-warning">Aberto</span>'
      else
      if FDQryFiltroSITUACAO.AsString = 'Pago' then
        Text := '<span class="badge badge-success">Pago</span>';

      if FDQryFiltroSITUACAO.AsString = 'Aberto' then
        begin
          if Date > FDQryFiltroVENCIMENTO.AsDateTime then
            Text := '<span class="badge badge-danger">Atrasado</span>';
        end;
    end;
end;

procedure TfrmBaseTITULOS.G1Click(Sender: TObject);
begin
  inherited;

  mm.VarC_Atelagenerica := 'PARCELATITULOS';
  frmTELAGENERICA.ShowModal();
end;
procedure TfrmBaseTITULOS.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';

  ed_Table_Status_OLD.Text := '';

  if pgBaseCadControl.ActivePage = tabRegister then
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

procedure TfrmBaseTITULOS.LimpaVars;
begin
  edSearchCRUD2.Text            := '';
  UniEdit1.Text                 := '';
  UniEdit2.Text                 := '';
  UniEditportadordescricao.Text := '';
  UniEditplanodescricao.Text    := '';
  UniEditnomevendedor.Text      := '';
end;

procedure TfrmBaseTITULOS.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (FDQryCad.FieldCount - 1) do
    UniMemolog.Lines.Add(FDQryCad.Fields[i].DisplayName + ':' + FDQryCad.Fields[i].DisplayText);
end;

procedure TfrmBaseTITULOS.rc_DefaultTitleForm;
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

procedure TfrmBaseTITULOS.SetBut(Acao: TAcaoCrud);
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
       btnSaveReg.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;
end;

procedure TfrmBaseTITULOS.SomaTotal;
var
  sumvalue : Real;
begin
  sumvalue := 0;

  FDQryFiltro.DisableControls;
  FDQryFiltro.First;
  while not FDQryFiltro.Eof do
    begin
      sumvalue := sumvalue + FDQryFiltro.FindField('VALORATUAL').AsFloat;
      FDQryFiltro.Next;
    end;
  FDQryFiltro.First;
  FDQryFiltro.EnableControls;

  UniLabelTOTALTITULOS.Text := FormatFloat('R$ #,0.00', sumvalue);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit1ButtonClick(Sender: TObject);
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

procedure TfrmBaseTITULOS.UniButtonDbEdit1Exit(Sender: TObject);
begin
  inherited;
  if (UniButtonDbEdit1.Text <> '') and (UniButtonDbEdit1.Text <> '0') then
    if SqlPesquisa('SELECT NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEdit1.Text)) then
      begin
        edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
        UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
        UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
      end;
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PORTADOR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit2Exit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,FDQryCad.FindField('PORTADOR').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PLANOCONTAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PLANOCONTAS').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit3Exit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,FDQryCad.FindField('PLANOCONTAS').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit4ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('FUNCIONARIO').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit4Exit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',FDQryCad.FindField('FUNCIONARIO').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonEditpbancosButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonEditppessoasButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditppessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniFrameCreate(Sender: TObject);
begin
  inherited;

  cbxSearchCRUDField2.ItemIndex := 1;
  UniComboBoxSTATUS.ItemIndex   := 0;

  edSearchCRUDDtIni.Text        := '01/01/2010';
  edSearchCRUDDtEnd.Text        := '31/12/2099';
  btnSearchCRUD.OnClick(Self);
  ativabusca();
end;

end.
