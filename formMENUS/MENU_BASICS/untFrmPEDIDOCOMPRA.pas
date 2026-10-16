unit untFrmPEDIDOCOMPRA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMOVIMENTOMESTRE,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, uniHTMLFrame, uniMemo, uniDBMemo,
  uniDBEdit, uniDBDateTimePicker, UniButtonDbEdit, uniMultiItem, uniComboBox,
  uniDateTimePicker, UniButtonEdit, uniScrollBox, uniPanel, uniPageControl,
  uniButton, uniBitBtn, uniBasicGrid, uniDBGrid, uniGUIClasses, uniEdit,
  uniLabel, uniGUIBaseClasses;

type
  TfrmPEDIDOCOMPRA = class(TfrmMOVIMENTOMESTRE)
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPEDIDOCOMPRA: TfrmPEDIDOCOMPRA;

implementation

{$R *.dfm}
procedure TfrmPEDIDOCOMPRA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  labTitleForm.Caption        := 'PEDIDO DE COMPRA';
  varC_Documento_Mvmestre     := 6;
end;

initialization
  RegisterClass(TfrmPEDIDOCOMPRA);
end.
