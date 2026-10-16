unit untcadFUNCIONARIOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniMemo;

type
  TfrmcadFUNCIONARIOS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel8: TUniLabel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadFUNCIONARIOS: TfrmcadFUNCIONARIOS;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmcadFUNCIONARIOS);
end.
