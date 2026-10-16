unit mkm_relatorios;

interface

function RELATORIO_ESTOQUE_LOTE(const etipo,elote,eboletim:string;eproduto,eempresa:integer):string;
function EXTRATO_BANCARIO_BANCO(const eempresa,ebanco:integer;dataini,datafin:TDateTime):string;

function RELATORIO_VENDASPERIODO   (const rempresa:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
function RELATORIO_LOTEBAS         (const rempresa:integer;rprodutoini,rprodutofin,rsaldos,ropcoes,rcategoria:string):string;
function RELATORIO_OSESTOQUE       (const rempresa,rnumero,rdocumento:integer):string;
function ESCRITA_KARDEXPRODUTO     (const rempresa,rproduto,rtipo:integer;dataini,datafin:string):string;
function ESCRITA_VENDASPORPRODUTO  (const rempresa,rtipo:integer;rpessoaini,rpessoafin,rdataini,rdatafin:string):string;

function ESCRITA_VENDASTOTALQTDEPRODUTO  (const rempresa,rtipo:integer;rpessoaini,rpessoafin,rdataini,rdatafin:string):string;

function XML_SAIDAS                (const rempresa:integer;dataini,datafin:TDateTime):string;
function XML_MANIFESTO             (const rempresa:integer;dataini,datafin:TDateTime):string;

function CARREGA_PERMISSAOZERADA():string;
implementation

uses MainModule, System.SysUtils, mkm_func_web, Vcl.Clipbrd, mkm_funcoes;

function RELATORIO_ESTOQUE_LOTE(const etipo,elote,eboletim:string;eproduto,eempresa:integer):string;
var
  escrita:string;
begin
{
  if etipo = 'Saco' then
    begin
      escrita :=
      ' select                                                                                         ' +
      ' (row_number() over (order by rl.numero, rl.data)) as sequencia,                                ' +
      '  rl.operacao_op,rl.entrada_saida,rl.data, rl.numero, rl.serie, rl.pessoa, rl.nome, rl.estado,  ' +
      '  case when rl.entrada_saida = 0 then cast(rl.quantidade               as numeric(15,2)) else 0 end Entrada,           ' +
      '  case when rl.entrada_saida = 1 then cast(rl.qtepeso                  as numeric(15,2)) else 0 end Saida,             ' +
      ' sum(case when rl.entrada_saida = 0 then cast(rl.quantidade  as numeric(15,2)) else 0 end -                                                   ' +
      '     case when rl.entrada_saida = 1 then cast(rl.qtepeso     as numeric(15,2)) else 0 end) over(order by rl.numero,rl.data, sequencia) saldo, ' +
      ' sum(case when rl.entrada_saida = 0 then cast(rl.quantidade  as numeric(15,2)) else 0 end -     ' +
      '     case when rl.entrada_saida = 1 then cast(rl.qtepeso     as numeric(15,2)) else 0 end)      ' +
      '     over(order by rl.numero,rl.data, sequencia) / rl.pesosaco sacos                            ' +
      '                                                                                                ' +
      ' FROM relatorio_lotes rl                                                                        ' +
      ' where rl.lotesemente                                                               =           ' + QuotedStr(elote)    +
      ' and   rl.boletim                                                                   =           ' + QuotedStr(eboletim) +
      ' and   rl.produto                                                                   =           ' + IntToStr(eproduto)  +
      ' and   rl.empresa                                                                   =           ' + IntToStr(eempresa)  +
      ' and   rl.cancelada <>                                                                          ' + QuotedStr('C')      +
      ' order by rl.numero,rl.data,sequencia                                                                               ';
    end
  else
  }
    begin
      escrita :=
      ' select                                                                                         ' +
      ' (row_number() over (order by rl.numero, rl.data)) as sequencia,                                ' +
      '  rl.operacao_op,rl.entrada_saida,rl.data, rl.numero, rl.serie, rl.pessoa, rl.nome, rl.estado,  ' +
      '  case when rl.entrada_saida = 0 then rl.quantidade else 0 end Entrada,                         ' +
      '  case when rl.entrada_saida = 1 then rl.quantidade else 0 end Saida,                           ' +
      '  sum(rl.quantidade * decode(rl.entrada_saida,0,1,-1)) over(order by rl.numero,rl.data, sequencia) saldo             ' +
      ' FROM relatorio_lotes rl                                                                        ' +
      ' where rl.lotesemente                                                               =           ' + QuotedStr(elote)    +
      ' and   rl.boletim                                                                   =           ' + QuotedStr(eboletim) +
      ' and   rl.produto                                                                   =           ' + IntToStr(eproduto)  +
      ' and   rl.empresa                                                                   =           ' + IntToStr(eempresa)  +
      ' and   rl.cancelada <>                                                                          ' + QuotedStr('C')      +
      ' order by rl.numero,rl.data,sequencia                                                                               ';
    end;

  Result := escrita;
end;
function EXTRATO_BANCARIO_BANCO(const eempresa,ebanco:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            'select                                                                                                     '+
            '  ss.tipo,ss.portador,ss.pagamento,                                                                        '+
            '  ss.serie,                                                                                                '+
            '  ss.sequencia,                                                                                            '+
            '  ss.historico,                                                                                            '+
            '  ss.saldo - ss.credito + ss.debito as saldo_anterior,                                                     '+
            '  ss.credito,                                                                                              '+
            '  ss.debito,                                                                                               '+
            '  ss.saldo                                                                                                 '+
            'from                                                                                                       '+
            '  (                                                                                                        '+
            'select                                                                                                     '+
            '  mb.tipo,mb.portador, mb.pagamento, mb.serie, mb.sequencia, mb.historico,                                                      '+
            '   case when mb.tipo = '+QuotedStr('Entrada')+'  then mb.valorpago else 0 end Credito,                                    '+
            '   case when mb.tipo = '+QuotedStr('Saida')  +'  then mb.valorpago else 0 end Debito,                                      '+
            '  sum(mb.valorpago * decode(mb.tipo,'+QuotedStr('Entrada')+',1,-1)) over(order by mb.pagamento, mb.sequencia) saldo       '+
            'from                                                                                                       '+
            '  bancos mb                                                                                                '+
            'where                                                                                                      '+
            '     mb.portador                 =                                                                         '+ IntToStr(ebanco)                          +
            'and  mb.pagamento between                                                                                  '+ QuotedStr(DataPonto(DateToStr(dataini)))  +
            'and                                                                                                        '+ QuotedStr(DataPonto(DateToStr(datafin)))  +
            'and mb.empresa                   =                                                                         '+ IntToStr(eempresa)                        +
            'order by mb.pagamento, mb.sequencia) ss                                                                    ';

  Result := escrita;
end;
function RELATORIO_VENDASPERIODO(const rempresa:integer;rdataini,rdatafin,rpessoaini,rpessoafin,rtipo,rordem,rstatus,rvendas,rdevolucao,rvendasef,rbonifica,rtroca,routros:string):string;
var
   M_SITUACAO,
   M_ORDEM,
   M_SQL,
   sql_or,
   sql_vendas,
   sql_bonificacao,
   sql_devolucao,
   sql_troca,
   sql_vendaef,
   sql_outros    :string;
begin
  sql_or     :=
                ' AND ('                                    +
                variif(rvendas      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Vendas')      + ') or','') +
                variif(rbonifica    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Bonificacao') + ') or','') +
                variif(rdevolucao   = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Devolucao')   + ') or','') +
                variif(rtroca       = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Troca')       + ') or','') +
                variif(rvendasef    = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Venda EF')    + ') or','') +
                variif(routros      = 'T','(OPERACOES.OPERACAO_OP      = ' + QuotedStr('Outros')      + ') or','') +
                ')';


  case StrToInt(rordem) of
    0 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.NUMERO';
    1 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.PESSOA';
    2 : M_ORDEM := 'ORDER BY MVMESTRE.OPERACAO, MVMESTRE.EMISSAO';
  end;


  case StrToInt(rtipo) of

    0 : M_SQL :=   ' SELECT * FROM MVMESTRE, OPERACOES, PESSOAS      ' +
                   ' WHERE MVMESTRE.EMISSAO BETWEEN                  ' + QuotedStr(dataponto(rdataini)) +
                   ' AND                                             ' + QuotedStr(dataponto(rdatafin)) +
                   ' AND MVMESTRE.PESSOA = PESSOAS.CODIGO            ' +
                   ' AND OPERACOES.codigo        = MVMESTRE.operacao ' +
                   ' AND MVMESTRE.PESSOA BETWEEN                     ' + QuotedStr(rpessoaini)     +
                   ' AND                                             ' + QuotedStr(rpessoafin)     +
                   ' AND MVMESTRE.EMPRESA        =                   ' + IntToStr(rempresa)        +
                   ' AND ((MVMESTRE.DOCUMENTO = '+QuotedStr('1')+') or (MVMESTRE.DOCUMENTO = '+QuotedStr('2')+'))'+
                   variif(rstatus = '0',' AND MVMESTRE.CANCELADA      <> ' + QuotedStr('C')           + sql_or,
                                    ' AND MVMESTRE.CANCELADA          =  ' + QuotedStr('C'))          +
                   M_ORDEM;
  end;

  result := RemoverORSql(M_SQL);
end;
function RELATORIO_LOTEBAS      (const rempresa:integer;rprodutoini,rprodutofin,rsaldos,ropcoes,rcategoria:string):string;
var
  M_SQL                  : string;
  opcoes,saldos,categoria:string;
begin
  case StrToInt(rsaldos) of
    0 : saldos := ' AND DISPONIVEL > 0 ';
    1 : saldos := ' AND DISPONIVEL < 0 ';
    2 : saldos := ' AND DISPONIVEL = 0 ';
    3 : saldos := ' ';
  end;

  case StrToInt(ropcoes) of
    0 : opcoes := ' AND TIPO = ' + QuotedStr('Aguarde');
    1 : opcoes := ' AND TIPO = ' + QuotedStr('Entrada');
    2 : opcoes := ' AND TIPO = ' + QuotedStr('Saida');
    3 : opcoes := ' AND TIPO = ' + QuotedStr('Fiscal');
    4 : opcoes := ' ';
  end;

  M_SQL := ' SELECT * FROM SEMENTES WHERE EMPRESA = ' + IntToStr(rempresa)    +
           ' AND PRODUTO BETWEEN                    ' + QuotedStr(rprodutoini)+
           ' AND                                    ' + QuotedStr(rprodutofin)+
           ' AND CATEGORIA                        = ' + QuotedStr(rcategoria) +
           opcoes + saldos + ' order by PRODUTO';

  Result := M_SQL;
end;
function CARREGA_PERMISSAOZERADA():string;
var
  escrita : string;
begin
  escrita :=
            '  select                                        ' +
            '    M.menu,                                     ' +
            '    M.tabela                                    ' +
            '  from  menusistema m                           ' +
            '  order by m.menu                               ';

  Result := escrita;
end;
function RELATORIO_OSESTOQUE    (const rempresa,rnumero,rdocumento:integer):string;
var
  escrita : string;
begin
  escrita :=
  ' select                                                                        ' +
  '   comp.produto,                                                               ' +
  '   comp.qtdecomposicao * comp.qtdeitens as quantidade                          ' +
  ' from                                                                          ' +
  '   (                                                                           ' +
  '     select                                                                    ' +
  '       ci.produto,                                                             ' +
  '       sum(ci.quantidade) as qtdecomposicao,                                   ' +
  '       sum(m.quantidade)  as qtdeitens                                         ' +
  '     from                                                                      ' +
  '       composicaoitens ci inner join composicao c on (c.codigo  = ci.mestre)   ' +
  '                          inner join mvitens    m on (m.produto = c.produto)   ' +
  '     where m.documento =                                                       ' + IntToStr(rdocumento) +
  '     and   m.numero    =                                                       ' + IntToStr(rnumero)    +
  '     and   m.empresa   =                                                       ' + IntToStr(rempresa)   +
  '     group by 1                                                                ' +
  '     order by ci.produto) comp                                                 ' +
  ' order by quantidade desc                                                      ';

  Result := escrita;
end;
function ESCRITA_KARDEXPRODUTO           (const rempresa,rproduto,rtipo:integer;dataini,datafin:string):string;
var
  escrita : string;
begin
escrita :=
  'select                                                                       ' +
  '  p.numero,                                                                  ' +
  '  p.serie,                                                                   ' +
  '  p.emissao,                                                                 ' +
  '  p.operacao,                                                                ' +
  '  op.operacao_op,                                                            ' +
  '  p.pessoa,                                                                  ' +
  '  pp.nome,                                                                   ' +
  '  p.uf,                                                                      ' +
  '  case when op.entrada_saida = 0 then p.quantidade else 0  end Entrada,      ' +
  '  case when op.entrada_saida = 1 then p.quantidade else 0  end Saida         ' +
  'from                                                                         ' +
  '  mvitens p inner join operacoes op on (p.operacao = op.codigo)              ' +
  '            inner join pessoas   pp on (p.pessoa   = pp.codigo)              ' +
  'where p.produto =                                                            ' + IntToStr(rproduto)            +
  'and   p.empresa =                                                            ' + IntToStr(rempresa)            +
  'and   op.estoque <>                                                          ' + QuotedStr('2')                +
  'and   p.emissao  between                                                     ' + QuotedStr(DataPonto(dataini)) +
  'and                                                                          ' + QuotedStr(DataPonto(datafin)) +
   variif(rtipo = 0,' and (p.documento = 1 or p.documento = 2) ' +
                    ' and  p.cancelada                      <> ' + QuotedStr('C'),
                    ' and  p.documento not in (1,2,3)')          +
  'order by p.emissao,p.numero                                                     ';

  result := escrita;
end;

function XML_SAIDAS            (const rempresa:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select NUMERO,                                                                      ' +
            '  SERIE,                                                                              ' +
            '  DOCUMENTO,                                                                          ' +
            '  CODIGOBARRAS,                                                                       ' +
            '  EMISSAO,                                                                            ' +
            '  CANCELADA                                                                           ' +
            '   FROM MVMESTRE left join OPERACOES ON (OPERACOES.CODIGO = MVMESTRE.OPERACAO)        ' +
            '  WHERE OPERACOES.ENTRADA_SAIDA   = '+QuotedStr('1')+'                                ' +
            '  AND   MVMESTRE.DOCUMENTO        = '+QuotedStr('1')+'                                ' +
            '  AND   MVMESTRE.CANCELADA        = '+QuotedStr('A')+'                                ' +
            '  AND   MVMESTRE.EMPRESA          = '+IntToStr(rempresa) +'                           ' +
            '  AND   MVMESTRE.EMISSAO BETWEEN    '+QuotedStr(DataPonto(DateToStr(dataini))) + '    ' +
            '  AND                               '+QuotedStr(DataPonto(DateToStr(datafin))) + '    ' +
            '  ORDER BY MVMESTRE.NUMERO                    ';

  Result := escrita;
end;

function XML_MANIFESTO            (const rempresa:integer;dataini,datafin:TDateTime):string;
var
  escrita : string;
begin
  escrita :=
            '  select NUMERO,                                                                      ' +
            '  SERIE,                                                                              ' +
            '  DOCUMENTO,                                                                          ' +
            '  CODIGOBARRAS,                                                                       ' +
            '  EMISSAO,                                                                            ' +
            '  CANCELADA                                                                           ' +
            '   FROM MFMESTRE                                                                      ' +
            '  WHERE MFMESTRE.DOCUMENTO        = '+QuotedStr('20')+'                               ' +
            '  AND   ((MFMESTRE.CANCELADA      = '+QuotedStr('A')+') OR (MFMESTRE.CANCELADA = '+QuotedStr('E')+')) ' +
            '  AND   MFMESTRE.EMPRESA          = '+IntToStr(rempresa) +'                           ' +
            '  AND   MFMESTRE.EMISSAO BETWEEN    '+QuotedStr(DataPonto(DateToStr(dataini))) + '    ' +
            '  AND                               '+QuotedStr(DataPonto(DateToStr(datafin))) + '    ' +
            '  ORDER BY  MFMESTRE.NUMERO                    ';

  Result := escrita;
end;
function ESCRITA_VENDASTOTALQTDEPRODUTO  (const rempresa,rtipo:integer;rpessoaini,rpessoafin,rdataini,rdatafin:string):string;
var
  escrita : string;
begin
  escrita :=
            ' SELECT                                                           ' +
            '     i.produto,                                                   ' +
            '     avg(i.preco) as MEDIA_PRECO,                                 ' +
            '     SUM(COALESCE(i.quantidade, 0)) AS total_quantidade,          ' +
            '     SUM(COALESCE(i.total, 0))      AS total_valor                ' +
            ' FROM                                                             ' +
            '     mvitens i                                                    ' +
            ' INNER JOIN                                                       ' +
            '     operacoes op ON i.operacao = op.codigo                       ' +
            ' WHERE                                                            ' +
            '     i.produto between ' + QuotedStr(rpessoaini) + ' and ' + QuotedStr(rpessoafin) +
            '     AND i.empresa =   ' + IntToStr(rempresa)    +                     ' ' +
            '     AND op.estoque <> 2                                          ' +
            '     AND i.emissao BETWEEN ' + QuotedStr(DataPonto(rdataini)) +   ' ' +
            '     AND ' + QuotedStr(DataPonto(rdatafin)) +                     ' ' +
            variif(rtipo = 0,
                   ' AND i.documento = 1 AND i.cancelada <> ' + QuotedStr('C'),
                   ' AND i.documento = 4') +                                   ' ' +
            ' GROUP BY                                                         ' +
            '     i.produto                                          ' +
            ' ORDER BY                                                         ' +
            '     i.produto ASC, total_quantidade ASC                          '
            ;

  Result := escrita;

end;
function ESCRITA_VENDASPORPRODUTO(const rempresa,rtipo:integer;rpessoaini,rpessoafin,rdataini,rdatafin:string):string;
var
  escrita : string;
begin
  escrita :=
            ' SELECT                                                           ' +
            '     i.pessoa,                                                    ' +
            '     i.produto,                                                   ' +
            '     avg(i.preco) as MEDIA_PRECO,                                 ' +
            '     SUM(COALESCE(i.quantidade, 0)) AS total_quantidade,          ' +
            '     SUM(COALESCE(i.total, 0))      AS total_valor                ' +
            ' FROM                                                             ' +
            '     mvitens i                                                    ' +
            ' INNER JOIN                                                       ' +
            '     operacoes op ON i.operacao = op.codigo                       ' +
            ' INNER JOIN                                                       ' +
            '     pessoas pp ON i.pessoa = pp.codigo                           ' +
            ' WHERE                                                            ' +
            '     i.pessoa BETWEEN '+QuotedStr(rpessoaini)+' and '+QuotedStr(rpessoafin)+'                         ' +
            '     AND i.empresa = ' + IntToStr(rempresa) +                     ' ' +
            '     AND op.estoque <> 2                                          ' +
            '     AND i.emissao BETWEEN ' + QuotedStr(DataPonto(rdataini)) +   ' ' +
            '     AND ' + QuotedStr(DataPonto(rdatafin)) +                     ' ' +
            variif(rtipo = 0,
                   ' AND ((i.documento = 1) OR (i.documento = 2)) AND i.cancelada <> ' + QuotedStr('C'),
                   ' AND i.documento = 4') +                                   ' ' +
            ' GROUP BY                                                         ' +
            '     i.pessoa, i.produto                                          ' +
            ' ORDER BY                                                         ' +
            '     i.pessoa ASC, total_quantidade ASC                           '
            ;

  Result := escrita;
end;
end.
