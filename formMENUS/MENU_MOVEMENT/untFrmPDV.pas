unit untFrmPDV;

interface

uses
  Math, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniPanel, uniLabel, uniEdit, uniButton, uniBitBtn,
  uniSpeedButton, uniImage, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPDV = class(TUniForm)
    paHeader: TUniContainerPanel;
    lblHeaderTitulo: TUniLabel;
    lblTipoDoc: TUniLabel;
    cbTipoDocumento: TUniComboBox;
    paFooter: TUniContainerPanel;
    btnF2: TUniBitBtn;
    btnF3: TUniBitBtn;
    btnF4: TUniBitBtn;
    btnF7: TUniBitBtn;
    btnF9: TUniBitBtn;
    paCorpo: TUniContainerPanel;
    paEsquerda: TUniContainerPanel;
    lblTitCodigo: TUniLabel;
    paCodigoBox: TUniContainerPanel;
    edtCodigoBarras: TUniEdit;
    btnBuscaCodigo: TUniSpeedButton;
    paQtdPreco: TUniContainerPanel;
    paQtd: TUniContainerPanel;
    lblQtd: TUniLabel;
    edtQtd: TUniFormattedNumberEdit;
    paPrecoUnit: TUniContainerPanel;
    lblPrecoUnit: TUniLabel;
    edtPrecoUnit: TUniFormattedNumberEdit;
    paPreview: TUniContainerPanel;
    lblTitPreview: TUniLabel;
    paCardProduto: TUniContainerPanel;
    lblNomeProduto: TUniLabel;
    lblDescProduto: TUniLabel;
    lblQtdUnitProduto: TUniLabel;
    lblSubtotalProduto: TUniLabel;
    paDireita: TUniContainerPanel;
    gridItens: TUniDBGrid;
    pnlTotalGeral: TUniContainerPanel;
    lblTotalPagar: TUniLabel;
    memItens: TFDMemTable;
    dsItens: TDataSource;
    memItensITEM: TIntegerField;
    memItensPRODUTO: TIntegerField;
    memItensCODIGO: TStringField;
    memItensDESCRICAO: TStringField;
    memItensUNIDADE: TStringField;
    memItensQTD: TFloatField;
    memItensUNITARIO: TFloatField;
    memItensSUBTOTAL: TFloatField;
    memItensNCM: TStringField;
    memItensPRECO_ORIGINAL: TFloatField;
    memItensDESCONTO: TFloatField;
    UniImage1: TUniImage;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoBarrasExit(Sender: TObject);
    procedure edtCodigoBarrasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPrecoUnitEnter(Sender: TObject);
    procedure edtPrecoUnitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPrecoUnitExit(Sender: TObject);
    procedure btnBuscaCodigoClick(Sender: TObject);
    procedure btnF2Click(Sender: TObject);
    procedure btnF3Click(Sender: TObject);
    procedure btnF4Click(Sender: TObject);
    procedure btnF7Click(Sender: TObject);
    procedure btnF9Click(Sender: TObject);
    procedure gridItensDblClick(Sender: TObject);
  private
    { Private declarations }
    FTotalVenda: Double;
    FTotalDesconto: Double;
    FValidandoPreco: Boolean;
    FProdId: Integer;
    FProdCodigo: string;
    FProdDescricao: string;
    FProdUnidade: string;
    FProdNcm: string;
    procedure NovaVenda;
    procedure CarregaProduto(const ACodigo: string);
    procedure AdicionarItemNaVenda;
    procedure CancelarItemSelecionado;
    procedure AplicarDescontoGeral;
    procedure CalculaTotaisVenda;
    procedure GravarVenda;
    function ObterDocumentoAtivo: Integer;
  public
    { Public declarations }
  end;

function frmPDV: TfrmPDV;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_procedures, mkm_layout,mkm_funcoes,
  untFrmPesquisaProduto, untFrmPesquisa;

function frmPDV: TfrmPDV;
begin
  Result := TfrmPDV(mm.GetFormInstance(TfrmPDV));
end;

procedure TfrmPDV.UniFormCreate(Sender: TObject);
begin
  if not memItens.Active then
    memItens.CreateDataSet;
  NovaVenda;
end;

procedure TfrmPDV.UniFormReady(Sender: TObject);
begin
  Self.Top  := (UniSession.UniApplication.ScreenHeight div 2) - (Self.Height div 2);
  Self.Left := (UniSession.UniApplication.ScreenWidth div 2) - (Self.Width div 2);
  edtCodigoBarras.SetFocus;
end;

procedure TfrmPDV.NovaVenda;
begin
  if cbTipoDocumento.ItemIndex < 0 then
    cbTipoDocumento.ItemIndex := 0;
  memItens.EmptyDataSet;
  FTotalVenda := 0.0;
  FTotalDesconto := 0.0;
  FValidandoPreco := False;
  FProdId := 0;
  FProdCodigo := '';
  FProdDescricao := '';
  FProdUnidade := '';
  FProdNcm := '';
  edtCodigoBarras.Clear;
  edtQtd.Value := 1.0;
  edtPrecoUnit.Value := 0.0;
  lblNomeProduto.Caption := 'Aguardando produto...';
  lblDescProduto.Caption := 'Bipe o c'#243'digo de barras ou tecle F2 para buscar';
  lblQtdUnitProduto.Caption := '0 un   R$ 0,00';
  lblSubtotalProduto.Caption := 'subtotal: R$ 0,00';
  lblTotalPagar.Caption := 'TOTAL A PAGAR: R$ 0,00';
  lblHeaderTitulo.Caption := 'PDV 01 - CAIXA LIVRE';
  if Visible then
    edtCodigoBarras.SetFocus;
end;

function TfrmPDV.ObterDocumentoAtivo: Integer;
begin
  // 4 = Pedido Simples, 10 = Cupom Fiscal (NFC-e)
  if cbTipoDocumento.ItemIndex = 1 then
    Result := 10
  else
    Result := 4;
end;

procedure TfrmPDV.CarregaProduto(const ACodigo: string);
var
  vSql: string;
begin
  if Trim(ACodigo) = '' then Exit;

  // Busca o produto pelo código interno ou referência
  vSql := ' select P.*, S.* ' +
          ' from produtos P ' +
          ' inner join saldos s on s.produto = p.codigo         ' +
          ' where (P.CODIGO       = ' + QuotedStr(Trim(ACodigo)) + ') ' +
          '    or (P.CODIGOBARRAS = ' + QuotedStr(Trim(ACodigo)) + ')';

  if not SqlPesquisa(vSql) then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Produto não encontrado: ' + ACodigo, 'warning', false);
    FProdId := 0;
    edtCodigoBarras.SelectAll;
    edtCodigoBarras.SetFocus;
    Exit;
  end;

  // Armazena dados do produto selecionado
  FProdId        := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
  FProdDescricao := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
  FProdUnidade   := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
  FProdNcm       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
  FProdCodigo    := dm_rc.sqlBuscas.FindField('CODIGOBARRAS').AsString;
  if Trim(FProdCodigo) = '' then
    FProdCodigo := IntToStr(FProdId);

  // Atualiza campos de entrada e card de prévia
  edtPrecoUnit.Value := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
  if edtQtd.Value <= 0 then
    edtQtd.Value := 1.0;

  lblNomeProduto.Caption     := FProdDescricao;
  lblDescProduto.Caption     := 'Cód: ' + IntToStr(FProdId) + ' | Ref: ' + FProdCodigo + ' | Un: ' + FProdUnidade;
  lblQtdUnitProduto.Caption  := FormatFloat('0.###', edtQtd.Value) + ' ' + FProdUnidade +
                                '   R$ ' + FormatFloat('###,##0.00', edtPrecoUnit.Value);
  lblSubtotalProduto.Caption := 'subtotal: R$ ' + FormatFloat('###,##0.00', edtQtd.Value * edtPrecoUnit.Value);

  // Não adiciona direto: navega até a quantidade para conferência/edição
  edtQtd.SelectAll;
  edtQtd.SetFocus;
end;

procedure TfrmPDV.edtCodigoBarrasExit(Sender: TObject);
begin
  if Trim(edtCodigoBarras.Text) <> '' then
    CarregaProduto(Trim(edtCodigoBarras.Text));
end;

procedure TfrmPDV.edtCodigoBarrasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Trim(edtCodigoBarras.Text) <> '' then
      CarregaProduto(Trim(edtCodigoBarras.Text))
    else
      btnBuscaCodigoClick(Sender);
  end;
end;

procedure TfrmPDV.edtQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edtQtd.Value <= 0 then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe a QUANTIDADE antes de efetuar a venda!', 'warning', false);
      edtQtd.SelectAll;
      edtQtd.SetFocus;
      Exit;
    end;

    // Atualiza o subtotal no card de prévia
    lblQtdUnitProduto.Caption := FormatFloat('0.###', edtQtd.Value) + ' ' + FProdUnidade +
                                 '   R$ ' + FormatFloat('###,##0.00', edtPrecoUnit.Value);
    lblSubtotalProduto.Caption := 'subtotal: R$ ' + FormatFloat('###,##0.00', edtQtd.Value * edtPrecoUnit.Value);

    // Navega diretamente para o Preço Unitário permitindo digitação imediata
    edtPrecoUnit.SelectAll;
    edtPrecoUnit.SetFocus;
  end;
end;

procedure TfrmPDV.edtPrecoUnitEnter(Sender: TObject);
begin
  // Permite digitação livre ao entrar no campo
end;

procedure TfrmPDV.edtPrecoUnitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if FProdId > 0 then
    begin
      if edtQtd.Value <= 0 then
      begin
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe a QUANTIDADE antes de efetuar a venda!', 'warning', false);
        edtQtd.SelectAll;
        edtQtd.SetFocus;
        Exit;
      end;

      if edtPrecoUnit.Value <= 0 then
      begin
        dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe o PREÇO UNITÁRIO antes de efetuar a venda!', 'warning', false);
        edtPrecoUnit.SelectAll;
        edtPrecoUnit.SetFocus;
        Exit;
      end;

      AdicionarItemNaVenda;
    end
    else
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione ou bipe um produto primeiro!', 'warning', false);
      edtCodigoBarras.SetFocus;
    end;
  end;
end;

procedure TfrmPDV.edtPrecoUnitExit(Sender: TObject);
begin
  if FProdId > 0 then
  begin
    // Atualiza a prévia com os valores informados
    lblQtdUnitProduto.Caption := FormatFloat('0.###', edtQtd.Value) + ' ' + FProdUnidade +
                                 '   R$ ' + FormatFloat('###,##0.00', edtPrecoUnit.Value);
    lblSubtotalProduto.Caption := 'subtotal: R$ ' + FormatFloat('###,##0.00', edtQtd.Value * edtPrecoUnit.Value);

    // Se ambos estiverem válidos (> 0), efetiva a venda ao sair do campo
    if (edtPrecoUnit.Value > 0) and (edtQtd.Value > 0) then
      AdicionarItemNaVenda
    else if (edtPrecoUnit.Value <= 0) then
    begin
      // Alerta não-bloqueante (Toast) para orientar sem travar nem criar loop no navegador
      dm_rc.rc_ShowToaster('warning', 'Informe o PREÇO UNITÁRIO antes de efetuar a venda!', false, 'fade', 2500);
      edtPrecoUnit.SelectAll;
      edtPrecoUnit.SetFocus;
    end;
  end;
end;

procedure TfrmPDV.AdicionarItemNaVenda;
var
  vQtd, vPreco, vSubTotal: Double;
begin
  // 1. Validação de Produto Carregado
  if FProdId <= 0 then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione ou bipe um produto primeiro!', 'warning', false);
    edtCodigoBarras.SetFocus;
    Exit;
  end;

  // 2. Validação da Quantidade
  vQtd := edtQtd.Value;
  if vQtd <= 0 then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe a QUANTIDADE antes de efetuar a venda!', 'warning', false);
    edtQtd.SetFocus;
    Exit;
  end;

  // 3. Validação do Preço Unitário
  vPreco := edtPrecoUnit.Value;
  if vPreco <= 0 then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe o PREÇO UNITÁRIO antes de efetuar a venda!', 'warning', false);
    edtPrecoUnit.SetFocus;
    Exit;
  end;

  vSubTotal := vQtd * vPreco;

  memItens.Append;
  memItens.FieldByName('ITEM').AsInteger           := memItens.RecordCount + 1;
  memItens.FieldByName('PRODUTO').AsInteger        := FProdId;
  memItens.FieldByName('CODIGO').AsString          := FProdCodigo;
  memItens.FieldByName('DESCRICAO').AsString       := FProdDescricao;
  memItens.FieldByName('UNIDADE').AsString         := FProdUnidade;
  memItens.FieldByName('QTD').AsFloat              := vQtd;
  memItens.FieldByName('UNITARIO').AsFloat         := vPreco;
  memItens.FieldByName('SUBTOTAL').AsFloat         := vSubTotal;
  memItens.FieldByName('NCM').AsString             := FProdNcm;
  memItens.FieldByName('PRECO_ORIGINAL').AsFloat   := vPreco;
  memItens.FieldByName('DESCONTO').AsFloat         := 0.0;
  memItens.Post;

  CalculaTotaisVenda;

  // 4. Limpa e reseta para o próximo produto
  FProdId            := 0;
  edtCodigoBarras.Clear;
  edtQtd.Value       := 0.0;
  edtPrecoUnit.Value := 0.0;
  edtCodigoBarras.SetFocus;
end;

procedure TfrmPDV.CancelarItemSelecionado;
var
  vTextoIni: string;
begin
  if memItens.IsEmpty then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Nenhum item na lista para cancelar!', 'warning', false);
    edtCodigoBarras.SetFocus;
    Exit;
  end;

  vTextoIni := '';
  if not memItens.IsEmpty then
    vTextoIni := memItens.FieldByName('ITEM').AsString;

  Prompt(
    'Informe o NÚMERO DO ITEM a cancelar:',
    vTextoIni,
    mtConfirmation,
    mbOKCancel,
    procedure(Sender: TComponent; AResult: Integer; AText: string)
    var
      vItemNum: Integer;
      vItemSeq: Integer;
    begin
      if (AResult = mrOK) and (Trim(AText) <> '') then
      begin
        vItemNum := StrToIntDef(Trim(AText), 0);
        if vItemNum <= 0 then
        begin
          dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Número do item inválido!', 'warning', false);
          edtCodigoBarras.SetFocus;
          Exit;
        end;

        if memItens.Locate('ITEM', vItemNum, []) then
        begin
          memItens.Delete;

          // Renumera itens sequencialmente
          if not memItens.IsEmpty then
          begin
            memItens.DisableControls;
            try
              vItemSeq := 0;
              memItens.First;
              while not memItens.Eof do
              begin
                Inc(vItemSeq);
                memItens.Edit;
                memItens.FieldByName('ITEM').AsInteger := vItemSeq;
                memItens.Post;
                memItens.Next;
              end;
            finally
              memItens.EnableControls;
            end;
          end;

          CalculaTotaisVenda;
          dm_rc.rc_ShowSweetAlert('SUCESSO', 'Item ' + IntToStr(vItemNum) + ' cancelado com sucesso!', 'success', false);
        end
        else
        begin
          dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Item ' + IntToStr(vItemNum) + ' não foi encontrado na lista!', 'warning', false);
        end;

        edtCodigoBarras.SetFocus;
      end;
    end
  );
end;

procedure TfrmPDV.CalculaTotaisVenda;
var
  vBook: TBookmark;
begin
  FTotalVenda := 0.0;
  FTotalDesconto := 0.0;
  FValidandoPreco := False;

  if not memItens.IsEmpty then
  begin
    vBook := memItens.GetBookmark;
    memItens.DisableControls;
    try
      memItens.First;
      while not memItens.Eof do
      begin
        FTotalVenda := FTotalVenda + memItens.FieldByName('SUBTOTAL').AsFloat;
        memItens.Next;
      end;
    finally
      if memItens.BookmarkValid(vBook) then
        memItens.GotoBookmark(vBook);
      memItens.FreeBookmark(vBook);
      memItens.EnableControls;
    end;
    lblHeaderTitulo.Caption := 'PDV 01 - VENDA EM ANDAMENTO (' + IntToStr(memItens.RecordCount) + ' itens)';
  end
  else
  begin
    lblHeaderTitulo.Caption := 'PDV 01 - CAIXA LIVRE';
  end;

  lblTotalPagar.Caption := 'TOTAL A PAGAR: R$ ' + FormatFloat('###,##0.00', FTotalVenda);
end;

procedure TfrmPDV.GravarVenda;
var
  vCodigoMestre, vNumeroDoc, vDocTipo: Integer;
  vSerie, vGuidMestre: string;
  vPessoa, vOperacao, vCondicao: Integer;
  vQry: TFDQuery;
  vSeq: Integer;
  vNomeDoc: string;
begin
  if memItens.IsEmpty or (FTotalVenda <= 0) then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Nenhum item adicionado à venda!', 'warning', false);
    Exit;
  end;

  vDocTipo := ObterDocumentoAtivo;
  if vDocTipo = 10 then
    vNomeDoc := 'CUPOM FISCAL (NFC-e)'
  else
    vNomeDoc := 'PEDIDO SIMPLES';

  // 1. Carrega parâmetros padrão do tipo de documento
  vOperacao := 1;
  vCondicao := 1;
  vPessoa   := 1;
  vSerie    := 'PDV';

  if SqlPesquisa('select operacao, serie, condicao, pessoa from documentos where documento = ' +
                 IntToStr(vDocTipo) + ' and empresa = ' + IntToStr(mm.varI_Code_Company)) then
  begin
    if dm_rc.sqlBuscas.FindField('OPERACAO') <> nil then
      vOperacao := dm_rc.sqlBuscas.FindField('OPERACAO').AsInteger;
    if dm_rc.sqlBuscas.FindField('SERIE') <> nil then
      vSerie := dm_rc.sqlBuscas.FindField('SERIE').AsString;
    if dm_rc.sqlBuscas.FindField('CONDICAO') <> nil then
      vCondicao := dm_rc.sqlBuscas.FindField('CONDICAO').AsInteger;
    if dm_rc.sqlBuscas.FindField('PESSOA') <> nil then
      vPessoa := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
  end;

  if Trim(vSerie) = '' then
    vSerie := '1';

  // 2. Numeração do sistema RadCORE
  vCodigoMestre := Ultimo_Codigo('MVMESTRE', 'CODIGO', True);
  vNumeroDoc    := Ultimo_Numero(mm.varI_Code_Company, vDocTipo, 'GRAVAR');
  vGuidMestre   := Gera_Guid;

  vQry := TFDQuery.Create(nil);
  try
    vQry.Connection  := mm.SQLConn;
    vQry.Transaction := mm.FDTransaction;

    // 3. Grava MVMESTRE
    vQry.SQL.Text :=
      'INSERT INTO MVMESTRE ( ' +
      '  KEY, CODIGO, NUMERO, EMPRESA, DOCUMENTO, SERIE, EMISSAO, PESSOA, ' +
      '  OPERACAO, CONDICAO, FUNCIONARIO, VLRPRODUTOS, VLRTOTAL, VLRDESCONTOS, ' +
      '  STATUS, CANCELADA ' +
      ') VALUES ( ' +
      '  :KEY, :CODIGO, :NUMERO, :EMPRESA, :DOCUMENTO, :SERIE, :EMISSAO, :PESSOA, ' +
      '  :OPERACAO, :CONDICAO, :FUNCIONARIO, :VLRPRODUTOS, :VLRTOTAL, :VLRDESCONTOS, ' +
      '  :STATUS, :CANCELADA ' +
      ')';

    vQry.ParamByName('KEY').AsString          := vGuidMestre;
    vQry.ParamByName('CODIGO').AsInteger      := vCodigoMestre;
    vQry.ParamByName('NUMERO').AsInteger      := vNumeroDoc;
    vQry.ParamByName('EMPRESA').AsInteger     := mm.varI_Code_Company;
    vQry.ParamByName('DOCUMENTO').AsInteger   := vDocTipo;
    vQry.ParamByName('SERIE').AsString        := vSerie;
    vQry.ParamByName('EMISSAO').AsDate        := Date;
    vQry.ParamByName('PESSOA').AsInteger      := vPessoa;
    vQry.ParamByName('OPERACAO').AsInteger    := vOperacao;
    vQry.ParamByName('CONDICAO').AsInteger    := vCondicao;
    vQry.ParamByName('FUNCIONARIO').AsInteger := 0;//mm.varI_Code_User;
    vQry.ParamByName('VLRPRODUTOS').AsFloat   := FTotalVenda + FTotalDesconto;
    vQry.ParamByName('VLRTOTAL').AsFloat      := FTotalVenda;
    vQry.ParamByName('VLRDESCONTOS').AsFloat  := FTotalDesconto;
    vQry.ParamByName('STATUS').AsString       := 'A';
    vQry.ParamByName('CANCELADA').AsString    := 'F';
    vQry.ExecSQL;

    // 4. Grava MVITENS
    vSeq := 0;
    memItens.DisableControls;
    try
      memItens.First;
      while not memItens.Eof do
      begin
        Inc(vSeq);
        vQry.SQL.Text :=
          'INSERT INTO MVITENS ( ' +
          '  KEY, CODIGO, EMPRESA, DOCUMENTO, NUMERO, SERIE, SEQUENCIA, ' +
          '  EMISSAO, PESSOA, PRODUTO, CODREFERENCIA, DESCRICAO, UNIDADE, ' +
          '  QUANTIDADE, PRECO, TOTAL, OPERACAO, NUMERONCM ' +
          ') VALUES ( ' +
          '  :KEY, :CODIGO, :EMPRESA, :DOCUMENTO, :NUMERO, :SERIE, :SEQUENCIA, ' +
          '  :EMISSAO, :PESSOA, :PRODUTO, :CODREFERENCIA, :DESCRICAO, :UNIDADE, ' +
          '  :QUANTIDADE, :PRECO, :TOTAL, :OPERACAO, :NUMERONCM ' +
          ')';

        vQry.ParamByName('KEY').AsString           := Gera_Guid;
        vQry.ParamByName('CODIGO').AsInteger       := Ultimo_Codigo('MVITENS', 'CODIGO', True);
        vQry.ParamByName('EMPRESA').AsInteger      := mm.varI_Code_Company;
        vQry.ParamByName('DOCUMENTO').AsInteger    := vDocTipo;
        vQry.ParamByName('NUMERO').AsInteger       := vNumeroDoc;
        vQry.ParamByName('SERIE').AsString         := vSerie;
        vQry.ParamByName('SEQUENCIA').AsInteger    := vSeq;
        vQry.ParamByName('EMISSAO').AsDate         := Date;
        vQry.ParamByName('PESSOA').AsInteger       := vPessoa;
        vQry.ParamByName('PRODUTO').AsInteger      := memItens.FieldByName('PRODUTO').AsInteger;
        vQry.ParamByName('CODREFERENCIA').AsString := memItens.FieldByName('CODIGO').AsString;
        vQry.ParamByName('DESCRICAO').AsString     := memItens.FieldByName('DESCRICAO').AsString;
        vQry.ParamByName('UNIDADE').AsString       := memItens.FieldByName('UNIDADE').AsString;
        vQry.ParamByName('QUANTIDADE').AsFloat     := memItens.FieldByName('QTD').AsFloat;
        vQry.ParamByName('PRECO').AsFloat          := memItens.FieldByName('UNITARIO').AsFloat;
        vQry.ParamByName('TOTAL').AsFloat          := memItens.FieldByName('SUBTOTAL').AsFloat;
        vQry.ParamByName('OPERACAO').AsInteger     := vOperacao;
        vQry.ParamByName('NUMERONCM').AsString     := memItens.FieldByName('NCM').AsString;
        vQry.ExecSQL;

        memItens.Next;
      end;
    finally
      memItens.EnableControls;
    end;

    // 5. Confirma Transação
    try
//      mm.FDTransaction.CommitRetaining;
      dm_rc.rc_ShowSweetAlert('SUCESSO', vNomeDoc + ' gravado com sucesso! Nº ' + IntToStr(vNumeroDoc), 'success', false);
      NovaVenda;
    except
      on E: Exception do
        dm_rc.rc_ShowSweetAlert('ERRO', 'Falha ao gravar movimento: ' + E.Message, 'error', false);
    end;

  finally
    vQry.Free;
  end;
end;

procedure TfrmPDV.btnF4Click(Sender: TObject);
begin
  AplicarDescontoGeral;
end;

procedure TfrmPDV.AplicarDescontoGeral;
var
  vTextoIni: string;
begin
  if memItens.IsEmpty then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Nenhum item na venda para aplicar desconto!', 'warning', false);
    edtCodigoBarras.SetFocus;
    Exit;
  end;

  vTextoIni := '0,00';
  Prompt(
    'Informe o DESCONTO (Ex: 10,00 ou 10% - Digite 0 para zerar):',
    vTextoIni,
    mtConfirmation,
    mbOKCancel,
    procedure(Sender: TComponent; AResult: Integer; AText: string)
    var
      vStr: string;
      vIsPercent: Boolean;
      vValorDigitado: Double;
      vDescontoTotal: Double;
      vTotalBrutoItens: Double;
      vItemDesc, vDescAcumulado: Double;
      vSubTotalOrig, vNovoSubTotal, vNovoUnitario, vPrecoOrig: Double;
      vQtd: Double;
      vRecCount, vRecIndex: Integer;
    begin
      if (AResult = mrOK) then
      begin
        vStr := Trim(AText);
        vIsPercent := Pos('%', vStr) > 0;
        vStr := StringReplace(vStr, '%', '', [rfReplaceAll]);
        vStr := StringReplace(vStr, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
        vStr := Trim(vStr);
        vStr := StringReplace(vStr, '.', '', [rfReplaceAll]);
        vStr := StringReplace(vStr, ',', FormatSettings.DecimalSeparator, [rfReplaceAll]);
        vValorDigitado := StrToFloatDef(vStr, 0);

        if vValorDigitado < 0 then
        begin
          dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'O valor do desconto não pode ser negativo!', 'warning', false);
          edtCodigoBarras.SetFocus;
          Exit;
        end;

        // CASO 1: Informou 0 -> Zera todos os descontos e restaura os valores originais
        if vValorDigitado = 0 then
        begin
          memItens.DisableControls;
          try
            memItens.First;
            while not memItens.Eof do
            begin
              vPrecoOrig := memItens.FieldByName('PRECO_ORIGINAL').AsFloat;
              if vPrecoOrig <= 0 then
                vPrecoOrig := memItens.FieldByName('UNITARIO').AsFloat;

              vQtd := memItens.FieldByName('QTD').AsFloat;
              if vQtd <= 0 then vQtd := 1;

              vNovoSubTotal := Round((vQtd * vPrecoOrig) * 100) / 100;

              memItens.Edit;
              memItens.FieldByName('PRECO_ORIGINAL').AsFloat := vPrecoOrig;
              memItens.FieldByName('DESCONTO').AsFloat        := 0.0;
              memItens.FieldByName('UNITARIO').AsFloat        := vPrecoOrig;
              memItens.FieldByName('SUBTOTAL').AsFloat        := vNovoSubTotal;
              memItens.Post;

              memItens.Next;
            end;
          finally
            memItens.EnableControls;
          end;

          FTotalDesconto := 0.0;
  FValidandoPreco := False;
          CalculaTotaisVenda;

//          dm_rc.rc_ShowSweetAlert('DESCONTO', 'Descontos zerados com sucesso! Total recalculado.', 'info', false);
          edtCodigoBarras.SetFocus;
          Exit;
        end;

        // CASO 2: Informou valor > 0 -> Calcula o total bruto a partir do preco original
        vTotalBrutoItens := 0;
        memItens.DisableControls;
        try
          memItens.First;
          while not memItens.Eof do
          begin
            vPrecoOrig := memItens.FieldByName('PRECO_ORIGINAL').AsFloat;
            if vPrecoOrig <= 0 then
              vPrecoOrig := memItens.FieldByName('UNITARIO').AsFloat;

            vQtd := memItens.FieldByName('QTD').AsFloat;
            if vQtd <= 0 then vQtd := 1;

            vTotalBrutoItens := vTotalBrutoItens + (vQtd * vPrecoOrig);
            memItens.Next;
          end;

          if vTotalBrutoItens <= 0 then
          begin
            dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'O total da venda está zerado!', 'warning', false);
            edtCodigoBarras.SetFocus;
            Exit;
          end;

          if vIsPercent then
          begin
            if vValorDigitado >= 100 then
            begin
              dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'O desconto não pode ser de 100% ou mais!', 'warning', false);
              edtCodigoBarras.SetFocus;
              Exit;
            end;
            vDescontoTotal := Round((vTotalBrutoItens * (vValorDigitado / 100.0)) * 100) / 100;
          end
          else
            vDescontoTotal := vValorDigitado;

          if vDescontoTotal >= vTotalBrutoItens then
          begin
            dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'O desconto não pode ser maior ou igual ao total da venda!', 'warning', false);
            edtCodigoBarras.SetFocus;
            Exit;
          end;

          // Rateio proporcional entre todos os itens
          vDescAcumulado := 0;
          vRecCount := memItens.RecordCount;
          vRecIndex := 0;

          memItens.First;
          while not memItens.Eof do
          begin
            Inc(vRecIndex);
            vPrecoOrig := memItens.FieldByName('PRECO_ORIGINAL').AsFloat;
            if vPrecoOrig <= 0 then
              vPrecoOrig := memItens.FieldByName('UNITARIO').AsFloat;

            vQtd := memItens.FieldByName('QTD').AsFloat;
            if vQtd <= 0 then vQtd := 1;

            vSubTotalOrig := Round((vQtd * vPrecoOrig) * 100) / 100;

            if vRecIndex = vRecCount then
              vItemDesc := vDescontoTotal - vDescAcumulado
            else
            begin
              vItemDesc := Round((vDescontoTotal * (vSubTotalOrig / vTotalBrutoItens)) * 100) / 100;
              vDescAcumulado := vDescAcumulado + vItemDesc;
            end;

            vNovoSubTotal := vSubTotalOrig - vItemDesc;
            if vNovoSubTotal < 0 then
              vNovoSubTotal := 0;

            vNovoUnitario := Round((vNovoSubTotal / vQtd) * 100) / 100;

            memItens.Edit;
            memItens.FieldByName('PRECO_ORIGINAL').AsFloat := vPrecoOrig;
            memItens.FieldByName('DESCONTO').AsFloat        := vItemDesc;
            memItens.FieldByName('SUBTOTAL').AsFloat        := vNovoSubTotal;
            memItens.FieldByName('UNITARIO').AsFloat        := vNovoUnitario;
            memItens.Post;

            memItens.Next;
          end;
        finally
          memItens.EnableControls;
        end;

        FTotalDesconto := vDescontoTotal;
        CalculaTotaisVenda;

        dm_rc.rc_ShowSweetAlert('DESCONTO', 'Desconto de R$ ' + FormatFloat('###,##0.00', vDescontoTotal) + ' aplicado com sucesso e rateado entre os itens!', 'success', false);
        edtCodigoBarras.SetFocus;
      end;
    end
  );
end;


procedure TfrmPDV.btnBuscaCodigoClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    begin
      if AResult = mrOK then
      begin
        edtCodigoBarras.Text := mm.varC_codigo_busca;
        CarregaProduto(mm.varC_codigo_busca);
      end
      else
        edtCodigoBarras.SetFocus;
    end
  );
end;

procedure TfrmPDV.btnF2Click(Sender: TObject);
begin
  btnBuscaCodigoClick(Sender);
end;

procedure TfrmPDV.btnF3Click(Sender: TObject);
begin
  edtQtd.SelectAll;
  edtQtd.SetFocus;
end;

procedure TfrmPDV.btnF7Click(Sender: TObject);
begin
  CancelarItemSelecionado;
end;

procedure TfrmPDV.btnF9Click(Sender: TObject);
begin
  if (FProdId > 0) and (edtPrecoUnit.Value <= 0) then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe o PREÇO UNITÁRIO antes de efetuar a venda!', 'warning', false);
    edtPrecoUnit.SelectAll;
    edtPrecoUnit.SetFocus;
    Exit;
  end;

  if (FProdId > 0) and (edtPrecoUnit.Value > 0) and (edtQtd.Value > 0) then
    AdicionarItemNaVenda;

  GravarVenda;
end;

procedure TfrmPDV.gridItensDblClick(Sender: TObject);
begin
  if not memItens.IsEmpty then
  begin
    edtQtd.Value := memItens.FieldByName('QTD').AsFloat;
    edtPrecoUnit.Value := memItens.FieldByName('UNITARIO').AsFloat;
    edtQtd.SelectAll;
    edtQtd.SetFocus;
  end;
end;

procedure TfrmPDV.UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2:     btnF2Click(Sender);
    VK_F3:     btnF3Click(Sender);
    VK_F4:     btnF4Click(Sender);
    VK_F7:     btnF7Click(Sender);
    VK_F9:     btnF9Click(Sender);
    VK_ESCAPE: Close;
  end;
end;

initialization
  RegisterClass(TfrmPDV);

end.
