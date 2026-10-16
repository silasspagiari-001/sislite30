unit untCadPLANOCONTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniDBComboBox, uniCheckBox, uniDBCheckBox, uniDBEdit,
  uniMemo;

type
  TfrmCADPLANOCONTAS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel8: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel9: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADPLANOCONTAS: TfrmCADPLANOCONTAS;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmCADPLANOCONTAS);

end.
