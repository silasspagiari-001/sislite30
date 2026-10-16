unit untFrmTELAMOVIMENTOBOLETOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniEdit, UniButtonEdit, uniLabel, uniScreenMask;

type
  TfrmTELAMOVIMENTOBOLETOS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniDBGridboletos: TUniDBGrid;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditdescricaobanco: TUniEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    btngerar: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    btnimprimir: TUniBitBtn;
    UniScreenMask1: TUniScreenMask;
    rcBlock40: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    btngravar: TUniBitBtn;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniNumberEditparcelas: TUniNumberEdit;
    UniContainerPanel2: TUniContainerPanel;
    btncalcula: TUniBitBtn;
    UniFormattedNumberEditVLRPEDIDO: TUniFormattedNumberEdit;
    UniLabel3: TUniLabel;
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditpbancosExit(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btngerarClick(Sender: TObject);
    procedure btncalculaClick(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure UniDBGridboletosCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregatitulos(pempresa,pnumero,pdocumento,pparcela:integer);
  procedure botoes(const pacao:string);
  procedure Calcula_Titulos();
  procedure Grava_Financeiro(const premessa:string;ppessoa,psequencia,pempresa:integer;pvencimento:tdatetime; pvalor:real);
  procedure AtualizaRemessa (const premessa:string);
  procedure AtualizaPedido  (const premessa:string);  
  end;

function frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_funcoes, mkm_procedures, untFrmPesquisa,
  untDM_RC, mkm_regrasnegocio, unReportImpressao, mkm_func_web,
  System.DateUtils, FireDAC.Comp.Client, str_func;

function frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS;
begin
  Result := TfrmTELAMOVIMENTOBOLETOS(mm.GetFormInstance(TfrmTELAMOVIMENTOBOLETOS));
end;

procedure TfrmTELAMOVIMENTOBOLETOS.carregatitulos(pempresa,pnumero,pdocumento,pparcela:integer);
begin
  if SqlPesquisa('select * from receber where empresa = ' + IntToStr(pempresa)    +
                 'and numero    =                       ' + IntToStr(pnumero)     +
                 'and documento =                       ' + IntToStr(pdocumento)  +
                 variif(pparcela = 0,'',
                 ' and sequencia = ' + IntToStr(pparcela)) +
                 'order by sequencia asc') then
  begin
    dm_rc.tbboletos.Close;
    dm_rc.tbboletos.Open;

    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin

        dm_rc.tbboletos.append;
        dm_rc.tbboletos.FindField('NOME').AsString           := Acha_Item('PESSOAS',dm_rc.sqlBuscas.FindField('PESSOA').AsString) ;
        dm_rc.tbboletos.FindField('NUMERO').AsInteger        := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
        dm_rc.tbboletos.FindField('SEQUENCIA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
        dm_rc.tbboletos.FindField('SERIE').AsString          := dm_rc.sqlBuscas.FindField('SERIE').AsString;
        dm_rc.tbboletos.FindField('VENCIMENTO').AsDateTime   := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
        dm_rc.tbboletos.FindField('VALOR').AsFloat           := dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat;
        dm_rc.tbboletos.FindField('SITUACAO').AsString       := dm_rc.sqlBuscas.FindField('SITUACAO').AsString;
        dm_rc.tbboletos.FindField('confirmaboleto').AsString := dm_rc.sqlBuscas.FindField('confirmaboleto').AsString;
        dm_rc.tbboletos.post;

        dm_rc.sqlBuscas.Next;
      end;
    dm_rc.tbboletos.First;
  end;

end;

procedure TfrmTELAMOVIMENTOBOLETOS.Grava_Financeiro(const premessa:string;ppessoa,psequencia,pempresa:integer;pvencimento:tdatetime; pvalor:real);
var
  logtable   : TFDQuery;
  i          : integer;
begin
  logtable                               := TFDQuery.Create(nil);
  logtable.Connection                    := mm.SQLConn;
  logtable.UpdateOptions.UpdateTableName := 'RECEBER';

  logtable.Close;
  logtable.SQL.Text := 'select * from RECEBER where codigo = 0';
  logtable.Open();

  logtable.Append;
  logtable.FindField('KEY').AsString             := Gera_Guid();
  logtable.FindField('CODIGO').AsInteger         := Ultimo_Codigo('RECEBER','CODIGO',True);
  logtable.FindField('EMPRESA').AsInteger        := pempresa;
  logtable.FindField('FUNCIONARIO').AsInteger    := mm.varI_User;
  logtable.FindField('CARTEIRA').AsInteger       := 1;
  logtable.FindField('FINANCEIRO').AsInteger     := 1;
  logtable.FindField('DOCUMENTO').AsInteger      := mm.varI_Code_documento_Documento;
  logtable.FindField('SEQUENCIA').AsInteger      := psequencia;
  logtable.FindField('PORTADOR').AsInteger       := 1;
  logtable.FindField('PLANOCONTAS').AsString     := '1';
  logtable.FindField('APLICACAO').AsInteger      := 1;
  logtable.FindField('NUMERO').AsInteger         := mm.varI_Code_Numero_Documento;
  logtable.FindField('PEDIDO').AsInteger         := mm.varI_Code_Numero_Documento;

  if mm.vars_identificatabela = 'PEDIDO' then
    logtable.FindField('NUMERO_SOLICITACAO').AsString := premessa
  else
    logtable.FindField('REMESSA').AsString            := premessa;
  
  logtable.FindField('SERIE').AsString           := dm_rc.tbboletosSERIE.AsString;
  logtable.FindField('PESSOA').AsInteger         := ppessoa;
  logtable.FindField('EMISSAO').AsDateTime       := date;
  logtable.FindField('VENCIMENTO').AsDateTime    := pvencimento;
  logtable.FindField('VALORORIGINAL').AsFloat    := pvalor;
  logtable.FindField('VALORATUAL').AsFloat       := pvalor;
  logtable.FindField('VALORPAGO').AsFloat        := 0.00;
  logtable.FindField('SITUACAO').AsString        := 'Aberto';
  logtable.Post;

  FreeAndNil(logtable);
end;

procedure TfrmTELAMOVIMENTOBOLETOS.AtualizaPedido(const premessa: string);
begin
  executasql('update solicitacao set status_f = ' + QuotedStr('T') +
             'where  numero_termo             = ' + QuotedStr(premessa));
end;

procedure TfrmTELAMOVIMENTOBOLETOS.AtualizaRemessa(const premessa: string);
begin
  executasql('update solicitacao set STATUS_F = ' + QuotedStr('T')      +
             'where remessa_financeiro        = ' + QuotedStr(premessa) +
             'and empresa                     = ' + IntToStr(mm.varI_Code_Company));

  executasql('update remessa set confirmaboleto = ' + QuotedStr('T')      +
             'where numerore                    = ' + QuotedStr(premessa) +
             'and empresa                       = ' + IntToStr(mm.varI_Code_Company));
end;

procedure TfrmTELAMOVIMENTOBOLETOS.botoes(const pacao: string);
begin
  if pacao = 'boleto' then
    begin
      btngerar.Enabled              := False;
      btnimprimir.Enabled           := True;
      UniButtonEditpbancos.ReadOnly := False;
      UniEditdescricaobanco.ReadOnly:= False;

      btncalcula.Enabled            := false;
      btngravar.Enabled             := False;
      UniNumberEditparcelas.Enabled := False;
    end
  else
  if pacao = 'hboleto' then
    begin
      btngerar.Enabled              := True;
      btnimprimir.Enabled           := False;
      UniButtonEditpbancos.ReadOnly := False;
      UniEditdescricaobanco.ReadOnly:= False;

      btncalcula.Enabled            := false;
      btngravar.Enabled             := False;
      UniNumberEditparcelas.Enabled := False;
    end
  else
    begin
      btngerar.Enabled              := False;
      btnimprimir.Enabled           := False;
      UniButtonEditpbancos.ReadOnly := False;
      UniEditdescricaobanco.ReadOnly:= True;

      btncalcula.Enabled            := True;
      btngravar.Enabled             := False;
      UniNumberEditparcelas.Enabled := True;
      UniNumberEditparcelas.Value   := 1;
    end;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.btncalculaClick(Sender: TObject);
begin
  UniDBGridboletos.Options          := UniDBGridboletos.Options + [dgEditing];

  calcula_titulos();
  btngravar.Enabled  := True;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.btngerarClick(Sender: TObject);
begin
  if dm_rc.tbboletos.RecordCount = 0  then
  begin
    dm_rc.rc_ShowSweetAlert( 'Ok', 'SEM INFORMAÇÕES DOS TITULOS' , 'error' , false );
    abort
  end
 else
  if (UniButtonEditpbancos.Text = '0') or
     (UniButtonEditpbancos.Text = '')  then
  begin
    dm_rc.rc_ShowSweetAlert( 'Ok', 'INFORMAR UMA CONTA VÁLIDA' , 'error' , false );
    abort
  end
 else
   begin
     if ConfirmarBoleto (mm.varI_Code_Company,
                         mm.varI_Code_Numero_Documento,
                         mm.varI_Code_documento_Documento,
                         0,
                         StrToInt(UniButtonEditpbancos.Text)) = True then
     begin
       btngerar.Enabled              := False;
       btnimprimir.Enabled           := True;
       UniButtonEditpbancos.ReadOnly := True;
       UniEditdescricaobanco.ReadOnly:= True;
       mm.varboletosolicitacao       := 'S';

       try  
         carregatitulos(mm.varI_Code_Company,
                        mm.varI_Code_Numero_Documento,
                        mm.varI_Code_documento_Documento,0);

         if mm.vars_identificatabela = 'REMESSA' then
           begin
             AtualizaRemessa(mm.vars_numero_remessa);
           end;

         if mm.vars_identificatabela = 'PEDIDO' then
           begin                  
             AtualizaPedido(mm.vars_numero_remessa);
           end;                       

         dm_rc.rc_ShowSweetAlert( 'Ok', 'BOLETO LANÇADO COM SUCESSO!' , 'success' , false );
       except
         dm_rc.rc_ShowSweetAlert( 'Ok', 'PROBLEMAS AO GERAR BOLETO!' , 'error' , false );
       end;
     end;

   end;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.btngravarClick(Sender: TObject);
begin
  try
    dm_rc.tbboletos.DisableControls;
    dm_rc.tbboletos.First;
    while not dm_rc.tbboletos.Eof do
      begin
        Grava_Financeiro(mm.vars_numero_remessa,
                         strtoint(mm.vari_pessoaamostra),
                         dm_rc.tbboletos.RecNo,
                         mm.varI_Code_Empresa_Documento,
                         dm_rc.tbboletosVENCIMENTO.AsDateTime,
                         dm_rc.tbboletosVALOR.AsFloat);
                         
        dm_rc.tbboletos.Next;
      end;
    dm_rc.tbboletos.EnableControls;
    dm_rc.tbboletos.First;

    UniDBGridboletos.Options          := UniDBGridboletos.Options - [dgEditing];
    
    botoes('hboleto');

    UniButtonEditpbancos.Text     := '';
    UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',UniButtonEditpbancos.Text);    
    
    dm_rc.rc_ShowToaster('success', 'Financeiro Gerado com Sucesso', True,'pinItUp');
  except
    dm_rc.rc_ShowToaster('error', 'NÃO CONSEGUI GERAR, CHAME O SUPORTE ', True,'pinItUp');
  end;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.btnimprimirClick(Sender: TObject);
var
  caminhopdf:string;
begin
  if (UniButtonEditpbancos.Text <> '0') and (UniButtonEditpbancos.Text <> '9999') then
    begin
      mm.varC_caminhopdf := GerarBoletoPDF (mm.varI_Code_Company,
                                            mm.varI_Code_Numero_Documento,
                                            mm.varI_Code_documento_Documento,
                                            0,
                                            StrToInt(UniButtonEditpbancos.Text),
                                            'imprimir');
      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO EXISTE BOLETO A SER IMPRESSO' , 'error' , false );

end;

procedure TfrmTELAMOVIMENTOBOLETOS.Calcula_Titulos;
var
  M_PARCELAS      : TStringList;
  R               : Integer;
  M_RESTO         : Real;
  ORDEM,
  M_ITENS         : Integer;
  parcela         : integer;
  VencimentoAtual : TDateTime;
  serie           : string;
begin
  dm_rc.tbboletos.Close;
  dm_rc.tbboletos.Open;

  if mm.vars_identificatabela = 'REMESSA' then
    serie := 'REM';
  if mm.vars_identificatabela = 'PEDIDO' then
    serie := 'LAS';
  if mm.vars_identificatabela = 'NEMATOIDE' then
    serie := 'LAN';


  ORDEM           := 0;
  parcela         := StrToInt(UniNumberEditparcelas.Text);
  M_RESTO         := UniFormattedNumberEditVLRPEDIDO.Value;
  VencimentoAtual := DATE;

  for R := 0 to parcela - 1  do
  begin
    inc(ORDEM);
    dm_rc.tbboletos.Append;
    VencimentoAtual                                    := IncDay(VencimentoAtual, 30);
    dm_rc.tbboletos.FindField('VENCIMENTO').AsDateTime := VencimentoAtual;
    dm_rc.tbboletos.FindField('VALOR').AsFloat         := MRound(UniFormattedNumberEditVLRPEDIDO.Value / parcela, 2);
    dm_rc.tbboletos.FindField('SEQUENCIA').AsInteger   := ORDEM;
    dm_rc.tbboletos.FindField('NUMERO').AsString       := RemoverEspeciais(mm.vari_pessoaamostra);
    dm_rc.tbboletos.FindField('SERIE').AsString        := serie;
    dm_rc.tbboletos.FindField('SITUACAO').AsString     := 'Aberto';
    dm_rc.tbboletos.FindField('NOME').AsString         := ACHA_ITEM('PESSOAS',mm.vari_pessoaamostra);
    dm_rc.tbboletos.Post;

    M_RESTO := M_RESTO - dm_rc.tbboletos.FindField('VALOR').AsFloat;
  end;

  if M_RESTO > 0 then
  begin
    dm_rc.tbboletos.Last;
    dm_rc.tbboletos.Edit;
    dm_rc.tbboletos.FindField('VALOR').AsFloat := dm_rc.tbboletos.FindField('VALOR').AsFloat + Abs(M_RESTO);
    dm_rc.tbboletos.Post;
  end
  else if M_RESTO < 0 then
  begin
    dm_rc.tbboletos.First;
    dm_rc.tbboletos.Edit;
    dm_rc.tbboletos.FindField('VALOR').AsFloat := dm_rc.tbboletos.FindField('VALOR').AsFloat - Abs(M_RESTO);
    dm_rc.tbboletos.Post;
  end;

  dm_rc.tbboletos.First;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniButtonEditpbancosButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniButtonEditpbancosExit(Sender: TObject);
begin
  UniEditdescricaobanco.Text := Acha_Item('PORTADORES'  ,UniButtonEditpbancos.Text);
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniDBGridboletosCellClick(Column: TUniDBGridColumn);
var
  caminhopdf:string;
begin
  if Column.FieldName = 'confirmaboleto' then
    begin
      if dm_rc.tbboletos.FindField('confirmaboleto').AsString = 'T' then
        begin
          mm.varC_caminhopdf := GerarBoletoPDF (mm.varI_Code_Company,
                                                dm_rc.tbboletosNUMERO.AsInteger,
                                                mm.varI_Code_documento_Documento,
                                                dm_rc.tbboletos.RecNo,
                                                StrToInt(UniButtonEditpbancos.Text),
                                                'imprimir');
          unfImpressao.ShowModal();
        end;
    end;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmTELAMOVIMENTOBOLETOS.UniFormShow(Sender: TObject);
begin
  UniFormattedNumberEditVLRPEDIDO.Value := mm.vari_vlr_pedido;


  if mm.vars_identificatabela = 'RECEBER' then
    begin
      if SqlPesquisa('select * from receber where empresa = ' + IntToStr(mm.varI_Code_Empresa_Documento)   +
                     'and numero    =                       ' + IntToStr(mm.varI_Code_Numero_Documento)    +
                     'and documento =                       ' + IntToStr(mm.varI_Code_documento_Documento) +
                     'and sequencia =                       ' + IntToStr(mm.varI_Code_Documento_parcela)   +
                     'order by sequencia asc') then
      begin
        if dm_rc.sqlBuscas.FindField('PORTADOR').AsString = '1' then
          begin
            botoes('hboleto');

            UniButtonEditpbancos.Text     := '';
            UniEditdescricaobanco.Text    := '';
          end
        else
          begin
            botoes('boleto');
            UniButtonEditpbancos.Text     := dm_rc.sqlBuscas.FindField('PORTADOR').AsString;
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',dm_rc.sqlBuscas.FindField('PORTADOR').AsString);
          end;


        carregatitulos(mm.varI_Code_Empresa_Documento,
                       mm.varI_Code_Numero_Documento,
                       mm.varI_Code_documento_Documento,
                       mm.varI_Code_Documento_parcela);
      end
      else
        begin
          botoes('');
        end;
    end;  
  if mm.vars_identificatabela = 'PEDIDO' then
    begin
      if SqlPesquisa('select * from receber where empresa = ' + IntToStr(mm.varI_Code_Company)             +
                     'and numero    =                       ' + IntToStr(mm.varI_Code_Numero_Documento)    +
                     'and documento =                       ' + IntToStr(mm.varI_Code_documento_Documento) +
                     'order by sequencia asc') then
      begin
        if dm_rc.sqlBuscas.FindField('PORTADOR').AsString = '1' then
          begin
            botoes('hboleto');

            UniButtonEditpbancos.Text     := '';
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',UniButtonEditpbancos.Text);
          end
        else
          begin
            botoes('boleto');
            UniButtonEditpbancos.Text     := dm_rc.sqlBuscas.FindField('PORTADOR').AsString;
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',dm_rc.sqlBuscas.FindField('PORTADOR').AsString);
          end;


        carregatitulos(mm.varI_Code_Company,
                       mm.varI_Code_Numero_Documento,
                       mm.varI_Code_documento_Documento,0);
      end
      else
        begin
          botoes('');
        end;
    end;

  if mm.vars_identificatabela = 'NEMATOIDE' then
    begin
      if SqlPesquisa('select * from receber where empresa = ' + IntToStr(mm.varI_Code_Company)             +
                     'and numero    =                       ' + IntToStr(mm.varI_Code_Numero_Documento)    +
                     'and documento =                       ' + IntToStr(mm.varI_Code_documento_Documento) +
                     'order by sequencia asc') then
      begin
        if dm_rc.sqlBuscas.FindField('PORTADOR').AsString = '1' then
          begin
            botoes('hboleto');

            UniButtonEditpbancos.Text     := '';
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',UniButtonEditpbancos.Text);
          end
        else
          begin
            botoes('boleto');
            UniButtonEditpbancos.Text     := dm_rc.sqlBuscas.FindField('PORTADOR').AsString;
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',dm_rc.sqlBuscas.FindField('PORTADOR').AsString);
          end;


        carregatitulos(mm.varI_Code_Company,
                       mm.varI_Code_Numero_Documento,
                       mm.varI_Code_documento_Documento,0);
      end
      else
        begin
          botoes('');
        end;
    end;

  if mm.vars_identificatabela = 'REMESSA' then
    begin
      if SqlPesquisa('select * from receber where empresa = ' + IntToStr(mm.varI_Code_Company)             +
                     'and numero    =                       ' + IntToStr(mm.varI_Code_Numero_Documento)    +
                     'and documento =                       ' + IntToStr(mm.varI_Code_documento_Documento) +
                     'order by sequencia asc') then
      begin
        if dm_rc.sqlBuscas.FindField('PORTADOR').AsString = '1' then
          begin
            botoes('hboleto');

            UniButtonEditpbancos.Text     := '';
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',UniButtonEditpbancos.Text);
          end
        else
          begin
            botoes('boleto');
            UniButtonEditpbancos.Text     := dm_rc.sqlBuscas.FindField('PORTADOR').AsString;
            UniEditdescricaobanco.Text    := Acha_Item('PORTADORES',dm_rc.sqlBuscas.FindField('PORTADOR').AsString);
          end;


        carregatitulos(mm.varI_Code_Company,
                       mm.varI_Code_Numero_Documento,
                       mm.varI_Code_documento_Documento,
                       0);
      end
      else
        begin
          botoes('');
        end;
    end;

end;

end.
