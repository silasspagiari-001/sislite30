unit mkm_procedures;

interface

uses
  untDM_RC, FireDAC.Comp.Client, REST.Client, System.JSON, REST.Types,
  uMsgInfo;

function  Ultimo_Codigo(Const F_TABELA,F_CONTROLE:String; Status:Boolean): integer;
function  Ultimo_Numero(Const F_EMPRESA,F_DOCUMENTO:integer;F_SITUACAO:string): integer;
function  Gera_Amostra(const F_DATA: TDateTime): string;
function  gera_log(Frase:String):boolean;
function  Acha_Item(Const F_TABELA,F_CODIGO:String): String;
function  SqlPesquisa(Const F_SQL:String):Boolean;
function  SqlPesquisaPrimeira(Const F_SQL:String):Boolean;
function  SqlPesquisaSecundaria(Const F_SQL:String):Boolean;

function  executasql(Const F_SQL:String):Boolean;
function  SqlProdutos(Const F_SQL:String):Boolean;
procedure Calcula_SaldoProduto (const pempresa,pproduto:integer);

function  TabelaMvitens(Const F_SQL:String):Boolean;
function  TabelaReceber(Const F_SQL:String):Boolean;
function  TabelaEmpresas(Const F_SQL:String):Boolean;
function  TabelaOperacao(Const F_SQL:String):Boolean;
function  TabelaPessoas(Const F_SQL:String):Boolean;
function  TabelaDocumentos(Const F_SQL:String):Boolean;
function  TabelaMvmestre(Const F_SQL:String):Boolean;
function  TabelaTransporte(Const F_SQL:String):Boolean;
function  TabelaMedidas(Const F_SQL:String):Boolean;
function  TabelaTitulos(Const F_SQL:String): boolean;
function  TabelaPermissao(Const F_SQL:String):Boolean;
function  TabelaUsuarios(Const F_SQL:String):Boolean;
function  TabelaFonecedor(Const F_SQL:String): boolean;
function  TabelaPortadores(Const F_SQL:String): boolean;

function  TabelaProtocolo(Const F_SQL:String):Boolean;
function  TabelaAnalise(Const F_SQL:String):Boolean;
function  TabelaAnaliseItens(Const F_SQL:String):Boolean;
function  TabelaPMS(Const F_SQL:String):Boolean;
function  TabelaEspecie(Const F_SQL:String):Boolean;
function  TabelaCultivar(Const F_SQL:String):Boolean;
function  TabelaCategoria(Const F_SQL:String):Boolean;
function  TabelaPeneira(Const F_SQL:String):Boolean;
function  TabelaResponsavel(Const F_SQL:String):Boolean;
function  TabelaGerminacao(Const F_SQL:String):Boolean;
function  TabelaRTCliente(Const F_SQL:String):Boolean;
function  TabelaRTLaboratorio(Const F_SQL:String):Boolean;
function  TabelaRegiao(Const F_SQL:String):Boolean;
function  TabelaSementes(Const F_SQL:String):Boolean;
function  TabelaLaboratorio(Const F_SQL:String):Boolean;
function  TabelaProdutos(Const F_SQL:String):Boolean;
function  TabelaEscritas(Const F_SQL:String):Boolean;
function  TabelaPontos(Const F_SQL:String):Boolean;
function  TabelaEventoXML(Const F_SQL:String):Boolean;
function  TabelaBatidaItens(Const F_SQL:String):Boolean;
function  TabelaBatidaMestre(Const F_SQL:String):Boolean;
function  TabelaMfmestre(Const F_SQL:String):Boolean;
function  TabelaMfitens(Const F_SQL:String):Boolean;
function  TabelaComposicaoitens(Const F_SQL:String):Boolean;
function  TabelaComposicao(Const F_SQL:String):Boolean;
function  TabelaSaldos(Const F_SQL:String):Boolean;
function  TabelaAgrupaFinanceiro(Const F_SQL:String):Boolean;

function  Saldo_Banco_Atual(const F_DATA : TDateTime;F_EMPRESA:integer) : Real;
function  Calcula_AntCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
function  Calcula_AntPlano(const F_EMPRESA: Integer; F_PLANO: string; F_DATA: TDate): Real;
function  Calcula_SaldoAtualCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
function  Sequencia_Caixa(const F_DATA : TDateTime; F_PORTADOR :integer): Integer;
function  SqlPesquisaGerais(Const F_SQL:String):TFDQuery;
function  VerificaProtocolo(Const F_PROTOCOLO:Integer;tipo:string):string;
function  VerificaDevolucao(const F_OPERACAO :Integer):string;
function  Verifica_Permissao(const P_EMPRESA,P_FUNCIONARIO:Integer;P_TABELA,P_TIPO:string):string;
function  Sequencia_Menusisterma(const P_MENU:string):Integer;
function  HttpGet(get:string):string;
function  Caminho(Retornar:String):String;
procedure VerificarEAdicionarCampo(Connection: TFDConnection; const Tabela, Campo, ScriptDDL: string);
procedure verificaatualizacao();

procedure Calcula_Lote(const F_EMPRESA,F_PRODUTO:integer;F_LOTE,F_BOLETIM,F_TERMO,F_TIPO:string);
function  SaldoProdutoKardex_Nota (const rempresa,rproduto:integer;datafin:TDateTime):Real;

function HttpGetMSG(get: string): TMsgInfo;
function ConfirmaCienciaFinanceiro(pCodigo: Integer; pContrato, pUsuario: string): Boolean;
function HttpGetFinanceiro(get: string): TAvisoFinanceiroInfo;
function  ConfirmaLeituraMensagem(pCodigo: Integer; pCnpj, pUsuario: string): Boolean;

implementation

uses
  System.SysUtils, Vcl.Forms, mkm_func_web, MainModule, Data.DB, mkm_funcoes;

var
  query : TFDQuery;
  M_SQL : string;

function Ultimo_Numero(Const F_EMPRESA,F_DOCUMENTO:integer;F_SITUACAO:string): integer;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                                                ' +
             ' declare variable P_NUMERO integer;                                                                            ' +
             ' declare variable P_SITUACAO varchar(10);                                                                      ' +
             ' begin                                                                                                         ' +
             ' P_SITUACAO = ' + QuotedStr('GRAVAR')                                                                     + ' ;' +
             '   for select numero from documentos where documento = ' + IntToStr(F_DOCUMENTO) + ' and empresa = ' + IntToStr(F_EMPRESA) + ' into :p_numero do    ' +
             '     begin                                                                                                     ' +
             '       p_numero  = p_numero + 1;                                                                               ' +
             '       p_retorno = p_numero;                                                                                   ' +
             '        if (p_situacao = ' + QuotedStr(F_SITUACAO) +') then                                                    ' +
             '          begin                                                                                                ' +
             '            update documentos set numero = :p_numero where empresa = ' + IntToStr(F_EMPRESA) + ' and documento = ' + IntToStr(F_DOCUMENTO) +';     ' +
             '          end                                                                                                  ' +
             '     end                                                                                                       ' +
             '   suspend;                                                                                                    ' +
             ' end                                                                                                           ' ;

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  Result := Query.FindField('P_RETORNO').AsInteger;
  FreeAndNil(query);
end;

function Ultimo_Codigo(Const F_TABELA,F_CONTROLE:String; Status:Boolean): integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    if Status = False then
      M_SQL :=    'select max(' + F_CONTROLE + ') as ULTIMO from ' + F_TABELA
    else
      M_SQL :=    'execute block returns (ULTIMO integer) as      ' +
                  'declare variable incremento integer;           ' +
                  'declare variable ultima_gen integer;           ' +
                  'declare variable v_contador integer;           ' +
                  'declare variable altera_gen varchar(100);      ' +
                  'begin                                          ' +
                  '  incremento = gen_id(GEN_'+F_TABELA+'_ID, 1); ' +
                  '  ultima_gen = incremento;                     ' +
                  '  v_contador = 1;                              ' +
                  '  while (exists(select * from                  ' + F_TABELA   + ' where ' + F_CONTROLE + ' =  :v_contador)) do ' +
                  '    begin                                      ' +
                  '      v_contador = v_contador + 1;             ' +
                  '    end                                        ' +
                  '  if (v_contador = incremento) then            ' +
                  '    ULTIMO = incremento;                       ' +
                  '  else                                         ' +
                  '    ULTIMO = v_contador;                       ' +
                  '  suspend;                                     ' +
                  'end                                            ';

    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except
      on e: exception do gera_log(e.message);
    end;
  finally
    if Status = False then
      result :=  Query.FindField('ULTIMO').AsInteger + 1
    else
      result :=  Query.FindField('ULTIMO').AsInteger;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Acha_Item(Const F_TABELA,F_CODIGO:String): String;
var
  M_DESCRICAO : string;
  M_CONTROLE  : String;
begin
  if StrContains('PLANOCONTAS',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'PLANO';
    end
  else
  if StrContains('PRODUTOS#CARTEIRA#APLICACAO#PORTADORES#OPERACOES#HISTORICO#GRUPOS#CARTAO#HISTORICO#CENTROCUSTO#INDICATIVO',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('SAFRA#PORTADOR#CARTEIRA#APLICACAO#PLANOCONTAS#PRAGAS',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('CONDICOES',F_TABELA) then
    begin
      M_DESCRICAO := 'DESCRICAO';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('CULTIVAR',F_TABELA) then
    begin
      M_DESCRICAO := 'CULTIVAR';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('ESPECIE',F_TABELA) then
    begin
      M_DESCRICAO := 'SEMENTENOME';
      M_CONTROLE  := 'CODIGO';
    end
  else
  if StrContains('RESPONSAVEL#FUNCIONARIOS',F_TABELA) then
    begin
      M_DESCRICAO := 'NOME';
      M_CONTROLE  := 'CODIGO';
    end
  else
    begin
      M_DESCRICAO := 'NOME';
      M_CONTROLE  := 'CODIGO';
    end;

  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO varchar(200))              as           ' +
             ' declare variable V_CODIGO varchar(20);                                   ' +
             ' declare variable P_TABELA varchar(20);                                   ' +
             ' declare variable P_RESULTADO varchar(200);                               ' +
             ' declare variable P_ERRO integer;                                         ' +
             ' begin                                                                    ' +
             '   select ' + M_CONTROLE + ',' + M_DESCRICAO + ' from ' + F_TABELA      + ' where ' + M_CONTROLE + ' = ' + QuotedStr(F_CODIGO) + '       ' +
             '     into                                                                 ' +
             '       V_CODIGO,                                                          ' +
             '         P_RESULTADO;                                                     ' +
             '   P_RETORNO = P_RESULTADO;                                               ' +
             '   suspend;                                                               ' +
             '                                                                          ' +
             ' end                                                                      ';
    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except
      on e: exception do
        begin
          gera_log(e.Message);
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsString;
    Query.Close;
    FreeAndNil(Query);
  end;

end;
function gera_log(Frase:String):boolean;
var
  Arquivo: String;
  Texto  : TextFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) +'erro' + '.log';
  AssignFile(Texto,Arquivo);
  if not FileExists(Arquivo) then
    Rewrite(Texto)
  else
    Append(Texto);
  WriteLn(Texto, Frase);
  CloseFile(Texto);
end;
function  executasql(Const F_SQL:String): boolean;
begin
  with dm_rc.executasql do
    begin
      Close;
      DataSource := nil;
      UnPrepare;
      Sql.Clear;
      Sql.Add(F_SQL);
      Prepare;
      ExecSQL;
    end;

 if dm_rc.executasql.IsEmpty then
   result := False
 else
   result := True;
end;
function  SqlProdutos(Const F_SQL:String): boolean;
begin
  with dm_rc.tbprodutos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbprodutos.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMvitens(Const F_SQL:String): boolean;
begin
  with dm_rc.tbmvitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbmvitens.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMvmestre(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryMvmestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryMvmestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaTransporte(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryTransportes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryTransportes.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMedidas(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqrymedidas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymedidas.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaOperacao(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryoperacoes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryoperacoes.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaDocumentos(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryDocumentos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryDocumentos.IsEmpty then
   result := False
 else
   result := True;
end;


function  TabelaPessoas(Const F_SQL:String): boolean;
begin
  with dm_rc.FDQryPessoas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryPessoas.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaEmpresas(Const F_SQL:String): boolean;
begin
  with dm_rc.tbempresas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbempresas.IsEmpty then
   result := False
 else
   result := True;
end;


function  TabelaReceber(Const F_SQL:String): boolean;
begin
  with dm_rc.tbreceber do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbreceber.IsEmpty then
   result := False
 else
   result := True;
end;


function  SqlPesquisa(Const F_SQL:String): boolean;
begin
  with dm_rc.sqlBuscas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlBuscas.IsEmpty then
   result := False
 else
   result := True;
end;
function  Saldo_Banco_Atual(const F_DATA : TDateTime;F_EMPRESA:integer) : real;
var
  saldoatual : real;
begin
  saldoatual := 0;

  if SqlPesquisa(' SELECT B.PORTADOR FROM BANCOS B ' +
                 ' WHERE EMISSAO <=                ' + QuotedStr(DataPonto(DateToStr(F_DATA))) +
                 ' AND    EMPRESA          =       ' + Inttostr(F_EMPRESA)                     +
                 ' AND B.PORTADOR <> 0             ' +
                 ' GROUP BY PORTADOR               ' +
                 ' ORDER BY B.PORTADOR') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          saldoatual   := saldoatual +  Calcula_AntCaixa(F_EMPRESA,dm_rc.sqlBuscas.findfield('PORTADOR').AsInteger,F_DATA);

          dm_rc.sqlBuscas.Next;
        end;
    end;
  Result := saldoatual;
end;
function  Calcula_AntCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + IntToStr(F_PORTADOR) +' = 0) then                                                         ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and               ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;  ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                ' +
             '                     bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;     ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa =  ' + IntToStr(F_EMPRESA)               + '  and                 ' +
             '                     bancos.portador = ' +  IntToStr(F_PORTADOR)             + '  and                 ' +
             '                     bancos.tipo     = ' + QuotedStr('Entrada')              + '  and                 ' +
             '                     bancos.emissao <  '+ QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_credita;    ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa =  ' + IntToStr(F_EMPRESA)               + '  and                  ' +
             '                     bancos.portador = ' + IntToStr(F_PORTADOR)              + '  and                  ' +
             '                     bancos.tipo    =  ' + QuotedStr('Saida')                + '  and                  ' +
             '                     bancos.emissao <  ' + QuotedStr(DataPonto(DateToStr(F_DATA)))      + ' into :v_debita;       ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';



    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except
      on e: exception do
        begin
          //msg('Calcula_AntCaixa_Procedure Erro: ' + e.message);
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Calcula_SaldoatualCaixa(const F_EMPRESA,F_PORTADOR : Integer; F_DATA:TDate):Real;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn ;

    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + IntToStr(F_PORTADOR) +' = 0) then                                                      ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and               ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and               ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;  ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                ' +
             '                     bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;     ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa =  ' + IntToStr(F_EMPRESA)               + '  and                 ' +
             '                     bancos.portador = ' +  IntToStr(F_PORTADOR)             + '  and                 ' +
             '                     bancos.tipo     = ' + QuotedStr('Entrada')              + '  and                 ' +
             '                     bancos.emissao <= '+ QuotedStr(DataPonto(DateToStr(F_DATA)))        + '  into :v_credita;    ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa =  ' + IntToStr(F_EMPRESA)               + '  and                  ' +
             '                     bancos.portador = ' + IntToStr(F_PORTADOR)              + '  and                  ' +
             '                     bancos.tipo    =  ' + QuotedStr('Saida')                + '  and                  ' +
             '                     bancos.emissao <= ' + QuotedStr(DataPonto(DateToStr(F_DATA)))      + ' into :v_debita;       ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             'end                                                                            ';

    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except
      on e: exception do
        begin
//          msg('Calcula_AntCaixa_Procedure Erro: ' + e.message);
        end;
    end;
  finally
    result :=  Query.FindField('P_RETORNO').AsFloat;
    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  Sequencia_Caixa(const F_DATA : TDateTime; F_PORTADOR :integer) : Integer;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := mm.SQLConn;

    M_SQL := ' execute block returns (P_RETORNO integer)                   as                         ' +
             ' declare variable NUMERO integer;                                                       ' +
             ' begin                                                                                  ' +
             '   select count(coalesce(bancos.codigo,0))+1 as sequencia from bancos where bancos.portador  =                    ' + IntToStr(F_PORTADOR) +
             '   and bancos.emissao                                                                        =                    ' + QuotedStr(DataPonto(DateToStr(F_DATA))) + '             ' +
             '   into :numero;                                                                        ' +
             '   p_retorno  = NUMERO;                                                                 ' +
             '   suspend;                                                                             ' +
             ' end                                                                                    ';

    try
      with query do
        begin
          Close;
          UnPrepare;
          Sql.Clear;
          sql.Text := M_SQL;
          Prepare;
          Open;
        end;
    except
      on e: exception do
        begin
        end;
    end;
  finally
    result :=  Query.FindField('p_retorno').AsInteger;

    Query.Close;
    FreeAndNil(Query);
  end;
end;
function  SqlPesquisaGerais(Const F_SQL:String):TFDQuery;
begin
  query := TFDQuery.Create(nil);
  with query do
    begin
      try
        try
          Connection := mm.SQLConn;
          UnPrepare;
          Close;
          sql.Clear;
          SQL.Add(F_SQL);
          Prepare;
          Open;
        except
          on e: exception do
            begin
              gera_log('Abre_Tabela ' + e.message);
            end;
        end;
      finally
        Result := query;
      end;
    end;
end;
function Calcula_AntPlano(const F_EMPRESA: Integer; F_PLANO: string; F_DATA: TDate): Real;
var
  M_SQL        : string;
  numero       : Integer;
  vError       : string;
  FDQryExecute : TFDQuery;
begin

  try
    M_SQL := ' execute block returns (P_RETORNO numeric(15,4))             as                ' +
             ' declare variable V_CREDITA numeric(14,3);                                     ' +
             ' declare variable V_DEBITA numeric(14,3);                                      ' +
             ' declare variable V_SALDO numeric(14,3);                                       ' +
             ' begin                                                                         ' +
             ' if (' + F_PLANO +' = 0) then                                                  ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and                           ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + '  into :v_credita;              ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Saida')                 + '  and                           ' +
             '                     bancos.emissao < ' + QuotedStr(DataPonto(DateToStr(F_DATA)))       + ' into :v_debita;                ' +
             '   end                                                                         ' +
             ' else                                                                          ' +
             '   begin                                                                       ' +
             ' /* credita */                                                                 ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.planocontas = ' + QuotedStr(F_PLANO)             + '  and                           ' +
             '                     bancos.tipo    = ' + QuotedStr('Entrada')               + '  and                           ' +
             '                     bancos.emissao <     ' + QuotedStr(DataPonto(DateToStr(F_DATA)))   + ' into :v_credita;               ' +
             ' /* debita */                                                                  ' +
             '     select coalesce(sum(bancos.valorpago),0) from bancos                      ' +
             '               where bancos.empresa = ' + IntToStr(F_EMPRESA)                + '  and                           ' +
             '                     bancos.planocontas = ' + QuotedStr(F_PLANO)             + '  and                           ' +
             '                     bancos.tipo        = ' + QuotedStr('Saida')             + '  and                           ' +
             '                     bancos.emissao <     ' + QuotedStr(DataPonto(DateToStr(F_DATA)))   + ' into :v_debita;                ' +
             '   end                                                                         ' +
             '                                                                               ' +
             '   v_saldo = v_credita - v_debita ;                                            ' +
             '                                                                               ' +
             '   P_RETORNO = v_saldo;                                                        ' +
             '                                                                               ' +
             '   suspend;                                                                    ' +
             '                                                                               ' +
             ' end                                                                           ';

    try
      FDQryExecute             := TFDQuery.Create(nil);
      FDQryExecute.Connection  := mm.SQLConn;
      with FDQryExecute do
        begin
          Close;
          Sql.Clear;
          SQL.Text := M_SQL;
          Open;
        end;
    except
      on e: exception do
        begin
          gera_log('Calcula Antplano: ' + e.message);
        end;
    end;
  finally
    result := FDQryExecute.FindField('P_RETORNO').asfloat;

    FreeAndNil(FDQryExecute);
  end;
end;

function Gera_Amostra(const F_DATA: TDateTime): string;
var
  M_AMOSTRA : string;
begin

  dm_rc.FDQryDocumentos.Close;
  dm_rc.FDQryDocumentos.SQL.Clear;
  dm_rc.FDQryDocumentos.SQL.Text := 'SELECT * FROM DOCUMENTOS WHERE DOCUMENTO = 8';
  dm_rc.FDQryDocumentos.Open;

 if  dm_rc.FDQryDocumentos.RecordCount > 0 then
   begin
     M_AMOSTRA := '';
     M_AMOSTRA := IntToStr(dm_rc.FDQryDocumentos.FindField('NUMERO').AsInteger + 1);

     try
       dm_rc.FDQryDocumentos.Edit;
       dm_rc.FDQryDocumentos.FindField('NUMERO').AsInteger := StrToInt(M_AMOSTRA);
       dm_rc.FDQryDocumentos.Post;
     finally
       if dm_rc.FDQryDocumentos.State = dsBrowse then  dm_rc.FDQryDocumentos.Edit;
         Result := StrZeroS(M_AMOSTRA,5)+ '/' + FormatDateTime('yy', F_DATA);
     end;
   end
 else
   Result := 'NC';
end;
function  TabelaProtocolo(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryProtocolo do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryProtocolo.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaAnalise(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryAnalise do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryAnalise.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaAnaliseItens(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryAnaliseitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryAnaliseitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPMS(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryPMS do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryPMS.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEspecie(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryEspecie do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryEspecie.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaCultivar(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryCultivar do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryCultivar.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaResponsavel(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryResponsavel do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryResponsavel.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaGerminacao(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryGerminacao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryGerminacao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRTCliente(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryRTCliente do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryRTCliente.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaRTLaboratorio(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryResponsavel do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryResponsavel.IsEmpty then
   result := False
 else
   result := True;
end;
function VerificaProtocolo(Const F_PROTOCOLO:Integer;tipo:string):string;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;

  if tipo = 'BOLETIM' then
    M_SQL := 'select boletim as resultado  from protocolo where codigo  = ' + IntToStr(F_PROTOCOLO);
  if tipo = 'INFORMATIVO' then
    M_SQL := 'select numeroir as resultado from protocolo where codigo = ' + IntToStr(F_PROTOCOLO);
  if tipo = 'FICHA' then
    M_SQL := 'select protocolo as resultado from analise where protocolo = ' + IntToStr(F_PROTOCOLO);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  if query.FindField('resultado').AsString <> ''  then
    Result := 'T'
  else
    Result := 'F';

  query.Free;
end;
function  SqlPesquisaSecundaria(Const F_SQL:String):Boolean;
begin
  with dm_rc.sqlpesquisasecundaria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlpesquisasecundaria.IsEmpty then
   result := False
 else
   result := True;

end;
function  SqlPesquisaPrimeira(Const F_SQL:String):Boolean;
begin
  with dm_rc.sqlpesquisaprimaria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.sqlpesquisaprimaria.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaCategoria(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrycategoria do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycategoria.IsEmpty then
   result := False
 else
   result := True;

end;
function  TabelaPeneira(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypeneira do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypeneira.IsEmpty then
   result := False
 else
   result := True;
end;
function  Tabelaregiao(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryregiao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryregiao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaSementes(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrysementes do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysementes.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaLaboratorio(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrylaboratorio do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrylaboratorio.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaProdutos(Const F_SQL:String):Boolean;
begin
  with dm_rc.FDQryProdutos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.FDQryProdutos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaTitulos(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrytitulos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrytitulos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEscritas(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryescritas do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryescritas.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPontos(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypontos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypontos.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaEventoXML(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryeventoxml do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryeventoxml.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaComposicaoitens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrycomposicaoitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycomposicaoitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  VerificaDevolucao(const F_OPERACAO :Integer):string;
var
  sql : string;
begin
  query            := TFDQuery.Create(nil);
  query.Connection := mm.SQLConn;
  M_SQL            := 'select tipo from operacoes where codigo = ' + IntToStr(F_OPERACAO);

  with query do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := M_SQL;
      Prepare;
      Open;
    end;

  result:= query.FindField('tipo').AsString
end;
procedure Calcula_Lote(const F_EMPRESA,F_PRODUTO:integer;F_LOTE,F_BOLETIM,F_TERMO,F_TIPO:string);
begin
  with dm_rc.procCALCULA_LOTE do
    begin
      Prepare;
      ParamByName('P_EMPRESA').AsInteger     := F_EMPRESA;
      ParamByName('P_PRODUTO').AsInteger     := F_PRODUTO;
      ParamByName('P_LOTE').AsString         := F_LOTE;
      ParamByName('P_BOLETIM').AsString      := F_BOLETIM;
      ParamByName('P_TERMO').AsString        := F_TERMO;
      ParamByName('P_TIPO').AsString         := 'Kilos';
      ExecProc;
    end;
end;
function  TabelaBatidaItens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrybatidaitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrybatidaitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaBatidaMestre(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrybatidamestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrybatidamestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMfmestre(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrymfmestre do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymfmestre.IsEmpty then
   result := False
 else
   result := True;
end;

function  TabelaMfitens(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrymfitens do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrymfitens.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPermissao(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrypermissao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrypermissao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaUsuarios(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryusuarios do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryusuarios.IsEmpty then
   result := False
 else
   result := True;
end;
function  Verifica_Permissao(const P_EMPRESA,P_FUNCIONARIO:Integer;P_TABELA,P_TIPO:string):string;
begin
  with dm_rc.procVERIFICA_PERMISSAO do
    begin
      StoredProcName := 'VERIFICA_PERMISSAO';
      Prepare;
      ParamByName('P_EMPRESA').AsInteger       := P_EMPRESA;
      ParamByName('P_FUNCIONARIO').AsInteger   := P_FUNCIONARIO;
      ParamByName('P_TABELA').AsString         := P_TABELA;
      ParamByName('P_TIPO').AsString           := P_TIPO;
      ExecProc;

      if P_FUNCIONARIO = 9999 then
        Result := 'T'
      else
        result := ParamByName('R_RESULTADO').AsString;
    end;
end;
function  Sequencia_Menusisterma(const P_MENU:string):Integer;
begin
  with dm_rc.procSEQUENCIA_MENUSISTEMA do
    begin
      StoredProcName := 'SEQUENCIA_MENUSISTEMA';
      Prepare;
      ParamByName('P_MENU').AsString         := P_MENU;
      ExecProc;

      result := ParamByName('R_SEQUENCIA').AsInteger;

    end;
end;
function  TabelaComposicao(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrycomposicao do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrycomposicao.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaSaldos(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqrysaldos do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqrysaldos.IsEmpty then
   result := False
 else
   result := True;
end;
function HttpGetMSG(get: string): TMsgInfo;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  JsonObj     : TJSONObject;
begin
  RestClient  := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  Response    := TRESTResponse.Create(nil);
  Result := TMsgInfo.Create; // Criamos a instância para armazenar os valores

  try
    RestRequest.Client     := RestClient;
    RestRequest.Response   := Response;

    RestClient.BaseURL     := get;
    RestClient.ContentType := 'application/json';
    RestRequest.Accept     := 'application/json';
    RestRequest.Method     := rmGET;

    RestRequest.Execute;

    // Faz o parsing do JSON recebido
    JsonObj := TJSONObject.ParseJSONValue(Response.Content) as TJSONObject;

    if Assigned(JsonObj) then
    try
      // Preenche os valores no objeto
      Result.Registro := JsonObj.GetValue<Integer>('registro');
      Result.Titulo   := JsonObj.GetValue<string>('titulo');
      Result.Corpo    := JsonObj.GetValue<string>('corpo');
    finally
      JsonObj.Free;
    end;

  finally
    RestRequest.Free;
    RestClient.Free;
    Response.Free;
  end;
end;
function HttpGet(get:string):string;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  ArrayMsg    : TJSONArray;
  x           : integer;
begin

  RestRequest            := TRESTRequest .Create(mm);
  RestClient             := TRESTClient  .Create(mm);
  Response               := TRESTResponse.Create(mm);

  RestRequest.Client     := RestClient;
  RestRequest.Response   := Response;

  RestClient.BaseURL     := get;
  RestClient.ContentType := 'application/json';
  RestRequest.Accept     := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RestRequest.Method     := rmGET;


  try
    RestRequest.Execute;

    ArrayMsg := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.JSONValue.ToJSON),0) as TJSONArray;
    Result   := ArrayMsg.Get(0).GetValue<string>('msg');
  finally

    FreeAndNil(RestRequest);
    FreeAndNil(RestClient);
    FreeAndNil(Response);
    ArrayMsg.DisposeOf;
  end;
end;
function Caminho(Retornar:String):String;
var
  Config: TextFile;
  Linha : string;
begin
  AssignFile(Config,ExtractFilePath(Application.ExeName) + 'Config.ib');
  Reset(Config);
  while not Eof(Config) do
    begin
      Readln(Config, Linha);
      if UpperCase(Copy(Linha,1,length(Retornar))) = UpperCase(Retornar) then
        Result := StrAllTrim(Copy(Linha,length(Retornar)+1,300));
    end;
  CloseFile(Config);
end;
function  SaldoProdutoKardex_Nota (const rempresa,rproduto:integer;datafin:TDateTime):Real;
var
  procgeralote : TFDQuery;
  V_SALDO      : Real;
begin
  procgeralote            := TFDQuery.Create(nil);
  procgeralote.Connection := mm.SQLConn;
  V_SALDO                 := 0;

  M_SQL :=
          'select                                                                                 ' +
          '  entradas - saidas as saldo                                                           ' +
          'from (                                                                                 ' +
          '    select                                                                             ' +
          '      p.produto,                                                                       ' +
          '      sum(iif(op.entrada_saida = 0 and p.data < ' + QuotedStr(DataPonto(DateToStr(datafin))) + ',p.quantidade,0)) entradas,    ' +
          '      sum(iif(op.entrada_saida = 1 and p.data < ' + QuotedStr(DataPonto(DateToStr(datafin))) + ',p.quantidade,0)) saidas       ' +
          '    from                                                                               ' +
          '      pontos p inner join operacoes op on (p.operacao = op.codigo)                     ' +
          '               inner join pessoas   pp on (p.pessoa   = pp.codigo)                     ' +
          '    where p.produto =                                                                  ' + IntToStr(rproduto) +
          '    and   p.empresa =                                                                  ' + IntToStr(rempresa) +
          '    and   p.data <                                                                     ' + QuotedStr(DataPonto(DateToStr(datafin))) +
          '    and   p.documento <>                                                               ' + QuotedStr('3')  +
          '    and   p.documento <>                                                               ' + QuotedStr('4')  +
          '    and   p.documento <>                                                               ' + QuotedStr('5')  +
          '    and   p.documento <>                                                               ' + QuotedStr('6')  +
          '    and   p.documento <>                                                               ' + QuotedStr('7')  +
          '    and   p.cancelada <>                                                               ' + QuotedStr('C')  +
          '    and   op.estoque  <>                                                               ' + QuotedStr('2')  +
          '   group by 1 ) k                                                                      ';

  try
    with procgeralote do
      begin
        Close;
        UnPrepare;
        Sql.Clear;
        sql.Text := M_SQL;
        Prepare;
        Open;
      end;
    V_SALDO := procgeralote.FindField('SALDO').AsFloat;
  except
    on e: exception do
      begin
        gera_log('Saldo_Produto_Nota_Procedure Erro: ' + e.message);
      end;
  end;
  Result := V_SALDO;

  procgeralote.Free;
end;
procedure Calcula_SaldoProduto (const pempresa,pproduto:integer);
var
  calculaitens : TFDQuery;
begin
  calculaitens     := TFDQuery.Create(nil);
  calculaitens.Connection := mm.SQLConn;
  mm.FDTransaction.StartTransaction;

  M_SQL :=
          'execute block  as                                                                       '+
          'declare variable creditoPT numeric(18,2);                                               '+
          'declare variable debitoPT  numeric(18,2);                                               '+
          'declare variable saldoPT   numeric(18,2);                                               '+
          'declare variable v_credita numeric(18,2);                                               '+
          'declare variable v_debita  numeric(18,2);                                               '+
          'declare variable v_saldo   numeric(18,2);                                               '+
          '                                                                                        '+
          'begin                                                                                   '+
          '                                                                                        '+
          '  select coalesce(sum(mi.quantidade),0) from pontos mi                                  '+
          '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
          '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
          '    and   mi.tipo    = '+QuotedStr('ENTRADA')+' into creditoPT;                         '+
          '                                                                                        '+
          '  select coalesce(sum(mi.quantidade),0) from pontos mi                                  '+
          '    where mi.empresa = '+IntToStr(pempresa)  +'                                         '+
          '    and   mi.produto = '+IntToStr(pproduto)  +'                                         '+
          '    and   mi.tipo    = '+QuotedStr('SAIDA')+' into debitoPT;                            '+
          '                                                                                        '+
          '  saldoPT = creditoPT - debitoPT;                                                       '+
          '                                                                                        '+
          '  select coalesce(sum(mvitens.quantidade),0) from mvitens, operacoes                    '+
          '    where mvitens.empresa  = '+IntToStr(pempresa)+'                                     '+
          '    and   mvitens.produto  = '+IntToStr(pproduto)+'                                     '+
          '    and   operacoes.codigo = mvitens.operacao                                           '+
          '    and   operacoes.entrada_saida = 0                                                   '+
          '    and   operacoes.estoque       = 0 into v_credita;                                   '+
          '                                                                                        '+
          '  select coalesce(sum(mvitens.quantidade),0) from mvitens, operacoes                    '+
          '    where mvitens.empresa  = '+IntToStr(pempresa)+'                                     '+
          '    and   mvitens.produto  = '+IntToStr(pproduto)+'                                     '+
          '    and   operacoes.codigo = mvitens.operacao                                           '+
          '    and   operacoes.entrada_saida = 1                                                   '+
          '    and   operacoes.estoque       = 1 into v_debita;                                    '+
          '                                                                                        '+
          '  v_saldo = v_credita - v_debita;                                                       '+
          '                                                                                        '+
          '  update saldos li                                                                      '+
          '    set li.saldoponto = :saldoPT,                                                       '+
          '        li.disponivel = :v_saldo                                                        '+
          '    where li.empresa = '+IntToStr(pempresa)+'                                           '+
          '    and   li.produto = '+IntToStr(pproduto)+';                                          '+
          '                                                                                        '+
          '  suspend;                                                                              '+
          'end                                                                                     ';


  try

    with calculaitens do
      begin
        Close;
        DataSource := nil;
        UnPrepare;
        Sql.Clear;
        Sql.Add(M_SQL);
        Prepare;
        ExecSQL;
      end;

  except
    on e: exception do
      begin
        gera_log('CalculaLoteInterno Erro: ' + e.message);
      end;
  end;
  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;
  calculaitens.Free;
end;
procedure VerificarEAdicionarCampo(Connection: TFDConnection; const Tabela, Campo, ScriptDDL: string);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Connection;
    Qry.SQL.Text :=
      'SELECT 1 FROM RDB$RELATION_FIELDS ' +
      'WHERE TRIM(RDB$RELATION_NAME) = :TABELA ' +
      '  AND TRIM(RDB$FIELD_NAME) = :CAMPO';

    Qry.ParamByName('TABELA').AsString := UpperCase(Tabela);
    Qry.ParamByName('CAMPO').AsString  := UpperCase(Campo);
    Qry.Open;

    if Qry.IsEmpty then
    begin
      Connection.ExecSQL(ScriptDDL);
    end;
  finally
    Qry.Free;
  end;
end;
procedure verificaatualizacao();
begin
  try
    //*********************************************************************//
    //2026
    //*********************************************************************//
    VerificarEAdicionarCampo(mm.SQLConn, 'EMPRESAS' , 'CERTIFICADO_CAMINHO', 'ALTER TABLE EMPRESAS ADD CERTIFICADO_CAMINHO VARCHAR(150)');
    VerificarEAdicionarCampo(mm.SQLConn, 'EMPRESAS' , 'IDCSC'              , 'ALTER TABLE EMPRESAS  ADD IDCSC              VARCHAR(20)');
    VerificarEAdicionarCampo(mm.SQLConn, 'EMPRESAS' , 'CSC'                , 'ALTER TABLE EMPRESAS  ADD CSC                VARCHAR(100)');

    VerificarEAdicionarCampo(mm.SQLConn, 'MVITENS'  , 'FORNECEDORCODIGO'   , 'ALTER TABLE MVITENS  ADD FORNECEDORCODIGO    VARCHAR(20)');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVITENS'  , 'PEDIDOOR'           , 'ALTER TABLE MVITENS  ADD PEDIDOOR            VARCHAR(20)');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVITENS'  , 'PEDIDOITEMOR'       , 'ALTER TABLE MVITENS  ADD PEDIDOITEMOR        VARCHAR(20)');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVMESTRE' , 'CHAVEACESSO '       , 'ALTER TABLE MVMESTRE ADD CHAVEACESSO         BLOB SUB_TYPE TEXT CHARACTER SET WIN1252');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVITENS'  , 'PERCSUB'            , 'ALTER TABLE MVITENS  ADD PERCSUB             NUMERIC(18,4)');

    VerificarEAdicionarCampo(mm.SQLConn, 'MVMESTRE'  , 'DINHEIRO'           , 'ALTER TABLE MVMESTRE  ADD DINHEIRO            NUMERIC(18,4)');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVMESTRE'  , 'DEBITO'             , 'ALTER TABLE MVMESTRE  ADD DEBITO              NUMERIC(18,4)');
    VerificarEAdicionarCampo(mm.SQLConn, 'MVMESTRE'  , 'CREDITO'            , 'ALTER TABLE MVMESTRE  ADD CREDITO             NUMERIC(18,4)');

    VerificarEAdicionarCampo(mm.SQLConn, 'MVMESTRE'  , 'CPFCNPJ'            , 'ALTER TABLE MVMESTRE  ADD CPFCNPJ             VARCHAR(20)');

  except
    on E: Exception do
      gera_log(e.Message);
  end;
end;
function  TabelaFonecedor(Const F_SQL:String): boolean;
begin
  with dm_rc.fdqryfornecedorproduto do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryfornecedorproduto.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaPortadores(Const F_SQL:String): boolean;
begin
  with dm_rc.tbportadores do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.tbportadores.IsEmpty then
   result := False
 else
   result := True;
end;
function  TabelaAgrupaFinanceiro(Const F_SQL:String):Boolean;
begin
  with dm_rc.fdqryagrupafinanceiro do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := F_SQL;
      Prepare;
      Open;
    end;

 if dm_rc.fdqryagrupafinanceiro.IsEmpty then
   result := False
 else
   result := True;
end;
function ConfirmaCienciaFinanceiro(pCodigo: Integer; pContrato, pUsuario: string): Boolean;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  sBase, sUrl : string;
begin
  Result := False;
  RestClient  := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  Response    := TRESTResponse.Create(nil);
  try
    try
      sBase := Caminho('HTTPGETFINANCEIRO=');
      if (sBase <> '') and (Copy(sBase, Length(sBase), 1) <> '/') then
        sBase := sBase + '/';
      sUrl := sBase + 'financeiroconfirmalida/' + IntToStr(pCodigo) + '|' + pContrato + '|' + pUsuario;
      RestRequest.Client     := RestClient;
      RestRequest.Response   := Response;
      RestClient.BaseURL     := sUrl;
      RestClient.ContentType := 'application/json';
      RestRequest.Accept     := 'application/json';
      RestRequest.Method     := rmGET;
      RestRequest.Execute;
      Result := (Response.StatusCode = 200);
    except
      Result := False;
    end;
  finally
    FreeAndNil(RestRequest);
    FreeAndNil(RestClient);
    FreeAndNil(Response);
  end;
end;
function HttpGetFinanceiro(get: string): TAvisoFinanceiroInfo;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  JsonVal     : TJSONValue;
  ArrayMsg    : TJSONArray;
  Obj         : TJSONObject;
begin
  Result := TAvisoFinanceiroInfo.Create;
  Result.Status := 'Livre';
  Result.Codigo := 0;
  Result.Documento := '';
  Result.Valor := '0,00';
  Result.Vencimento := '';
  Result.DiasAtraso := 0;
  Result.DiasTolerancia := 5;
  Result.Contrato := '';
  Result.Motivo := '';

  RestClient  := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  Response    := TRESTResponse.Create(nil);
  try
    try
      RestRequest.Client     := RestClient;
      RestRequest.Response   := Response;
      RestClient.BaseURL     := get;
      RestClient.ContentType := 'application/json';
      RestRequest.Accept     := 'application/json, text/plain; q=0.9, text/html;q=0.8';
      RestRequest.Method     := rmGET;
      RestRequest.Execute;

      if (Response.StatusCode = 200) and (Trim(Response.Content) <> '') then
      begin
        JsonVal := TJSONObject.ParseJSONValue(Response.Content);
        if Assigned(JsonVal) then
        try
          Obj := nil;
          if (JsonVal is TJSONArray) and (TJSONArray(JsonVal).Count > 0) and (TJSONArray(JsonVal).Get(0) is TJSONObject) then
            Obj := TJSONObject(TJSONArray(JsonVal).Get(0))
          else if JsonVal is TJSONObject then
            Obj := TJSONObject(JsonVal);

          if Obj <> nil then
          begin
            Result.Status         := Obj.GetValue<string>('msg', 'Livre');
            Result.Codigo         := Obj.GetValue<Integer>('codigo', 0);
            Result.Documento      := Obj.GetValue<string>('documento', '');
            Result.Valor          := Obj.GetValue<string>('valor', '0,00');
            Result.Vencimento     := Obj.GetValue<string>('vencimento', '');
            Result.DiasAtraso     := Obj.GetValue<Integer>('dias_atraso', 0);
            Result.DiasTolerancia := Obj.GetValue<Integer>('dias_tolerancia', 5);
            Result.Contrato       := Obj.GetValue<string>('contrato', '');
            Result.Motivo         := Obj.GetValue<string>('motivo', '');
          end;
        finally
          JsonVal.Free;
        end;
      end;
    except
      on E: Exception do
        gera_log('Erro HttpGetFinanceiro: ' + E.Message);
    end;
  finally
    FreeAndNil(RestRequest);
    FreeAndNil(RestClient);
    FreeAndNil(Response);
  end;
end;
function ConfirmaLeituraMensagem(pCodigo: Integer; pCnpj, pUsuario: string): Boolean;
var
  RestClient  : TRESTClient;
  RestRequest : TRESTRequest;
  Response    : TRESTResponse;
  sUrl        : string;
begin
  Result := False;
  RestClient  := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  Response    := TRESTResponse.Create(nil);
  try
    try
      sUrl := Caminho('HTTPGETFINANCEIRO=') + 'mensagemconfirmaleitura/' + IntToStr(pCodigo) + '|' + pCnpj + '|' + pUsuario;
      RestRequest.Client     := RestClient;
      RestRequest.Response   := Response;
      RestClient.BaseURL     := sUrl;
      RestClient.ContentType := 'application/json';
      RestRequest.Accept     := 'application/json';
      RestRequest.Method     := rmGET;
      RestRequest.Execute;
      Result := (Response.StatusCode = 200);
    except
      Result := False;
    end;
  finally
    RestRequest.Free;
    RestClient.Free;
    Response.Free;
  end;
end;

end.
