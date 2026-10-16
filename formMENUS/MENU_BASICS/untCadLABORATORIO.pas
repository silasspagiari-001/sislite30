unit untCadLABORATORIO;

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
  uniMemo;

type
  TfrmCADLABORATORIO = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel10: TUniLabel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniButtonDbEditcep: TUniButtonDbEdit;
    UniLabel11: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel16: TUniLabel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniLabel18: TUniLabel;
    procedure UniButtonDbEditcepButtonClick(Sender: TObject);
    procedure UniButtonDbEditcepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADLABORATORIO: TfrmCADLABORATORIO;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_procedures, untDM_RC;
procedure TfrmCADLABORATORIO.UniButtonDbEditcepButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CEP').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCADLABORATORIO.UniButtonDbEditcepExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcep.Text <> '') and (UniButtonDbEditcep.Text <> '0') then
        begin
          SqlPesquisa('select DESCRICAO, UF from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEP').AsString));
            FDQryCad.FindField('CIDADE').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
            FDQryCad.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
        end;
    end;
end;

initialization
  RegisterClass(TfrmCADLABORATORIO);
end.
