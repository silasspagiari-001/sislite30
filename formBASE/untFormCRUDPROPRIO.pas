unit untFormCRUDPROPRIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniGUIClasses, uniEdit, uniLabel, uniScrollBox,
  uniPanel, uniPageControl, uniButton, uniBitBtn, uniHTMLFrame,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMemo;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmCRUDPROPRIO = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    paSearchOp1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    cbxSearchCRUDordem: TUniComboBox;
    UniLabel1: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniComboBoxCRUDordem: TUniComboBox;
    UniLabel2: TUniLabel;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    dscruddetails: TDataSource;
    FDQryCaddetails: TFDQuery;
    UniMemolog: TUniMemo;
    tbdetalhes: TFDMemTable;
    dsdetalhes: TDataSource;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure Exclui();

  procedure MemoGravaLog();
  procedure GravaBatidaitens(const f_mestre:integer);
  procedure CarregaBatidaitens(const f_mestre:integer);
  procedure HabilitaCombobox(status:boolean);

  end;

var
  frmCRUDPROPRIO  : TfrmCRUDPROPRIO;
  state           : string;

implementation

{$R *.dfm}

uses mkm_func_web, MainModule, System.TypInfo, untDM_RC, uniDBEdit,
  mkm_procedures, mkm_funcoes, Vcl.StdCtrls, Vcl.Clipbrd, uniDBComboBox;

{ TfrmCRUDPROPRIO }

procedure TfrmCRUDPROPRIO.ativabusca;
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

procedure TfrmCRUDPROPRIO.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;
end;

procedure TfrmCRUDPROPRIO.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
      Exclui();
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' , false );
      Abort
    end;

    Try
       FDQryCad.Close;

      for i := 0 to  FDQryCad.Params.Count - 1 do
      begin
        Cmp :=  FDQryCad.Params[i].Name;
         FDQryCad.Params[i].Value :=  FDQryFiltro.FieldByName(Cmp).Value ;
      end;
       FDQryCad.Open;
    Except
      abort;
    End;
end;

procedure TfrmCRUDPROPRIO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;
  Try
  {
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;
  }
    FDQryCad.Edit;

    UniPageControlcadastros.ActivePage := UniTabSheetCRUD;
  Except
   Abort ;
  End ;

  HabilitaCombobox(false);

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
      FDQryCaddetails.Edit ;
    end;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;

    end;
end;

procedure TfrmCRUDPROPRIO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);
  mm.FDTransaction.StartTransaction;
  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  HabilitaCombobox(false);

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
    end;

  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

  if not( FDQryCad.Active) then
      FDQryCad.Open;

  FDQryCad.Insert;
  FDQryCad.FindField('CODIGO').AsInteger := 0;

  if not StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('ATIVO').AsString   := 'T';
  //************************************************************************//
  if StrContains('HISTORICO',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('TIPO').AsString := 'Entrada';
  //************************************************************************//
  //************************************************************************//
  if StrContains('CONDICOES',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('ENTRADA_SAIDA').AsInteger := 0;
  //************************************************************************//
  //************************************************************************//
  if StrContains('ESCRITAS',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('TIPO').AsString := 'DENTRO';
  //************************************************************************//
  //************************************************************************//
  if StrContains('CENTROCUSTO',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('SITUACAO').AsString := 'Entrada';
  //************************************************************************//
  //************************************************************************//
  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('TIPO').AsString     := 'Entrada';
      FDQryCad.FindField('DESTINO').AsString  := 'Contabil';
      FDQryCad.FindField('CUSTO').AsString    := 'Fixo';
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('DOCUMENTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('NUMERO').AsInteger      := 0;
      FDQryCad.FindField('DOCUMENTO').AsInteger   := 0;
      FDQryCad.FindField('OPERACAO').AsInteger    := 0;
      FDQryCad.FindField('PESSOA').AsInteger      := 0;
      FDQryCad.FindField('CONDICAO').AsInteger    := 0;
      FDQryCad.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('APLICACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('SITUACAO').AsString      := 'Receita';
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('ESCRITA').AsInteger       := 0;
      FDQryCad.FindField('SUBSTITUICAO').AsInteger  := 0;
      FDQryCad.FindField('TIPO').AsString           := 'Normal';
      FDQryCad.FindField('OPERACAO_OP').AsString    := 'Vendas';
      FDQryCad.FindField('ENTRADA_SAIDA').AsInteger := 0;
      FDQryCad.FindField('FINANCEIRO').AsInteger    := 0;
      FDQryCad.FindField('ESTOQUE').AsInteger       := 0;
      FDQryCad.FindField('UNICA').AsInteger         := 0;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('TOLERANCIA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('AMOSTRA_MEDIA').AsFloat        := 0;
      FDQryCad.FindField('AMOSTRA_DOSN_MIN').AsFloat     := 0.0;
      FDQryCad.FindField('AMOSTRA_DOSN_MAX').AsFloat     := 0.00;
      FDQryCad.FindField('AMOSTRA_PUREZA_MIN').AsFloat   := 0.00;
      FDQryCad.FindField('AMOSTRA_PUREZA_MAX').AsFloat   := 0.00;
      FDQryCad.FindField('ESPECIE').AsInteger            := 0;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('GRUPO').AsInteger := 0;
  //************************************************************************//
  //************************************************************************//
  if StrContains('PESSOAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('CADASTRO').AsDateTime  := Date;
      FDQryCad.FindField('IBGEENTREGA').AsString := '1050';
    end;
  //************************************************************************//
  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
//      FDQryCad.FindField('CODIMP').AsInteger     := mm.varI_Code_Company;
      FDQryCad.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
    end;
  //************************************************************************//
  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('CODIGO_ESPECIE').AsInteger     := 0;
      FDQryCad.FindField('CODIGO_CULTIVAR').AsInteger    := 0;
      FDQryCad.FindField('PESOBRUTO').AsFloat            := 0;
      FDQryCad.FindField('PESOLIQUIDO').AsFloat          := 0;
      FDQryCad.FindField('ALIQUOTAIPI').AsFloat          := 0;
      FDQryCad.FindField('GRUPO').AsInteger              := 0;
      FDQryCad.FindField('UNIDADE').AsString             := 'UN';

      FDQryCaddetails.Insert;
      FDQryCaddetails.FindField('SITUACAOLOCAL').AsString    := '0103';
      FDQryCaddetails.FindField('SITUACAOOUTRAS').AsString   := '0103';

      FDQryCaddetails.FindField('BASE0').AsFloat             := 0.00;
      FDQryCaddetails.FindField('BASE1').AsFloat             := 0.00;
      FDQryCaddetails.FindField('BASE2').AsFloat             := 0.00;

      FDQryCaddetails.FindField('ICMS0').AsFloat             := 18;
      FDQryCaddetails.FindField('ICMS1').AsFloat             := 7;
      FDQryCaddetails.FindField('ICMS2').AsFloat             := 12;

      FDQryCaddetails.FindField('PIS').asstring              := '01';
      FDQryCaddetails.FindField('COFINS').asstring           := '01';
      FDQryCaddetails.FindField('VLRPIS').AsFloat            := 0.00;
      FDQryCaddetails.FindField('VLRCOFINS').AsFloat         := 0.00;

      FDQryCaddetails.FindField('CUSTO').AsFloat             := 0.0000;
      FDQryCaddetails.FindField('COMPRA').AsFloat            := 0.0000;
      FDQryCaddetails.FindField('VENDA').AsFloat             := 0.00;
      FDQryCaddetails.FindField('MARGEM').AsFloat            := 0.000;

    end;
  //************************************************************************//
  if StrContains('EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('IBGE').AsString        := '1050';
      FDQryCad.FindField('PAIS').AsString        := 'BRASIL';
    end;
  //************************************************************************//
  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('DATA').AsDateTime      := Date;
      FDQryCad.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
      FDQryCad.FindField('SERIE').AsString       := 'EST';
      FDQryCad.FindField('CANCELADA').AsString   := '';
      FDQryCad.FindField('SEQUENCIA').AsInteger  := 1;
      FDQryCad.FindField('DOCUMENTO').AsInteger  := 30;
      FDQryCad.FindField('NUMERO').AsInteger     := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);
    end;
  //************************************************************************//
  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;
      FDQryCad.FindField('LABORATORIO').AsInteger  := 1;
      FDQryCad.FindField('REMETENTE').AsInteger    := 1;
      FDQryCad.FindField('RESPONSAVEL').AsInteger  := 1;
      FDQryCad.FindField('TIPO').AsString          := 'Fiscal';

      FDQryCad.FindField('ANALISEPURA').AsFloat    := 0.00;
      FDQryCad.FindField('MATINERTES').AsFloat     := 0.00;
      FDQryCad.FindField('PESOEMBALAGEM').AsFloat  := 0;
    end;
  //************************************************************************//
  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime     := Date;
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;
      FDQryCad.FindField('NUMERO').AsInteger       := 0;
      FDQryCad.FindField('PU').AsFloat             := 0.00;
      FDQryCad.FindField('QUANTIDADE').AsFloat     := 0.00;

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;

    end;
end;

procedure TfrmCRUDPROPRIO.btnSaveRegClick(Sender: TObject);

begin
  inherited;
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('NUMERO').AsInteger := Ultimo_Numero(mm.varI_Code_Company,300,'GRAVAR');

           if not StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);

           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
         end;

       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;
       mm.FDTransaction.CommitRetaining;
       MM.FDTransaction.Commit;

       if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
         begin

           if FDQryCaddetails.State in [dsInsert] then
             begin
               FDQryCaddetails.FindField('KEY').AsString      := Gera_Guid;
               FDQryCaddetails.FindField('EMPRESA').AsInteger := MM.varI_Code_Company;
               FDQryCaddetails.FindField('PRODUTO').AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
             end;
           FDQryCaddetails.Post;

           if FDQryCaddetails.State in [dsInsert] then
             begin
               if SqlPesquisa('selet * from empresas where codigo <> ' + IntToStr(MM.varI_Code_Company)) then
                 begin
                   dm_rc.sqlBuscas.First;
                   while not dm_rc.sqlBuscas.Eof do
                     begin

                       dm_rc.sqlBuscas.Append;
                       dm_rc.sqlBuscas.FindField('KEY').AsString            := Gera_Guid;
                       dm_rc.sqlBuscas.FindField('EMPRESA').AsInteger       := MM.varI_Code_Company;
                       dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger       := FDQryCad.FindField('CODIGO').AsInteger;

                       dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString  := FDQryCaddetails.FindField('SITUACAOLOCAL').AsString;
                       dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString := FDQryCaddetails.FindField('SITUACAOOUTRAS').AsString;
                       dm_rc.sqlBuscas.FindField('PIS').AsString            := FDQryCaddetails.FindField('PIS').AsString;
                       dm_rc.sqlBuscas.FindField('COFINS').AsString         := FDQryCaddetails.FindField('COFINS').AsString;

                       dm_rc.sqlBuscas.FindField('BASE0').AsFloat           := FDQryCaddetails.FindField('BASE0').AsFloat;
                       dm_rc.sqlBuscas.FindField('BASE1').AsFloat           := FDQryCaddetails.FindField('BASE1').AsFloat;
                       dm_rc.sqlBuscas.FindField('BASE2').AsFloat           := FDQryCaddetails.FindField('BASE2').AsFloat;
                       dm_rc.sqlBuscas.FindField('ICMS0').AsFloat           := FDQryCaddetails.FindField('ICMS0').AsFloat;
                       dm_rc.sqlBuscas.FindField('ICMS1').AsFloat           := FDQryCaddetails.FindField('ICMS1').AsFloat;
                       dm_rc.sqlBuscas.FindField('ICMS2').AsFloat           := FDQryCaddetails.FindField('ICMS2').AsFloat;

                       dm_rc.sqlBuscas.FindField('VLRPIS').AsFloat          := FDQryCaddetails.FindField('VLRPIS').AsFloat;
                       dm_rc.sqlBuscas.FindField('VLRCOFINS').AsFloat       := FDQryCaddetails.FindField('VLRCOFINS').AsFloat;

                       dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat     := FDQryCaddetails.FindField('PESOLIQUIDO').AsFloat;
                       dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat       := FDQryCaddetails.FindField('PESOBRUTO').AsFloat;


                       dm_rc.sqlBuscas.Post;

                       dm_rc.sqlBuscas.Next;
                     end;
                 end;
             end;
         end;

       try
         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  FDQryCad.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  FDQryCad.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
         pgBaseCadControl.ActivePage := tabSearch;
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;

     End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  HabilitaCombobox(True);

end;

procedure TfrmCRUDPROPRIO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCRUDPROPRIO.btnSearchCRUDClick(Sender: TObject);
var i                 : integer;
  select,where, ativo : string;
  M_STR,
  M_STRSITUACAO   : TStringList;
begin
  inherited;

  if StrContains('MENUSISTEMA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;MENU;TABELA',';')
    end;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NUMERO;PRODUTO;LOTE',';')
    end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;CODIGOREFERENCIA;DESCRICAO',';')
    end;

  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('LOTE;BOLETIM;TERMO;CULTIVAR;PRODUTO',';')
    end;

  if StrContains('PESSOAS#TRANSPORTES#EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;FANTASIA;CPFCNPJ;ENDERECO;CIDADE;ESTADO',';')
    end;

  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME',';')
    end;

  if StrContains('LABORATORIO#RESPONSAVEL',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;CIDADE;ESTADO',';')
    end;


  if StrContains('CATEGORIA#PENEIRA#PRAGAS#BALANCAS#HISTORICO#CARTEIRA#CONDICOES#ESCRITAS#PARAMETROSOPERACAO#PORTADORES#REGIAO#MEDIDAS#'+
                 'CENTROCUSTO#DOCUMENTOS#APLICACAO#GRUPOS#GERMINADOR#GRUPOSESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO',';')
    end;

  if StrContains('PROBABILIDADE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;BASE;MEDIA',';')
    end;

  if StrContains('INDICATIVO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO',';')
    end;


  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO;REFERENCIA',';')
    end;


  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;SEMENTENOME;POPULAR',';')
    end;

  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;PLANO;DESCRICAO',';')
    end;

  if StrContains('CULTIVAR',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;CULTIVAR',';')
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NUMERO;PRODUTO;DESCRICAO',';')
    end;

  // Abre a query do filtro
  if  FDQryCad.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlertSimple('Tabela esta em EDIÇÃO');
       abort ;
     end;

  FDQryFiltro.Close;

  case UniComboBoxCRUDordem.ItemIndex of
    0 : ativo := ' and ativo = ' + QuotedStr('T');
    1 : ativo := ' and ativo = ' + QuotedStr('F');
    2 : ativo := '';
  end;

  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]     +
                ' starting with                      ' + QuotedStr(edSearchCRUDconteudo.Text)    +
                variif(StrContains('PRODUTO#LOTE',M_STR[cbxSearchCRUDordem.ItemIndex]),
                ' order by '+M_STR[cbxSearchCRUDordem.ItemIndex]+', disponivel ',
                ' order by                                      ' + M_STR[cbxSearchCRUDordem.ItemIndex]);
    end
  else
  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;


      where  := ' where     ' + M_STR[cbxSearchCRUDordem.ItemIndex]      +
                ' like      ' + QuotedStr('%' + edSearchCRUDconteudo.Text+'%') +
                ' order by  ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr(edSearchCRUDconteudo.Text+'%')    +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]               +
                ' like                               ' + QuotedStr('%' + edSearchCRUDconteudo.Text+'%')    + ativo +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end;

  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text := select+where;
  FDQryFiltro.Open();

  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

function TfrmCRUDPROPRIO.CamposValidados: Boolean;
var
  i,e :Integer;
  Campos :TStrings;
begin
  Try
    Campos := TStringList.Create;
    Campos.Clear ;
    e := 0 ;
    for I:= 0 to ComponentCount -1 do
       begin
         if ( Components[I] is TUniDBEdit )  then
            begin

               If ( TUniDBEdit(Components[i]).Tag = 1 ) then
                 Begin
                   if TUniDBEdit(Components[i]).Text = '' then
                      begin
                        Campos.Add('-' + TUniDBEdit(Components[i]).Field.DisplayName ) ;
                        inc(e) ;
                      end;
                 End;
            end;
       end;

     if e = 0  then
        result := true ;

     If e > 0 then
        Begin
           Campos.Insert(0,'Preencha os campos obrigatórios:');
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' , false );
           FDQryCad.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmCRUDPROPRIO.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  pgBaseCadControl.ActivePage := tabRegister;

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp                       :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
    end;


  if not( FDQryCad.Active) then
    begin
      FDQryCad.Open;
    end;

  pgBaseCadControl.ActivePage        := tabRegister;
  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

end;

Procedure TfrmCRUDPROPRIO.Exclui;
var
  codigotable : integer;
  batpro, batlote, batboletim, battermo:string;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;

  FDQryCad.Delete;

  try
    if  FDQryFiltro.Active then
      FDQryFiltro.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            FDQryCad.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Delete;
    end;

end;

procedure TfrmCRUDPROPRIO.GravaBatidaitens(const f_mestre: integer);
var
  mEQV : Real;
  tot  : Real;
begin
  executasql       ('delete from batidaitens where mestre   = ' + IntToStr(f_mestre));
  TabelaBatidaItens('select * from batidaitens where mestre = ' + IntToStr(f_mestre));

  tot := 0;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('PRODUTO').AsInteger > 0 then
        begin
          mEQV                                        := 0;
          mEQV                                        := ((tbdetalhes.FindField('QUANTIDADE').AsFloat / FDQryCad.FindField('QUANTIDADE').AsFloat)* 100);

          tbdetalhes.edit;
          tbdetalhes.FindField('EQUIVALENTE').AsFloat :=  MRound(mEQV,2);
          tbdetalhes.post;

          tot := tot + tbdetalhes.FindField('QUANTIDADE').AsFloat;
        end;

      tbdetalhes.Next
    end;

  tbdetalhes.First;
  tbdetalhes.Insert;
  tbdetalhes.FindField('PRODUTO').AsInteger   := FDQryCad.FindField('PRODUTO').AsInteger;
  tbdetalhes.FindField('DESCRICAO').AsString  := FDQryCad.FindField('DESCRICAO').AsString;
  tbdetalhes.FindField('QUANTIDADE').AsFloat  := FDQryCad.FindField('QUANTIDADE').AsFloat  - tot;
  tbdetalhes.FindField('EQUIVALENTE').AsFloat := MRound((tbdetalhes.FindField('QUANTIDADE').AsFloat/FDQryCad.FindField('QUANTIDADE').AsFloat * 100),2);
  tbdetalhes.FindField('TIPO').AsString       := 'Sementes';
  tbdetalhes.post;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.fdqrybatidaitens.Append;
          dm_rc.fdqrybatidaitens.FindField('CODIGO').AsInteger       := Ultimo_Codigo('BATIDAITENS','CODIGO',True);
          dm_rc.fdqrybatidaitens.FindField('SEQUENCIA').AsInteger    := tbdetalhes.FindField('SEQUENCIA').AsInteger;
          dm_rc.fdqrybatidaitens.FindField('PRODUTO').AsInteger      := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrybatidaitens.FindField('DESCRICAO').AsString     := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.fdqrybatidaitens.FindField('QUANTIDADE').AsFloat     := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('EQUIVALENCIA').AsFloat   := tbdetalhes.FindField('EQUIVALENTE').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('CUSTO_UNITARIO').AsFloat := tbdetalhes.FindField('CUSTO_UNITARIO').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('TIPO').AsString          := tbdetalhes.FindField('TIPO').AsString;
          dm_rc.fdqrybatidaitens.FindField('MESTRE').AsInteger       := f_mestre;
          dm_rc.fdqrybatidaitens.FindField('KEY').AsString           := Gera_Guid();
          dm_rc.fdqrybatidaitens.Post;
        end;

      tbdetalhes.Next;
    end;

end;
procedure TfrmCRUDPROPRIO.HabilitaCombobox(status: boolean);
var
  e,i:integer;
begin
  e := 0 ;
  for I:= 0 to ComponentCount -1 do
     begin
       if ( Components[I] is TUniDBComboBox )  then
         begin
           TUniDBEdit(Components[i]).ReadOnly := status;
         end;
     end;
end;

procedure TfrmCRUDPROPRIO.CarregaBatidaitens(const f_mestre: integer);
begin
  if TabelaBatidaItens('select * from batidaitens where mestre = ' + IntToStr(f_mestre) + ' order by sequencia') then
    begin
      tbdetalhes.Close;
      tbdetalhes.Open;

      dm_rc.fdqrybatidaitens.First;
      while not dm_rc.fdqrybatidaitens.Eof do
        begin
          tbdetalhes.Append;
          tbdetalhes.FindField('PRODUTO').AsInteger        := dm_rc.fdqrybatidaitens.FindField('PRODUTO').AsInteger;
          tbdetalhes.FindField('DESCRICAO').AsString       := dm_rc.fdqrybatidaitens.FindField('DESCRICAO').AsString;
          tbdetalhes.FindField('SEQUENCIA').AsInteger      := dm_rc.fdqrybatidaitens.FindField('SEQUENCIA').AsInteger;
          tbdetalhes.FindField('QUANTIDADE').AsFloat       := dm_rc.fdqrybatidaitens.FindField('QUANTIDADE').AsFloat;
          tbdetalhes.FindField('EQUIVALENTE').AsFloat      := dm_rc.fdqrybatidaitens.FindField('EQUIVALENCIA').AsFloat;
          tbdetalhes.FindField('CUSTO_UNITARIO').AsFloat   := dm_rc.fdqrybatidaitens.FindField('CUSTO_UNITARIO').AsFloat;
          tbdetalhes.FindField('TIPO').AsString            := dm_rc.fdqrybatidaitens.FindField('TIPO').AsString;
          tbdetalhes.Post;
          dm_rc.fdqrybatidaitens.Next;
        end;
      tbdetalhes.First;
    end;

end;
procedure TfrmCRUDPROPRIO.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (FDQryCad.FieldCount - 1) do
    UniMemolog.Lines.Add(FDQryCad.Fields[i].DisplayName + ':' + FDQryCad.Fields[i].DisplayText);
end;

procedure TfrmCRUDPROPRIO.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;

end;

procedure TfrmCRUDPROPRIO.UniFrameCreate(Sender: TObject);
begin
  inherited;

  cbxSearchCRUDordem.Clear;
  UniComboBoxCRUDordem.Clear;
  UniComboBoxCRUDordem.Items.Add('Ativo');
  UniComboBoxCRUDordem.Items.Add('Inativo');
  UniComboBoxCRUDordem.Items.Add('Todos');
  UniComboBoxCRUDordem.ItemIndex := 0;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('PESSOAS#TRANSPORTES#EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('FANTASIA');
      cbxSearchCRUDordem.Items.Add('CPF/CNPJ');
      cbxSearchCRUDordem.Items.Add('ENDEREÇO');
      cbxSearchCRUDordem.Items.Add('CIDADE');
      cbxSearchCRUDordem.Items.Add('ESTADO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO SISTEMA');
      cbxSearchCRUDordem.Items.Add('CÓDIGO REF.');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;


  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('BOLETIM');
      cbxSearchCRUDordem.Items.Add('TERMO');
      cbxSearchCRUDordem.Items.Add('CULTIVAR');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.ItemIndex := 0;
    end;


  if StrContains('LABORATORIO#RESPONSAVEL',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('CIDADE');
      cbxSearchCRUDordem.Items.Add('ESTADO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('INDICATIVO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRICAO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PROBABILIDADE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('BASE');
      cbxSearchCRUDordem.Items.Add('MEDIA');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.Items.Add('REFERÊNCIA');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('PLANO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;


  if StrContains('CATEGORIA#PENEIRA#PRAGAS#BALANCAS#HISTORICO#CARTEIRA#CONDICOES#ESCRITAS#PARAMETROSOPERACAO#PORTADORES#REGIAO#MEDIDAS#CENTROCUSTO#'+
                 'DOCUMENTOS#APLICACAO#GRUPOS#GERMINADOR#GRUPOSESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME ESPECIE');
      cbxSearchCRUDordem.Items.Add('POPULAR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('CULTIVAR',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('CULTIVAR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO PRODUTO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('MENUSISTEMA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CODIGO');
      cbxSearchCRUDordem.Items.Add('MENU');
      cbxSearchCRUDordem.Items.Add('TABELA');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  HabilitaCombobox(True);

  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

end.
