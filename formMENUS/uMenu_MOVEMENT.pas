unit uMenu_MOVEMENT;

interface

procedure rc_BuildMenu_MOVEMENT ;


implementation


uses uconsts, MainModule, mkm_menus;


procedure rc_BuildMenu_MOVEMENT ;
var
   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuMovement, 200 );
     SetLength( mm.varA_MenuMovementPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;
{
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 1, 'VENDAS'                        , ''                               , '' ,'', 'fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Orçamento(s)'                  , '', '', 'orcamentotemperfarma'   , 'fa-box-open' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Produtos'                      , 'produtos'              , '', '', 'fa-book' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Condições Pgto'                , 'condicoes'             , '', '', 'fa-table' );

     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 1, 'MOVIMENTO'                     , ''                               , '' ,'', 'fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Orçamento(s)'                  , '', '', 'orcamentotemperfarma'   , 'fa-box-open' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Nota Eletrônica'               , '', '', 'notaeletronica'         , 'fa-box-open' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Manifesto Eletrônico'          , '', '', 'manifesto'              , 'fa-box-open' );

     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 1, mm.MNU_MOVEMENT           , '', '', '', 'fa-dollar-sign' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Orçamento(s)'            , '', '', 'orcamento'          , 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Pedido(s)'               , '', '', 'pedidos'            , 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Nota Eletrônica'         , '', '', 'notaeletronica'     , 'fas-dot-circle' );
    }

//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'ENTRADAS'                , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Compras'                 , 'compras', '', '', '',false, false, false, false );

     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'SAÍDAS'                  , '', '', '', '' );
     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Ordem de Serviço'        , 'oses', '', '', '' );
     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'PDV'                   , 'oses', '', 'PDV', '' );

//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'FINANCEIRO'              , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Movimento de Caixa'       , 'movcaixa', '', '', '' );

//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'ADMINISTRATIVO'          , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Recibos'                 , 'recibos', '', '', '' );

     SetLength( mm.varA_MenuMovement, iSeqMenu );
     SetLength( mm.varA_MenuMovementPermissions, iSeqMenuPermission );

end;


end.

