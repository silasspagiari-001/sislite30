unit untCadPAGAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBASEFINANCEIRO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniPanel, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniGUIClasses, uniEdit, UniButtonEdit, uniLabel,
  uniGUIBaseClasses, Vcl.Menus, uniMainMenu;

type
  TfrmCADPAGAR = class(TfrmBASEFINANCEIRO)
    procedure UniBitBtncadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADPAGAR: TfrmCADPAGAR;

implementation

{$R *.dfm}

procedure TfrmCADPAGAR.UniBitBtncadastroClick(Sender: TObject);
begin
  inherited;
  btnSearchCRUD.OnClick(self);
end;

initialization
  RegisterClass(TfrmCADPAGAR);
end.
