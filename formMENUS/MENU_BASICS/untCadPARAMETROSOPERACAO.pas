unit untCadPARAMETROSOPERACAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, UniButtonDbEdit, uniCheckBox, uniDBCheckBox, uniDBEdit,
  uniMemo;

type
  TfrmCADPARAMETROSOPERACAO = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniButtonDbEditcodigocondicaomestre: TUniButtonDbEdit;
    UniLabel6: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel7: TUniLabel;
    procedure UniButtonDbEditcodigocondicaomestreButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADPARAMETROSOPERACAO: TfrmCADPARAMETROSOPERACAO;

implementation

{$R *.dfm}

uses untFrmPesquisa, MainModule;
procedure TfrmCADPARAMETROSOPERACAO.UniButtonDbEdit1ButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('OPERACOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('OP_EXTERNA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);

end;

procedure TfrmCADPARAMETROSOPERACAO.UniButtonDbEditcodigocondicaomestreButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('OPERACOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('OP_INTERNA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

initialization
  RegisterClass(TfrmCADPARAMETROSOPERACAO);
end.
