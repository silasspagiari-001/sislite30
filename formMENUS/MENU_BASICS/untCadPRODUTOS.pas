unit untCadPRODUTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, UniButtonDbEdit,
  uniDBComboBox, uniMemo, Vcl.Menus, uniMainMenu, uniScreenMask;

type
  TfrmcadPRODUTOS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBComboBoxmedida: TUniDBComboBox;
    UniLabel4: TUniLabel;
    UniButtonDbEditGRUPOS: TUniButtonDbEdit;
    UniLabel5: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel12: TUniLabel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel13: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel17: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel21: TUniLabel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    rcBlock240: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel27: TUniLabel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel6: TUniLabel;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroUNIDADE: TStringField;
    FDQryFiltroALTURA: TFMTBCDField;
    FDQryFiltroCOMPRIMENTO: TFMTBCDField;
    FDQryFiltroLARGURA: TFMTBCDField;
    UniPopupMenudetalhes: TUniPopupMenu;
    D1: TUniMenuItem;
    FDQryFiltroTIPO: TStringField;
    UniLabel15: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit14: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit15: TUniDBFormattedNumberEdit;
    UniLabel31: TUniLabel;
    FDQryFiltroCODIGOREFERENCIA: TStringField;
    UniScreenMask1: TUniScreenMask;
    UniLabel32: TUniLabel;
    UniDBFormattedNumberEdit16: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit17: TUniDBFormattedNumberEdit;
    UniLabel33: TUniLabel;
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniButtonDbEditGRUPOSButtonClick(Sender: TObject);
    procedure UniButtonDbEditespecieButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigocultivarButtonClick(Sender: TObject);
    procedure FDQryFiltroUNIDADEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOptionsClick(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniDBFormattedNumberEdit14Exit(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure UniDBFormattedNumberEdit15Exit(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
    procedure carregamedida();
    procedure AtualizaCusto(const cproduto:integer;vlrcusto:real);
    procedure AtualizaCustoMestre(const cmestre:integer);

    procedure ExclusaoCustoItens(const cproduto :integer);
    procedure ExclusaoCustoMestre(const cmestre:integer);
  end;

var
  frmcadPRODUTOS: TfrmcadPRODUTOS;

implementation

{$R *.dfm}

uses mkm_procedures, untDM_RC, MainModule, untFrmPesquisa, Vcl.Grids,
  untFrmCOMPOSICAOPRODUTO, mkm_funcoes, mkm_func_web;
{ TfrmcadPRODUTOS }
procedure TfrmcadPRODUTOS.AtualizaCustoMestre(const cmestre:integer);
var
  vlrtotalcusto,
  valoratual    : Real;
  produtomestre : integer;

begin
  if SqlPesquisa('select * from COMPOSICAOITENS where mestre =  ' + IntToStr(cmestre)) then
    begin
      vlrtotalcusto := 0;
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          vlrtotalcusto := vlrtotalcusto + dm_rc.sqlBuscas.FindField('TOTALCUSTO').AsFloat;

          dm_rc.sqlBuscas.Next;
        end;
    end;

  if TabelaComposicao('select * from composicao where codigo = ' + IntToStr(cmestre)) then
    begin
      valoratual    := 0;
      valoratual    := Mround(dm_rc.fdqrycomposicao.FindField('MARGEM').AsFloat * vlrtotalcusto,2)/100;
      valoratual    := Mround(valoratual + vlrtotalcusto,2);
      produtomestre := dm_rc.fdqrycomposicao.FindField('PRODUTO').AsInteger;

      dm_rc.fdqrycomposicao.Edit;
      dm_rc.fdqrycomposicao.FindField('TOTALCUSTO').AsFloat := vlrtotalcusto;
      dm_rc.fdqrycomposicao.FindField('VENDA').AsFloat      := valoratual;
      dm_rc.fdqrycomposicao.Post;

      if TabelaSaldos('select * from saldos where produto = ' + IntToStr(produtomestre)) then
        begin
          dm_rc.fdqrysaldos.Edit;
          dm_rc.fdqrysaldos.FindField('VENDA').AsFloat := valoratual;
          dm_rc.fdqrysaldos.FindField('CUSTO').AsFloat := vlrtotalcusto;
          dm_rc.fdqrysaldos.Post;
        end;
    end;
end;
procedure TfrmcadPRODUTOS.AtualizaCusto(const cproduto:integer;vlrcusto:real);
begin
  if  TabelaComposicaoitens('select * from COMPOSICAOITENS where produto = ' + IntToStr(cproduto)) then
    begin
      dm_rc.fdqrycomposicaoitens.First;
      while not dm_rc.fdqrycomposicaoitens.Eof do
        begin
          dm_rc.fdqrycomposicaoitens.Edit;
          dm_rc.fdqrycomposicaoitens.FindField('VLRCUSTO').AsFloat   := vlrcusto;
          dm_rc.fdqrycomposicaoitens.FindField('TOTALCUSTO').AsFloat := (dm_rc.fdqrycomposicaoitens.FindField('QUANTIDADE').AsFloat * vlrcusto);
          dm_rc.fdqrycomposicaoitens.Post;

          AtualizaCustoMestre(dm_rc.fdqrycomposicaoitens.FindField('MESTRE').AsInteger);

          dm_rc.fdqrycomposicaoitens.Next;
        end;
      dm_rc.rc_ShowSweetAlert( 'OK', 'ATUALIZAÇÃO DA COMPOSICAO ATUALIZADA COM SUCESSO!' , 'sucess' , false );
    end;
end;

procedure TfrmcadPRODUTOS.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  mm.varPRODUTO_EDITADO := '';
end;

procedure TfrmcadPRODUTOS.btnDeleteRegClick(Sender: TObject);
var
  cproduto:integer;
  ctipo   : string;
begin
  cproduto := FDQryCad.FindField('CODIGO').AsInteger;
  ctipo    := FDQryCad.FindField('TIPO').AsString;

  inherited;

  if ctipo = 'Materia Prima' then
    begin
      if mm.varB_Yes then
        ExclusaoCustoItens(cproduto);
    end;
end;

procedure TfrmcadPRODUTOS.btnEditRegClick(Sender: TObject);
begin
  carregamedida();
  inherited;
  mm.varPRODUTO_EDITADO := 'S';
end;

procedure TfrmcadPRODUTOS.btnNewRegClick(Sender: TObject);
begin
  carregamedida();
  inherited;

  mm.varPRODUTO_EDITADO := 'S';
end;

procedure TfrmcadPRODUTOS.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenudetalhes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmcadPRODUTOS.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  mm.varCustoAnteriorProduto := 0;
  mm.varPRODUTO_EDITADO      := '';
  mm.varCUSTO_COMPOSICAO     := 0;
  mm.varCUSTO_UNITARIO       := 0;
end;

procedure TfrmcadPRODUTOS.carregamedida;
begin
  UniDBComboBoxmedida.Clear;
  TabelaMedidas('SELECT sigla FROM medidas WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY codigo');
  dm_rc.fdqrymedidas.first;
  while not dm_rc.fdqrymedidas.Eof do
    begin
      UniDBComboBoxmedida.Items.Add(dm_rc.fdqrymedidas.FindField('SIGLA').AsString);
      dm_rc.fdqrymedidas.Next;
    end;
end;

procedure TfrmcadPRODUTOS.D1Click(Sender: TObject);
begin
  inherited;
  if FDQryFiltro.RecordCount > 0 then
    begin
      mm.varCP_CODIGO := FDQryFiltroCODIGO.AsInteger;
      frmCOMPOSICAOPRODUTO.ShowModal();

      if mm.varPRODUTO_EDITADO = 'S' then
        begin
          FDQryCaddetails.FindField('VENDA').AsFloat := mm.varCUSTO_COMPOSICAO;
          FDQryCaddetails.FindField('CUSTO').AsFloat := mm.varCUSTO_UNITARIO;
        end;
    end;
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'UNIDADE' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregamedida();
  inherited;
  mm.varCustoAnteriorProduto := 0;
  mm.varCustoAnteriorProduto := FDQryCaddetails.FindField('CUSTO').AsFloat;
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmcadPRODUTOS.ExclusaoCustoItens(const cproduto: integer);
begin
  if  TabelaComposicaoitens('select * from COMPOSICAOITENS where produto = ' + IntToStr(cproduto)) then
    begin
      executasql('delete from composicaoitens where produto = ' + IntToStr(cproduto));

      dm_rc.fdqrycomposicaoitens.First;
      while not dm_rc.fdqrycomposicaoitens.Eof do
        begin
          ExclusaoCustoMestre(dm_rc.fdqrycomposicaoitens.FindField('MESTRE').AsInteger);

          dm_rc.fdqrycomposicaoitens.Next;
        end;
      dm_rc.rc_ShowSweetAlert( 'OK', 'COMPOSIÇÃO REFEITA COM SUCESSO!' , 'sucess' , false );
    end;
end;

procedure TfrmcadPRODUTOS.ExclusaoCustoMestre(const cmestre: integer);
var
  vlrtotalcusto,
  valoratual    : Real;
  produtomestre : integer;

begin
  if SqlPesquisa('select * from COMPOSICAOITENS where mestre =  ' + IntToStr(cmestre)) then
    begin
      vlrtotalcusto := 0;
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          vlrtotalcusto := vlrtotalcusto + dm_rc.sqlBuscas.FindField('TOTALCUSTO').AsFloat;

          dm_rc.sqlBuscas.Next;
        end;
    end;

  if TabelaComposicao('select * from composicao where codigo = ' + IntToStr(cmestre)) then
    begin
      valoratual    := 0;
      valoratual    := Mround(dm_rc.fdqrycomposicao.FindField('MARGEM').AsFloat * vlrtotalcusto,2)/100;
      valoratual    := Mround(valoratual + vlrtotalcusto,2);
      produtomestre := dm_rc.fdqrycomposicao.FindField('PRODUTO').AsInteger;

      dm_rc.fdqrycomposicao.Edit;
      dm_rc.fdqrycomposicao.FindField('TOTALCUSTO').AsFloat := vlrtotalcusto;
      dm_rc.fdqrycomposicao.FindField('VENDA').AsFloat      := valoratual;
      dm_rc.fdqrycomposicao.Post;

      if TabelaSaldos('select * from saldos where produto = ' + IntToStr(produtomestre)) then
        begin
          dm_rc.fdqrysaldos.Edit;
          dm_rc.fdqrysaldos.FindField('VENDA').AsFloat := valoratual;
          dm_rc.fdqrysaldos.FindField('CUSTO').AsFloat := vlrtotalcusto;
          dm_rc.fdqrysaldos.Post;
        end;
    end;

end;

procedure TfrmcadPRODUTOS.FDQryFiltroUNIDADEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=
    '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcodigocultivarButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CULTIVAR');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CODIGO_CULTIVAR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditespecieButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('ESPECIE');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CODIGO_ESPECIE').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditGRUPOSButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('GRUPOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('GRUPO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniDBFormattedNumberEdit14Exit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if FDQryCad.FindField('TIPO').AsString = 'Materia Prima' then
        begin
          if mm.varCustoAnteriorProduto <> FDQryCaddetails.FindField('CUSTO').AsFloat then
            begin
              dm_rc.rc_ShowYesNo( 'POSSO ATUALIZAR O PREÇO DE CUSTO?, HOUVE UMA MUDANÇA!' );
              if mm.varB_Yes then
                begin
                  AtualizaCusto(FDQryCad.FindField('CODIGO').AsInteger,FDQryCaddetails.FindField('CUSTO').AsFloat);
                end;
            end;
        end;
    end;
end;

procedure TfrmcadPRODUTOS.UniDBFormattedNumberEdit15Exit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
   begin
     if FDQryCaddetails.FindField('COMPRA').AsFloat > 0 then
       if FDQryCaddetails.FindField('MARGEM').AsFloat > 0then
         FDQryCaddetails.FindField('VENDA').AsFloat := FDQryCaddetails.FindField('COMPRA').AsFloat + ((FDQryCaddetails.FindField('COMPRA').AsFloat * 0.01) * FDQryCaddetails.FindField('MARGEM').AsFloat);
   end;
end;

procedure TfrmcadPRODUTOS.UniFrameCreate(Sender: TObject);
begin
  inherited;
  dbgSearchCRUD.ClientEvents.UniEvents.Add(
  'store.aftercreate=function store.aftercreate(sender)' +
  '{'+
  'sender.setRemoteSort(false);'+
  '}'
  );
end;

procedure TfrmcadPRODUTOS.UniFrameDestroy(Sender: TObject);
begin
  inherited;
    mm.varPRODUTO_EDITADO := '';
end;

initialization
  RegisterClass(TfrmcadPRODUTOS);
end.
