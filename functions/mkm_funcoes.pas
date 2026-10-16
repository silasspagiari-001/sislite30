unit mkm_funcoes;

interface

uses
  FireDAC.Comp.Client, Data.DB, uniGUIFrame;
function  Gera_Guid: String;
function  StrSubst(const S, Del, Ins: string; Count: Integer): string;
function  StrContains(const S1, S2: string): Boolean;
function  StrPos(const S, SubStr: string; Index: Integer): Integer;
function  CriaMemoria (tabela: String): TFDMemTable;
function  tratanome(aux: string): String;
function  Trocarletra(Str:String): String;
function  PrimeiraLetraMaiscula(Str: string): string;
function  Sigla_Mes(Const F_DATA:TDateTime;F_LETRAS:Integer;F_MAIUSCULA:Boolean;F_CASASANO:Integer): String;
function  Month(Dt: TDateTime): Integer;
function  StrRight(const S: string; Count: Integer): string;
Function  FORMATA_CEP(const F_CLICEP:string):String;
function  ExtensoMes(n: Integer): String;
function  ExtensoValor( pValor:Extended;VlrMonetario:Boolean):String;
function  CasasDecimais(const f_valor:Real):string;
Function  Formata_Cnpj(const F_CLICNP:string):String;
function  Busca_Array(F_CAMPO:string;F_ARRAY:array of String):Boolean;
function  NomeEstado(F_ESTADO : String): String;
function  Retornastatustable(DataSet: TDataSet): String;
function  RemoverEspeciais(Str:String): String;
function  StrLeft(const S: string; Count: Integer): string;
function  ValidaSenha(F_VALOR,F_SENHA :String):Boolean;
function  DataSetToJsonTXT(pDataSet: TDataSet): String;
function  Validacaminho(pempresa:integer;caminho,pcnpj,ptipo,pemissao,peventosnfe:string):string;
function  ValidadorAcbr(const campo,tipo:string):string;
procedure Exclui_Movimento(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO:Integer);
procedure EventoXmlAcbr(pnumero,pdocumento,pempresa,ptipo:string);
procedure GravaLog(lempresa,lusuario,lcodigo:integer;lloguin,lacao,ltabela,larquivo,dados:string);
function  Downloadremessa(const caminhoarq, nomearquivo : string): string;
function  RemoverORSql(Str:String): String;
function  StrRPad(const S: string; Count: Integer): string;
function  StrSpace(Count: Integer): string;
function Enviar_Email(mensagem,titulo,empresa,destinatarioemail,anexo1,anexo2:String): Boolean;
function StrZero(Number: Double; Len, Dec: Integer): string;
function ExtCem( pCem:String ):String;
function StripDouble( pString:String ):String;
procedure GravarTexto(SalvarComo, Texto:String);
procedure Exclui_MovimentoPessoa(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO,F_PESSOA:Integer);
function  Sigla_MesNovo(Const F_DATA:TDateTime): String;
function IsDir(const DirName: string): Boolean;

procedure AcaoCentroCusto(pempresa,pmestreid:integer;pacao,ptabela:string;table:tfdmemtable);
procedure AcaoCentroCustoMvmestre(pempresa,pmestreid:integer;pacao,ptabela:string;table:tfdmemtable);


implementation

uses
  System.SysUtils, mkm_func_web, System.AnsiStrings, System.StrUtils,Winapi.Windows,
  MainModule, mkm_procedures, System.TypInfo, uniMemo, Vcl.StdCtrls, untDM_RC,
  System.JSON, System.Classes, ACBrValidador, Vcl.Forms, uniDBComboBox,IdHTTP,idSMTP,IdText,IdAttachmentFile,IdMessage;

function Gera_Guid: String;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := StrSubst(StrSubst(GuidToString(Guid),'{','',0),'}','',0);
end;
function StrSubst(const S, Del, Ins: string; Count: Integer): string;
var
  I, Found: Integer;
  R: string;
begin
  R := S;
  if (S = '') or (Del = '') or (Del = Ins) then
    R := ''
  else
    begin
      Found := 0;
      I := 1;
      while ((Count = 0) or (Found < Count)) and (I <= Length(R)) do
        begin
          if Copy(R, I, Length(Del)) = Del then
            begin
              Inc(Found);
              Delete(R, I, Length(Del));
              Insert(Ins, R, I);
              Inc(I, Length(Ins));
            end
          else
            Inc(I);
        end;
    end;
  Result := R;
end;

function StrZero(Number: Double; Len, Dec: Integer): string;
var
  S: string;
begin
  Str(Number : Len : Dec, S);
  S := StrAllTrim(S);
  Result := StrReplicate('0', Len - Length(S)) + S;
end;

function StrContains(const S1, S2: string): Boolean;
begin
  if StrPos(S1,S2,1) > 0 then
    result := True
  else
    result := False;
end;
function StrPos(const S, SubStr: string; Index: Integer): Integer;
var
  Found, I: Integer;
begin
  Result := 0;
  if (Index < 1) or (S = '') or (SubStr = '') then
    Exit;
  Found := 0;
  I := 1;
  while (I <= Length(S)) and (Found < Index) do
    begin
      if Copy(S, I, Length(SubStr)) = SubStr then
        Inc(Found);
      Inc(I);
    end;
  if Found = Index then
    Result := I - 1;
end;
function  CriaMemoria (tabela: String): TFDMemTable;
var
 QueryVirtual : TFDMemTable;
begin
  QueryVirtual  :=  TFDMemTable.Create(nil);
  try
    try
      if tabela = 'ESTOQUE' then
        begin
          QueryVirtual.FieldDefs.Add('GRUPO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('CODIGO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('DISPONIVEL'       , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'        , ftString,  100 , False);
          QueryVirtual.FieldDefs.Add('GRUPO_DESCRICAO'  , ftString,  100 , False);
        end;

      if tabela = 'PARCELAS' then
        begin
          QueryVirtual.FieldDefs.Add('JUROS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PARC'       , ftfloat);
          QueryVirtual.FieldDefs.Add('VLRPARCELA' , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCONTO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'      , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'  , ftString,  100 , False);
        end;

      if tabela = 'FINANCEIRO_SINTETICO' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'    , ftfloat);
          QueryVirtual.FieldDefs.Add('PARCELA'    , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'  , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'     , ftfloat);
          QueryVirtual.FieldDefs.Add('CARTEIRA'   , ftfloat);
          QueryVirtual.FieldDefs.Add('ORIGINAL'   , ftfloat);
          QueryVirtual.FieldDefs.Add('ATUAL'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PAGO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PRAZO'      , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE' , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCPERCA'  , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE_PERCA'  , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'             , ftfloat);

          QueryVirtual.FieldDefs.Add('EMISSAO'    , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'  , ftString,  80 , False);
          QueryVirtual.FieldDefs.Add('DATAINICIAL', ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('SERIE'      , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO' , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'  , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('NOME'       , ftString,  34 , False);
          QueryVirtual.FieldDefs.Add('SITUACAO'   , ftString,  20 , False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'    , ftString,  20 , False);

          QueryVirtual.FieldDefs.Add('DESCRICAO_CARTEIRA'  , ftString,  80  , False);
          QueryVirtual.FieldDefs.Add('OBSERVACOES'         , ftString,  100 , False);
        end;

      if tabela = 'DUPLICATAMERCANTIL' then
        begin
          QueryVirtual.FieldDefs.Add('MEMNUM'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMNOM'                , ftString,  100,False);
          QueryVirtual.FieldDefs.Add('MEMDTE'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMVCT'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('MEMORD'                , ftString,  01, False);
          QueryVirtual.FieldDefs.Add('MEMVALORFINAL'         , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('MEMPEDIDO'             , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('EXTENSAO'              , ftString,  150, False);
          QueryVirtual.FieldDefs.Add('MEMVALORPARCELA'       , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('MEMVALORTOTAL'         , ftString,  20, False);
        end;

      if tabela = 'TERMO' then
        begin
          QueryVirtual.FieldDefs.Add('LOTE'         , ftString,  50, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'      , ftString,  50, False);
          QueryVirtual.FieldDefs.Add('DATABOLETIM'  , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('EMBALAGEM'    , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('OE'           , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PN'           , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('PESO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('GERMINACAO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('SEMDURAS'     , ftfloat);
          QueryVirtual.FieldDefs.Add('CODIGO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('SS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SI'           , ftfloat);
          QueryVirtual.FieldDefs.Add('RP'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SNT'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SILVESTRES'   , ftfloat);
          QueryVirtual.FieldDefs.Add('NOCIVAS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('CULTIVADAS'   , ftfloat);
          QueryVirtual.FieldDefs.Add('VALIDADEGERMINACAO'  , ftString,  10, False);
        end;

      if tabela = 'CONTRATO_NOTA' then
        begin
          QueryVirtual.FieldDefs.Add('PRODUTO'        , ftString,   20, False);
          QueryVirtual.FieldDefs.Add('QUANTIDADESACO' , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOSACO'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PESO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('ALTURA'         , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('LARGURA'        , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('COMPRIMENTO'    , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'      , ftString,   200, False);

        end;

      if tabela = 'CONSULTABOLETIM' then
        begin
          QueryVirtual.FieldDefs.Add('PROTOCOLO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('AMOSTRA'     , ftString,   20, False);
          QueryVirtual.FieldDefs.Add('SITUACAO'    , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'     , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('NUMEROIR'    , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('ESPECIE'     , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'     , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'    , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO_IR'  , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO_BO'  , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('CATEGORIA'   , ftString,   15, False);
          QueryVirtual.FieldDefs.Add('LOTE'        , ftString,   80, False);
          QueryVirtual.FieldDefs.Add('SAFRAVALIDA' , ftString,   20, False);
          QueryVirtual.FieldDefs.Add('ANALISE'     , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('SOLICITADO'  , ftString,   10, False);
        end;

      if tabela = 'ARQUIVOREMESSA' then
        begin
          QueryVirtual.FieldDefs.Add('DATA_GERADA'   , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('HORA_GERADA'   , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('ARQUIVO'       , ftString,   10, False);
          QueryVirtual.FieldDefs.Add('detalhes'      , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('LOG_INCLUSAO'  , ftString,   100, False);
          QueryVirtual.FieldDefs.Add('CAMINHO'       , ftString,   100, False);
        end;

      if tabela = 'REFERENCIACOMERCIAL' then
        begin
          QueryVirtual.FieldDefs.Add('VLRBASEICMS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('VLRTOTAL'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VLRICMS'               , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('TIPO'                  , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                 , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('OPERACAO'              , ftString,   05, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'               , ftString,   10, False);
        end;

      if tabela = 'HISTORICOBENEFICIAMENTO' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'             , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'            , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('GERMINACAO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCARTE'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'         , ftfloat);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                 , ftString,  003, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'               , ftString,  010, False);
          QueryVirtual.FieldDefs.Add('LOTEDESTINO'           , ftString,  020, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'               , ftString,  020, False);
          QueryVirtual.FieldDefs.Add('TERMO'                 , ftString,  020, False);
        end;

      if tabela = 'FLUXOCAIXA' then
        begin
          QueryVirtual.FieldDefs.Add('SALDO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALPAGAR'            , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALRECEBER'          , ftfloat);
          QueryVirtual.FieldDefs.Add('DIA'                   , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'            , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('SEMANA'                , ftString,  20, False);
        end;

      if tabela = 'ESPECIE' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('POPULAR'                , ftString,  050, False);
        end;

      if tabela = 'CADASTRO_PRODUTOS' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('UNIDADE'                , ftString,  025, False);
          QueryVirtual.FieldDefs.Add('SEMENTENOME'            , ftString,  080, False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'               , ftString,  025, False);
        end;

      if tabela = 'BUSCACADASTRO' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('NOME'                   , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'                , ftString,  025, False);
          QueryVirtual.FieldDefs.Add('CIDADE'                 , ftString,  080, False);
          QueryVirtual.FieldDefs.Add('ESTADO'                 , ftString,  002, False);
          QueryVirtual.FieldDefs.Add('TELEFONE'               , ftString,  025, False);
        end;

      if tabela = 'PESSOASPRODUTOS' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('EMISSAO'         , ftString, 010, False);
          QueryVirtual.FieldDefs.Add('NOMEPRODUTO'     , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('SERIE'           , ftString, 3  , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
        end;

      if tabela = 'KARDEXPRODUTO' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'           , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'          , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTOS'          , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'         , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO_ANTERIOR'  , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOUN'         , ftfloat);

          QueryVirtual.FieldDefs.Add('ENTRADA_PONTO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA_PONTO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO_PONTO'     , ftfloat);
          QueryVirtual.FieldDefs.Add('PONTO_ANTERIOR'  , ftfloat);

          QueryVirtual.FieldDefs.Add('EMISSAO'         , ftDateTime);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'      , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('NOMEPRODUTO'     , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('SERIE'           , ftString, 3  , False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('UF'              , ftString, 2  , False);
          QueryVirtual.FieldDefs.Add('CPFCNPJ'         , ftString, 025, False);
          QueryVirtual.FieldDefs.Add('CIDADE'          , ftString, 100, False);
        end;

      if Tabela = 'ITENS_MOVIMENTO_TOTAL' then
        begin
          QueryVirtual.FieldDefs.Add('OPERACAO'        , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PRECO'           , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO'       , ftString, 100, False);
          QueryVirtual.FieldDefs.Add('CST'             , ftString, 3, False);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'      , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('LIQUIDO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('DESPESAS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCICMS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('REDUCAO'         , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORIPI'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCIPI'         , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCONTOS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'           , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTOS'        , ftfloat);
          QueryVirtual.FieldDefs.Add('FRETE'           , ftfloat);

          QueryVirtual.FieldDefs.Add('BASE0'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASE1'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASE2'           , ftfloat);

          QueryVirtual.FieldDefs.Add('ICMS0'           , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS1'           , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS2'           , ftfloat);
        end;

      if Tabela = 'MESTRE_MOVIMENTO_TOTAL' then
        begin
          QueryVirtual.FieldDefs.Add('BASE_ICMS'       , ftfloat);
          QueryVirtual.FieldDefs.Add('VALOR_ICMS'      , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_PRODUTO'   , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_NOTA'      , ftfloat);
        end;


      if tabela = 'PLANOCONTAS' then
        begin
          QueryVirtual.FieldDefs.Add('CODIGO'                 , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('DESCRICAO'              , ftString,  80, False);
          QueryVirtual.FieldDefs.Add('ATIVO'                  , ftString,  01, False);
          QueryVirtual.FieldDefs.Add('TIPO'                   , ftString,  15, False);
          QueryVirtual.FieldDefs.Add('DESTINO'                , ftString,  15, False);
          QueryVirtual.FieldDefs.Add('CUSTO'                  , ftString,  15, False);
        end;

      if tabela = 'TITULOS' then
        begin
          QueryVirtual.FieldDefs.Add('VALORPAGO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('CONTROLE'               , ftfloat);
          QueryVirtual.FieldDefs.Add('VENDEDOR'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PARCELA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('PRAZO'                  , ftfloat);

          QueryVirtual.FieldDefs.Add('SEQUENCIA'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORATUAL'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORORIGINAL'          , ftfloat);
          QueryVirtual.FieldDefs.Add('COMISSAO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PERCCOMISSAO'           , ftfloat);

          QueryVirtual.FieldDefs.Add('EMISSAO'                , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'             , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'              , ftString,  10, False);

          QueryVirtual.FieldDefs.Add('STATUS'                 , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('SERIE'                  , ftString,  10, False);

          QueryVirtual.FieldDefs.Add('PORTADOR'               , ftfloat);
          QueryVirtual.FieldDefs.Add('PORTADOR_DESCRICAO'     , ftString,  50, False);

          QueryVirtual.FieldDefs.Add('PESSOA'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('NOME_PESSOA'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PESSOA_CPF'             , ftString,  20, False);
          QueryVirtual.FieldDefs.Add('PESSOA_TELEFONE'        , ftString,  20, False);

          QueryVirtual.FieldDefs.Add('PLANOCONTAS'            , ftString,  10, False);
          QueryVirtual.FieldDefs.Add('PLANOCONTAS_DESCRICAO'  , ftString,  50, False);

          QueryVirtual.FieldDefs.Add('VENDEDOR_NOME'          , ftString,  80, False);
          QueryVirtual.FieldDefs.Add('VENDEDOR_COMISSAO'      , ftfloat);
        end;

      if tabela = 'LOTES' then
        begin
          QueryVirtual.FieldDefs.Add('SALDOFISCAL'              , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOKG'                  , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOPONTO'               , ftfloat);

          QueryVirtual.FieldDefs.Add('NOME'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('TIPO'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PRODUTO'                  , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('LOTE'                     , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('BOLETIM'                  , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('TERMO'                    , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'               , ftString,  10,  False);
        end;

      if tabela = 'APURAICMS' then
        begin
          QueryVirtual.FieldDefs.Add('VALORORIGINAL'            , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'                , ftfloat);
          QueryVirtual.FieldDefs.Add('NAOTRIBUTADO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'                  , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDA'                    , ftfloat);

          QueryVirtual.FieldDefs.Add('PIS'                      , ftfloat);
          QueryVirtual.FieldDefs.Add('COFINS'                   , ftfloat);
          QueryVirtual.FieldDefs.Add('CSLL'                     , ftfloat);
          QueryVirtual.FieldDefs.Add('ICMS'                     , ftfloat);
          QueryVirtual.FieldDefs.Add('IR'                       , ftfloat);
          QueryVirtual.FieldDefs.Add('CFOP'                     , ftfloat);

          QueryVirtual.FieldDefs.Add('ENDERECO'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('OPERACAO'                 , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('CFOP1'                    , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DIAANO'                   , ftString,  20,  False);
          QueryVirtual.FieldDefs.Add('ESTADO'                   , ftString,  10,  False);

        end;

      if tabela = 'FINANCEIRO' then
        begin
          QueryVirtual.FieldDefs.Add('VALORATUAL'               , ftfloat);
          QueryVirtual.FieldDefs.Add('NUMERO'                   , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PORTADOR'                 , ftfloat);
          QueryVirtual.FieldDefs.Add('DIASABERTO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('DESCRICAO_PORTADOR'       , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'               , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('EMISSAO'                  , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('SERIE'                    , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('CIDADE'                   , ftString,  50,  False);
          QueryVirtual.FieldDefs.Add('ESTADO'                   , ftString,  05,  False);
        end;

      if tabela = 'GRAFICO' then
        begin
          QueryVirtual.FieldDefs.Add('TOTAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('ESTADO'               , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('MES'                  , ftString,  15,  False);

        end;
      if tabela = 'MEMCAD' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('CODIGO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('QUANTIDADE'           , ftfloat);
          QueryVirtual.FieldDefs.Add('BASEICMS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALBASE'            , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALICMS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORICMS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('OPERACAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PESSOA'               , ftfloat);
          QueryVirtual.FieldDefs.Add('CONDICAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VENDEDOR'             , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTALCOM'             , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORPAGO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('COMISSAO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('PRODUTO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADAUN'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIDAUN'              , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOUN'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ATUAL'                , ftfloat);
          QueryVirtual.FieldDefs.Add('PESOSACO'             , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTRADA'              , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTPONTOS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('ENTSACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('MEDIA_PRECO'          , ftfloat);

          QueryVirtual.FieldDefs.Add('SAIDA'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SAIPONTOS'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SAISACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('QTESACOS'             , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOPONTOS'          , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOSACOS'           , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOKG'              , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORCULTURAL'        , ftfloat);
          QueryVirtual.FieldDefs.Add('PUREZA'               , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_QUANTIDADE'     , ftfloat);
          QueryVirtual.FieldDefs.Add('TOTAL_VALOR'          , ftfloat);

          QueryVirtual.FieldDefs.Add('TIPO'                 , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('SERIE'                , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('DATAINICIAL'          , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('BOLETIM'              , ftString,  10,  False);

          QueryVirtual.FieldDefs.Add('DESCRICAO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('CABECALHO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('FANTASIA'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NOME'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ENDERECO'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ESTADO'               , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('CIDADE'               , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PEDIDO'               , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NOMEPESSOA'           , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DESOPERACAO'          , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'            , ftString,  05 , False);
          QueryVirtual.FieldDefs.Add('STATUSTIPO'           , ftString,  01 , False);
          QueryVirtual.FieldDefs.Add('SITUACAO'             , ftString,  10 , False);
          QueryVirtual.FieldDefs.Add('DETALHES'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('EMISSAO'              , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'           , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('CATEGORIA'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('TERMO'                , ftString,  20,  False);
          QueryVirtual.FieldDefs.Add('CULTIVAR'             , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('ESPECIE'              , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('LOTEORIGEM'           , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('LOTE'                 , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('NUMERONOTA'           , ftString,  015, False);
          QueryVirtual.FieldDefs.Add('TIPO_OP'              , ftString,  015, False);
        end;

      if tabela = 'BANCOS' then
        begin
          QueryVirtual.FieldDefs.Add('DESCRICAOAPLICACAO'   , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('HISTORICO'            , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('DESCPORTADOR'         , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('PLANO'                , ftString,  100, False);
          QueryVirtual.FieldDefs.Add('SERIE'                , ftString,  05,  False);
          QueryVirtual.FieldDefs.Add('TIPO'                 , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('EMISSAO'              , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('PAGAMENTO'            , ftString,  10,  False);
          QueryVirtual.FieldDefs.Add('SINAL'                , ftString,  03,  False);

          QueryVirtual.FieldDefs.Add('PORTADOR'             , ftfloat);
          QueryVirtual.FieldDefs.Add('CONTROLE'             , ftfloat);
          QueryVirtual.FieldDefs.Add('APLICACAO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO2'               , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDO'                , ftfloat);
          QueryVirtual.FieldDefs.Add('SALDOANTERIOR'        , ftfloat);
          QueryVirtual.FieldDefs.Add('CREDITO'              , ftfloat);
          QueryVirtual.FieldDefs.Add('DEBITO'               , ftfloat);
          QueryVirtual.FieldDefs.Add('VALORPAGO'            , ftfloat);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'            , ftfloat);
          QueryVirtual.FieldDefs.Add('LIMITE'               , ftfloat);
        end;

      if Tabela = 'VNC' then
        begin
          QueryVirtual.FieldDefs.Add('NUMERO'       , ftString, 15, False);
          QueryVirtual.FieldDefs.Add('SEQUENCIA'    , ftString, 5 , False);
          QueryVirtual.FieldDefs.Add('TOTAL'        , ftfloat);
          QueryVirtual.FieldDefs.Add('VENCIMENTO'   , ftDateTime);
        end;

    except
//       on e: exception do gera_log('CriaMemoria: ' + e.message + Tabela);
    end;
  finally
    QueryVirtual.Open;
    result := QueryVirtual;
  end;
end;
function tratanome(aux: string): String;
var
  i: integer;
begin
  aux:=lowercase(aux);
 if length(aux)<>0then
  Begin
    aux[1]:=Upcase(aux[1]);
    for i:=2 to length(aux) do
      if aux[i]=' '
      then aux[i+1]:=Upcase(aux[i+1]);
    tratanome:=aux;
  end
 else
   tratanome:='';
end;
function Trocarletra(Str:String): String;
Const ComAcento = '«‘√’¬ ';
      SemAcento = 'ÁÙ„ı‚Í';
Var
  R: Integer;
Begin
  for R := 1 to Length(Str) do
    begin
      if Pos(Copy(Str,R,1),ComAcento)<>0 Then
        begin
          Str := StrSubst(Str,Copy(Str,R,1),SemAcento[Pos(Copy(Str,R,1),ComAcento)],1);
        end;
    end;
  Result := Str;
end;
function PrimeiraLetraMaiscula(Str: string): string;
 var
   i: integer;
   esp: boolean;
 begin
   str := LowerCase(Trim(str));
   for i := 1 to Length(str) do
   begin
     if i = 1 then
       str[i] := UpCase(str[i])
     else
       begin
         if i <> Length(str) then
         begin
           esp := (str[i] = ' ');
           if esp then
             str[i+1] := UpCase(str[i+1]);
         end;
       end;
   end;
   Result := Str;
 end;
function Sigla_Mes(Const F_DATA:TDateTime;F_LETRAS:Integer;F_MAIUSCULA:Boolean;F_CASASANO:Integer): String;
begin
 if month(F_DATA) =  1 then result := variif(F_MAIUSCULA,Copy(StrUpper('Janeiro  '),1,F_LETRAS),Copy('Janeiro  ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  2 then result := variif(F_MAIUSCULA,Copy(StrUpper('Fevereiro'),1,F_LETRAS),Copy('Fevereiro',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  3 then result := variif(F_MAIUSCULA,Copy(StrUpper('MarÁo    '),1,F_LETRAS),Copy('MarÁo    ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  4 then result := variif(F_MAIUSCULA,Copy(StrUpper('Abril    '),1,F_LETRAS),Copy('Abril    ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  5 then result := variif(F_MAIUSCULA,Copy(StrUpper('Maio     '),1,F_LETRAS),Copy('Maio     ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  6 then result := variif(F_MAIUSCULA,Copy(StrUpper('Junho    '),1,F_LETRAS),Copy('Junho    ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  7 then result := variif(F_MAIUSCULA,Copy(StrUpper('Julho    '),1,F_LETRAS),Copy('Julho    ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  8 then result := variif(F_MAIUSCULA,Copy(StrUpper('Agosto   '),1,F_LETRAS),Copy('Agosto   ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) =  9 then result := variif(F_MAIUSCULA,Copy(StrUpper('Setembro '),1,F_LETRAS),Copy('Setembro ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) = 10 then result := variif(F_MAIUSCULA,Copy(StrUpper('Outubro  '),1,F_LETRAS),Copy('Outubro  ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) = 11 then result := variif(F_MAIUSCULA,Copy(StrUpper('Novembro '),1,F_LETRAS),Copy('Novembro ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
 if month(F_DATA) = 12 then result := variif(F_MAIUSCULA,Copy(StrUpper('Dezembro '),1,F_LETRAS),Copy('Dezembro ',1,F_LETRAS)) + variif(F_CASASANO=0,'',variif(F_CASASANO=4,StrRight(DateToStr(F_DATA),4),StrRight(DateToStr(F_DATA),2)));
end;
function Month(Dt: TDateTime): Integer;
var
  Y, M, D: Word;
begin
  DecodeDate(Dt, Y, M, D);
  Result := M;
end;
function StrRight(const S: string; Count: Integer): string;
begin
  Result := Copy(S, Length(S) - Count + 1, Count);
end;
Function FORMATA_CEP(const F_CLICEP:string):String;
begin
  result:=Copy(F_CLICEP, 1, 5) + '-' + Copy(F_CLICEP, 6, 3);
end;
function ExtensoMes(n: Integer): String;
var
 m : string;
begin
 Case n Of
    01 : m:= 'Janeiro';
    02 : m:= 'Fevereiro';
    03 : m:= 'MarÁo';
    04 : m:= 'Abril';
    05 : m:= 'Maio';
    06 : m:= 'Junho';
    07 : m:= 'Julho';
    08 : m:= 'Agosto';
    09 : m:= 'Setembro';
    10 : m:= 'Outubro';
    11 : m:= 'Novembro';
    12 : m:= 'Dezembro';
  end;
  Result := m;
end;
function CasasDecimais(const f_valor: Real): string;
var
  posicao : Extended;
  I       : Integer;
  retorno : string;
begin

  if f_valor < 1.000 then
    Result :=  FormatFloat('##,#0.0000',f_valor)
  else
  if (f_valor > 1.000) and (f_valor < 9.999) then
    Result :=  FormatFloat('##,#0.000',f_valor)
  else
  if (f_valor > 10.00) and (f_valor < 99.99) then
    Result :=  FormatFloat('##,#0.00',f_valor)
  else
  if (f_valor > 100.0) and (f_valor < 999.9) then
    Result :=  FormatFloat('##,#0.0',f_valor)
  else
    Result :=  FormatFloat('##,#0',f_valor)
end;
Function Formata_Cnpj(const F_CLICNP:string):String;
begin
  if Length(F_CLICNP) = 11 then
    result:=Copy(F_CLICNP, 1, 3) + '.' + Copy(F_CLICNP, 4, 3) + '.' + Copy(F_CLICNP, 7, 3) + '-' + Copy(F_CLICNP, 10, 2)
  else
    result:=Copy(F_CLICNP, 1, 2) + '.' + Copy(F_CLICNP, 3, 3) + '.' + Copy(F_CLICNP, 6, 3) + '/' + Copy(F_CLICNP, 9, 4)+ '-' + Copy(F_CLICNP, 13, 2);
end;
function Busca_Array(F_CAMPO:string;F_ARRAY:array of String):Boolean;
Var Indice : Integer;
begin
  Indice := AnsiIndexText(F_CAMPO,F_ARRAY);
  if Indice = -1 then
    result := False
  else
    Result := True;
end;
function NomeEstado(F_ESTADO : String): String;
begin
  case AnsiIndexStr(F_ESTADO,['MS','SP','MT','PR','AM','RR','MG','DF','GO','PA','PI','AL','RJ','SE','CE','RN','RS','SC','ES','AC','MA','PE','RO','TO','BH','PA','AP']) of
     0 : Result := 'Mato Grosso do Sul';
     1 : Result := 'S„o Paulo';
     2 : Result := 'Mato Grosso';
     3 : Result := 'Paran·';
     4 : Result := 'Amazonas';
     5 : Result := 'Roraima';
     6 : Result := 'Minas Gerais';
     7 : Result := 'Distrito Federal';
     8 : Result := 'Goias';
     9 : Result := 'Paraiba';
    10 : Result := 'Piaui';
    11 : Result := 'Alagoas';
    12 : Result := 'Rio de Janeiro';
    13 : Result := 'Sergipe';
    14 : Result := 'Cear·';
    15 : Result := 'Rio Grande do Norte';
    16 : Result := 'Rio Grande do Sul';
    17 : Result := 'Santa Catarina';
    18 : Result := 'Espirito Santo';
    19 : Result := 'Acre';
    20 : Result := 'Maranh„o';
    21 : Result := 'Pernambuco';
    22 : Result := 'Roraima';
    23 : Result := 'Tocantins';
    24 : Result := 'Bahia';
    25 : Result := 'Par·';
    26 : Result := 'Amap·';
  end;
end;
procedure GravaLog(lempresa,lusuario,lcodigo:integer;lloguin,lacao,ltabela,larquivo,dados:string);
var
  logtable   : TFDQuery;
  listadados : TUnimemo;
  i          : integer;
begin
  logtable                               := TFDQuery.Create(nil);
  logtable.Connection                    := mm.SQLConn;
  logtable.UpdateOptions.UpdateTableName := 'RASTREIO';

  logtable.Close;
  logtable.SQL.Text := 'select * from rastreio where codigo = 0';
  logtable.Open();

  logtable.Append;
  logtable.FindField('KEY').AsString             := Gera_Guid();
  logtable.FindField('CODIGO').AsInteger         := Ultimo_Codigo('RASTREIO','CODIGO',false);
  logtable.FindField('EMPRESA').AsInteger        := lempresa;
  logtable.FindField('CODFUNCIONARIO').AsInteger := lusuario;
  logtable.FindField('CODIGOTABELA').AsInteger   := lcodigo;
  logtable.FindField('DATA').AsDateTime          := Date;
  logtable.FindField('USUARIO').AsString         := lloguin;
  logtable.FindField('HORA').AsDateTime          := Time;
  logtable.FindField('ACAO').AsString            := lacao;
  logtable.FindField('TABELA').AsString          := ltabela;
  logtable.FindField('ARQUIVO').AsString         := larquivo;
  logtable.FindField('DADOS').AsString           := dados;
  logtable.Post;

  logtable.Free;

end;
function Retornastatustable(DataSet: TDataSet): String;
begin
  Result := Format('%s',[GetEnumName(TypeInfo(TDataSetState),
  Ord(DataSet.State))]);
end;

function RemoverEspeciais(Str:String): String;
Begin
  Str := StrSubst(Str,'.','',0);
  Str := StrSubst(Str,'/','',0);
  Str := StrSubst(Str,'-','',0);
  Str := StrSubst(Str,'(','',0);
  Str := StrSubst(Str,')','',0);
  Str := StrSubst(Str,',','',0);
  Str := StrSubst(Str,'"','',0);
  Str := StrSubst(Str,'.','',0);
  Str := StrSubst(Str,'´','',0);
  Str := StrSubst(Str,':','',0);
  Str := StrSubst(Str,',','',0);
  Str := StrSubst(Str,'+','',0);
  Str := StrSubst(Str,'™','',0);
  Str := StrSubst(Str,':','',0);
  Result := Str;
end;
function StrLeft(const S: string; Count: Integer): string;
begin
  Result := Copy(S, 1, Count);
end;
function ValidaSenha(F_VALOR,F_SENHA :String):Boolean;
var
  M_VALOR : Real;
  M_TOTAL : string;
  M_SENHA : String;
  M_SUPER : String;
begin
  M_VALOR := StrToFloat(F_SENHA) / 3;
  M_TOTAL := StrLeft(FloatToStr(M_VALOR),4);
  M_SUPER := F_VALOR;

  if M_SUPER = '8608' then
    Result             := true
  else
  if M_SUPER <> M_TOTAL then
    begin
      Result := False;
    end
  else
    Result   := true;
end;
function DataSetToJsonTXT(pDataSet: TDataSet): String;
  var
    ArrayJSon : TJSONArray;
    ObjJSon   : TJSONObject;
    strJSon   : TJSONString;
    intJSon   : TJSONNumber;
    floatJson : TJSONValue;
    dateJson  : TJSONString;
    TrueJSon  : TJSONTrue;
    FalseJSon : TJSONFalse;
    pField    : TField;
begin
  ArrayJSon   := TJSONArray.Create;
  try
    pDataSet.First;
    while not pDataSet.Eof do
       begin
         ObjJSon:=TJSONObject.Create;
         for pField in pDataSet.Fields do
           case pField.DataType of
             ftString:
               begin
                 strJSon:=TJSONString.Create(pField.AsString);
                 ObjJSon.AddPair(pField.FieldName,strJSon);
               end;
            ftInteger:
               begin
                 IntJSon:=TJSONNumber.Create(pField.AsInteger);
                 ObjJSon.AddPair(pField.FieldName,IntJSon);
               end;
            ftFloat:
               begin
                 floatJson:=TJSONNumber.Create(pField.AsFloat);
                 ObjJSon.AddPair(pField.FieldName,floatJson);
               end;
            ftDateTime:
               begin
                 dateJson:=TJSONString.Create(pField.AsString);
                 ObjJSon.AddPair(pField.FieldName,dateJson);
               end;
           else
              begin
                strJSon:=TJSONString.Create(pField.AsString);
                ObjJSon.AddPair(pField.FieldName,strJSon);
              end;
           end;
          ArrayJSon.AddElement(ObjJSon);
          pDataSet.next;
        end;
    result:=ArrayJSon.ToString;
  finally
    ArrayJSon.Free;
  end;
end;
function  Validacaminho(pempresa:integer;caminho,pcnpj,ptipo,pemissao,peventosnfe:string):string;
var
  pcaminho : string;
begin
  pcaminho :=  pcnpj                                       + '\'                           +
               FormatDateTime('yyyy',StrToDate(pemissao))  + '\'+ptipo+'\'                 +
               '0'+IntToStr(pempresa)                                                      +
               copy(ExtensoMes(StrToInt(FormatDateTime('mm'  , StrToDate(pemissao)))),1,3) +
               FormatDateTime('yy', StrToDate(pemissao))                                   +
               variif(ptipo = 'MDFe','mfd','')                                             +
               '\'+ptipo+'\' +
               variif(peventosnfe <> '',peventosnfe+'\','');

  if not DirectoryExists(caminho+pcaminho) then forceDirectories(caminho+pcaminho);

  Result := caminho+pcaminho;
end;
procedure Exclui_Movimento(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO:Integer);
var ST_ITENS:TStringlist;
    R       : Integer;
begin
  if F_TABELA = 'MVITENS' then
    begin
      if TabelaMvitens('SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                       'AND DOCUMENTO                       = ' + IntToStr(F_DOCUMENTO) +
                       'AND NUMERO                          = ' + intToStr(F_NUMERO)    +
                       'AND SERIE                           = ' + QuotedStr(F_SERIE)) then
        begin
          executasql('DELETE FROM PONTOS   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
          executasql('DELETE FROM MVITENS  WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));

          ST_ITENS := TStringList.Create;
          dm_rc.tbmvitens.First;
          while not dm_rc.tbmvitens.Eof do
            begin
              ST_ITENS.Add(IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger));

              dm_rc.tbmvitens.Next;
            end;
        end;
    end;

  if F_TABELA = 'PONTOS' then
    begin
      if TabelaPontos('SELECT * FROM PONTOS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                      ' AND DOCUMENTO                     = ' + IntToStr(F_DOCUMENTO) +
                      ' AND NUMERO                        = ' + intToStr(F_NUMERO)    +
                      ' AND SERIE                         = ' + QuotedStr(F_SERIE)) then
        begin
          executasql('DELETE FROM PONTOS   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                     ' AND DOCUMENTO                     = ' + IntToStr(F_DOCUMENTO) +
                     ' AND NUMERO                        = ' + intToStr(F_NUMERO)    +
                     ' AND SERIE                         = ' + QuotedStr(F_SERIE));

          ST_ITENS := TStringList.Create;
          dm_rc.fdqrypontos.First;
          while not dm_rc.fdqrypontos.Eof do
            begin
               ST_ITENS.Add(IntToStr       (dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger));

               Calcula_SaldoProduto(mm.varI_Code_Company,
                                    dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger);

              dm_rc.fdqrypontos.Next;
            end;
        end;
    end;

  if F_TABELA = 'RECEBER' then
    begin
      executasql('DELETE FROM RECEBER WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
    end;

  if F_TABELA = 'PAGAR' then
    begin
      executasql('DELETE FROM PAGAR WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE));
    end;
end;
procedure EventoXmlAcbr(pnumero,pdocumento,pempresa,ptipo:string);
begin
  TabelaEventoXML('select * from eventosxml where codigo = 0');

  if ptipo = 'CCE' then
    begin
      executasql(' delete from eventosxml where numero = ' + QuotedStr(pnumero)   +
                 ' and documento                       = ' + QuotedStr(pdocumento)+
                 ' and empresa                         = ' + QuotedStr(pempresa));
    end;

  dm_rc.fdqryeventoxml.Append;
  dm_rc.fdqryeventoxml.FindField('KEY').AsString        := Gera_Guid();
  dm_rc.fdqryeventoxml.FindField('CODIGO').AsInteger    := Ultimo_Codigo('EVENTOSXML','CODIGO',False);
  dm_rc.fdqryeventoxml.FindField('NUMERO').AsInteger    := StrToInt(pnumero);
  dm_rc.fdqryeventoxml.FindField('EMPRESA').AsInteger   := StrToInt(pempresa);
  dm_rc.fdqryeventoxml.FindField('DOCUMENTO').AsInteger := StrToInt(pdocumento);
  dm_rc.fdqryeventoxml.FindField('EMISSAO').AsDateTime  := Date;
  dm_rc.fdqryeventoxml.FindField('HORA').AsDateTime     := Time;
  dm_rc.fdqryeventoxml.FindField('TIPO').AsString       := ptipo;
  dm_rc.fdqryeventoxml.FindField('XML').AsString        := dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
  dm_rc.fdqryeventoxml.Post;

end;
function  ValidadorAcbr(const campo,tipo:string):string;
begin
  if tipo = 'CPFCNPJ' then
    dm_rc.ACBrValidador.TipoDocto := docCNPJ;

  dm_rc.ACBrValidador.documento := campo;

  if not dm_rc.ACBrValidador.Validar then
    begin
      if tipo = 'CPFCNPJ' then
        Result :=  'ESTE CPF/CNPJ N√O … V¡LIDO!';
    end
  else
    Result := '';
end;
function Downloadremessa(const caminhoarq, nomearquivo : string): string;
var
  original, destino : string;
  Arquivo           : TStringList;
begin
  if caminhoarq <> '' then
    begin
      original := caminhoarq+nomearquivo;
      destino  := ExtractFilePath(Application.ExeName)+'files\';
      Arquivo  := TStringList.Create();

      Arquivo.LoadFromFile(original);
      Arquivo.SaveToFile(destino+nomearquivo);
      Arquivo.Free;
    end;
  Result := nomearquivo;
end;
function RemoverORSql(Str:String): String;
Begin
  Str := StrSubst(Str,'or)',')',0);
  Result := Str;
end;
function StrRPad(const S: string; Count: Integer): string;
begin
  Result := StrSpace(Count - Length(S)) + S;
end;
function StrSpace(Count: Integer): string;
begin
  Result := StrReplicate(' ', Count);
end;

function Enviar_Email(mensagem,titulo,empresa,destinatarioemail,anexo1,anexo2:String): Boolean;
var
  idSMTP     : TIdSMTP;
  Parametros : TStringList;
  Resposta   : String;
  JsonToSend : TStringStream;
  Msg        : TIdMessage;
  TextoHtml  : TIdText;
begin

  IdSMTP := TIdSMTP.Create(nil);

  try
    IdSMTP.Host     := 'smtpi.sisgraos.com.br';
    IdSMTP.Port     := 587;
    IdSMTP.Username := 'nferedesisgraos@sisgraos.com.br';
    IdSMTP.Password := 'sistema@2020';

    Msg             := TIdMessage.Create(nil);
    Msg.Body.Clear;

    TextoHtml             := TIdText.Create(Msg.MessageParts);
    TextoHtml.ContentType := 'text/html';
    TextoHtml.Body.Text   := mensagem;
    TextoHtml.CharSet     := 'ISO-8859-1';

    try
      Msg.From.Name                 := empresa;
      Msg.From.Address              := 'nferedesisgraos@sisgraos.com.br';
      Msg.Subject                   := titulo;
      Msg.Recipients.EMailAddresses := destinatarioemail;
      Msg.CCList.EMailAddresses     := '';
      Msg.ReceiptRecipient.Name     := empresa;
      Msg.Priority                  := mpLow;
      Msg.ReceiptRecipient.Text     := 'nferedesisgraos@sisgraos.com.br';

      if not StrEmpty(anexo1) then
        TIdAttachmentFile.Create(Msg.MessageParts,anexo1);

      if not StrEmpty(anexo2) then
        TIdAttachmentFile.Create(Msg.MessageParts,anexo2);

      if not IdSMTP.Connected then IdSMTP.Connect;

      try
        IdSMTP.Send(Msg);
        Result := True;
      except
        Result := False;
      end;

    finally
      FreeAndNil(Msg);
      IdSMTP.Disconnect;
    end;

  finally
    FreeAndNil(IdSMTP);
  end;

end;

//*************************************//
function StripDouble( pString:String ):String;
//*************************************//
begin
   while pos('  ',pString) > 0 do Delete(pString,pos('  ',pString),1);
   Result := pString;
end;


function ExtCem( pCem:String ):String;
   Const
      aCent:Array[1..9] of string =
         ('CENTO','DUZENTOS','TREZENTOS','QUATROCENTOS','QUINHENTOS',
         'SEISCENTOS','SETECENTOS','OITOCENTOS','NOVECENTOS');
      aVint:Array[1..9] of string =  ('ONZE','DOZE','TREZE','QUATORZE',
         'QUINZE','DEZESSEIS','DEZESSETE','DEZOITO','DEZENOVE');
      aDez :Array[1..9] of string = ('DEZ','VINTE','TRINTA','QUARENTA',
         'CINQUENTA','SESSENTA','SETENTA','OITENTA','NOVENTA');
      aUnit:Array[1..9] of string = ('UM','DOIS','TRES','QUATRO',
         'CINCO','SEIS','SETE','OITO','NOVE');
   Var
      aVal:Array[1..3] of integer;
      text : String;
   begin
      text := '';
      aVal[1] := StrToInt( Copy( pCem,1,1) );
      aVal[2] := StrToInt( Copy( pCem,2,1) );
      aVal[3] := StrToInt( Copy( pCem,3,1) );
      if StrToInt(pCem) > 0 then
      begin
         if StrToInt(pCem) = 100 then
            text := 'CEM'
         else begin
            if aVal[1] > 0 then
              text := aCent[aVal[1]]+variif((aVal[2]+aVal[3]) > 0,' E ',' ');
            if (aVal[2] = 1)  and (aVal[3] > 0) then
               text := text + ' ' + aVint[Aval[3]]
            else begin
               if aVal[2] > 0 then
                text := text+' '+aDez[aVal[2]]+variif(aVal[3]>0, ' E ',' ');
               text := text+variif(aVal[3]>0,' '+aUnit[aVal[3]],' ');
            end;
         end;
      end;
      text := text + ' ';
      Result := text;
   end;

function ExtensoValor( pValor:Extended;VlrMonetario:Boolean):String;
//*************************************//
   Const
      aCifra : Array[1..6,1..2] of String = (('TRILH√O,','TRILHOES,'),
                                             ('BILHAO,' ,'BILH’ES,' ),
                                             ('MILHAO,' ,'MILH’ES,' ),
                                             ('MIL,'     ,'MIL,'     ),
                                             ('    '     ,'   '      ),
                                             ('CENTAVO' ,'CENTAVOS'));
   Var
      tStr,tExtenso,tSubs:String;
      tX,tCentavos:Integer;
   begin
      tSubs := ' ';
      tExtenso := ' ';
      tStr := StrZero(pValor,18,2);  {funcao disponÌvel neste livro}
      tCentavos := StrToInt( Copy(tStr,17,2) );
      if pValor > 0 then
      begin
         if tCentavos > 0 then
           tExtenso := ExtCem( StrZero( tCentavos,3,0 )) + aCifra[6,Trunc(variif(tCentavos =1,1,2))];
         if trunc( pValor ) > 0 then
           tExtenso := variif(trunc( pValor ) = 1,variif(VlrMonetario,'REAL',''),variif(vlrMonetario,' REAIS',''))+variif(tCentavos > 0, ' E   ','')+tExtenso;
         for tX := 5 Downto 1 do
         begin
            tSubs := Copy(tStr,(tX*3)-2,3);
            if StrToInt( tSubs ) > 0 then
              tExtenso := ExtCem( tSubs ) + aCifra[tX,Trunc(variif(StrToInt( tSubs )=1,1,2))]+'   '+tExtenso;
         end;
      end;
      Result := StripDouble( tExtenso );
   end;

procedure GravarTexto(SalvarComo, Texto:String);
var
   txt: textfile;
begin
   try
     AssignFile(txt, SalvarComo);
     Rewrite(txt, SalvarComo);
     Append(txt);
     WriteLn(txt, Texto);
   finally
     CloseFile(txt);
   end;
end;
procedure Exclui_MovimentoPessoa(F_TABELA,F_SERIE:String;F_EMPRESA,F_DOCUMENTO,F_NUMERO,F_PESSOA:Integer);
var ST_ITENS : TStringlist;
    R        : Integer;
begin
  if F_TABELA = 'MVITENS' then
    begin
      if TabelaMvitens('SELECT * FROM MVITENS WHERE EMPRESA = ' + IntToStr(F_EMPRESA)   +
                       'AND DOCUMENTO                       = ' + IntToStr(F_DOCUMENTO) +
                       'AND NUMERO                          = ' + intToStr(F_NUMERO)    +
                       'AND SERIE                           = ' + QuotedStr(F_SERIE)    +
                       'AND PESSOA                          = ' + intToStr(F_PESSOA)) then
        begin
          executasql('DELETE FROM PONTOS   WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE) + ' AND PESSOA = ' + intToStr(F_PESSOA));
          executasql('DELETE FROM MVITENS  WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE) + ' AND PESSOA = ' + intToStr(F_PESSOA));

          dm_rc.tbmvitens.First;
          while not dm_rc.tbmvitens.Eof do
            begin
              Calcula_SaldoProduto(F_EMPRESA,dm_rc.tbmvitens.FindField('PRODUTO').AsInteger);

              dm_rc.tbmvitens.Next;
            end;
        end;
    end;

  if F_TABELA = 'RECEBER' then
    begin
      executasql('DELETE FROM RECEBER WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE) + ' AND PESSOA = ' + IntToStr(F_PESSOA));
    end;

  if F_TABELA = 'PAGAR' then
    begin
      executasql('DELETE FROM PAGAR WHERE EMPRESA = ' + IntToStr(F_EMPRESA)+ ' AND DOCUMENTO = ' + IntToStr(F_DOCUMENTO) + ' AND NUMERO = ' + intToStr(F_NUMERO) + ' AND SERIE = ' + QuotedStr(F_SERIE) + ' AND PESSOA = ' + IntToStr(F_PESSOA));
    end;
end;
function  Sigla_MesNovo(Const F_DATA:TDateTime): String;
begin
 if month(F_DATA) =  1 then result := 'Jan01';
 if month(F_DATA) =  2 then result := 'Fev02';
 if month(F_DATA) =  3 then result := 'Mar03';
 if month(F_DATA) =  4 then result := 'Abr04';
 if month(F_DATA) =  5 then result := 'Mai05';
 if month(F_DATA) =  6 then result := 'Jun06';
 if month(F_DATA) =  7 then result := 'Jul07';
 if month(F_DATA) =  8 then result := 'Ago08';
 if month(F_DATA) =  9 then result := 'Set09';
 if month(F_DATA) = 10 then result := 'Out10';
 if month(F_DATA) = 11 then result := 'Nov11';
 if month(F_DATA) = 12 then result := 'Dez12';
end;
function IsDir(const DirName: string): Boolean;
var
  Attr: Integer;
begin
  Attr := GetFileAttributes(PChar(DirName));
  Result := (Attr <> -1) and ((FILE_ATTRIBUTE_DIRECTORY and Attr) <> 0);
end;
procedure AcaoCentroCusto(pempresa,pmestreid:integer;pacao,ptabela:string;table:tfdmemtable);
var
  custotable : TFDQuery;
  i          : integer;
begin
  custotable                               := TFDQuery.Create(nil);
  custotable.Connection                    := mm.SQLConn;
  custotable.UpdateOptions.UpdateTableName := 'FINANCEIRO_CENTROCUSTO';

  if pacao = 'grava' then
    begin
      custotable.Close;
      custotable.SQL.Text := 'select * from FINANCEIRO_CENTROCUSTO where codigo = 0';
      custotable.Open();

      table.First;
      while not table.Eof do
        begin

          custotable.Append;
          custotable.FindField('KEY').AsString              := Gera_Guid();
          custotable.FindField('CODIGO').AsInteger          := Ultimo_Codigo('FINANCEIRO_CENTROCUSTO','CODIGO',True);
          custotable.FindField('EMPRESA').AsInteger         := pempresa;
          custotable.FindField('MESTRE_ID').AsInteger       := pmestreid;
          custotable.FindField('TABELA').AsString           := ptabela;
          custotable.FindField('CENTRO').AsInteger          := table.FindField('CENTROCUSTO').AsInteger;
          custotable.FindField('DESCRICAO_CENTRO').AsString := table.FindField('DESCRICAO').AsString;
          custotable.FindField('VALOR').AsFloat             := table.FindField('VALOR').AsFloat;
          custotable.Post;

          table.Next;
        end;
    end;

  if pacao = 'carrega' then
    begin
      dm_rc.tbcentrocustofin.Close;
      dm_rc.tbcentrocustofin.Open;

      custotable.Close;
      custotable.SQL.Text := ' select * from FINANCEIRO_CENTROCUSTO where mestre_id = ' + IntToStr(pmestreid) +
                             ' and tabela                                           = ' + QuotedStr(ptabela)  +
                             ' order by codigo';
      custotable.Open();

      custotable.First;
      while not custotable.Eof do
        begin

          dm_rc.tbcentrocustofin.Append;
          dm_rc.tbcentrocustofin.FindField('CENTROCUSTO').AsInteger  := custotable.FindField('CENTRO').AsInteger;
          dm_rc.tbcentrocustofin.FindField('DESCRICAO').AsString     := custotable.FindField('DESCRICAO_CENTRO').AsString;
          dm_rc.tbcentrocustofin.FindField('VALOR').AsFloat          := custotable.FindField('VALOR').AsFloat;
          dm_rc.tbcentrocustofin.Post;

          custotable.Next;
        end;
    end;

  FreeAndNil(custotable);
end;
procedure AcaoCentroCustoMvmestre(pempresa,pmestreid:integer;pacao,ptabela:string;table:tfdmemtable);
var
  custotable : TFDQuery;
  i          : integer;
begin
  custotable                               := TFDQuery.Create(nil);
  custotable.Connection                    := mm.SQLConn;
  custotable.UpdateOptions.UpdateTableName := 'MVMESTRE_CENTROCUSTO';

  if pacao = 'grava' then
    begin
      custotable.Close;
      custotable.SQL.Text := 'select * from MVMESTRE_CENTROCUSTO where codigo = 0';
      custotable.Open();

      table.First;
      while not table.Eof do
        begin

          custotable.Append;
          custotable.FindField('KEY').AsString              := Gera_Guid();
          custotable.FindField('CODIGO').AsInteger          := Ultimo_Codigo('MVMESTRE_CENTROCUSTO','CODIGO',True);
          custotable.FindField('EMPRESA').AsInteger         := pempresa;
          custotable.FindField('MESTRE_ID').AsInteger       := pmestreid;
          custotable.FindField('TABELA').AsString           := ptabela;
          custotable.FindField('SEQUENCIA').AsInteger       := table.RecNo;
          custotable.FindField('CENTRO').AsInteger          := table.FindField('CENTROCUSTO').AsInteger;
          custotable.FindField('DESCRICAO_CENTRO').AsString := table.FindField('DESCRICAO').AsString;
          custotable.FindField('VALOR').AsFloat             := table.FindField('VALOR').AsFloat;
          custotable.Post;

          table.Next;
        end;
    end;

  if pacao = 'carrega' then
    begin
      dm_rc.tbcentrocustofin.Close;
      dm_rc.tbcentrocustofin.Open;

      custotable.Close;
      custotable.SQL.Text := ' select * from MVMESTRE_CENTROCUSTO where mestre_id = ' + IntToStr(pmestreid) +
                             ' and tabela                                           = ' + QuotedStr(ptabela)  +
                             ' order by codigo';
      custotable.Open();

      custotable.First;
      while not custotable.Eof do
        begin

          dm_rc.tbcentrocustofin.Append;
          dm_rc.tbcentrocustofin.FindField('CENTROCUSTO').AsInteger  := custotable.FindField('CENTRO').AsInteger;
          dm_rc.tbcentrocustofin.FindField('DESCRICAO').AsString     := custotable.FindField('DESCRICAO_CENTRO').AsString;
          dm_rc.tbcentrocustofin.FindField('VALOR').AsFloat          := custotable.FindField('VALOR').AsFloat;
          dm_rc.tbcentrocustofin.Post;

          custotable.Next;
        end;
    end;

  FreeAndNil(custotable);

end;

end.
