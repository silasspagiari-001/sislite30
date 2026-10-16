unit untCadPONTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniDateTimePicker, uniDBDateTimePicker, UniButtonDbEdit,
  uniDBEdit, uniDBComboBox, uniMemo, uniDBMemo;

type
  TfrmcadPONTOS = class(TfrmCRUDPROPRIO)
    FDQryFiltroTIPO: TStringField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroPRODUTO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroQUANTIDADE: TFMTBCDField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroLOTESEMENTE: TStringField;
    FDQryFiltroBOLETIM: TStringField;
    FDQryFiltroTERMO: TStringField;
    FDQryFiltroDATA: TDateField;
    FDQryFiltroNUMERO: TIntegerField;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel15: TUniLabel;
    UniButtonDbEditprodutoponto: TUniButtonDbEdit;
    UniDBEdit7: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniButtonDbEditoperacao: TUniButtonDbEdit;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBComboBox2: TUniDBComboBox;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniLabel23: TUniLabel;
    UniDBComboBox4: TUniDBComboBox;
    rcBlock250: TUniContainerPanel;
    UniLabel27: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    FDQryFiltroPUREZA: TFMTBCDField;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonDbEditprodutopontoButtonClick(Sender: TObject);
    procedure UniButtonDbEditprodutopontoExit(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniButtonDbEditoperacaoButtonClick(Sender: TObject);
    procedure UniButtonDbEditoperacaoExit(Sender: TObject);
    procedure UniButtonDbEditLOTEButtonClick(Sender: TObject);
    procedure UniDBFormattedNumberEdit1Exit(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregacategoria();
    procedure carregalote(const F_LOTE:string);
    function  CalculaPonto(vrpur,vrqtde:Real) : Real;
  end;

var
  frmcadPONTOS: TfrmcadPONTOS;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_procedures, untDM_RC, mkm_funcoes,
  mkm_func_web;

procedure TfrmcadPONTOS.btnDeleteRegClick(Sender: TObject);
var
  produto:integer;
begin
  produto := 0;
  produto := FDQryCad.FindField('PRODUTO').AsInteger;

  inherited;
  Calcula_SaldoProduto(mm.varI_Code_Company,produto);
end;

procedure TfrmcadPONTOS.btnEditRegClick(Sender: TObject);
begin
  carregacategoria();
  inherited;
end;

procedure TfrmcadPONTOS.btnNewRegClick(Sender: TObject);
begin
  carregacategoria();
  inherited;
end;

procedure TfrmcadPONTOS.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  Calcula_SaldoProduto(mm.varI_Code_Company,FDQryCad.FindField('PRODUTO').AsInteger);
end;

function TfrmcadPONTOS.CalculaPonto(vrpur, vrqtde: Real): Real;
var
  totpontos : Real;
begin
  totpontos := 0;
  totpontos := vrqtde * vrpur;

  Result    := totpontos;
end;

procedure TfrmcadPONTOS.carregacategoria;
begin

end;

procedure TfrmcadPONTOS.carregalote(const F_LOTE:string);
begin
  if SqlPesquisa('select codigo, produto, lote, boletim, termo, categoria,analisepura, gernormais, valorcultural from sementes where LOTE = ' + QuotedStr(F_LOTE)) then
    begin
      FDQryCad.FindField('PRODUTO').AsString     := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
      FDQryCad.FindField('LOTESEMENTE').AsString := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      FDQryCad.FindField('BOLETIM').AsString     := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      FDQryCad.FindField('TERMO').AsString       := dm_rc.sqlBuscas.FindField('TERMO').AsString;
      FDQryCad.FindField('CATEGORIA').AsString   := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      FDQryCad.FindField('PUREZA').AsFloat       := dm_rc.sqlBuscas.FindField('ANALISEPURA').AsFloat;
      FDQryCad.FindField('GERMINACAO').AsFloat   := dm_rc.sqlBuscas.FindField('GERNORMAIS').AsFloat;
      FDQryCad.FindField('VALORCULTURAL').AsFloat:= dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsFloat;

      UniButtonDbEditprodutoponto.OnExit(Self);
    end;
end;

procedure TfrmcadPONTOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregacategoria();
  inherited;
end;

procedure TfrmcadPONTOS.FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    begin
      if FDQryFiltroTIPO.AsString = 'ENTRADA' then
        Text := '<span class="badge badge-success">Entrada</span>'
      else
      if FDQryFiltroTIPO.AsString = 'SAIDA' then
        Text := '<span class="badge badge-danger">Saida</span>'
      else
        Text := '<span class="badge badge-warning">Nulo</span>';
    end;
end;

procedure TfrmcadPONTOS.UniButtonDbEdit3ButtonClick(Sender: TObject);
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

procedure TfrmcadPONTOS.UniButtonDbEditLOTEButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('SEMENTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('LOTESEMENTE').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmcadPONTOS.UniButtonDbEditoperacaoButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('OPERACOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('OPERACAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPONTOS.UniButtonDbEditoperacaoExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditoperacao.Text <> '') and (UniButtonDbEditoperacao.Text <> '0') then
        begin
          if SqlPesquisa('SELECT CODIGO, ENTRADA_SAIDA FROM OPERACOES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditoperacao.Text)) then
            begin
              FDQryCad.FindField('TIPO').AsString := variif(dm_rc.sqlBuscas.FindField('ENTRADA_SAIDA').AsInteger = 0,'ENTRADA','SAIDA');
            end;
        end;
    end;
end;

procedure TfrmcadPONTOS.UniButtonDbEditprodutopontoButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PRODUTO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPONTOS.UniButtonDbEditprodutopontoExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditprodutoponto.Text <> '') and (UniButtonDbEditprodutoponto.Text <> '0') then
        begin
          FDQryCad.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',UniButtonDbEditprodutoponto.Text);
        end;
    end;
end;

procedure TfrmcadPONTOS.UniDBFormattedNumberEdit1Exit(Sender: TObject);
begin
  FDQryCad.FindField('PONTOS').AsFloat := CalculaPonto(FDQryCad.FindField('PUREZA').AsFloat,
                                                       FDQryCad.FindField('QUANTIDADE').AsFloat);
end;

procedure TfrmcadPONTOS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniContainerPanel5.Visible := False;
end;

initialization
  RegisterClass(TfrmcadPONTOS);
end.
