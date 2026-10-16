unit untFrmCRUDFINANCEIRO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniMemo, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniMultiItem,
  uniComboBox, uniDBComboBox, uniEdit, uniDBEdit, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UniButtonDbEdit, uniDateTimePicker, uniDBDateTimePicker,
  uniDBMemo, uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmCRUDFINANCEIRO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    paBaseTop: TUniContainerPanel;
    UniMemolog: TUniMemo;
    UniLabelTOTALTITULOS: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    FDQryCad: TFDQuery;
    dscrud: TDataSource;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    rcDBComboBox50: TUniDBComboBox;
    UniLabel6: TUniLabel;
    UniDBEditnumero: TUniDBEdit;
    UniLabel27: TUniLabel;
    UniDBEditsequencia: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel9: TUniLabel;
    edSearchCRUD2: TUniEdit;
    UniLabel10: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniLabel11: TUniLabel;
    UniLabel18: TUniLabel;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniLabel40: TUniLabel;
    UniEditportadordescricao: TUniEdit;
    UniLabel19: TUniLabel;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniLabel17: TUniLabel;
    UniEditplanodescricao: TUniEdit;
    UniLabel20: TUniLabel;
    UniButtonDbEdit4: TUniButtonDbEdit;
    UniLabel49: TUniLabel;
    UniEditnomevendedor: TUniEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel50: TUniLabel;
    UniLabel12: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel14: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel15: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    UniLabel21: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel1: TUniLabel;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel2: TUniLabel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    btnsair: TUniBitBtn;
    UniScreenMask1: TUniScreenMask;
    UniBitBtn12: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniButtonDbEdit5: TUniButtonDbEdit;
    ubtnBOLETO: TUniBitBtn;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1Exit(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit3Exit(Sender: TObject);
    procedure UniButtonDbEdit4ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit4Exit(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniButtonDbEdit5ButtonClick(Sender: TObject);
    procedure ubtnBOLETOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure Exclui();
  procedure LimpaVars();
  procedure MemoGravaLog();
  procedure CarregaDados();
  procedure excluifinanceiro(Sender: TComponent;
  AResult: Integer; AText: string);
  end;

  var
    state           : string;

function frmCRUDFINANCEIRO: TfrmCRUDFINANCEIRO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, System.TypInfo, untFrmTELAGENERICA, untDM_RC,
  mkm_func_web, mkm_funcoes, mkm_procedures, untFrmPesquisa, mkm_layout,
  untFrmTELACENTROCUSTO, untFrmTELAMOVIMENTOBOLETOS;

function frmCRUDFINANCEIRO: TfrmCRUDFINANCEIRO;
begin
  Result := TfrmCRUDFINANCEIRO(mm.GetFormInstance(TfrmCRUDFINANCEIRO));
end;

procedure TfrmCRUDFINANCEIRO.btnCancelRegClick(Sender: TObject);
begin
   SetBut(tpListacomRegistros);

   FDQryCad.Close ;
   LimpaVars;
end;

procedure TfrmCRUDFINANCEIRO.btnDeleteRegClick(Sender: TObject);
var
nescrita:string;
begin
  nescrita := '';
  Prompt('Escreva "excluir" ',nescrita ,mtInformation, mbOKCancel, excluifinanceiro);
  abort;
end;

procedure TfrmCRUDFINANCEIRO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;

  SetBut(tpAlterar);

  FDQryCad.Edit;
end;

procedure TfrmCRUDFINANCEIRO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;

  SetBut(tpIncluir);

  FDQryCad.Close;
  LimpaVars;

  if not( FDQryCad.Active) then
      FDQryCad.Open;

   FDQryCad.Insert ;
   FDQryCad.FindField('CODIGO').AsInteger      := 0;
   FDQryCad.FindField('SEQUENCIA').AsInteger   := 1;
   FDQryCad.FindField('PORTADOR').AsInteger    := 0;
   FDQryCad.FindField('DOCUMENTO').AsInteger   := 30;
   FDQryCad.FindField('PLANOCONTAS').AsInteger := 0;
   FDQryCad.FindField('FUNCIONARIO').AsInteger := 0;
   FDQryCad.FindField('VALORDESCONTOS').AsFloat:= 0;
   FDQryCad.FindField('VALORTAXAS').AsFloat    := 0;
   FDQryCad.FindField('VALORJUROS').AsFloat    := 0;
   FDQryCad.FindField('VALORATUAL').AsFloat    := 0;
   FDQryCad.FindField('VALORORIGINAL').AsFloat := 0;
   FDQryCad.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
   FDQryCad.FindField('SITUACAO').AsString     := 'Aberto';
   FDQryCad.FindField('SERIE').AsString        := 'DUP';
   FDQryCad.FindField('EMISSAO').AsDateTime    := Date;
   FDQryCad.FindField('FINANCEIRO').AsInteger  := varIIF(FDQryCad.UpdateOptions.UpdateTableName = 'PAGAR',0,1);

end;

procedure TfrmCRUDFINANCEIRO.btnSaveRegClick(Sender: TObject);
begin
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       if FDQryCad.State in [dsInsert] then
         begin
           FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);
           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
         end;

       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;

       try
         if dm_rc.tbcentrocustofin.recordcount > 0 then
           begin
             AcaoCentroCusto(mm.varI_Code_Company,
                             FDQryCad.FindField('CODIGO').AsInteger,
                             'grava',
                             FDQryCad.UpdateOptions.UpdateTableName,
                             dm_rc.tbcentrocustofin);

           end;

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
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;
     End;

  if  FDQryCad.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);
end;

function TfrmCRUDFINANCEIRO.CamposValidados: Boolean;
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

procedure TfrmCRUDFINANCEIRO.CarregaDados;
begin
  if SqlPesquisa('SELECT CODIGO, NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(FDQryCad.FindField('PESSOA').AsString)) then
    begin
      edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
    end;

  if FDQryCad.FindField('PORTADOR').AsString <> '' then
    UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,FDQryCad.FindField('PORTADOR').AsString);
  if FDQryCad.FindField('PLANOCONTAS').AsString <> '' then
    UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,FDQryCad.FindField('PLANOCONTAS').AsString);
  if FDQryCad.FindField('FUNCIONARIO').AsString <> '' then
    UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',FDQryCad.FindField('FUNCIONARIO').AsString);

  AcaoCentroCusto(mm.varI_Code_Company,
                  FDQryCad.FindField('CODIGO').AsInteger,
                  'carrega',
                  FDQryCad.UpdateOptions.UpdateTableName,
                  dm_rc.tbcentrocustofin);

end;

procedure TfrmCRUDFINANCEIRO.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;
  FDQryCad.Delete;

  executasql(' delete from FINANCEIRO_CENTROCUSTO where tabela = ' + QuotedStr(FDQryCad.UpdateOptions.UpdateTableName) +
             ' and mestre_id                                   = ' + IntToStr(codigotable));

  try
    if  FDQryCad.Active then
      FDQryCad.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            FDQryCad.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );

  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmCRUDFINANCEIRO.excluifinanceiro(Sender: TComponent;
  AResult: Integer; AText: string);
  var
    pcodigo:integer;
begin
  try
    if (AText = 'excluir') then
      begin
        pcodigo := FDQryCad.FindField('CODIGO').AsInteger;
        try
          FDQryCad.Delete;
          executasql('delete from FINANCEIRO_AGRUPADO  where MESTRE_ID   = ' + IntToStr(pcodigo));

        finally
          SetBut(tpListaVazia);
          dm_rc.rc_ShowToaster('success', 'Excluido com Sucesso! ', True,'pinItUp');
          btnsair.OnClick(Self);
        end;
      end
    else
      dm_rc.rc_ShowToaster('error', 'NÃO FOI POSSIVEL EXCLUIR ', True,'pinItUp')
  except
  end;
end;

procedure TfrmCRUDFINANCEIRO.LimpaVars;
begin
  edSearchCRUD2.Text            := '';
  UniEdit1.Text                 := '';
  UniEdit2.Text                 := '';
  UniEditportadordescricao.Text := '';
  UniEditplanodescricao.Text    := '';
  UniEditnomevendedor.Text      := '';
end;

procedure TfrmCRUDFINANCEIRO.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (FDQryCad.FieldCount - 1) do
    UniMemolog.Lines.Add(FDQryCad.Fields[i].DisplayName + ':' + FDQryCad.Fields[i].DisplayText);
end;

procedure TfrmCRUDFINANCEIRO.SetBut(Acao: TAcaoCrud);
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

procedure TfrmCRUDFINANCEIRO.ubtnBOLETOClick(Sender: TObject);
begin
  mm.varboletosolicitacao             := '';
  mm.vars_identificatabela            := 'RECEBER';
  mm.varI_Code_Empresa_Documento      := FDQryCad.FindField('EMPRESA').AsInteger;
  mm.varI_Code_Numero_Documento       := FDQryCad.FindField('NUMERO').AsInteger;
  mm.vari_vlr_pedido                  := FDQryCad.FindField('VALORATUAL').AsFloat;
  mm.vari_pessoaamostra               := FDQryCad.FindField('PESSOA').AsString;
  mm.varI_Code_documento_Documento    := FDQryCad.FindField('DOCUMENTO').AsInteger;
  mm.varI_Code_Documento_parcela      := FDQryCad.FindField('SEQUENCIA').AsInteger;

  frmTELAMOVIMENTOBOLETOS.ShowModal();
end;

procedure TfrmCRUDFINANCEIRO.UniBitBtn12Click(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    mm.vari_statuscentrocusto := 'T'
  else
    mm.vari_statuscentrocusto := 'F';

      frmTELACENTROCUSTO.ShowModal();
end;

procedure TfrmCRUDFINANCEIRO.btnsairClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit1Exit(Sender: TObject);
begin
  if (UniButtonDbEdit1.Text <> '') and (UniButtonDbEdit1.Text <> '0') then
    if SqlPesquisa('SELECT NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEdit1.Text)) then
      begin
        edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
        UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
        UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
      end;
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.FindField('PORTADOR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit2Exit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,FDQryCad.FindField('PORTADOR').AsString);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PLANOCONTAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.FindField('PLANOCONTAS').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit3Exit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,FDQryCad.FindField('PLANOCONTAS').AsString);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit4ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.FindField('FUNCIONARIO').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit4Exit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',FDQryCad.FindField('FUNCIONARIO').AsString);

end;

procedure TfrmCRUDFINANCEIRO.UniButtonDbEdit5ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('EMPRESAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.FindField('EMPRESA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCRUDFINANCEIRO.UniFormCreate(Sender: TObject);
begin
    rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmCRUDFINANCEIRO.UniFormReady(Sender: TObject);
begin
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmCRUDFINANCEIRO.UniFormShow(Sender: TObject);
  var i : integer; Cmp:String;
begin
  UniLabelTOTALTITULOS.Caption              := 'CONTAS A ' + mm.vars_idfinanceiro;
  FDQryCad   .UpdateOptions.UpdateTableName := mm.vars_idfinanceiro;

  if mm.vars_idfinanceiro = 'PAGAR' then
    ubtnBOLETO.Visible := False;


  if mm.vari_regfinanceiro = 0 then
    begin
      SetBut(tpListaVazia)
    end
  else
    begin

      FDQryCad.Close;
      FDQryCad.SQL.Clear;
      FDQryCad.SQL.Text  := ' SELECT * FROM  ' + FDQryCad.UpdateOptions.UpdateTableName +
                            ' WHERE CODIGO = ' + IntToStr(mm.vari_regfinanceiro);
      FDQryCad.Open();

      CarregaDados();
      SetBut(tpListacomRegistros)
    end;


end;

end.
