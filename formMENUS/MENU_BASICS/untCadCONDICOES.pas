unit untCadCONDICOES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniRadioGroup,
  uniDBRadioGroup, uniMemo, uniDBMemo;

type
  TfrmCADCONDICOES = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel6: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADCONDICOES: TfrmCADCONDICOES;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmCADCONDICOES);
end.
