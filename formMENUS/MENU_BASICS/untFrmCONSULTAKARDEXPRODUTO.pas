unit untFrmCONSULTAKARDEXPRODUTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, uniButton, uniBitBtn,
  uniMultiItem, uniComboBox, uniDateTimePicker;

type
  TfrmCONSULTAKARDEXPRODUTO = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpproduto: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditdescricao: TUniEdit;
    UniLabel1: TUniLabel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    dsfiltro: TDataSource;
    FDQryPesquisa: TFDQuery;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniButtonEditpprodutoButtonClick(Sender: TObject);
    procedure UniButtonEditpprodutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  end;

var
  frmCONSULTAKARDEXPRODUTO: TfrmCONSULTAKARDEXPRODUTO;

implementation

{$R *.dfm}

uses untDM_RC, mkm_procedures, MainModule, mkm_func_web, mkm_impressao,
  mkm_relatorios, untFrmPesquisa;

{ TfrmCONSULTAKARDEXPRODUTO }

procedure TfrmCONSULTAKARDEXPRODUTO.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmCONSULTAKARDEXPRODUTO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCONSULTAKARDEXPRODUTO.btnSearchCRUDClick(Sender: TObject);
var
  sql : string;
  SALDO,ENTRADA,SAIDA,SALDOANT :Real;
begin
  inherited;
  if (UniButtonEditpproduto.Text  = '' ) or
     (UniButtonEditpproduto.Text  = '0') then
  begin
    dm_rc.rc_ShowSweetAlert( 'Ok', 'INFORME UM PRODUTO' , 'error' , false );
    abort
  end;

  SALDO    := 0;
  ENTRADA  := 0;
  SAIDA    := 0;
  SALDOANT := 0;

  dm_rc.memkardexkproduto.Close;
  dm_rc.memkardexkproduto.Open;

  sql := ESCRITA_KARDEXPRODUTO(mm.varI_Code_Company,
                              StrToInt(UniButtonEditpproduto.Text),
                              cbxSearchCRUDFieldordem.ItemIndex,
                              edSearchCRUDDtIni.Text,
                              edSearchCRUDDtEnd.Text);
  SqlPesquisa(sql);
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.RecNo = 1 then
        begin
          dm_rc.memkardexkproduto.append;
          dm_rc.memkardexkproduto.FindField('NOME').AsString := ' SALDO ANTERIOR -> ';
          dm_rc.memkardexkproduto.FindField('SALDO').AsFloat := SaldoProdutoKardex_Nota(MM.varI_Code_Company,
                                                                strtoint(UniButtonEditpproduto.Text),
                                                                edSearchCRUDDtIni.DateTime);
          dm_rc.memkardexkproduto.Post;

          SALDO := dm_rc.memkardexkproduto.FindField('SALDO').AsFloat;
        end;

        begin
          ENTRADA := DM_RC.sqlBuscas.FindField('ENTRADA').AsFloat;
          SAIDA   := DM_RC.sqlBuscas.FindField('SAIDA').AsFloat;
          SALDO   := SALDO + (ENTRADA - SAIDA);

          dm_rc.memkardexkproduto.append;
          dm_rc.memkardexkproduto.FindField('NOME').AsString        := ' SALDO ANTERIOR -> ';
          dm_rc.memkardexkproduto.FindField('NUMERO').AsInteger     := DM_RC.sqlBuscas.FindField('NUMERO').AsInteger;
          dm_rc.memkardexkproduto.FindField('PESSOA').AsInteger     := DM_RC.sqlBuscas.FindField('PESSOA').AsInteger;
          dm_rc.memkardexkproduto.FindField('NOME').AsString        := DM_RC.sqlBuscas.FindField('NOME').AsString;
          dm_rc.memkardexkproduto.FindField('EMISSAO').AsDateTime   := DM_RC.sqlBuscas.FindField('EMISSAO').AsDateTime;
          dm_rc.memkardexkproduto.FindField('SERIE').AsString       := DM_RC.sqlBuscas.FindField('SERIE').AsString;
          dm_rc.memkardexkproduto.FindField('OPERACAO_OP').AsString := DM_RC.sqlBuscas.FindField('OPERACAO_OP').AsString;

          dm_rc.memkardexkproduto.FindField('ENTRADA').AsFloat      := DM_RC.sqlBuscas.FindField('ENTRADA').AsFloat;
          dm_rc.memkardexkproduto.FindField('SAIDA').AsFloat        := DM_RC.sqlBuscas.FindField('SAIDA').AsFloat;
          dm_rc.memkardexkproduto.FindField('SALDO').AsFloat        := SALDO;
          dm_rc.memkardexkproduto.Post;
        end;

      dm_rc.sqlBuscas.Next;
    end;
end;
procedure TfrmCONSULTAKARDEXPRODUTO.UniButtonEditpprodutoButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpproduto.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCONSULTAKARDEXPRODUTO.UniButtonEditpprodutoExit(Sender: TObject);
begin
  inherited;
  UniEditdescricao.Text := Acha_Item('PRODUTOS',UniButtonEditpproduto.Text);
end;

procedure TfrmCONSULTAKARDEXPRODUTO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldordem.ItemIndex := 0;
  edSearchCRUDDtEnd.DateTime        := Date;
end;

initialization
  RegisterClass(TfrmCONSULTAKARDEXPRODUTO);
end.
