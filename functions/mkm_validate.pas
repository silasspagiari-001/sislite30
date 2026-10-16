unit mkm_validate; // 3.2.0.7


interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics, RegularExpressions,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
function rc_FormValidate( pFormFrame : TObject; pClear : boolean = false ) : boolean;

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout;

//showdelphi
function IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not CharInSet( s[i] , ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.'] ) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

function IsValidCpfCnpj( pCpf : boolean; Numero : String) : Boolean;
Var
  i,d,b,
  Digito : Byte;
  Soma : Integer;
  CNPJ : Boolean;
  DgPass,
  DgCalc : String;
begin
  Result := False;
  Numero := ReturnNumbers(Numero);
  // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
//  Case Length(Numero) of
//    11: CNPJ := False;
//    14: CNPJ := True;
//  else Exit;
//  end;
  CNPJ := not pCpf;
  // Separa o número do digito
  DgCalc := '';
  DgPass := Copy(Numero,Length(Numero)-1,2);
  Numero := Copy(Numero,1,Length(Numero)-2);
  // Calcula o digito 1 e 2
  For d := 1 to 2 do begin
    B := varIIF(D=1,2,3); // BYTE
    SOMA := varIIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);
    for i := Length(Numero) downto 1 do begin
      Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;
      Inc(b);
      If (b > 9) And CNPJ Then
        b := 2;
    end;
   Digito := 11 - Soma mod 11;
   If Digito >= 10 then
     Digito := 0;
   DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;
  Result := DgCalc = DgPass;
end;

function IsValidIP( pIP : string ) : boolean;
var
   ipRegExp : string;
begin
    ipRegExp := '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';

    Result := TRegEx.IsMatch( pIP, ipRegExp ) ;
end;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
var
   FS: TFormatSettings;
   dDt : TDateTime;
begin
  Result := false;

  Case pType of
       vtNotBlank : Result := pContent <> EmptyStr;

       vtIP       : Result := TRegEx.IsMatch( pContent, RegEx_IP4 ) ;//IsValidIP( pContent );

       vtEmail    : Result := TRegEx.IsMatch( pContent, RegEx_EMAIL ) ;//IsValidEmail( pContent );

       vtPASS     : Result := TRegEx.IsMatch( pContent, RegEx_PASS ) ;//IsValidEmail( pContent );

       vtCPF,
       vtCNPJ     : Result := IsValidCpfCnpj( pType = vtCPF, pContent );

       vtDATE     : begin
                       case mm.varLT_Lang of
                            ltpt_BR : Result := TryStrToDate( pContent , dDt);
                            lten_US : begin
                                        FS := TFormatSettings.Create('en-US');
                                        Result := TryStrToDate( pContent , dDt, FS );
                                      end;
                            ltes_ES : Result := TryStrToDate( pContent , dDt);
                            ltfr_FR : Result := TryStrToDate( pContent , dDt);
                            ltde_DE : Result := TryStrToDate( pContent , dDt);
                            ltit_IT : Result := TryStrToDate( pContent , dDt);
                            lttr_TR : Result := TryStrToDate( pContent , dDt);
                            ltru_RU : Result := TryStrToDate( pContent , dDt);
                            ltzn_CH : Result := TryStrToDate( pContent , dDt);
                            ltin_ID : Result := TryStrToDate( pContent , dDt);
                            ltth_TH : Result := TryStrToDate( pContent , dDt);
                            lthi_IN : Result := TryStrToDate( pContent , dDt);
                            ltar_SA : Result := TryStrToDate( pContent , dDt);
                       end;

                    end;
  End;
end;

function rc_FormValidate(pFormFrame: TObject; pClear : boolean = false ) : boolean;
var
   i, l1, l2 : integer;
   oObj, oObj2 : TUniControl;

   cPF, cPJ,
   cTmp, cTmp2, cTmp3, cTmp4,cMsg : string;
begin
  Result := True;

  for I := 1 to TComponent( pFormFrame ).ComponentCount - 1 do
  begin
         if ( TComponent( pFormFrame ).Components[I] is TUniControl ) then
         begin
            oObj  := TUniControl ( TComponent( pFormFrame ).Components[I] );

            If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
            begin
               if rc_PosHintProperty( 'valid:', oObj.Hint ) > 0 then
               begin
                  if pClear then
                     rc_RemoveCssClass( oObj , 'rc-invalid' )
                  else
                  begin
                     cMsg := '';
                     cTmp := '@#$%¨&*-+!';
                     If GetPropInfo( oObj.ClassInfo, 'DataSource') <> nil then
                        cTmp := TUniDBEdit( oObj ).Text
                     else
                     If GetPropInfo( oObj.ClassInfo, 'Text') <> nil then
                        cTmp := TUniEdit( oObj ).Text;

                     if cTmp <> '@#$%¨&*-+!' then
                     begin
                        if Pos( 'valid:blank', oObj.Hint ) > 0 then
                        begin
                             if not rc_TypeIsValid( vtNotBlank, cTmp ) then
                             begin
                                  cTmp2 := '';
                                  if Pos( '=', oObj.Hint ) > 0 then
                                  begin
                                     // v. 3.2.0.2 // feedback Felipe Pucci
                                     //cTmp2 := StringReplace( Trim( Copy( oObj.Hint, Pos( '=', oObj.Hint ) + 1, 100 ) ), '|', '', [rfReplaceAll] ) + ' ';
                                     cTmp2 := rc_GetHintProperty( 'valid:', oObj.Hint );
                                     cTmp2 := StringReplace( Trim( Copy( cTmp2, Pos( '=', cTmp2 ) + 1, 100 ) ), '|', '', [rfReplaceAll] ) + ' ';
                                     cTmp2 := Trim( StringReplace( cTmp2, ']]', '', [rfReplaceAll] ) );
                                  end;

                                  if cTmp2 <> '' then
                                     cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, [' [' + cTmp2 + '] '] )
                                  else
                                     cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, ['']  );

                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        if Pos( 'valid:ip', oObj.Hint ) > 0 then
                        begin
                             if not ( rc_TypeIsValid( vtIP, cTmp ) ) then
                             begin
                                  if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                  begin
                                     cMsg := 'IP: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        if Pos( 'valid:date', oObj.Hint ) > 0 then
                        begin
                             if ( not ( rc_TypeIsValid( vtDATE, cTmp ) ) ) or ( cTmp = '30/12/1899' ) then
                             begin
                                  if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( cTmp <> '' ) then
                                  begin
                                     cMsg := mm.MSG_DATETYPE + ': ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        if Pos( 'valid:email', oObj.Hint ) > 0 then
                        begin
                             if not ( rc_TypeIsValid( vtEmail, cTmp ) ) then
                             begin
                                  if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( cTmp <> '' ) then
                                  begin
                                     cMsg := 'Email: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                     rc_AddCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                  end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        // The RegEX context applyed here sometimes "broken"...I am still trying to undestand why.
                        if Pos( 'valid:pass', oObj.Hint ) > 0 then
                        begin
                             if not ( rc_TypeIsValid( vtPASS, cTmp ) ) then
                             begin
                                if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( cTmp <> '' ) then
                                begin
                                   cMsg := mm.MSG_VALIDATE_PASSWORD;
                                   rc_AddCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        cTmp3 := rc_GetHintProperty( 'valid:', oObj.Hint );
                        if Pos( 'min-', cTmp3 ) > 0 then
                        begin
                             cTmp3 := StringReplace( cTmp3, 'min-', '', [rfReplaceAll] ) ;
                             l1 := StrToIntDef( cTmp3, 0 );

                             if rc_GetHintProperty( 'mask:', oObj.Hint ) <> '' then
                                cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                             else
                                cTmp4 := TUniEdit( oObj ).Text;

                             l2 := Length( cTmp4 );
                             if l2 < l1 then
                             begin
                                if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( cTmp <> '' ) then
                                begin
                                   cMsg := format( mm.MSG_VALIDATE_LENGTH_MIN, [ l1.ToString, l2.ToString ] );
                                   rc_AddCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        cTmp3 := rc_GetHintProperty( 'valid:', oObj.Hint );
                        if Pos( 'max-', cTmp3 ) > 0 then
                        begin
                             cTmp3 := StringReplace( cTmp3, 'max-', '', [rfReplaceAll] ) ;
                             l1 := StrToIntDef( cTmp3, 0 );

                             if rc_GetHintProperty( 'mask:', oObj.Hint ) <> '' then
                                cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                             else
                                cTmp4 := TUniEdit( oObj ).Text;

                             l2 := Length( cTmp4 );
                             if l2 > l1 then
                             begin
                                if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( cTmp <> '' ) then
                                begin
                                   cMsg := format( mm.MSG_VALIDATE_LENGTH_MAX, [ l1.ToString, l2.ToString ] );
                                   rc_AddCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                             end
                             else
                             begin
                                 rc_RemoveCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                             end;
                        end;

                        // CPF and CNPJ are brazilian document types
                        if ( Pos( 'valid:cpfcnpj', oObj.Hint ) > 0 ) or ( Pos( 'valid:cnpjcpf', oObj.Hint ) > 0 ) or
                           ( Pos( 'valid:cpf', oObj.Hint ) > 0 ) or ( Pos( 'valid:cnpj', oObj.Hint ) > 0 ) then
                        begin
                             // campo PESSOA
                             cTmp3 := '';
                             oObj2 := nil;
                             if Pos( ' &', oObj.Hint ) > 0 then
                             begin
                                  cTmp2 := StringReplace( Trim( Copy( oObj.Hint, Pos( ' &', oObj.Hint ) + 1, 100 ) ), '|', '', [rfReplaceAll] ) + ' ';

                                  cTmp3 := Copy( cTmp2, Pos( '"', cTmp2 ) + 1 , 100 );
                                  cTmp2 := trim( Copy( cTmp2, 2, Pos( '=' , cTmp2 ) - 2 ) );
                                  cTmp3 := Copy( cTmp3, 1, Pos( '"', cTmp3 ) - 1 );

                                  cPf   := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                                  cPj   := Copy( cTmp3, Pos( ' ', cTmp3 ) + 1, 100 );

                                  oObj2  := TUniControl ( TComponent( pFormFrame ).FindComponent( cTmp2 ) );

                                  if oObj2 <> nil then
                                  begin
                                       If GetPropInfo( oObj2.ClassInfo, 'DataSource') <> nil then
                                          cTmp4 := TUniDBEdit( oObj2 ).Text
                                       else
                                       If GetPropInfo( oObj2.ClassInfo, 'Text') <> nil then
                                          cTmp4 := TUniEdit( oObj2 ).Text;
                                  end;
                             end;

                             if cTmp4 <> '' then
                             begin
                                 if ( Pos( 'valid:cpfcnpj', oObj.Hint ) > 0 ) and ( cTmp4 = cPF ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                                 begin
                                    if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) ) then
                                    begin
                                       cMsg := 'Cpf inválido ou em branco !';
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                    end;
                                 end
                                 else
                                 if ( Pos( 'valid:cpfcnpj', oObj.Hint ) > 0 ) and ( cTmp4 = cPJ ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                                 begin
                                    if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                    begin
                                       cMsg := 'Cnpj inválido ou em branco!';
                                       rc_AddCssClass( oObj , 'rc-invalid' );
                                       oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                    end;
                                 end
                                 else
                                 begin
                                     rc_RemoveCssClass( oObj , 'rc-invalid' );
                                     oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                 end;
                             end
                             else
                             if ( ( Pos( 'valid:cpf', oObj.Hint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 11 ) ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                             begin
                                if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                begin
                                   cMsg := 'Cpf inválido !';
                                   rc_AddCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end
                                else
                                begin
                                    rc_RemoveCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                             end
                             else
                             if ( ( Pos( 'valid:cnpj', oObj.Hint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 14 ) ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                             begin
                                if ( Pos( ' notblank', oObj.Hint ) = 0 ) or ( Pos( ' notblank', oObj.Hint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                begin
                                   cMsg := 'Cnpj inválido !';
                                   rc_AddCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'true' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end
                                else
                                begin
                                    rc_RemoveCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'false' , 'invalid:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                             end;
                        end;
                     end;

                     if cMsg <> EmptyStr then
                     begin
                         Result := False;
                         dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, cMsg, 'error' );
                     end;
                  end;
               end;
            end;
         end;
  end;
end;
end.
