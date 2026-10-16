unit untCadPESSOAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniDBEdit, uniCheckBox, uniDBCheckBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, UniButtonDbEdit, UniFSCombobox,
  Vcl.Menus, uniMainMenu, uniMemo;

type
  TfrmcadPESSOAS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel4: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniButtonDbEditcodigocondicaomestre: TUniButtonDbEdit;
    UniLabel12: TUniLabel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniDBEdit5: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    UniButtonDbEditCEPP: TUniButtonDbEdit;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    UniDBEdit10: TUniDBEdit;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniLabel22: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    rcBlock210: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniDBEdit11: TUniDBEdit;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    UniDBEdit14: TUniDBEdit;
    UniLabel27: TUniLabel;
    UniDBEdit15: TUniDBEdit;
    UniLabel28: TUniLabel;
    UniDBComboBoxregiao: TUniDBComboBox;
    UniTabSheetdadosdemais: TUniTabSheet;
    rcBlock270: TUniContainerPanel;
    UniLabel29: TUniLabel;
    rcBlock280: TUniContainerPanel;
    rcBlock290: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    UniButtonDbEditCEPENTREGA: TUniButtonDbEdit;
    UniDBEdit16: TUniDBEdit;
    UniDBEdit17: TUniDBEdit;
    UniDBEdit18: TUniDBEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    rcBlock320: TUniContainerPanel;
    rcBlock330: TUniContainerPanel;
    UniDBEdit19: TUniDBEdit;
    UniLabel34: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel35: TUniLabel;
    rcBlock340: TUniContainerPanel;
    UniLabel36: TUniLabel;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    rcBlock380: TUniContainerPanel;
    UniButtonDbEditcepfaturamento: TUniButtonDbEdit;
    UniLabel37: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    UniLabel38: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    UniLabel39: TUniLabel;
    UniDBEdit22: TUniDBEdit;
    UniLabel40: TUniLabel;
    rcBlock390: TUniContainerPanel;
    rcBlock400: TUniContainerPanel;
    UniDBEdit23: TUniDBEdit;
    UniLabel41: TUniLabel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel42: TUniLabel;
    UniPopupMenudetalhes: TUniPopupMenu;
    R1: TUniMenuItem;
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure UniButtonDbEditCEPPButtonClick(Sender: TObject);
    procedure UniButtonDbEditCEPPExit(Sender: TObject);
    procedure UniButtonDbEditCEPENTREGAExit(Sender: TObject);
    procedure UniButtonDbEditCEPENTREGAButtonClick(Sender: TObject);
    procedure UniButtonDbEditcepfaturamentoButtonClick(Sender: TObject);
    procedure UniButtonDbEditcepfaturamentoExit(Sender: TObject);
    procedure UniButtonDbEditcodigocondicaomestreButtonClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregaregiao();
  end;

var
  frmcadPESSOAS: TfrmcadPESSOAS;

implementation

{$R *.dfm}

uses untDM_RC, mkm_procedures, MainModule, untFrmPesquisa, untFrmTELAGENERICA;
{ TfrmcadPESSOAS }

procedure TfrmcadPESSOAS.btnNewRegClick(Sender: TObject);
begin
  inherited;
  carregaregiao();

end;

procedure TfrmcadPESSOAS.btnOptionsClick(Sender: TObject);
begin
  UniPopupMenudetalhes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmcadPESSOAS.carregaregiao;
begin
  UniDBComboBoxregiao.Clear;
  Tabelaregiao('SELECT descricao FROM regiao WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY codigo');
  dm_rc.fdqryregiao.first;
  while not dm_rc.fdqryregiao.Eof do
    begin
      UniDBComboBoxregiao.Items.Add(dm_rc.fdqryregiao.FindField('DESCRICAO').AsString);
      dm_rc.fdqryregiao.Next;
    end;
end;

procedure TfrmcadPESSOAS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregaregiao();
  inherited;
end;

procedure TfrmcadPESSOAS.R1Click(Sender: TObject);
begin
  mm.varI_Code_Pessoa_historico := FDQryFiltro.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica         := 'HISTORICOFATURAMENTO';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmcadPESSOAS.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('IBGE').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmcadPESSOAS.UniButtonDbEditCEPENTREGAButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CEPENTREGA').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmcadPESSOAS.UniButtonDbEditCEPENTREGAExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditCEPENTREGA.Text <> '') and (UniButtonDbEditCEPENTREGA.Text <> '0') then
        begin
          if SqlPesquisa('select DESCRICAO, UF, CODIIBGE from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEPENTREGA').AsString)) then
            begin
              FDQryCad.FindField('CIDADEENTREGA').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
              FDQryCad.FindField('ESTADOENTREGA').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
              FDQryCad.FindField('IBGEENTREGA').AsString       := dm_rc.sqlBuscas.Findfield('CODIIBGE').asstring;
            end;
        end;
    end;
end;

procedure TfrmcadPESSOAS.UniButtonDbEditcepfaturamentoButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CEPCOBRANCA').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmcadPESSOAS.UniButtonDbEditcepfaturamentoExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcepfaturamento.Text <> '') and (UniButtonDbEditcepfaturamento.Text <> '0') then
        begin
          if SqlPesquisa('select DESCRICAO, UF from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEPCOBRANCA').AsString)) then
            begin
              FDQryCad.FindField('CIDADECOBRANCA').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
              FDQryCad.FindField('ESTADOCOBRANCA').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
            end;
        end;
    end;
end;

procedure TfrmcadPESSOAS.UniButtonDbEditCEPPButtonClick(Sender: TObject);
begin
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

procedure TfrmcadPESSOAS.UniButtonDbEditCEPPExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditCEPP.Text <> '') and (UniButtonDbEditCEPP.Text <> '0') then
        begin
          if SqlPesquisa('select DESCRICAO, UF, CODIIBGE from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEP').AsString)) then
            begin
              FDQryCad.FindField('CIDADE').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
              FDQryCad.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
              FDQryCad.FindField('IBGE').AsString       := dm_rc.sqlBuscas.Findfield('CODIIBGE').asstring;
            end;
        end;
    end;
end;

procedure TfrmcadPESSOAS.UniButtonDbEditcodigocondicaomestreButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('FUNCIONARIO').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

initialization
  RegisterClass(TfrmcadPESSOAS);
end.
