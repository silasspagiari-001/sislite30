unit untCadAPLICACAO;

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
  uniDBComboBox, uniMemo;

type
  TfrmCADAPLICACAO = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniButtonDbEditcusto: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    procedure UniButtonDbEditcustoButtonClick(Sender: TObject);
    procedure UniButtonDbEditcustoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADAPLICACAO: TfrmCADAPLICACAO;

implementation

{$R *.dfm}

uses untFrmPesquisa, MainModule, mkm_procedures;

procedure TfrmCADAPLICACAO.UniButtonDbEditcustoButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CENTROCUSTO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CENTROCUSTO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADAPLICACAO.UniButtonDbEditcustoExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcusto.Text <> '') and (UniButtonDbEditcusto.Text <> '0') then
        FDQryCad.FindField('NOMECENTRO').AsString     := Acha_Item('CENTROCUSTO',FDQryCad.FindField('CENTROCUSTO').AsString);
    end;
end;
initialization
  RegisterClass(TfrmCADAPLICACAO);
end.
