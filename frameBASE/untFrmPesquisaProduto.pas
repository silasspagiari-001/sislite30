unit untFrmPesquisaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Clipbrd,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTimer, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniLabel, uniEdit,
  uniPanel;

type
  Tfrmpesquisaproduto = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    edSearchCRUDconteudo: TUniEdit;
    UniLabelv1: TUniLabel;
    cbxSearchCRUDFieldtipo: TUniComboBox;
    rcBlock40: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    paTotreg: TUniContainerPanel;
    labTotReg: TUniLabel;
    rcBlock20: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    timerClose: TUniTimer;
    cbxordempesquisa: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

    procedure Seta_Grid(F_DATASOURCE:TDataSource;F_CAMPOS:array of String);
  end;

function frmpesquisaproduto: Tfrmpesquisaproduto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_anim, untDM_RC, mkm_func_web, uconsts;

function frmpesquisaproduto: Tfrmpesquisaproduto;
begin
  Result := Tfrmpesquisaproduto(mm.GetFormInstance(Tfrmpesquisaproduto));
end;

procedure Tfrmpesquisaproduto.btnLkpSearchClick(Sender: TObject);
var
  M_STR      : TStringList;
  M_SQL,
  M_TIPOPRO  : string;

begin
  if StrContains('PRODUTOS#COMPOSICAO',mm.varC_referencia_busca) then
    begin
      M_STR:=Explode('CODIGO;CODIGOREFERENCIA;DESCRICAO',';');

      case cbxSearchCRUDFieldtipo.ItemIndex of
        0 : M_TIPOPRO := ' AND P.TIPO = ' + QuotedStr('Produto Acabado');
        1 : M_TIPOPRO := ' AND P.TIPO = ' + QuotedStr('Materia Prima');
        2 : M_TIPOPRO := ' AND P.TIPO = ' + QuotedStr('Outros');
        3 : M_TIPOPRO := '';
      end;

      M_SQL:=' SELECT P.CODIGO,P.CODIGOREFERENCIA,P.DESCRICAO,P.ALTURA, P.LARGURA, P.COMPRIMENTO, SALDOS.VENDA FROM PRODUTOS P '                             +
             ' INNER JOIN SALDOS ON (P.CODIGO = SALDOS.PRODUTO)         '                             +
             ' WHERE                               P.' + M_STR[cbxordempesquisa.ItemIndex]            +
             ' like                                  ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')  + M_TIPOPRO +
             ' ORDER BY                            P.' + M_STR[cbxordempesquisa.ItemIndex];
    end;

//  Clipboard.AsText := M_SQL;
  dm_rc.sqlPesquisa.Close;
  dm_rc.sqlPesquisa.SQL.Clear;
  dm_rc.sqlPesquisa.sql.add(M_SQL);
  dm_rc.sqlPesquisa.Open;

  labTotReg.Caption := IntToStr(dm_rc.sqlpesquisa.RecordCount) + ' Registro(s) Encontrado(s).'
end;

procedure Tfrmpesquisaproduto.dbgSearchCRUDDblClick(Sender: TObject);
begin
  mm.varC_codigo_busca := IntToStr(dm_rc.sqlpesquisa.FindField('CODIGO').AsInteger);

  ModalResult := mrOK;

  dm_rc.sqlpesquisa.Close;
  timerClose.Enabled := true;
  rc_MoveAnimationForm( self,
                       self.left,
                       self.left,
                       self.top,
                       -self.Height,
                       400,
                       0 ) ;
end;

procedure Tfrmpesquisaproduto.Seta_Grid(F_DATASOURCE: TDataSource;F_CAMPOS: array of String);
var
  M_PARAMS:TStringList;
  R       :Integer;
begin
  try
    dbgSearchCRUD.DataSource := F_DATASOURCE;
    for R:=0 to High(F_CAMPOS) do
      begin
        M_PARAMS := Explode(F_CAMPOS[R],'|');
        dbgSearchCRUD.Columns.Add;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Visible         := True;
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].FieldName       := M_PARAMS[1];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Title.Caption   := M_PARAMS[2];
        dbgSearchCRUD.Columns[StrToInt(M_PARAMS[0])].Width           := StrToInt(M_PARAMS[3]);

        FreeAndNil(M_PARAMS);
      end;
  finally
    FreeAndNil(M_PARAMS);
  end;
end;

procedure Tfrmpesquisaproduto.UniFormCreate(Sender: TObject);
var
   i : integer;
begin
  // sort
  dbgSearchCRUD.ClientEvents.UniEvents.Add(
       'store.afterCreate=function store.afterCreate(sender)' +
       '{ sender.setRemoteSort(false);﻿ }'
  );
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                 end;
       ltzn_CH : begin

                 end;
       ltin_ID : begin

                 end;
       ltth_TH : begin

                 end;
       lthi_IN : begin

                 end;
       ltar_SA    : begin

                 end;
  end;

  cFormModal := mm.varC_Form_Modal;
  dbgSearchCRUD.Columns.Clear;

  if StrContains('PRODUTOS#COMPOSICAO',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldtipo.Clear;
    cbxSearchCRUDFieldtipo.Items.Add('Produto Acabado');
    cbxSearchCRUDFieldtipo.Items.Add('Materia Prima');
    cbxSearchCRUDFieldtipo.Items.Add('Outros');
    cbxSearchCRUDFieldtipo.ItemIndex := 0;

    cbxordempesquisa.Clear;
    cbxordempesquisa.Items.Add('Codigo');
    cbxordempesquisa.Items.Add('Codigo Ref');
    cbxordempesquisa.Items.Add('Descrição');
    cbxordempesquisa.ItemIndex := 2;

    if StrContains('COMPOSICAO',mm.varC_referencia_busca) then
      begin
        cbxSearchCRUDFieldtipo.ItemIndex := 1;
        cbxordempesquisa.ItemIndex       := 1;
      end;


    Seta_Grid(dm_rc.dsSqlPesquisa,['0|CODIGOREFERENCIA|CODIGO REF.|100','1|CODIGO|CODIGO|50','2|DESCRICAO|DESCRICAO|300','3|ALTURA|ALT|50','4|LARGURA|LARG|50','5|COMPRIMENTO|COMP|50','6|VENDA|VENDA|100']);
  end;
end;

procedure Tfrmpesquisaproduto.UniFormDestroy(Sender: TObject);
begin
  dm_rc.sqlPesquisa.Close;
    mm.varC_Form_Modal := nil;
end;

procedure Tfrmpesquisaproduto.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure Tfrmpesquisaproduto.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

end.
