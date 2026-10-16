unit untFrmCOMPOSICAOPRODUTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniDBEdit, UniButtonDbEdit, uniLabel, uniEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid,
  uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros,tpCalcular);

  TfrmCOMPOSICAOPRODUTO = class(TUniForm)
    paBaseButtons: TUniContainerPanel;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniButtonDbEditproduto: TUniButtonDbEdit;
    UniLabel1: TUniLabel;
    UniDBFormattedNumberEditvlrcusto: TUniDBFormattedNumberEdit;
    UniLabel4: TUniLabel;
    FDQryCad: TFDQuery;
    dscrud: TDataSource;
    UniDBGridprodutos: TUniDBGrid;
    tbcompostoitens: TFDMemTable;
    dscompostoitens: TDataSource;
    tbcompostoitensPRODUTO: TIntegerField;
    tbcompostoitensDESCRICAO: TStringField;
    tbcompostoitensQUANTIDADE: TFloatField;
    tbcompostoitensVLRCOMPRA: TFloatField;
    tbcompostoitensVLRCUSTO: TFloatField;
    tbcompostoitensTOTALCOMPRA: TFloatField;
    tbcompostoitensTOTALCUSTO: TFloatField;
    tbcompostoitensbuscaproduto: TStringField;
    tbcompostoitensexclui: TStringField;
    btnLkpClear: TUniBitBtn;
    FDQryFiltro: TFDQuery;
    dsfiltro: TDataSource;
    btnCalcReg: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniScreenMask1: TUniScreenMask;
    procedure tbcompostoitensbuscaprodutoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure tbcompostoitensexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure tbcompostoitensAfterDelete(DataSet: TDataSet);
    procedure tbcompostoitensAfterPost(DataSet: TDataSet);
    procedure tbcompostoitensBeforeDelete(DataSet: TDataSet);
    procedure tbcompostoitensBeforePost(DataSet: TDataSet);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCalcRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  procedure  SetBut(Acao: TAcaoCrud);
  procedure  carregaprodutos(codigo: string);
  procedure  CalculaCusto();
  procedure  gravamemoria();
  procedure  gravacomposicaoitens();
  procedure  carregacomposicao();
  procedure  Exclui();
  procedure  calculaformacao();
  end;

function frmCOMPOSICAOPRODUTO: TfrmCOMPOSICAOPRODUTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, System.TypInfo, mkm_procedures, mkm_funcoes,
  untFrmPesquisaProduto, untDM_RC, mkm_func_web;

function frmCOMPOSICAOPRODUTO: TfrmCOMPOSICAOPRODUTO;
begin
  Result := TfrmCOMPOSICAOPRODUTO(mm.GetFormInstance(TfrmCOMPOSICAOPRODUTO));
end;

procedure TfrmCOMPOSICAOPRODUTO.btnCalcRegClick(Sender: TObject);
begin
//  if FDQryCad.FindField('MARGEM').AsFloat > 0 then
    CalculaCusto();
    calculaformacao();
//  else
//    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'COLOQUE UMA % DE MARGEM' , 'error' , false );

  SetBut(tpCalcular);
end;

procedure TfrmCOMPOSICAOPRODUTO.btnCancelRegClick(Sender: TObject);
begin
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;
   tbcompostoitens.Close;
end;

procedure TfrmCOMPOSICAOPRODUTO.btnDeleteRegClick(Sender: TObject);
begin
  Exclui();
end;

procedure TfrmCOMPOSICAOPRODUTO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

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

    if FDQryCad.State in [dsInsert] then
    begin
      S := 1;
      tbcompostoitens.Close;
      tbcompostoitens.Open;
    end
    else
      S := tbcompostoitens.RecordCount + 100;

    tbcompostoitens.DisableControls;
    tbcompostoitens.AfterDelete  := nil;
    tbcompostoitens.AfterPost    := nil;
    tbcompostoitens.BeforePost   := nil;
    tbcompostoitens.BeforeDelete := nil;

    for R := S to S + 100 do
    begin
      tbcompostoitens.Append;
      tbcompostoitens.Post;
    end;

    tbcompostoitens.First;
    tbcompostoitens.AfterDelete  := tbcompostoitensAfterDelete;
    tbcompostoitens.AfterPost    := tbcompostoitensAfterPost;
    tbcompostoitens.BeforeDelete := tbcompostoitensBeforeDelete;
    tbcompostoitens.BeforePost   := tbcompostoitensBeforePost;
    tbcompostoitens.EnableControls;
    tbcompostoitens.First;
  Except
   Abort ;
  End ;
end;

procedure TfrmCOMPOSICAOPRODUTO.btnLkpClearClick(Sender: TObject);
begin
  if mm.varPRODUTO_EDITADO = 'S' then
    begin
      mm.varCUSTO_COMPOSICAO := FDQryCad.FindField('VENDA').AsFloat;
      mm.varCUSTO_UNITARIO   := FDQryCad.FindField('TOTALCUSTO').AsFloat;
    end;

  ModalResult := mrOK;
end;

procedure TfrmCOMPOSICAOPRODUTO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

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

  FDQryCad.Insert;
  FDQryCad.FindField('EMPRESA').AsInteger   := mm.varI_Code_Company;
  FDQryCad.FindField('PRODUTO').AsInteger   := mm.varCP_CODIGO;
  FDQryCad.FindField('TOTALCOMPRA').AsFloat := 0;
  FDQryCad.FindField('TOTALCUSTO').AsFloat  := 0;
  FDQryCad.FindField('MARGEM').AsFloat      := 0.000;
  FDQryCad.FindField('VENDA').AsFloat       := 0.00;

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

  if FDQryCad.State in [dsInsert] then
  begin
    S := 1;

    tbcompostoitens.Close;
    tbcompostoitens.Open;
  end
  else
    S := tbcompostoitens.RecordCount + 10;

  tbcompostoitens.DisableControls;
  tbcompostoitens.AfterDelete  := nil;
  tbcompostoitens.AfterPost    := nil;
  tbcompostoitens.BeforePost   := nil;
  tbcompostoitens.BeforeDelete := nil;

  for R := S to S + 100 do
  begin
    tbcompostoitens.Append;
    tbcompostoitens.Post;
  end;

  tbcompostoitens.First;
  tbcompostoitens.AfterDelete  := tbcompostoitensAfterDelete;
  tbcompostoitens.AfterPost    := tbcompostoitensAfterPost;
  tbcompostoitens.BeforeDelete := tbcompostoitensBeforeDelete;
  tbcompostoitens.BeforePost   := tbcompostoitensBeforePost;
  tbcompostoitens.EnableControls;
  tbcompostoitens.First;
end;

procedure TfrmCOMPOSICAOPRODUTO.btnSaveRegClick(Sender: TObject);
begin
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       try
         if FDQryCad.State in [dsInsert] then
           begin
             FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo('COMPOSICAO','CODIGO',True);
             FDQryCad.FindField('KEY').AsString     := Gera_Guid;
           end;

         FDQryCad.Post;

         gravacomposicaoitens();

         mm.FDTransaction.CommitRetaining;
         MM.FDTransaction.Commit;

         dm_rc.rc_ShowSweetAlert( 'OK', 'COMPOSIÇÃO GRAVADA COM SUCESSO' , 'sucess' , false );
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR A COMPOSIÇÃO' , 'error' , false );
       end;
     End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);
end;

procedure TfrmCOMPOSICAOPRODUTO.CalculaCusto;
var
  M_MARCA      : TBookMark;
  M_TOTALCUSTO : Real;
begin
  M_MARCA := tbcompostoitens.GetBookmark;
  tbcompostoitens.DisableControls;

  tbcompostoitens.AfterDelete  := nil;
  tbcompostoitens.AfterPost    := nil;
  tbcompostoitens.BeforePost   := nil;
  tbcompostoitens.BeforeDelete := nil;
  tbcompostoitens.First;

  M_TOTALCUSTO := 0;

  tbcompostoitens.First;
  while not tbcompostoitens.eof do
  begin
    if tbcompostoitens.FindField('PRODUTO').AsInteger > 0 then
    begin
      M_TOTALCUSTO := M_TOTALCUSTO + tbcompostoitens.FindField('TOTALCUSTO').AsFloat;
    end;
    tbcompostoitens.next;
  end;

  FDQryCad.Edit;
  FDQryCad.FindField('TOTALCUSTO').AsFloat := MRound(M_TOTALCUSTO,4);


  tbcompostoitens.AfterDelete  := tbcompostoitensAfterDelete;
  tbcompostoitens.AfterPost    := tbcompostoitensAfterPost;
  tbcompostoitens.BeforeDelete := tbcompostoitensBeforeDelete;
  tbcompostoitens.BeforePost   := tbcompostoitensBeforePost;

  tbcompostoitens.GotoBookmark(M_MARCA);
  tbcompostoitens.FreeBookmark(M_MARCA);
  tbcompostoitens.EnableControls;

  calculaformacao();
end;

procedure TfrmCOMPOSICAOPRODUTO.calculaformacao;
var
  valoratual:Real;
begin
  FDQryCad.Edit;
  valoratual := 0;
  valoratual := (FDQryCad.FindField('TOTALCUSTO').AsFloat * FDQryCad.FindField('MARGEM').AsFloat)/100;
  valoratual :=  FDQryCad.FindField('TOTALCUSTO').AsFloat + valoratual;

  FDQryCad.FindField('VENDA').AsFloat := valoratual;
end;

procedure TfrmCOMPOSICAOPRODUTO.carregacomposicao;
begin
  tbcompostoitens.Close;
  tbcompostoitens.Open;
  TabelaComposicaoitens(' select * from composicaoitens where mestre = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger) +
                        ' order by sequencia');
  tbcompostoitens.DisableControls;
  dm_rc.fdqrycomposicaoitens.First;
  while not dm_rc.fdqrycomposicaoitens.Eof do
    begin
      tbcompostoitens.Append;
      tbcompostoitens.FindField('PRODUTO').AsInteger  := dm_rc.fdqrycomposicaoitens.FindField('PRODUTO').AsInteger;
      tbcompostoitens.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',dm_rc.fdqrycomposicaoitens.FindField('PRODUTO').AsString);
      tbcompostoitens.FindField('VLRCUSTO').AsFloat   := dm_rc.fdqrycomposicaoitens.FindField('VLRCUSTO').AsFloat;
      tbcompostoitens.FindField('TOTALCUSTO').AsFloat := dm_rc.fdqrycomposicaoitens.FindField('TOTALCUSTO').AsFloat;
      tbcompostoitens.FindField('QUANTIDADE').AsFloat := dm_rc.fdqrycomposicaoitens.FindField('QUANTIDADE').AsFloat;
      tbcompostoitens.Post;

      dm_rc.fdqrycomposicaoitens.Next;
    end;
  tbcompostoitens.EnableControls;
end;

procedure TfrmCOMPOSICAOPRODUTO.carregaprodutos(codigo: string);
var
  sql : string;
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
      tbcompostoitens.Edit;
      tbcompostoitens.FindField('PRODUTO').AsInteger       := StrToInt(codigo);
      tbcompostoitens.FindField('DESCRICAO').AsString      := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      tbcompostoitens.FindField('VLRCUSTO').AsFloat        := dm_rc.sqlBuscas.FindField('CUSTO').AsFloat;
    end;
end;

procedure TfrmCOMPOSICAOPRODUTO.Exclui;
var
  antcodigo, i : integer;
  cmp          : string;
begin
  try
    antcodigo := FDQryCad.FindField('CODIGO').AsInteger;
    FDQryCad.Delete;
    executasql('DELETE FROM COMPOSICAOITENS WHERE MESTRE = ' + IntToStr(antcodigo));

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
    tbcompostoitens.Close;
    dm_rc.rc_ShowSweetAlert( 'OK', 'EXCLUIDO COM SUCESSO' , 'sucess' , false );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO EXCLUIR COMPOSIÇÃO' , 'error' , false );
  end;
end;

procedure TfrmCOMPOSICAOPRODUTO.gravacomposicaoitens;
begin
  executasql           ('delete from COMPOSICAOITENS where mestre   = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));
  TabelaComposicaoitens('select * from COMPOSICAOITENS where codigo = 0');

  tbcompostoitens.first;
  tbcompostoitens.DisableControls;
  while not tbcompostoitens.Eof do
    begin
      if tbcompostoitens.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.fdqrycomposicaoitens.Append;
          dm_rc.fdqrycomposicaoitens.FindField('KEY').AsString        := Gera_Guid;
          dm_rc.fdqrycomposicaoitens.FindField('CODIGO').AsInteger    := Ultimo_Codigo('COMPOSICAOITENS','CODIGO',True);
          dm_rc.fdqrycomposicaoitens.FindField('MESTRE').AsInteger    := FDQryCad.FindField('CODIGO').AsInteger;
          dm_rc.fdqrycomposicaoitens.FindField('SEQUENCIA').AsInteger := tbcompostoitens.RecNo;
          dm_rc.fdqrycomposicaoitens.FindField('EMPRESA').AsInteger   := MM.varI_Code_Company;
          dm_rc.fdqrycomposicaoitens.FindField('PRODUTO').AsInteger   := tbcompostoitens.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrycomposicaoitens.FindField('QUANTIDADE').AsFloat  := tbcompostoitens.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqrycomposicaoitens.FindField('VLRCUSTO').AsFloat    := tbcompostoitens.FindField('VLRCUSTO').AsFloat;
          dm_rc.fdqrycomposicaoitens.FindField('TOTALCUSTO').AsFloat  := tbcompostoitens.FindField('TOTALCUSTO').AsFloat;
          dm_rc.fdqrycomposicaoitens.Post;
        end;
      tbcompostoitens.Next;
    end;
  tbcompostoitens.EnableControls;
  tbcompostoitens.First;

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];
end;

procedure TfrmCOMPOSICAOPRODUTO.gravamemoria;
begin
  if tbcompostoitens.FindField('PRODUTO').AsInteger > 0 then
    begin
      tbcompostoitens.Edit;

      if tbcompostoitens.FindField('PRODUTO').AsInteger > 0 then
        if tbcompostoitens.FindField('QUANTIDADE').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque a QUANTIDADE!' , 'warning' , false );
            tbcompostoitens.FindField('QUANTIDADE').FocusControl;
            Abort;
          end;

      if tbcompostoitens.FindField('PRODUTO').AsInteger > 0 then
        if tbcompostoitens.FindField('VLRCUSTO').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque o CUSTO!' , 'warning' , false );
            tbcompostoitens.FindField('VLRCUSTO').FocusControl;
            Abort;
          end;

      tbcompostoitens.FindField('TOTALCUSTO').AsFloat  := tbcompostoitens.FindField('VLRCUSTO').AsFloat *
                                                          tbcompostoitens.FindField('QUANTIDADE').AsFloat;
    end;
end;

procedure TfrmCOMPOSICAOPRODUTO.SetBut(Acao: TAcaoCrud);
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
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
   else if acao in [tpCalcular] then
     begin
        btnNewReg.Visible     := false;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCalcReg.Visible    := True;
        btnCancelReg.Visible  := True;
        btnSaveReg.Visible    := True;
     end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCalcReg.Visible    := False;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensAfterDelete(DataSet: TDataSet);
begin
  CalculaCusto();
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensAfterPost(DataSet: TDataSet);
begin
  CalculaCusto();
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensBeforeDelete(DataSet: TDataSet);
begin
  CalculaCusto();
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensBeforePost(DataSet: TDataSet);
begin
  gravamemoria();
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensbuscaprodutoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCOMPOSICAOPRODUTO.tbcompostoitensexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=
  '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';

end;

procedure TfrmCOMPOSICAOPRODUTO.UniDBGridprodutosCellClick(
  Column: TUniDBGridColumn);
begin
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'buscaproduto' then
        begin
          MM.Seta_Busca('COMPOSICAO');
          frmpesquisaproduto.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               tbcompostoitens.Edit;
               carregaprodutos(MM.varC_codigo_busca);
             end;
           end);
        end;

      if Column.FieldName = 'exclui' then
        begin
          tbcompostoitens.Delete;
        end;
    end;
end;

procedure TfrmCOMPOSICAOPRODUTO.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmCOMPOSICAOPRODUTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCOMPOSICAOPRODUTO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmCOMPOSICAOPRODUTO.UniFormShow(Sender: TObject);
var
  i :integer;
  cmp : string;
begin
  FDQryFiltro.Close;
  FDQryFiltro.sql.Clear;
  FDQryFiltro.SQL.Text := ' select * from composicao where produto = ' + IntToStr(mm.varCP_CODIGO) +
                          ' and empresa                            = ' + IntToStr(mm.varI_Code_Company);
  FDQryFiltro.Open;

  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp                       :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;

    carregacomposicao();
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;
end;

end.
