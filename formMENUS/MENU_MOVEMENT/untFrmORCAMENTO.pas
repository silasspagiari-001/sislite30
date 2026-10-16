unit untFrmORCAMENTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMOVIMENTOMESTRE,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniGUIClasses, uniEdit, UniButtonEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, Vcl.Menus, uniMainMenu, uniDBEdit, uniMemo, uniDBMemo,
  UniButtonDbEdit, uniDBDateTimePicker;

type
  TfrmORCAMENTO = class(TfrmMOVIMENTOMESTRE)
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmORCAMENTO: TfrmORCAMENTO;

implementation

{$R *.dfm}

uses MainModule;
procedure TfrmORCAMENTO.UniFrameCreate(Sender: TObject);
begin
  labTitleForm.Caption        := 'ORÇAMENTO';
  varC_Documento_Mvmestre     := 3;
  inherited;
end;

initialization
  RegisterClass(TfrmORCAMENTO);
end.
