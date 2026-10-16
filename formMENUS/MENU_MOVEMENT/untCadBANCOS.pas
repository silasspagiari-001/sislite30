unit untCadBANCOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniDBDateTimePicker, uniDBEdit, UniButtonDbEdit, uniDBComboBox, uniBasicGrid,
  uniDBGrid, uniMultiItem, uniComboBox, uniDateTimePicker, uniGUIClasses,
  uniEdit, UniButtonEdit, uniLabel, uniScrollBox, uniPanel, uniPageControl,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  uniHTMLFrame, uniGUIBaseClasses, uniGUITypes, uniMemo, uniDBMemo;

type

  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmcadBANCOS = class(TfrmBase)
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
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniEditdescricaobanco: TUniEdit;
    UniLabel1: TUniLabel;
    UniFormattedNumberEditcsaldo: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    FDQryFiltroKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroTIPO: TStringField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroPAGAMENTO: TDateField;
    FDQryFiltroVALORPAGO: TFMTBCDField;
    FDQryFiltroDATALANCAMENTO: TDateField;
    FDQryFiltroPORTADOR: TIntegerField;
    FDQryFiltroDESCPORTADOR: TStringField;
    FDQryFiltroAPLICACAO: TIntegerField;
    FDQryFiltroDESCAPLICACAO: TStringField;
    FDQryFiltroHISTORICO: TStringField;
    FDQryFiltroCODHISTORICO: TIntegerField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroDOCUMENTO: TStringField;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroPLANOCONTAS: TFMTBCDField;
    FDQryFiltroPLANODESCRICAO: TStringField;
    FDQryFiltroCONCILIADA: TStringField;
    FDQryFiltroCOMPETENCIA: TDateField;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcDBComboBox50: TUniDBComboBox;
    UniLabel7: TUniLabel;
    UniDBDateTimePickerPAGAMENTO: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel8: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    UniButtonDbEditcodportador: TUniButtonDbEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniButtonDbEditplanocontas: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBComboBoxTIPO: TUniDBComboBox;
    UniLabel11: TUniLabel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    UniButtonDbEditCODHISTORICO: TUniButtonDbEdit;
    UniLabel13: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    UniMemolog: TUniMemo;
    rcBlock160: TUniContainerPanel;
    UniLabel28: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniDBMemoobs: TUniDBMemo;
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonEditpbancosExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);

    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniButtonDbEditcodportadorButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodportadorExit(Sender: TObject);
    procedure UniButtonDbEditplanocontasButtonClick(Sender: TObject);
    procedure UniButtonDbEditplanocontasExit(Sender: TObject);
    procedure UniButtonDbEditCODHISTORICOButtonClick(Sender: TObject);
    procedure UniButtonDbEditCODHISTORICOExit(Sender: TObject);
    procedure labExitClick(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }

  procedure  SetBut(Acao:TAcaoCrud);
  procedure  ativabusca();
  function   CamposValidados :Boolean;
  procedure  Exclui();
  procedure  SaldoConta();
  procedure  MemoGravaLog();

  end;

var
  frmcadBANCOS: TfrmcadBANCOS;
  state       : string;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_func_web, mkm_procedures,
  System.DateUtils, untDM_RC, mkm_funcoes, System.TypInfo, untFrmTELAGENERICA;

procedure TfrmcadBANCOS.ativabusca;
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

procedure TfrmcadBANCOS.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;
end;

procedure TfrmcadBANCOS.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin

  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
      Exclui();
      SaldoConta();
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

procedure TfrmcadBANCOS.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

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
  Except
   Abort ;
  End ;

end;

procedure TfrmcadBANCOS.btnNewRegClick(Sender: TObject);
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


  if not( FDQryCad.Active) then
      FDQryCad.Open;

   FDQryCad.Insert ;
   FDQryCad.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;
   FDQryCad.FindField('SERIE').AsString         := 'MVB';
   FDQryCad.FindField('PAGAMENTO').AsDateTime   := Date;
   FDQryCad.FindField('EMISSAO').AsDateTime     := Date;
   FDQryCad.FindField('COMPETENCIA').AsDateTime := Date;
   FDQryCad.FindField('SEQUENCIA').AsInteger    := 1;
   UniButtonDbEditcodportador.SetFocus;
end;

procedure TfrmcadBANCOS.btnSaveRegClick(Sender: TObject);
begin
  inherited;

  if UniDBFormattedNumberEdit1.Value = 0 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque um valor!' , 'error' , false );
      UniDBFormattedNumberEdit1.SetFocus;
      Abort;
    end;


  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo('BANCOS','CODIGO',True);
           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
         end;

       FDQryCad.FindField('EMISSAO').AsDateTime   := FDQryCad.FindField('PAGAMENTO').AsDateTime;
       FDQryCad.FindField('SEQUENCIA').AsInteger  := Sequencia_Caixa(FDQryCad.FindField('PAGAMENTO').AsDateTime,
                                                                     FDQryCad.FindField('PORTADOR').AsInteger);
       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;

       mm.FDTransaction.CommitRetaining;
       mm.FDTransaction.Commit;

       try
         SaldoConta();
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

procedure TfrmcadBANCOS.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmcadBANCOS.btnSearchCRUDClick(Sender: TObject);
var
  SQL : string;
begin
  inherited;

  SQL := ' SELECT * FROM BANCOS         ' +
         ' WHERE EMPRESA             =  ' + IntToStr(mm.varI_Code_Company)               +
         ' AND PAGAMENTO BETWEEN        ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
         ' AND                          ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
         ' AND PORTADOR              =  ' + QuotedStr(UniButtonEditpbancos.Text)         +
         ' ORDER BY PAGAMENTO, SEQUENCIA';

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL;
  FDQryFiltro.Open();
  FDQryFiltro.Last;

  SaldoConta();

  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);

end;

function TfrmcadBANCOS.CamposValidados: Boolean;
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

procedure TfrmcadBANCOS.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
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

end;

procedure TfrmcadBANCOS.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (FDQryFiltroTIPO.AsString  = 'Saida' ) then
    attribs.Font.Color:= clRed
  else
  if (FDQryFiltroTIPO.AsString  = 'Entrada' ) then
    attribs.Font.Color:= clBlue;

end;

procedure TfrmcadBANCOS.Exclui;
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

end;

procedure TfrmcadBANCOS.FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroTIPO.AsString = 'Entrada' then
        Text := '<span class="badge badge-success">Entrada</span>'
      else
      if FDQryFiltroTIPO.AsString = 'Saida' then
        Text := '<span class="badge badge-danger">Saida</span>'
      else
        Text := '<span class="badge badge-warning">Aguarde</span>'
    end;
end;

procedure TfrmcadBANCOS.labExitClick(Sender: TObject);
var
   I, F : integer;
begin
  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmcadBANCOS.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (FDQryCad.FieldCount - 1) do
    UniMemolog.Lines.Add(FDQryCad.Fields[i].DisplayName + ':' + FDQryCad.Fields[i].DisplayText);
end;

procedure TfrmcadBANCOS.SaldoConta;
begin
  if UniButtonEditpbancos.Text <> '0' then
    UniFormattedNumberEditcsaldo.Value :=  Calcula_SaldoatualCaixa(mm.varI_Code_Company,StrToInt(UniButtonEditpbancos.Text),Date);
end;

procedure TfrmcadBANCOS.SetBut(Acao: TAcaoCrud);
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

procedure TfrmcadBANCOS.UniButtonDbEditCODHISTORICOButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('HISTORICO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CODHISTORICO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadBANCOS.UniButtonDbEditCODHISTORICOExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    if UniButtonDbEditCODHISTORICO.Text <> '' then
      FDQryCad.FindField('HISTORICO').AsString := Acha_Item('HISTORICO'  ,UniButtonDbEditCODHISTORICO.Text);
end;

procedure TfrmcadBANCOS.UniButtonDbEditcodportadorButtonClick(Sender: TObject);
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

procedure TfrmcadBANCOS.UniButtonDbEditcodportadorExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    if UniButtonDbEditcodportador.Text <> '' then
      FDQryCad.FindField('DESCPORTADOR').AsString := Acha_Item('PORTADORES'  ,UniButtonDbEditcodportador.Text);
end;

procedure TfrmcadBANCOS.UniButtonDbEditplanocontasButtonClick(Sender: TObject);
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

procedure TfrmcadBANCOS.UniButtonDbEditplanocontasExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if UniButtonDbEditplanocontas.Text <> '' then
        begin
          SqlPesquisa('select plano,descricao,tipo from planocontas where plano = ' + QuotedStr(UniButtonDbEditplanocontas.Text));
          FDQryCad.FindField('PLANODESCRICAO').AsString  := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
          FDQryCad.FindField('TIPO').AsString            := dm_rc.sqlBuscas.FindField('TIPO').AsString;
        end;
    end;
end;

procedure TfrmcadBANCOS.UniButtonEditpbancosButtonClick(Sender: TObject);
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

procedure TfrmcadBANCOS.UniButtonEditpbancosExit(Sender: TObject);
begin
  inherited;
    UniEditdescricaobanco.Text := Acha_Item('PORTADORES'  ,UniButtonEditpbancos.Text);
end;

procedure TfrmcadBANCOS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));

  btnSearchCRUD.OnClick(Self);
  ativabusca();
end;

initialization
  RegisterClass(TfrmcadBANCOS);
end.
