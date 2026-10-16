unit untCadINDICATIVO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn, uniGUIClasses,
  uniMemo, uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit;

type
  TfrmcadINDICATIVO = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadINDICATIVO: TfrmcadINDICATIVO;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmcadINDICATIVO);
end.
