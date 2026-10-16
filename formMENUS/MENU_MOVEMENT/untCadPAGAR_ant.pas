unit untCadPAGAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadTITULOS, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniHTMLFrame, uniDBDateTimePicker, uniDBEdit, UniButtonDbEdit, uniDBComboBox,
  uniMultiItem, uniComboBox, uniDateTimePicker, UniButtonEdit, uniScrollBox,
  uniPanel, uniPageControl, uniButton, uniBitBtn, uniBasicGrid, uniDBGrid,
  uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses, uniMemo, uniDBMemo;

type
  TfrmcadPAGAR = class(TfrmBaseTITULOS)
    FDQryFiltroVALORORIGINAL: TFMTBCDField;
    FDQryFiltroVALORPAGO: TFMTBCDField;
    FDQryFiltroDOCUMENTO: TIntegerField;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniDBMemoobs: TUniDBMemo;
    UniLabel39: TUniLabel;
    procedure G1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadPAGAR: TfrmcadPAGAR;

implementation

{$R *.dfm}

uses MainModule;
procedure TfrmcadPAGAR.G1Click(Sender: TObject);
begin
  mm.varFP_id_parcela := 'PAGAR';
  inherited;
end;

initialization
  RegisterClass(TfrmcadPAGAR);
end.
