unit untCADRECEBER;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadTitulos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniDateTimePicker,
  uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniScrollBox, uniPanel,
  uniPageControl, uniButton, uniBitBtn, uniGUIBaseClasses;

type
  TfrmcadRECEBER = class(TfrmBaseCRUDTITULOS)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadRECEBER: TfrmcadRECEBER;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmcadRECEBER);
end.
