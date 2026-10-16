unit untFrmPEDIDOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMOVIMENTOMESTRE,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client, Vcl.Menus,
  uniMainMenu, FireDAC.Comp.DataSet, uniHTMLFrame, uniDBEdit, uniMemo,
  uniDBMemo, uniDBDateTimePicker, UniButtonDbEdit, uniMultiItem, uniComboBox,
  uniDateTimePicker, UniButtonEdit, uniScrollBox, uniPanel, uniPageControl,
  uniButton, uniBitBtn, uniBasicGrid, uniDBGrid, uniGUIClasses, uniEdit,
  uniLabel, uniGUIBaseClasses;

type
  TfrmPEDIDOS = class(TfrmMOVIMENTOMESTRE)
    E1: TUniMenuItem;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPEDIDOS: TfrmPEDIDOS;

implementation

{$R *.dfm}

uses MainModule, untDM_RC;
procedure TfrmPEDIDOS.UniFrameCreate(Sender: TObject);
begin
  labTitleForm.Caption        := 'PEDIDOS';
  varC_Documento_Mvmestre     := 4;
  inherited;
end;

initialization
  RegisterClass(TfrmPEDIDOS);
end.
