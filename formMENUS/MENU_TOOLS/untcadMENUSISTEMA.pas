unit untcadMENUSISTEMA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn, uniGUIClasses,
  uniMemo, uniGUIBaseClasses, uniDBComboBox, uniDBEdit, uniScreenMask;

type
  TfrmcadMENUSISTEMA = class(TfrmCRUDPROPRIO)
    FDQryFiltroMENU: TStringField;
    FDQryFiltroTABELA: TStringField;
    FDQryFiltroORDEM: TIntegerField;
    FDQryFiltroCODIGO: TIntegerField;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel4: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    procedure btnSaveRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadMENUSISTEMA: TfrmcadMENUSISTEMA;

implementation

{$R *.dfm}

uses mkm_procedures;

procedure TfrmcadMENUSISTEMA.btnSaveRegClick(Sender: TObject);
begin
  FDQryCad.FindField('ORDEM').AsInteger := Sequencia_Menusisterma(FDQryCad.FindField('MENU').AsString);
  inherited;
end;
initialization
  RegisterClass(TfrmcadMENUSISTEMA);
end.
