unit uMenu_TOOLS;

interface

procedure rc_BuildMenu_TOOLS ;


implementation


uses uconsts, MainModule, mkm_menus, mkm_procedures;


procedure rc_BuildMenu_TOOLS ;
var

   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuTools, 200 );
     SetLength( mm.varA_MenuToolsPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 1, mm.MNU_TOOLS              , '', '', '', 'fa-wrench' ); 
     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 2, 'CONFIGURAÇÕES'           , '', '', '', 'fas-cog' );

     if Verifica_Permissao(mm.varI_Code_Company,mm.varI_User,'Faturamento','ACESSAR') = 'T' then
       begin
         rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'Rastreio do Usuario'     , 'rastreio'   , '', '', 'fas-user-ninja' );
         rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'Lista do Menu'           , 'menusistema', '', '', 'fas-user-ninja' );
       end;

     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'Usuários'                , 'usuarios', '', '', 'fas-user-cog', false, false, true, false );   // parametro do GUS // v. 3.2.0.1
        rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );
        rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, 'Permission:Master' ); // v. 3.2.0.1
        rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, 'Permission:All' );    // v. 3.2.0.1

//     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 2, 'VERSÕES'                 , '', '', '', 'fas-code-branch' );
//     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'Histórico de Versões'    , '', '', 'link:https://radcore.pro.br/web/atualizacoes/', '' );

     SetLength( mm.varA_MenuTools, iSeqMenu );
     SetLength( mm.varA_MenuToolsPermissions, iSeqMenuPermission );

     //--------------

end;


end.
