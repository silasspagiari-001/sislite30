unit untCadESPECIE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, UniButtonDbEdit,
  Vcl.Imaging.pngimage, uniImage, uniMemo;

type
  TfrmCADESPECIE = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBCheckBox2: TUniDBCheckBox;
    UniButtonDbEditcodigogrupo: TUniButtonDbEdit;
    UniLabel8: TUniLabel;
    procedure UniButtonDbEditcodigogrupoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADESPECIE: TfrmCADESPECIE;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa;
procedure TfrmCADESPECIE.UniButtonDbEditcodigogrupoButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('GRUPOSESPECIE');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('GRUPO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

initialization
  RegisterClass(TfrmCADESPECIE);
end.
