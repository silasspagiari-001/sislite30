unit mkm_func_web; // v. 3.2.0.7

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db,
    UniGuiClasses;

function rc_StrCaptalize( pStr : string ) : string;
function CloneComponent(aValue: TObject): TObject;
function FindAnyClass(const Name: string): TClass;
// webbroker uses GMT
function OffsetFromUTC: TDateTime;
function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;
//criptografia pelo codiuser
function Crypto(Action, Src, Key : WideString ): WideString;
Function Crypta(S , key2 :String):String;
Function DeCrypta(S, key2 :String):String;
{ Retorna o texto dentro de 2 tags (open & close Tag's) }
function GetTagContent(aText, OpenTag, CloseTag : String) : String;
function SetTagContent(aText, aTextReplace, OpenTag, CloseTag : String) : String;
function GetTagParams(S : String ): TStringList; // entrada de dados //para função “S” recebe string, “separador” recebe caracter de separação da string.
Function LoadHTMLFile(FileName : String) : String;
Function FormatDelphiDate(Value : String) : String;
//remover '.', '-', '_'
Function StrTokenClear( pText : String) : String;
Function StrTokenClearSql( pText : String;pRemoveAccents:boolean = false) : String; // v. 3.2.0.1
function StrPageName( pText : string ) : string;
function ReturnNumbers(pText:string):string;
function ReturnLetters(pText:string):string;
function RemoveInvalidChar( InputText: string): string;
function RemoveLineBreaks( InputText: string): string;
function FixDecimals( Value: Extended; Decimals: Integer): Extended;
function GetWebColor( pColor: string ): string;
function ColorToHtml(Clr: TColor): string;
function strTokenCount(S: string; Seperator: Char): Integer;
function strToken(var S: string; Seperator: Char): string;
function DataTypeIsNumber( pDtype : TFieldType ) : Boolean;
function DataTypeIsString( pDtype : TFieldType ) : Boolean;
function DataTypeIsDateTime( pDtype : TFieldType ) : Boolean;
function DataTypeStrIsNumber( pDtype : string ) : Boolean;
function DataTypeStrIsString( pDtype : string ) : Boolean;
function DataTypeStrIsDateTime( pDtype : string ) : Boolean;
function DataPonto(F_DATA:String): string;
function StrContains(const S1, S2: string): Boolean;
function StrPosicao(const S, SubStr: string; Index: Integer): Integer;
function Explode(str, separador: string): TStringList;
function EndOfMonth(Dt: TDateTime): TDateTime;
function DaysInMonth(Month, Year: Word): Byte;
function StrEmpty(const S: string): Boolean;
function DaysBetween(Dt1, Dt2: TDateTime): Integer;

function MRound(Value: Double; Dec: Integer): Double;
function Pow(X, Y: Double): Double;
function VALOR(Const F_NUM:string): integer;
function StrZeroS(Const X: String; Len: Integer): string;
function StrAllTrim(const S: string): string;
function StrLeft(const S: string; Count: Integer): string;
function StrRTrim(const S: string): string;
function StrReplicate(const S: string; Count: Integer): string;
function StrLTrim(const S: string): string;

implementation

uses str_func;
const
  MONTHS_DAYS    = '312831303130313130313031';


// origem: http://www.activedelphi.com.br/forum/viewtopic.php?t=94782&sid=6a5ae0eae276519e978ed275ed62a1e6
function rc_StrCaptalize( pStr : string ) : string;
var
  flag: Boolean;
  i: Byte;
  t: string;
begin
  flag := True;
  pStr := AnsiLowerCase(pStr);
  t := EmptyStr;

  for i := 1 to Length(pStr) do
  begin
    if flag then
      t := t + AnsiUpperCase(pStr[i])
    else
      t := t + pStr[i];

    //flag := (pStr[i] in [' ', '[',']', '(', ')']);
    flag := CharInSet( pStr[i] , [' ', '[',']', '(', ')'] );
  end;
  Result := t;
end;

function DataTypeStrIsNumber( pDtype : string ) : Boolean;
begin

     Result := ( pDtype  = 'ftinteger' ) or
               ( pDtype  = 'ftautoinc' ) or
               ( pDtype  = 'ftbcd' ) or
               ( pDtype  = 'ftfmtbcd' ) or
               ( pDtype  = 'ftfloat' )   or
               ( pDtype  = 'ftcurrency' )or
               ( pDtype  = 'ftlargeint' )or
               ( pDtype  = 'ftsmallint' )or
               ( pDtype  = 'bigint' ) or // v. 3.2.0.0 ( feedback Sergio para sqlserver)
               ( pDtype  = 'ftsingle' )or // v. 3.2.0.0
               ( pDtype  = 'ftword' );
end;

function DataTypeStrIsString( pDtype : string ) : Boolean;
begin


     Result := ( pDtype  = 'ftstring' ) or
               ( pDtype  = 'ftwidestring' ) or
               ( pDtype  = 'ftmemo' ) or
               ( pDtype  = 'ftwidememo' )  ;

end;

function DataTypeStrIsDateTime( pDtype : string ) : Boolean;
begin

     Result := ( pDtype  = 'ftdate' ) or
               ( pDtype  = 'fttime' ) or
               ( pDtype  = 'ftdatetime' ) or
               ( pDtype  = 'fttimestamp' )   or
               ( pDtype  = 'fttimestampoffset' );

end;

function DataTypeIsNumber( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftInteger ) or
               ( pDtype  = ftSingle ) or // v. 3.1.0.60
               ( pDtype  = ftAutoInc ) or
               ( pDtype  = ftBCD ) or
               ( pDtype  = ftFMTBcd ) or
               ( pDtype  = ftFloat )   or
               ( pDtype  = ftCurrency )or
               ( pDtype  = ftLargeint )or
               ( pDtype  = ftSmallint )or
               ( pDtype  = ftLongWord ) or // v. 3.2.0.4
               ( pDtype  = ftWord );
end;

function DataTypeIsString( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftString ) or
               ( pDtype  = ftWideString ) or
               ( pDtype  = ftMemo ) or
               ( pDtype  = ftWideMemo )  ;

end;

function DataTypeIsDateTime( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftDate ) or
               ( pDtype  = ftTime ) or
               ( pDtype  = ftDateTime ) or
               ( pDtype  = ftTimeStamp )   or
               ( pDtype  = ftTimeStampOffset );

end;


function strToken(var S: string; Seperator: Char): string;
var
  I: Word;
begin
  I := Pos(Seperator, S);
  if I <> 0 then
  begin
    Result := System.Copy(S, 1, I - 1);
    System.Delete(S, 1, I);
  end
  else
  begin
    Result := S;
    S := '';
  end;
end;

function strTokenCount(S: string; Seperator: Char): Integer;
begin
  Result := 0;
  while S <> '' do
  begin            { 29.10.96 sb }
    StrToken(S, Seperator);
    Inc(Result);
  end;
end;

function FixDecimals( Value: Extended; Decimals: Integer): Extended;
begin

  Result := SimpleRoundTo( Value, Decimals * (-1) );

end;

//showdelphi
function ColorToHtml(Clr: TColor): string;
begin
  Result := IntToHex(clr, 6);
  Result := '#' + Copy(Result, 5, 2) + Copy(Result, 3, 2) + Copy(Result, 1, 2);
end;

function GetWebColor( pColor: string ): string;
var
   s1, s2, s3, s4 : string;
begin

  // $00334455
  s1 := Copy( pColor, 2, 2 );
  s2 := Copy( pColor, 4, 2 );
  s3 := Copy( pColor, 6, 2 );

  if Length( pColor ) >= 8 then
     s4 := Copy( pColor, 8, 2 )
  else
     s4 := '00';

  Result := '#' + s4 + s3 + s2;

end;


function RemoveInvalidChar( InputText: string): string;
begin
  InputText := StringReplace(InputText,#$D,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,'"','',[rfReplaceAll]);
  InputText := StringReplace(InputText,'''','',[rfReplaceAll]);
  Result := InputText;
end;

function RemoveLineBreaks( InputText: string): string;
begin
  InputText := StringReplace(InputText,#$D,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,' ',[rfReplaceAll]);

  Result := InputText;
end;

function  ReturnNumbers(pText:string):string;
var ind : integer;
begin
   result := '';
   if pText <> '' then
   begin
     for ind := 0 to length(pText) do
     begin
         //if pText[ind] in ['0'..'9'] then
         if CharInSet( pText[ind] , ['0'..'9'] ) then
            result := result + pText[ind];
     end;
   end;
end;

function  ReturnLetters(pText:string):string;
var ind : integer;
begin
   result := '';
   for ind := 0 to length(pText) do
   begin
//       if ( pText[ind] in ['a'..'z'] ) or
//          ( pText[ind] in ['A'..'Z'] ) then
       if ( CharInSet( pText[ind] , ['a'..'z'] ) ) or
          ( CharInSet( pText[ind] , ['A'..'Z'] ) ) then

          result := result + pText[ind];
   end;
end;

function Crypto(Action, Src, Key : WideString ): WideString;
var
   KeyLen    : Integer;
   KeyPos    : Integer;
   offset    : Integer;
   dest      : string;
   SrcPos    : Integer;
   SrcAsc    : Integer;
   TmpSrcAsc : Integer;
   Range     : Integer;
   s         : string[255];
   c         : array[0..255] of Byte absolute s;
begin
     dest:='';
     KeyLen:=Length(Key);
     KeyPos:=0;
     SrcPos:=0;
     SrcAsc:=0;
     Range:=256;
     if Action = UpperCase('E') then
     begin
          Randomize;
          offset := Random(Range);
          dest   := format('%1.2x',[offset]);
          for SrcPos := 1 to Length(Src) do
          begin
               SrcAsc:=(Ord(Src[SrcPos]) + offset) MOD 255;
               if KeyPos < KeyLen then KeyPos:= KeyPos + 1 else KeyPos:=1;
               SrcAsc:= SrcAsc xor Ord(Key[KeyPos]);
               dest:=dest + format('%1.2x',[SrcAsc]); //¬
               offset:=SrcAsc;
          end;
     end;
     if Action = UpperCase('D') then
     begin
          offset:=StrToIntDef('$'+ copy(src,1,2),0);
          SrcPos:=3;
          repeat
                SrcAsc:=StrToIntDef('$'+ copy(src,SrcPos,2),0);
                if KeyPos < KeyLen Then KeyPos := KeyPos + 1 else KeyPos := 1;
                TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
                if TmpSrcAsc <= offset then
                     TmpSrcAsc := 255 + TmpSrcAsc - offset
                else
                     TmpSrcAsc := TmpSrcAsc - offset;
                dest := dest + chr(TmpSrcAsc);
                offset:=srcAsc;
                SrcPos:=SrcPos + 2;
          until SrcPos >= Length(Src);
     end;
     Crypto := dest;
end;

// não altere a chave pois é usada no cad. de usuários
// do not change the key as it is used in the cad. of users
Function Crypta(S , key2 :String):String;
begin

     Result := Crypto( 'E', S, key2 + 'M1kromundoR@dc0r3' ) ;//   StrEncrypt( s, 1974 );

end;

Function DeCrypta(S, key2 :String):String;
begin

     Result := Crypto( 'D', S, Key2 + 'M1kromundoR@dc0r3' ) ;//   StrDecrypt( s, 1974 );

end;

Function LoadHTMLFile(FileName : String) : String;
Var
 vStringCad : TStringList;
begin
   vStringCad := TStringList.Create;
   Try
      vStringCad.LoadFromFile(FileName);
      //Result := utf8decode(vStringCad.Text);
      Result := UTF8ToString(vStringCad.Text);
   Finally
      vStringCad.Free;
   End;
end;

Function FormatDelphiDate(Value : String) : String;
Begin

 Result := Value;

 If Pos('-', Value) > 0 Then
 Begin
    Result := Copy(Value, 1, Pos('-', Value) -1);
    Delete(Value, 1, Pos('-', Value));
    Result := Copy(Value, 1, Pos('-', Value) -1) + '/' + Result;
    Delete(Value, 1, Pos('-', Value));
    Result := Copy(Value, 1, Length(Value)) + '/' + Result;
 End;

End;
function DataPonto(F_DATA:String): string;
begin
  result := Copy(F_DATA,1, 2) + '.' +  Copy(F_DATA,4, 2) + '.' + Copy(F_DATA,7, 4);
end;
function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;
begin
  if aTest then  Result := TrueValue else Result := FalseValue;
end;

{ Retorna o pText dentro de 2 tags (open & close Tag's) }
//
// função original: ExtractText retirada do SHOW DELPHI
//
function GetTagContent(aText, OpenTag, CloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
  begin
    iAux := Pos(OpenTag, aText) ;// + Length(OpenTag);
    kAux := Pos(CloseTag, aText) + 3;
    Result := Copy(aText, iAux, kAux-iAux);
    Result := StringReplace( Result , '<# ' , '' , [rfReplaceAll] );
    Result := StringReplace( Result , ' #>' , '' , [rfReplaceAll] );
  end;
end;

{ Insere o pText entre 2 tags (open & close Tag's) }

function SetTagContent( aText, aTextReplace, OpenTag, CloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
  begin
    iAux := Pos(OpenTag, aText) ;// + Length(OpenTag);
    kAux := Pos(CloseTag, aText) + 3;
    Delete( aText , iAux , Length( Copy(aText, iAux, kAux-iAux) ) );

    Insert( aTextReplace , aText , iAux );

    Result := aText;

  end;
end;

function FindAnyClass(const Name: string): TClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
    begin
      if typ.IsInstance and (EndsText(Name, typ.Name)) then
        begin
          Result := typ.AsInstance.MetaClassType;
          break;
        end;
    end;
  ctx.Free;
end;

function GetTagParams(S : String ): TStringList;

  var

  iCount : integer;
  cResult : TStringList;
  cSeparator,
  Saux : string;


begin

    cSeparator := ' ';
    cResult := TStringList.Create;

    iCount := pos( cSeparator , S ); //pega posição do cSeparator

    if iCount <> 0 then             // verifica se existe o cSeparator caso contrario trata apenas como uma única linha
    begin

        while trim(S) <> '' do // enquanto S não for nulo executa
        begin

            Saux := copy( S , 1 , iCount-1 ); // Variável Saux recebe primeiro valor
            delete( S , 1 , iCount );         // deleta primeiro valor

            if iCount = 0 then                // se não ouver mais cSeparator Saux equivale ao resto da linha
            begin

                Saux := S.Replace( '"' , '' );
                S := '';

            end;

            //cResult.AddPair( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ), AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );// Add( Saux ); // adiciona linhas na string lista
            cResult.Add( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ) + '=' + AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );// Add( Saux ); // adiciona linhas na string lista
            iCount := pos( cSeparator , S ); //pega posição do cSeparator

        end;

    end
    else
    begin

        Saux := S.Replace( '"' , '' );
        //cResult.AddPair( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ), AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );//Add(Saux);
        cResult.Add( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ) + '=' + AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );//Add(Saux);

    end;

    Result := cResult; // retorna cResult como uma lista indexada

end;
// v. 3.2.0.1
// necessidade do OSMAR / enviado p FABIO testar com SQLSERVER - 24.05.21 16:15 p.m.
Function StrTokenClearSql( pText : String; pRemoveAccents:boolean ) : String;
Const
   cAccents = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
var
   cTokens : string;
   i : integer;
Begin
    if pRemoveAccents then
       cTokens := '&ºª' + cAccents
    else
       cTokens := '&ºª';

    for I := 1 to Length( cTokens ) do
        pText := StringReplace( pText, cTokens[ I ] , '_' , [rfReplaceAll] ); // verificar se "" é igual pra todos( pgsql, sqlserver... )

    if pRemoveAccents then
       Result := RemoveAcentos( pText )
    else
       Result := pText;
End;

Function StrTokenClear( pText : String) : String;
var
   cTokens : string;
   i : integer;
Begin

    cTokens := '-.,:;<>/|\()[]{}_#';

    for I := 1 to Length( cTokens ) do
        pText := StringReplace( pText, cTokens[ I ] , '' , [rfReplaceAll] );


    Result := pText;

End;

function StrPageName( pText : string ) : string;
begin
     Result := Trim( lowercase( StringReplace( pText, '.' , '' , [rfReplaceAll] ) ) );
     Result := lowercase( StringReplace( Result, ' ' , '_' , [rfReplaceAll] ) );
end;


// feedback: Mesut from Turkey
{$ifdef LINUX}
function OffsetFromUTC: TDateTime;
begin
Result := idGlobal.OffsetFromUTC;
end;
{$endif}
{$ifdef MSWINDOWS}
function OffsetFromUTC: TDateTime;
(*
Use it as: Expires := Now + (however long in TDateTimeFormat)+OffsetFromUTC;

such as: Expires := IncMinute(Now, DefaultTimeout) + OffsetFromUTC;
Responder

*)
//{$IFDEF LINUX}
//var
//T: TTime_T;
//TV: TTimeVal;
//UT: TUnixTime;
//begin
//gettimeofday(TV, nil);
//T := TV.tv_sec;
//localtime_r(@T, UT);
//// __tm_gmtoff is the bias in seconds from the UTC to the current time.
//// so I multiply by -1 to compensate for this.
//Result := -1*(UT.__tm_gmtoff / 60 / 60 / 24);
//end;
//{$ENDIF}
//{$IFDEF MSWINDOWS}
var
iBias: Integer;
tmez: TTimeZoneInformation;
begin
// Copied from IdGlobal.pas
case

     GetTimeZoneInformation(tmez) of TIME_ZONE_ID_INVALID: raise Exception.Create('FailedTimeZoneInfo');   //EFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);

     TIME_ZONE_ID_UNKNOWN  : iBias := tmez.Bias;

     TIME_ZONE_ID_DAYLIGHT : iBias := tmez.Bias + tmez.DaylightBias;

     TIME_ZONE_ID_STANDARD : iBias := tmez.Bias + tmez.StandardBias;
else
    raise Exception.Create('FailedTimeZoneInfo');   //EFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);
end;
{We use ABS because EncodeTime will only accept positve values}
Result := EncodeTime(Abs(iBias) div 60, Abs(iBias) mod 60, 0, 0);
end;
{$endif}

function CloneComponent(aValue: TObject): TObject;
var
  MarshalObj: TJSONMarshal;
  UnMarshalObj: TJSONUnMarshal;
  JSONValue: TJSONValue;
begin
  Result:= nil;
  MarshalObj := TJSONMarshal.Create;
  UnMarshalObj := TJSONUnMarshal.Create;
  try
    JSONValue := MarshalObj.Marshal(aValue);
    try
      if Assigned(JSONValue) then
        Result:= UnMarshalObj.Unmarshal(JSONValue);
    finally
      JSONValue.Free;
    end;
  finally
    MarshalObj.Free;
    UnMarshalObj.Free;
  end;
end;
function StrContains(const S1, S2: string): Boolean;
begin
//  Result := (StrPos(S1, S2, 1) > 0);
  if StrPosicao(S1,S2,1) > 0 then
    result := True
  else
    result := False;
end;
function StrPosicao(const S, SubStr: string; Index: Integer): Integer;
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
function Explode(str, separador: string): TStringList;
var
  p: integer;
begin
  Result := TStringList.Create;
  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p-1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;
  if (str <> '') then  Result.Add(str);
end;
function EndOfMonth(Dt: TDateTime): TDateTime;
var
  Y, M, D: Word;
begin
  DecodeDate(Dt, Y, M, D);
  Result := EncodeDate(Y, M, DaysInMonth(M, Y));
end;
function DaysInMonth(Month, Year: Word): Byte;
begin
  Result := 0;
  if not (Month in [1..12]) then
    Exit;
  Result := StrToInt(Copy(MONTHS_DAYS, (Month * 2) -1, 2));
  if (Month = 2) and IsLeapYear(Year) then
    Result := 29;
end;
function MRound(Value: Double; Dec: Integer): Double;
var
  Ord: Double;
  Sign: integer;
begin
  Sign := 1;
  if Value < 0 then
    Sign := -1;
  Ord := Pow(10, Dec);
  Result := Value - (Frac(Frac(Value) * Ord) / Ord);
  if Abs(Frac(Frac(Value) * Ord)) >= 0.5 then
    Result := Result + (Pow(10, -Dec) * Sign);
end;
function Pow(X, Y: Double): Double;
begin
  Result := Exp(Ln(X) * Y);
end;
function VALOR(Const F_NUM:string): integer;
var
  I, Code: Integer;
begin
  Val(F_NUM, I, Code);
  if Code <> 0 then
    result := 0
  else
    result := I;
end;
function StrEmpty(const S: string): Boolean;
begin
   Result := (S = '');
end;
function DaysBetween(Dt1, Dt2: TDateTime): Integer;
begin
  Result := Round(Dt2 - Dt1);
end;
function StrZeroS(Const X: String; Len: Integer): string;
var
  S: string;
begin
  S := StrAllTrim(StrLeft(X,Len));
  Result := StrReplicate('0', Len - Length(S)) + S;
end;
function StrAllTrim(const S: string): string;
begin
  Result := StrRTrim(StrLTrim(S));
end;
function StrLeft(const S: string; Count: Integer): string;
begin
  Result := Copy(S, 1, Count);
end;
function StrRTrim(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  if S = '' then
    Exit;
  I := Length(S);
  while (S[I] = ' ') and (I > 0) do
    Dec(I);
  Result := Copy(S, 1, I);
end;
function StrReplicate(const S: string; Count: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Count do
    Result := Result + S;
end;
function StrLTrim(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  if S = '' then
    Exit;
  I := 1;
  while (S[I] = ' ') and (I <= Length(S)) do
    Inc(I);
  Result := Copy(S, I, Length(S));
end;
end.
