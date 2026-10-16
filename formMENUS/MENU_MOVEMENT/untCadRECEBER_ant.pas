unit untCadRECEBER;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadTITULOS, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniPanel, uniHTMLFrame,
  uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  UniButtonDbEdit, UniButtonEdit, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniScrollBox, uniPageControl, uniButton,
  uniBitBtn, Vcl.Menus, uniMainMenu, uniDBComboBox, uniDBDateTimePicker, uniMemo,
  uniDBMemo;

type
  TfrmcadRECEBER = class(TfrmBaseTITULOS)
    UniPopupMenuopcoes: TUniPopupMenu;
    H1: TUniMenuItem;
    FDQryFiltroKEY: TStringField;
    N2: TUniMenuItem;
    D1: TUniMenuItem;
    FDQryFiltroDOCUMENTO: TIntegerField;
    FDQryFiltroVALORORIGINAL: TFMTBCDField;
    FDQryFiltroVALORPAGO: TFMTBCDField;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniDBMemoobs: TUniDBMemo;
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FDQryFiltroKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure H1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  end;

var
  frmcadRECEBER: TfrmcadRECEBER;

implementation

uses
  Vcl.Grids, mkm_impressao, unReportImpressao, untDM_RC, MainModule,
  untFrmTELAGENERICA;

{$R *.dfm}
procedure TfrmcadRECEBER.D1Click(Sender: TObject);
begin
  MM.varI_Code_Numero_Documento    := FDQryFiltro.FindField('NUMERO').AsInteger;
  MM.varI_Code_Documento_Documento := FDQryFiltro.FindField('DOCUMENTO').AsInteger;
  mm.VarC_Atelagenerica            := 'DETALHESEMISSORDOC';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmcadRECEBER.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'KEY' then
    begin
      UniPopupMenuopcoes.Popup(posicao_x-160,posicao_y, dbgSearchCRUD);
    end;

end;

procedure TfrmcadRECEBER.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmcadRECEBER.FDQryFiltroKEYGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text :=
    '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmcadRECEBER.G1Click(Sender: TObject);
begin
  mm.varFP_id_parcela := 'RECEBER';
  inherited;
end;

procedure TfrmcadRECEBER.H1Click(Sender: TObject);
begin
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR ESTA DUPLICATA?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Duplicata(mm.varI_Code_Company,
                                                 FDQryFiltro.FindField('CODIGO').AsInteger,
                                                 FDQryFiltro.FindField('SEQUENCIA').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

initialization
  RegisterClass(TfrmcadRECEBER);

end.
