unit uMenu_BASICS;

interface

procedure rc_BuildMenu_BASICS ;


implementation

uses uconsts, MainModule, system.sysutils, untdm_rc, mkm_menus, mkm_procedures;

procedure rc_BuildMenu_BASICS ;
var
   iSeqMenu,
   iSeqMenuPermission : Integer;
begin
     SetLength( mm.varA_MenuBasics, 200 );
     SetLength( mm.varA_MenuBasicsPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;
     // v. 3.2.0.0
     // este recurso ainda é experimental. Ainda não obtive sucesso para evitar que esta opção recebe o HOVER
     // this feature is still experimental. I haven't been successful yet to prevent this option from receiving HOVER


     //**********************************************************************//
     // ADMINISTRAÇÃO
     //**********************************************************************//
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'ADMINITRAÇÃO'                                      , ''                      , '' ,'', 'fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Cadastros'                                         , ''                      , '', '', 'fa-book' );

     rc_BuildMenuItem(mm.varA_MenuBasics, iSeqMenu, 0,  'Suporte Sisgrãos'  , ''                            , '', 'SUPORTESISGRAOS'                             , 'fa-headset' );


     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'pessoas','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Pessoas'                                         , 'pessoas'               , '', '', 'fa-book' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'produtos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Produtos'                                        , 'produtos'              , '', '', 'fa-book' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'pontos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Estoque'                                         , 'pontos'               , '', '', 'fa-user-edit' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'transportes','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Transportes'                                     , 'transportes'           , '', '', 'fa-book' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'funcionarios','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Funcionários'                                    , 'funcionarios'          , '', '', 'fa-book' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'empresas','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Empresa'                                         , 'empresas'              , '', '', 'fa-book' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Tabelas'               , ''                        , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'condicoes','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Condições Pgto'        , 'condicoes'             , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'portadores','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Instituição Bancária'  , 'portadores'            , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'planocontas','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Plano de Contas'       , 'planocontas'           , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'historico','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Histórico'             , 'historico'             , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'carteira','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Carteira'              , 'carteira'              , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'operacoes','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Cadastro CFOP'         , 'operacoes'             , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'escritas','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Escrita CFOP'          , 'escritas'              , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'parametrosoperacao','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Parâmetros Operação'   , 'parametrosoperacao'    , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'centrocusto','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Centro de Custo'       , 'centrocusto'           , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'documentos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Documentos'            , 'documentos'            , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'aplicacao','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Aplicação'             , 'aplicacao'             , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'regiao','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Região'                , 'regiao'                , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'medidas','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Medidas'               , 'medidas'               , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'indicativo','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Indicativo'         , 'indicativo'               , '', '', 'fa-table' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'grupos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Grupos'             , 'grupos'                   , '', '', 'fa-table' );


     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Financeiro'            , ''                        , '', '', 'fa-money-bill' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'receber','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Contas a Receber'      , 'receber'               , '', '', 'fa-money-bill' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'pagar','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Contas a Pagar'        , 'pagar'                 , '', '', 'fa-money-bill' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Baixas Financeira'     , ''                        , '', '', 'fa-comment-dollar' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'baixareceber','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Baixas a Receber'      , ''                      , '', 'baixareceber', 'fa-comment-dollar' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'baixapagar','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Baixas a Pagar'        , ''                      , '', 'baixapagar'  , 'fa-comment-dollar' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Bancos'                , ''                        , '', '', 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'bancos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Lançamento Bancário'   , 'bancos'                , '', '', 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'caixadiario','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Caixa Diário'          , ''                      , '', 'caixadiario'          , 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'extratobancario','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Extrato Bancário'      , ''                      , '', 'extratobancario'      , 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'planocontasindividual','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Extrato Plano de Contas'       , ''              , '', 'planocontasindividual', 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'planocontasanalitico','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Plano Analítico'        , ''                     , '', 'planocontasanalitico' , 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'planocontasresumo','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Resumo Plano'     , ''                           , '', 'planocontasresumo'    , 'fa-university' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'bancoresumo','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Resumo de Bancos'              , ''              , '', 'bancoresumo'          , 'fa-university' );

     //**********************************************************************//
     // VENDAS
     //**********************************************************************//

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'VENDAS'                        , ''                          , '' ,'', 'fa-sitemap' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'orcamento','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Orçamento'                  , '', '', 'orcamento'          , 'fa-file-invoice' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'pedidos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Pedido'                     , '', '', 'pedidos'            , 'fa-file-invoice' );


     //**********************************************************************//
     // FATURAMENTO
     //**********************************************************************//

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'FATURAMENTO'                     , ''                               , '' ,'', 'fa-sitemap' );
//       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'PDV'           , '', ''    , 'pdv', 'fa-boxes', True );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'notaentrada','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Nota Entrada'               , '', '', 'notaentrada'           , 'fa-file-invoice' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'cupomeletronico','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Cupom NFCe'                    , '', '', 'cupomeletronico'        , 'fa-file-contract' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'notaeletronica','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Nota Eletrônica'               , '', '', 'notaeletronica'         , 'fa-box-open' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'manifesto','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Manifesto Eletrônico'          , '', '', 'manifesto'              , 'fa-box-open' );

     //**********************************************************************//
     // CONSULTAS
     //**********************************************************************//

    rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'CONSULTAS'                  , ''                  , '' ,'','fa-archive' );
    if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'consultakardexproduto','ACESSAR') = 'T' then
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Kardex Produto'                  , ''            , '', 'consultakardexproduto'       , 'fa-truck-loading' );
    if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'consultaestoque','ACESSAR') = 'T' then
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Consulta Estoque'                , ''            , '', 'consultaestoque'             , 'fa-truck-loading' );


     //**********************************************************************//
     // RELATORIOS
     //**********************************************************************//
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'RELATÓRIOS'            , ''        , '' , '','fa-file-pdf' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Faturamento'           , ''        , '' , '', 'fa-dollar-sign' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'RELATORIOS','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Notas Emitidas'        , '', ''    , 'RELATORIOS', 'fa-dollar-sign', True );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'relatorioprodutopessoa','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Produto por Pessoa'        , '', ''    , 'relatorioprodutopessoa', 'fa-boxes', True );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'relatorioqtdeproduto','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Total por produto'      , '', ''    , 'relatorioqtdeproduto', 'fa-boxes', True );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Estoque'                 , ''        , '' , '', 'fa-boxes' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'relatorio_produtos','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Relatório Produto'        , '', ''    , 'relatorio_produtos', 'fa-boxes', True );
     //**********************************************************************//
     // CONTABILIDADE
     //**********************************************************************//
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'CONTABILIDADE'                                   , '', ''    ,''                              ,'fa-calculator' );
     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'arquivoxml','ACESSAR') = 'T' then
       rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Arquivo(s) XML'         , ''                   , '', 'arquivoxml'   , 'fa-file-code' );

     SetLength( mm.varA_MenuBasics, iSeqMenu );
     SetLength( mm.varA_MenuBasicsPermissions, iSeqMenuPermission );

end;


end.

