unit untFrmBASEFINANCEIRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniLabel, uniPanel,
  uniHTMLFrame, uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniEdit, UniButtonEdit, uniDateTimePicker, uniMultiItem,
  uniComboBox, uniGUITypes, uniButton, uniBitBtn, Vcl.Menus, uniMainMenu;

type
  TfrmBASEFINANCEIRO = class(TfrmBase)
    UniLabelTOTALTITULOS: TUniLabel;
    rcBlock10: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    labIcoNewCustomers30: TUniLabel;
    labDashCustomers30: TUniLabel;
    labNewCustomers30: TUniLabel;
    rcBlock20: TUniContainerPanel;
    labIcoSales20: TUniLabel;
    labSales20: TUniLabel;
    labDashSales20: TUniLabel;
    rcBlock40: TUniContainerPanel;
    labIcoInService40: TUniLabel;
    labDashInService40: TUniLabel;
    labInService40: TUniLabel;
    rcBlock50: TUniContainerPanel;
    labIcoGiveUp50: TUniLabel;
    labDashGiveUp50: TUniLabel;
    labGiveUp50: TUniLabel;
    rcBlock60: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniButtonEditppessoas: TUniButtonEdit;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniButtonEditpnumero: TUniButtonEdit;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel29: TUniLabel;
    UniEditpa: TUniEdit;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxSearchCRUDField2: TUniComboBox;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniComboBoxSTATUS: TUniComboBox;
    FDQryFiltro: TFDQuery;
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
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroREMESSA: TStringField;
    FDQryFiltroEMPRESA: TIntegerField;
    dsfiltro: TDataSource;
    UniContainerPanel7: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniButtonEditempresa: TUniButtonEdit;
    UniContainerPanel9: TUniContainerPanel;
    UniBitBtnprint: TUniBitBtn;
    UniContainerPanel10: TUniContainerPanel;
    UniBitBtncadastro: TUniBitBtn;
    totUniLabelEMP3: TUniLabel;
    totUniLabelEMP2: TUniLabel;
    totUniLabelEMP1: TUniLabel;
    vencUniLabel9EMP3: TUniLabel;
    vencUniLabel9EMP2: TUniLabel;
    vencUniLabel9EMP1: TUniLabel;
    recUniLabel9EMP3: TUniLabel;
    recUniLabel9EMP2: TUniLabel;
    recUniLabel9EMP1: TUniLabel;
    recebidaUniLabel7EMP1: TUniLabel;
    recebidaUniLabel7EMP2: TUniLabel;
    recebidaUniLabel7EMP3: TUniLabel;
    UniPopupMenu: TUniPopupMenu;
    V1: TUniMenuItem;
    B1: TUniMenuItem;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroVALORPAGO: TFMTBCDField;
    tbconsulta: TFDMemTable;
    dsconsulta: TDataSource;
    tbconsultaNUMERO: TIntegerField;
    tbconsultaSERIE: TStringField;
    tbconsultaSEQUENCIA: TIntegerField;
    tbconsultaPESSOA: TIntegerField;
    tbconsultaNOME: TStringField;
    tbconsultaEMISSAO: TDateField;
    tbconsultaVENCIMENTO: TDateField;
    tbconsultaPAGAMENTO: TDateField;
    tbconsultaVALORATUAL: TFMTBCDField;
    tbconsultaSITUACAO: TStringField;
    tbconsultaCODIGO: TIntegerField;
    tbconsultaREMESSA: TStringField;
    tbconsultaEMPRESA: TIntegerField;
    tbconsultaDOCUMENTO: TIntegerField;
    tbconsultaVALORPAGO: TFMTBCDField;
    UniContainerPanel11: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniPopupMenuopcoes: TUniPopupMenu;
    A1: TUniMenuItem;
    tbconsultamarcar: TStringField;
    i1: TUniMenuItem;
    G1: TUniMenuItem;
    V2: TUniMenuItem;
    procedure FDQryFiltroSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditppessoasButtonClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure FDQryFiltroSERIEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniBitBtncadastroClick(Sender: TObject);
    procedure FDQryFiltroCODIGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtnprintClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B1Click(Sender: TObject);
    procedure tbconsultaCODIGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbconsultaSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbconsultaSERIEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure i1Click(Sender: TObject);
    procedure g1Click(Sender: TObject);
    procedure V2Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  function  recebidas(const ptabela:string):string;
  function  receber  (const ptabela:string):string;
  function  vencidas (const ptabela:string):string;
  function  total    (const ptabela:string):string;

  function  totalEmp    (const pempresa:integer):string;
  function  vencidasEmp (const pempresa:integer):string;
  function  receberEmp  (const pempresa:integer):string;
  function  recebidasEmp(const pempresa:integer):string;
  function  verificaagp (const pcodigo: integer):boolean;

  procedure calculadash();
  end;

var
  frmBASEFINANCEIRO: TfrmBASEFINANCEIRO;

implementation

{$R *.dfm}

uses untDM_RC, mkm_func_web, untFrmPesquisa, MainModule, untFrmCRUDFINANCEIRO,
  untfrmImpressaoFinanceiro, Vcl.Grids, untFrmTELAMOVIMENTOBOLETOS,
  untFrmTELAGENERICA, mkm_procedures;
procedure TfrmBASEFINANCEIRO.A1Click(Sender: TObject);
begin
  inherited;

  dm_rc.tbconsultabasetitulos.Close;
  dm_rc.tbconsultabasetitulos.Open;

  tbconsulta.DisableControls;

  tbconsulta.First;
  while not tbconsulta.Eof do
    begin
      if tbconsulta.FindField('MARCAR').AsString = 'T' then
        begin
          dm_rc.tbconsultabasetitulos.Append;
          dm_rc.tbconsultabasetitulos.FieldByName('NUMERO').AsInteger              := tbconsulta.FieldByName('NUMERO').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('SERIE').AsString                := tbconsulta.FieldByName('SERIE').AsString;
          dm_rc.tbconsultabasetitulos.FieldByName('SEQUENCIA').AsInteger           := tbconsulta.FieldByName('SEQUENCIA').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('PESSOA').AsInteger              := tbconsulta.FieldByName('PESSOA').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('NOME').AsString                 := tbconsulta.FieldByName('NOME').AsString;
          dm_rc.tbconsultabasetitulos.FieldByName('EMISSAO').AsDateTime            := tbconsulta.FieldByName('EMISSAO').AsDateTime;
          dm_rc.tbconsultabasetitulos.FieldByName('VENCIMENTO').AsDateTime         := tbconsulta.FieldByName('VENCIMENTO').AsDateTime;
          dm_rc.tbconsultabasetitulos.FieldByName('PAGAMENTO').AsDateTime          := tbconsulta.FieldByName('PAGAMENTO').AsDateTime;
          dm_rc.tbconsultabasetitulos.FieldByName('VALORATUAL').AsCurrency         := tbconsulta.FieldByName('VALORATUAL').AsCurrency;
          dm_rc.tbconsultabasetitulos.FieldByName('SITUACAO').AsString             := tbconsulta.FieldByName('SITUACAO').AsString;
          dm_rc.tbconsultabasetitulos.FieldByName('CODIGO').AsInteger              := tbconsulta.FieldByName('CODIGO').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('REMESSA').AsString              := tbconsulta.FieldByName('REMESSA').AsString;
          dm_rc.tbconsultabasetitulos.FieldByName('EMPRESA').AsInteger             := tbconsulta.FieldByName('EMPRESA').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('DOCUMENTO').AsInteger           := tbconsulta.FieldByName('DOCUMENTO').AsInteger;
          dm_rc.tbconsultabasetitulos.FieldByName('VALORPAGO').AsCurrency          := tbconsulta.FieldByName('VALORPAGO').AsCurrency;
          dm_rc.tbconsultabasetitulos.Post;
        end;
      tbconsulta.Next;
    end;

  tbconsulta.First;
  tbconsulta.EnableControls;

  mm.VarC_Atelagenerica            := 'AGRUPATITULOS';
  frmTELAGENERICA.ShowModal();

  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmBASEFINANCEIRO.B1Click(Sender: TObject);
begin
  inherited;
  dm_rc.tbboletos.Close;
  dm_rc.tbboletos.Open;

  mm.varboletosolicitacao             := '';
  mm.vars_identificatabela            := 'RECEBER';
  mm.varI_Code_Empresa_Documento      := tbconsulta.FindField('EMPRESA').AsInteger;
  mm.varI_Code_Numero_Documento       := tbconsulta.FindField('NUMERO').AsInteger;
  mm.vari_vlr_pedido                  := tbconsulta.FindField('VALORATUAL').AsFloat;
  mm.vari_pessoaamostra               := tbconsulta.FindField('PESSOA').AsString;
  mm.varI_Code_documento_Documento    := tbconsulta.FindField('DOCUMENTO').AsInteger;
  mm.varI_Code_Documento_parcela      := tbconsulta.FindField('SEQUENCIA').AsInteger;

  frmTELAMOVIMENTOBOLETOS.ShowModal();

  FDQryFiltro.Refresh;
  tbconsulta.Refresh;
end;

procedure TfrmBASEFINANCEIRO.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
  i : integer;
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


  CAMPOS := ' T.CODIGO, T.DOCUMENTO, T.REMESSA, T.NUMERO,T.SERIE, T.EMPRESA, T.SEQUENCIA,T.PESSOA,P.NOME,T.EMISSAO,T.VENCIMENTO,T.PAGAMENTO,T.VALORORIGINAL,T.VALORATUAL,T.VALORJUROS,T.VALORDESCONTOS,T.OBSERVACOES,T.SITUACAO, T.VALORPAGO ';

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
            ' FROM   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniButtonEditempresa.Text              = '0'    ,' AND T.EMPRESA BETWEEN           ' + IntToStr(1) +
                                                                    ' AND                             ' + IntToStr(99999),
                                                                    ' AND T.EMPRESA                 = ' + QuotedStr(UniButtonEditempresa.Text));

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text  := SQL + M_AND + M_SITUACAO + M_ORDEM;
  FDQryFiltro.Open();

  tbconsulta.Close;
  tbconsulta.CopyDataSet(FDQryFiltro);
  tbconsulta.Open;

  calculadash;
end;

procedure TfrmBASEFINANCEIRO.calculadash;
begin
  // recebidas
  labSales20.Caption            := recebidas('');
  recebidaUniLabel7EMP1.Caption := recebidasEmp(1);
  recebidaUniLabel7EMP2.Caption := recebidasEmp(2);
  recebidaUniLabel7EMP3.Caption := recebidasEmp(3);

  //receber
  labNewCustomers30.Caption := receber('');
  recUniLabel9EMP1.Caption  := receberEmp(1);
  recUniLabel9EMP2.Caption  := receberEmp(2);
  recUniLabel9EMP3.Caption  := receberEmp(3);

  //vencidas
  labInService40.Caption    := vencidas('');
  vencUniLabel9EMP1.Caption := vencidasEmp(1);
  vencUniLabel9EMP2.Caption := vencidasEmp(2);
  vencUniLabel9EMP3.Caption := vencidasEmp(3);

  //total
  labGiveUp50.Caption       := total('');
  totUniLabelEMP1.Caption   := totalEmp(1);
  totUniLabelEMP2.Caption   := totalEmp(2);
  totUniLabelEMP3.Caption   := totalEmp(3);

end;

procedure TfrmBASEFINANCEIRO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;

   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'CODIGO' then
    begin

      if verificaagp(tbconsultaCODIGO.AsInteger) = True then
        i1.Visible := True
      else
        i1.Visible := False;

      if (FDQryFiltro.UpdateOptions.UpdateTableName = 'RECEBER') and (tbconsultaPAGAMENTO.AsString <> '') then
        begin
          V2.Visible := True;
        end
      else
        begin
          V2.Visible := False;
        end;


      UniPopupMenu.Popup(posicao_x-20,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmBASEFINANCEIRO.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;
  if tbconsulta.RecordCount > 0 then
    begin
      tbconsulta.Edit;

      if tbconsulta.FindField('MARCAR').AsString = '' then
        tbconsulta.FindField('MARCAR').AsString := 'T'
      else
      if tbconsulta.FindField('MARCAR').AsString = 'T' then
        tbconsulta.FindField('MARCAR').AsString := 'F'
      else
      if tbconsulta.FindField('MARCAR').AsString = 'F' then
        tbconsulta.FindField('MARCAR').AsString := 'T';

      tbconsulta.post;
    end;
end;

procedure TfrmBASEFINANCEIRO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if tbconsultaSITUACAO.AsString = 'Pago' then
    Attribs.Color := $B6F0CF;

  if tbconsultamarcar.AsString = 'T' then
    Attribs.Color := $00FFC1E0;

end;

procedure TfrmBASEFINANCEIRO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmBASEFINANCEIRO.FDQryFiltroCODIGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      Text := '<i title="Abrir Registro" class="fa fa-lg fa-folder-open fa-lg" style="color:black; cursor:pointer;"></i>';
    end;
end;

procedure TfrmBASEFINANCEIRO.FDQryFiltroSERIEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroSERIE.AsString = 'LAS' then
        Text := '<i title="Laboratório" class="fa fa-lg fa-flask fa-lg" style="color:black; cursor:pointer;"></i>';
      if FDQryFiltroSERIE.AsString = 'NFE' then
        Text := '<i title="NFE-@" class="fa fa-lg  fa-file-invoice" style="color:black; cursor:pointer;"></i>';
      if FDQryFiltroSERIE.AsString = 'DUP' then
        Text := '<i title="Duplicata" class="fa fa-lg  fa-file-invoice-dollar" style="color:black; cursor:pointer;"></i>';
      if FDQryFiltroSERIE.AsString = 'LOC' then
        Text := '<i title="Locação" class="fa fa-lg  fa-tractor" style="color:black; cursor:pointer;"></i>';
      if FDQryFiltroSERIE.AsString = 'PAG' then
        Text := '<i title="Cta Pagar" class="fa fa-lg  fa-money-check-alt" style="color:black; cursor:pointer;"></i>';
    end;
end;

procedure TfrmBASEFINANCEIRO.FDQryFiltroSITUACAOGetText(Sender: TField;
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

procedure TfrmBASEFINANCEIRO.g1Click(Sender: TObject);
begin
  inherited;
  mm.VarC_Atelagenerica := 'PARCELATITULOS';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmBASEFINANCEIRO.i1Click(Sender: TObject);
begin
  inherited;
  mm.varic_codigoreceber := tbconsultaCODIGO.AsInteger;

  mm.VarC_Atelagenerica            := 'LISTAAGRUPAMENTO';
  frmTELAGENERICA.ShowModal();
end;

function TfrmBASEFINANCEIRO.receber(const ptabela: string): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORATUAL) as TOTAL                       ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniButtonEditempresa.Text              = '0'    ,' AND T.EMPRESA BETWEEN           ' + IntToStr(1) +
                                                                    ' AND                             ' + IntToStr(99999),
                                                                    ' AND T.EMPRESA                 = ' + QuotedStr(UniButtonEditempresa.Text))       +
            ' AND T.SITUACAO =                                      ' + QuotedStr('Aberto') +
            ' AND T.VENCIMENTO >=     CURRENT_DATE                  ';

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

function TfrmBASEFINANCEIRO.receberEmp(const pempresa:integer): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORATUAL) as TOTAL                       ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
                                                                    ' AND T.EMPRESA                 = ' + IntToStr(pempresa)                          +
            ' AND T.SITUACAO =                                      ' + QuotedStr('Aberto') +
            ' AND T.VENCIMENTO >=     CURRENT_DATE                  ';

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := 'EMP ' + IntToStr(pempresa) + ' - ' +  FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

function TfrmBASEFINANCEIRO.recebidas(const ptabela: string): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORPAGO) as TOTAL                        ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniButtonEditempresa.Text              = '0'    ,' AND T.EMPRESA BETWEEN           ' + IntToStr(1) +
                                                                    ' AND                             ' + IntToStr(99999),
                                                                    ' AND T.EMPRESA                 = ' + QuotedStr(UniButtonEditempresa.Text))       +
            ' AND T.SITUACAO =                                      ' + QuotedStr('Pago');

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;

end;

function TfrmBASEFINANCEIRO.recebidasEmp(const pempresa: integer): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORPAGO) as TOTAL                        ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
                                                                    ' AND T.EMPRESA                 = ' + IntToStr(pempresa)                          +
            ' AND T.SITUACAO =                                      ' + QuotedStr('Pago');

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

procedure TfrmBASEFINANCEIRO.tbconsultaCODIGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      Text := '<i title="Abrir Registro" class="fa fa-lg fa-folder-open fa-lg" style="color:black; cursor:pointer;"></i>';
    end;
end;

procedure TfrmBASEFINANCEIRO.tbconsultaSERIEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbconsultaSERIE.AsString = 'LAS' then
        Text := '<i title="Laboratório" class="fa fa-lg fa-flask fa-lg" style="color:black; cursor:pointer;"></i>'
      else
      if tbconsultaSERIE.AsString = 'NFE' then
        Text := '<i title="NFE-@" class="fa fa-lg  fa-file-invoice" style="color:black; cursor:pointer;"></i>'
      else
      if tbconsultaSERIE.AsString = 'DUP' then
        Text := '<i title="Duplicata" class="fa fa-lg  fa-file-invoice-dollar" style="color:black; cursor:pointer;"></i>'
      else
      if tbconsultaSERIE.AsString = 'LOC' then
        Text := '<i title="Locação" class="fa fa-lg  fa-tractor" style="color:black; cursor:pointer;"></i>'
      else
      if tbconsultaSERIE.AsString = 'PAG' then
        Text := '<i title="Cta Pagar" class="fa fa-lg  fa-money-check-alt" style="color:black; cursor:pointer;"></i>'
      else
      if tbconsultaSERIE.AsString = 'AGP' then
        Text := '<i title="Agrupadas" class="fa fa-lg  fa-list-ol" style="color:black; cursor:pointer;"></i>'
      else
        Text := '<i title="Documentos" class="fa fa-lg  fa-file-invoice" style="color:black; cursor:pointer;"></i>';
    end;
end;

procedure TfrmBASEFINANCEIRO.tbconsultaSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbconsultaSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge badge-warning">Aberto</span>'
      else
      if tbconsultaSITUACAO.AsString = 'Pago' then
        Text := '<span class="badge badge-success">Pago</span>';

      if tbconsultaSITUACAO.AsString = 'Aberto' then
        begin
          if Date > tbconsultaVENCIMENTO.AsDateTime then
            Text := '<span class="badge badge-danger">Atrasado</span>';
        end;
    end;
end;

function TfrmBASEFINANCEIRO.total(const ptabela: string): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   variif(M_SITUACAO = 'Pago','SELECT SUM(T.VALORPAGO) AS TOTAL','SELECT SUM(T.VALORATUAL) as TOTAL           ') +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniButtonEditempresa.Text              = '0'    ,' AND T.EMPRESA BETWEEN           ' + IntToStr(1) +
                                                                    ' AND                             ' + IntToStr(99999),
                                                                    ' AND T.EMPRESA                 = ' + QuotedStr(UniButtonEditempresa.Text));

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

function TfrmBASEFINANCEIRO.totalEmp(const pempresa: integer): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   variif(M_SITUACAO = 'Pago','SELECT SUM(T.VALORPAGO) AS TOTAL','SELECT SUM(T.VALORATUAL) as TOTAL           ') +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
                                                                       ' AND T.EMPRESA              = ' + IntToStr(pempresa);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_SITUACAO + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := 'EMP ' + IntToStr(pempresa) + ' - ' + FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

procedure TfrmBASEFINANCEIRO.UniBitBtn1Click(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBASEFINANCEIRO.UniBitBtncadastroClick(Sender: TObject);
begin
  inherited;

  mm.vari_regfinanceiro := 0;
  mm.vars_idfinanceiro  := FDQryFiltro.UpdateOptions.UpdateTableName;
  FrmCRUDFINANCEIRO.ShowModal();
end;

procedure TfrmBASEFINANCEIRO.UniBitBtnprintClick(Sender: TObject);
begin
  inherited;
  dm_rc.tbgenerico.Close;
  dm_rc.tbgenerico.CopyDataSet(fdqryfiltro,[coStructure, coRestart, coAppend]);

  mm.varSR_Dataini := edSearchCRUDDtIni.Text;
  mm.varSR_Datafin := edSearchCRUDDtEnd.Text;
  mm.varSR_tipo    := variif(FDQryFiltro.UpdateOptions.UpdateTableName = 'RECEBER','1','0');

  frmimpressaofinanceiro.ShowModal();
end;

procedure TfrmBASEFINANCEIRO.UniButtonEditpbancosButtonClick(Sender: TObject);
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

procedure TfrmBASEFINANCEIRO.UniButtonEditppessoasButtonClick(Sender: TObject);
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

procedure TfrmBASEFINANCEIRO.UniFrameCreate(Sender: TObject);
begin
  inherited;

  if FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR' then
    begin
      labDashSales20.Caption     := 'Pagos';
      labDashCustomers30.Caption := 'A Pagar';
      B1.Visible                 := False;
      UniContainerPanel11.Visible:= true;
      i1.Visible                 := False;
      g1.Visible                 := True;
    end;

  UniLabelTOTALTITULOS.Caption  := 'CONTAS A ' + FDQryFiltro.UpdateOptions.UpdateTableName;
  cbxSearchCRUDField2.ItemIndex := 1;
  UniComboBoxSTATUS.ItemIndex   := 0;

  edSearchCRUDDtIni.Text        := '01/01/2010';
  edSearchCRUDDtEnd.Text        := '31/12/2099';
  UniButtonEditempresa.Text     := IntToStr(mm.varI_Code_Company);

  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmBASEFINANCEIRO.V1Click(Sender: TObject);
begin
  inherited;

  mm.vari_regfinanceiro := tbconsultaCODIGO.AsInteger;
  mm.vars_idfinanceiro  := FDQryFiltro.UpdateOptions.UpdateTableName;
  FrmCRUDFINANCEIRO.ShowModal();

  btnSearchCRUD.OnClick(self);
end;

procedure TfrmBASEFINANCEIRO.V2Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowYesNo( 'DESEJA VOLTAR EM ABERTO?' );
    if mm.varB_yes then
      begin
        if executasql (' UPDATE RECEBER SET RECEBER.SITUACAO  = ' + QuotedStr('Aberto') + ','+
                       ' RECEBER.PAGAMENTO                    = ' + 'null'              + ',' +
                       ' RECEBER.VALORPAGO                    = ' + IntToStr(0)         +
                       ' WHERE  RECEBER.CODIGO                = ' + IntToStr(tbconsultaCODIGO.AsInteger)) then
        begin
          try
            executasql('DELETE FROM BANCOS WHERE NUMERO    = ' + QuotedStr(tbconsultaNUMERO.AsString)   +
                        'AND SERIE                         = ' + QuotedStr(tbconsultaSERIE.AsString)    +
                        'AND SEQUENCIA                     = ' + IntToStr(tbconsultaSEQUENCIA.AsInteger));

            dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
          except
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui voltar!' , 'error' , false );
          end;
        end;
        btnSearchCRUD.OnClick(Self);
      end;
end;

function TfrmBASEFINANCEIRO.vencidas(const ptabela: string): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORATUAL) as TOTAL                       ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniButtonEditempresa.Text              = '0'    ,' AND T.EMPRESA BETWEEN           ' + IntToStr(1) +
                                                                    ' AND                             ' + IntToStr(99999),
                                                                    ' AND T.EMPRESA                 = ' + QuotedStr(UniButtonEditempresa.Text))       +
            ' AND T.SITUACAO   =                                    ' + QuotedStr('Aberto')             +
            ' AND T.VENCIMENTO <  CURRENT_DATE                      ';

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

function TfrmBASEFINANCEIRO.vencidasEmp(const pempresa: integer): string;
var
  query  : TFDQuery;
  msql   : string;
  M_SITUACAO,
  M_ORDEM,
  M_AND   :string;
begin

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;

  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  msql :=   'SELECT SUM(T.VALORATUAL) as TOTAL                       ' +
            ' FROM                                                   ' + FDQryFiltro.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(FDQryFiltro.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA                = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR              = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO                = ' + QuotedStr(UniButtonEditpnumero.Text))       +
                                                                    ' AND T.EMPRESA                 = ' + IntToStr(pempresa)       +
            ' AND T.SITUACAO   =                                    ' + QuotedStr('Aberto')             +
            ' AND T.VENCIMENTO <  CURRENT_DATE                      ';

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := msql + M_AND + M_ORDEM;
      Prepare;
      Open;
    end;

  Result := 'EMP ' + IntToStr(pempresa) + ' - ' +  FormatFloat('R$ #,0.00',Query.FindField('TOTAL').AsFloat);

  query.Free;
end;

function TfrmBASEFINANCEIRO.verificaagp(const pcodigo: integer): boolean;
begin
  SqlPesquisa('select * from FINANCEIRO_AGRUPADO where mestre_id = ' + IntToStr(pcodigo));

  if dm_rc.sqlBuscas.RecordCount > 0 then
    result := True
  else
    result := false;
end;

initialization
  RegisterClass(TfrmBASEFINANCEIRO);
end.
