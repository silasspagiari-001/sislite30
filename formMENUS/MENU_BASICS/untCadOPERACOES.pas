unit untCadOPERACOES;

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
  UniButtonDbEdit, uniRadioGroup, uniDBRadioGroup, uniMemo;

type
  TfrmCADOPERACOES = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel8: TUniLabel;
    UniButtonDbEditcusto: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel10: TUniLabel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    UniDBRadioGroup2: TUniDBRadioGroup;
    UniDBRadioGroup3: TUniDBRadioGroup;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    procedure UniButtonDbEditcustoButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADOPERACOES: TfrmCADOPERACOES;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa;
procedure TfrmCADOPERACOES.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('ESCRITAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('ESCRITA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADOPERACOES.UniButtonDbEditcustoButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('OPERACOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('SUBSTITUICAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

initialization
  RegisterClass(TfrmCADOPERACOES);
end.
