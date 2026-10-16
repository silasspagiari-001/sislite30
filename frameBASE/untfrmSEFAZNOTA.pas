unit untfrmSEFAZNOTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniPageControl, uniLabel, uniEdit, uniDBEdit, UniButtonDbEdit, uniScreenMask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniDBDateTimePicker, uniScrollBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniImage, acPNG, uniMemo, Vcl.Menus, uniMainMenu, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFEFR,ACBrDFeUtil,pcteConversaoCTe;

type
  TfrmSEFAZNOTA = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    btnENVIA: TUniBitBtn;
    btnSTATUS: TUniBitBtn;
    btnCONSULTA: TUniBitBtn;
    btnOPCOES: TUniBitBtn;
    UniPopupMenudetalhessefaz: TUniPopupMenu;
    danfeinpressao: TUniMenuItem;
    enviaremail: TUniMenuItem;
    cancelamentoeletronico: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    UniPageControlprincipal: TUniPageControl;
    UniTabSheetresposta: TUniTabSheet;
    rcBlock30: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniMemorespostaTXT: TUniMemo;
    rcBlock40: TUniContainerPanel;
    UniMemorespostaXML: TUniMemo;
    UniTabSheetcartacorrecao: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniMemocartacorrecao: TUniMemo;
    rcBlock80: TUniContainerPanel;
    UniMemorespostacartaXML: TUniMemo;
    UniPopupMenucartacorrecao: TUniPopupMenu;
    E1: TUniMenuItem;
    I1: TUniMenuItem;
    N4: TUniMenuItem;
    i2: TUniMenuItem;
    N3: TUniMenuItem;
    N5: TUniMenuItem;
    UniScreenMask1: TUniScreenMask;
    i7: TUniMenuItem;
    UniBitBtnimpressao: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnOPCOESClick(Sender: TObject);
    procedure btnSTATUSClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnCONSULTAClick(Sender: TObject);
    procedure danfeinpressaoClick(Sender: TObject);
    procedure cancelamentoeletronicoClick(Sender: TObject);
    procedure btnENVIAClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure enviaremailClick(Sender: TObject);
    procedure i7Click(Sender: TObject);
    procedure UniBitBtnimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;
   procedure ConfiguraAcbr(aempresa:integer);
   procedure HabilitaBotoes();
   procedure MontaXML(pcontrole:integer);
   procedure ValidaErros();
   procedure AtualizaNotas(tcancelada:string);
   procedure CarregaXML(pempresa,pcontrole:integer);

  end;

function frmSEFAZNOTA: TfrmSEFAZNOTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, untDM_RC, mkm_procedures,
  pcnConversao, blcksock, ACBrDFeSSL, untFrmTELAGENERICA, mkm_funcoes,
  pcnConversaoNFe, mkm_func_web, System.StrUtils, unReportImpressao,
  untFrmNOTAELETRONICA, Main, Vcl.Clipbrd;

var
  M_ARQUIVOPDF : string;
  M_ARQUIVOXML : string;

function frmSEFAZNOTA: TfrmSEFAZNOTA;
begin
  Result := TfrmSEFAZNOTA(mm.GetFormInstance(TfrmSEFAZNOTA));
end;

procedure TfrmSEFAZNOTA.AtualizaNotas(tcancelada: string);
begin
  TabelaMvmestre(' select * from mvmestre where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEmpresas(' select * from empresas where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaMvitens (' select * from mvitens  where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                 ' and                          documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                 ' and                          empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));

  dm_rc.FDQryMvmestre.Edit;
  if tcancelada = 'A' then
    begin
      dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString := Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
      dm_rc.FDQryMvmestre.FindField('PROTOCOLO').AsString    := dm_rc.ACBrNFe.WebServices.enviar.Protocolo;
      dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString    := 'A';
    end;

  dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString    := tcancelada;

  if tcancelada = 'A' then
    dm_rc.FDQryMvmestre.FindField('LOGENVIO').AsString     := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time)
  else
  if tcancelada = 'C' then
    begin
      dm_rc.FDQryMvmestre.FindField('LOGCANCELA').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

      executasql(' update receber set financeiro = ' + IntToStr(2) +
                 ' where numero                  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)   +
                 ' and documento                 = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                   = ' + IntToStr(mm.varI_Code_Company));
    end;

  dm_rc.FDQryMvmestre.Post;


  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      dm_rc.tbmvitens.Edit;
      dm_rc.tbmvitens.FindField('CANCELADA').AsString := tcancelada;
      dm_rc.tbmvitens.Post;

      dm_rc.tbmvitens.Next;
    end;

  dm_rc.FDQryMvmestre.Refresh;
end;

procedure TfrmSEFAZNOTA.btnCONSULTAClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  try
    dm_rc.ACBrNFe.NotasFiscais.Clear;
    dm_rc.ACBrNFe.WebServices.Consulta.NFeChave := dm_rc.FDQryMvmestre.FindField('codigobarras').AsString;
    dm_rc.ACBrNFe.WebServices.Consulta.Executar;

    if dm_rc.ACBrNFe.WebServices.Consulta.xMotivo = 'Cancelamento de NF-e homologado' then
      AtualizaNotas('C');
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrNFe.WebServices.Consulta.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.Consulta.TpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.Consulta.cUF));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('Chave........: ' + dm_rc.ACBrNFe.WebServices.Consulta.NFeChave);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.Consulta.Protocolo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.Consulta.DhRecbto));
  except
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZNOTA.btnENVIAClick(Sender: TObject);
begin

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  ConfiguraAcbr(mm.varI_Code_Company);
  MontaXML(mm.varI_Code_Documento_Controle);

  try
    dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSalvar    := Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'NFe',dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,'');

    try
      dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
      dm_rc.ACBrNFe.NotasFiscais.Assinar;
      dm_rc.ACBrNFe.NotasFiscais.Validar;
    except
      on e: exception do
      begin
        gera_log(e.message);
      end;
    end;


    if dm_rc.ACBrNFe.Enviar(1,False,True) then
      dm_rc.ACBrNFe.NotasFiscais.Items[0].GravarXML;

    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrNFe.WebServices.Enviar.RetornoWS);

    if StrContains('100#150#103',IntToStr(dm_rc.ACBrNFe.WebServices.retorno.cStat))then
      begin
        AtualizaNotas('A');
        UniMemorespostaTXT.Lines.Add('NOTA FISCAL ENVIADA COM SUCESSO!');
        UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Enviar.xMotivo);
        UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.Enviar.TpAmb));
        UniMemorespostaTXT.Lines.Add('Chave........: ' + Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44));
        UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.Enviar.Recibo);
        UniMemorespostaTXT.Lines.Add('Recibo.......: ' + dm_rc.ACBrNFe.WebServices.Enviar.Protocolo);
        HabilitaBotoes();

        executasql('update mvmestre set codigobarras = ' + QuotedStr(Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44)) +
                                      ' where numero = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('numero').AsInteger)    + ' and ' +
                                          'documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('documento').AsInteger) + ' and ' +
                                            'empresa = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('empresa').AsInteger));


      end;
  except
    on e: exception do
    begin
      gera_log(e.message);
      UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Enviar.xMotivo);
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error' , false );
    end;
  end;
end;

procedure TfrmSEFAZNOTA.btnOPCOESClick(Sender: TObject);
begin
  UniPopupMenudetalhessefaz.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZNOTA.btnSTATUSClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;
  try
    dm_rc.ACBrNFe.WebServices.StatusServico.Executar;
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrNFe.WebServices.StatusServico.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Status Serviço');
    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.StatusServico.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.StatusServico.cStat));
    UniMemorespostaTXT.Lines.Add('UF...........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.StatusServico.cUF));
    UniMemorespostaTXT.Lines.Add('Versão Aplic.: ' + dm_rc.ACBrNFe.WebServices.StatusServico.verAplic);
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.StatusServico.xMotivo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.StatusServico.dhRecbto));
  except
    UniMemorespostaTXT.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZNOTA.cancelamentoeletronicoClick(Sender: TObject);
var
  NumeroLote      : Integer;
begin
  UniScreenMask1.AttachedControl := cancelamentoeletronico;

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  ConfiguraAcbr(mm.varI_Code_Company);
  CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  dm_rc.ACBrNFe.EventoNFe.Evento.Clear;
  NumeroLote                     := random(5);
  dm_rc.ACBrNFe.EventoNFe.idLote := NumeroLote;

  with dm_rc.ACBrNFe.EventoNFe.Evento.New do
    begin
      InfEvento.tpAmb           := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
      infEvento.chNFe           := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
      infEvento.CNPJ            := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
      infEvento.dhEvento        := NOW;
      infEvento.tpEvento        := teCancelamento;
      infEvento.detEvento.nProt := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt;
      infEvento.detEvento.xJust := 'Emissao indevida por valores ou dados inconsistentes';
      InfEvento.cOrgao          := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cUF;
    end;

  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathEvento        := Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'NFe',dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,'Cancelamento');

  try
    if dm_rc.ACBrNFe.EnviarEvento(NumeroLote) then
      begin
        if dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
          begin
            UniMemorespostaTXT.Lines.Add('Não Consegui Cancelar a Nota Fiscal');
            UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
          end
        else
          begin
            UniMemorespostaXML.Lines.Text             := UTF8Encode(dm_rc.ACBrNFe.WebServices.EnvEvento.RetornoWS);

            UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
            UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
            UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));

            EventoXmlAcbr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,
                          dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString,
                          dm_rc.FDQryMvmestre.FindField('EMPRESA').AsString,
                          'C');

            AtualizaNotas('C');
            HabilitaBotoes();
          end;
      end;

  except
    on e: exception do
    begin
      gera_log(e.message);
      UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
    end;
  end;

end;

procedure TfrmSEFAZNOTA.CarregaXML(pempresa, pcontrole: integer);
begin
  SqlPesquisa   (' select * from mvmestre where codigo = ' + IntToStr(pcontrole));
  TabelaEmpresas(' select * from empresas where codigo = ' + IntToStr(pempresa));

  M_ARQUIVOXML := Validacaminho(pempresa,
                                mm.M_PATHXML,
                                mm.varC_Doc_Customer,
                                'NFe',
                                dm_rc.sqlBuscas.FindField('EMISSAO').AsString,
                                '') + dm_rc.sqlBuscas.FindField('CODIGOBARRAS').AsString + '-nfe.xml';

  if dm_rc.tbempresas.FindField('ESTILO').AsString = 'Fortesreport' then
    begin
      if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'C' then
        dm_rc.ACBrNFeDANFeRL.Cancelada := True
      else
        if (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A') or (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = '') then
          dm_rc.ACBrNFeDANFeRL.Cancelada := False;
    end
  else
    begin
      if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'C' then
        dm_rc.ACBrNFeDANFeFR.Cancelada := True
      else
        if (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A') or (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = '') then
          dm_rc.ACBrNFeDANFeFR.Cancelada := False;
    end;

  try
    dm_rc.ACBrNFe.NotasFiscais.Clear;
    dm_rc.ACBrNFe.NotasFiscais.LoadFromFile(M_ARQUIVOXML);
  except
  end;
end;

procedure TfrmSEFAZNOTA.ConfiguraAcbr(aempresa: integer);
begin
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(aempresa));

  M_ARQUIVOPDF := Gera_Guid()+'.pdf';

  dm_rc.ACBrNFe.WebServices.Retorno.Clear;

  dm_rc.ACBrNFe.Configuracoes.WebServices.UF              :=  dm_rc.tbempresas.FindField('ESTADO').AsString;
  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSchemas        :=  'C:\Arquivos\Schemas\NFe\';
  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSalvar         :=  'C:\Arquivos\temp\';

  if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
    dm_rc.ACBrNFe.Configuracoes.WebServices.Ambiente        :=  taProducao
  else
    dm_rc.ACBrNFe.Configuracoes.WebServices.Ambiente        :=  taHomologacao;

  //*************************************************************************
  dm_rc.AcbrNFE.Configuracoes.WebServices.IntervaloTentativas      :=  3000;
  dm_rc.AcbrNFE.Configuracoes.WebServices.TimeOut                  :=  4000;
  dm_rc.AcbrNFE.Configuracoes.WebServices.Tentativas               :=  5;
  dm_rc.AcbrNFE.Configuracoes.WebServices.AguardarConsultaRet      :=  3000;
  dm_rc.ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;

  dm_rc.ACBrNFe.Configuracoes.Geral.ExibirErroSchema               := False;
  dm_rc.ACBrNFe.Configuracoes.Geral.VersaoDF                       := ve400;
  //*************************************************************************
  dm_rc.ACBrNFe.SSL.SSLType                               :=  TSSLType(LT_TLSv1_2);
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLLib                :=  libWinCrypt;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLCryptLib           :=  cryWinCrypt;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLHttpLib            :=  httpWinHttp;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLXmlSignLib         :=  xsLibXml2;
  dm_rc.ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado :=  True;
  dm_rc.ACBrNFe.Configuracoes.Arquivos.SalvarEvento       :=  True;

  if dm_rc.tbempresas.FindField('CERTIFICADO_CAMINHO').AsString <> '' then
    begin
      dm_rc.ACBrNFe.Configuracoes.Certificados.ArquivoPFX     :=  dm_rc.tbempresas.FindField('CERTIFICADO_CAMINHO').AsString
    end
  else
    begin
      dm_rc.AcbrNFE.Configuracoes.Certificados.NumeroSerie    :=  dm_rc.tbempresas.FindField('CERTIFICADO_CHAVE').AsString;
    end;

  dm_rc.ACBrNFe.Configuracoes.Certificados.Senha          :=  dm_rc.tbempresas.FindField('CERTIFICADO_SENHA').AsString;

  if dm_rc.tbempresas.FindField('ESTILO').AsString = 'Fortesreport' then
    dm_rc.ACBrNFe.DANFE := dm_rc.ACBrNFeDANFeRL
  else
    dm_rc.ACBrNFe.DANFE := dm_rc.ACBrNFeDANFEFR;

  //*************************************************************************
  //IMPRESSAO FORTES
  //*************************************************************************
  dm_rc.ACBrNFeDANFeRL.NomeDocumento                      :=  M_ARQUIVOPDF;
  dm_rc.ACBrNFeDANFeRL.PathPDF                            :=  dm_rc.tbempresas.FindField('caminho_impressao').AsString;
  dm_rc.ACBrNFeDANFeRL.Logo                               :=  dm_rc.tbempresas.FindField('caminho_logo').AsString;
  dm_rc.ACBrNFeDANFEFR.Sistema                            :=  'Sislite - Sistema de Gestão Empresarial';
  dm_rc.ACBrNFeDANFEFR.Site                               :=  dm_rc.tbempresas.FindField('site').AsString;

  dm_rc.ACBrNFeDANFeRL.ImprimeNomeFantasia                :=  variif(dm_rc.tbempresas.FindField('IMP_FANTASIA').AsString           = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.LogoemCima                         :=  variif(dm_rc.tbempresas.FindField('IMP_LOGO').AsString               = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeCampoFatura                   :=  variif(dm_rc.tbempresas.FindField('IMP_EXIBEFATURA').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeDadosDocReferenciados         :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSREFERENCIADOS').AsString = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeResumoCanhoto                 :=  variif(dm_rc.tbempresas.FindField('IMP_RESUMOCANHOTO').AsString      = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeTotalTributosItem             :=  variif(dm_rc.tbempresas.FindField('IMP_TRIBUTOSIMP').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExpandirDadosAdicionaisAuto        :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSADICIONAIS').AsString    = 'T',True,False);

  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Nenhum' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infNenhum;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Descrição' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infDescricao;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Separadamente' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infSeparadamente;

  dm_rc.ACBrNFeDANFeRL.MargemDireita                      :=  dm_rc.tbempresas.FindField('IMP_MARGEM_DIREITA').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemEsquerda                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_ESQUERDA').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemInferior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_INFERIOR').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemSuperior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_SUPERIOR').AsFloat;

  dm_rc.ACBrNFeDANFeRL.MostraPreview                      :=  False;
  dm_rc.ACBrNFeDANFeRL.MostraSetup                        :=  False;
  dm_rc.ACBrNFeDANFeRL.MostraStatus                       :=  False;
  //*************************************************************************

  //*************************************************************************
  //IMPRESSAO FASTREPORT
  //*************************************************************************
  dm_rc.ACBrNFeDANFEFR.NomeDocumento                      :=  M_ARQUIVOPDF;
  dm_rc.ACBrNFeDANFEFR.PathPDF                            :=  dm_rc.tbempresas.FindField('caminho_impressao').AsString;
  dm_rc.ACBrNFeDANFEFR.Logo                               :=  dm_rc.tbempresas.FindField('caminho_logo').AsString;
  dm_rc.ACBrNFeDANFEFR.Sistema                            :=  'Sislite - Sistema de Gestão Empresarial';
  dm_rc.ACBrNFeDANFEFR.Site                               :=  dm_rc.tbempresas.FindField('site').AsString;
  if dm_rc.tbempresas.FindField('PRODUTOR').AsString = 'Retrato' then
    begin
      dm_rc.ACBrNFeDANFEFR.TipoDANFE                      := tiRetrato;
      dm_rc.ACBrNFeDANFEFR.FastFile                       := dm_rc.tbempresas.FindField('caminho_fastreport').AsString + '\DANFeRetrato.fr3'
    end
  else
    begin
      dm_rc.ACBrNFeDANFEFR.TipoDANFE                      := tiPaisagem;
      dm_rc.ACBrNFeDANFEFR.FastFile                       := dm_rc.tbempresas.FindField('caminho_fastreport').AsString + '\DANFePaisagem.fr3';
    end;
  dm_rc.ACBrNFeDANFEFR.FastFileInutilizacao               := dm_rc.tbempresas.FindField('caminho_fastreport').AsString + '\DANFeInutilizacao.fr3';
  dm_rc.ACBrNFeDANFEFR.FastFileEvento                     := dm_rc.tbempresas.FindField('caminho_fastreport').AsString + '\DANFeEventos.fr3';
  dm_rc.ACBrNFeDANFEFR.ImprimeNomeFantasia                :=  variif(dm_rc.tbempresas.FindField('IMP_FANTASIA').AsString           = 'T',True,False);
  dm_rc.ACBrNFeDANFEFR.ExibeCampoFatura                   :=  variif(dm_rc.tbempresas.FindField('IMP_EXIBEFATURA').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFEFR.ExibeDadosDocReferenciados         :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSREFERENCIADOS').AsString = 'T',True,False);
  dm_rc.ACBrNFeDANFEFR.ExibeResumoCanhoto                 :=  variif(dm_rc.tbempresas.FindField('IMP_RESUMOCANHOTO').AsString      = 'T',True,False);
  dm_rc.ACBrNFeDANFEFR.ExibeTotalTributosItem             :=  variif(dm_rc.tbempresas.FindField('IMP_TRIBUTOSIMP').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFEFR.ExpandirDadosAdicionaisAuto        :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSADICIONAIS').AsString    = 'T',True,False);

  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Nenhum' then
    dm_rc.ACBrNFeDANFEFR.ExibeInforAdicProduto              :=  infNenhum;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Descrição' then
    dm_rc.ACBrNFeDANFEFR.ExibeInforAdicProduto              :=  infDescricao;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Separadamente' then
    dm_rc.ACBrNFeDANFEFR.ExibeInforAdicProduto              :=  infSeparadamente;

  dm_rc.ACBrNFeDANFEFR.MargemDireita                      :=  dm_rc.tbempresas.FindField('IMP_MARGEM_DIREITA').AsFloat;
  dm_rc.ACBrNFeDANFEFR.MargemEsquerda                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_ESQUERDA').AsFloat;
  dm_rc.ACBrNFeDANFEFR.MargemInferior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_INFERIOR').AsFloat;
  dm_rc.ACBrNFeDANFEFR.MargemSuperior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_SUPERIOR').AsFloat;

  dm_rc.ACBrNFeDANFEFR.MostraPreview                      :=  False;
  dm_rc.ACBrNFeDANFEFR.MostraSetup                        :=  False;
  dm_rc.ACBrNFeDANFEFR.MostraStatus                       :=  False;
  //*************************************************************************
end;

procedure TfrmSEFAZNOTA.danfeinpressaoClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  if (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'A') or (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'C') then
    CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle)
  else
    begin
      MontaXML(mm.varI_Code_Documento_Controle);
      dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
    end;

  dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;
  mm.varC_caminhopdf :=  M_ARQUIVOPDF;

  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.E1Click(Sender: TObject);
var
 Chave, idLote, CNPJ, nSeqEvento, coduso: string;
 I : Integer;
begin
  if Length(UniMemocartacorrecao.Text) < 15 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'DESCRIÇÃO DA CARTA MENOR QUE 15 CARACTERES' , 'error' , false );
      abort;
    end;
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  dm_rc.FDQryMvmestre.Edit;
  dm_rc.FDQryMvmestre.FindField('CARTACORRECAO').AsString := UniMemocartacorrecao.Text;
  dm_rc.FDQryMvmestre.Post;

  dm_rc.ACBrNFe.NotasFiscais.Clear;
  dm_rc.ACBrNFe.EventoNFe.Evento.Clear;

  ConfiguraAcbr(mm.varI_Code_Company);

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;
  UniMemorespostacartaXML.Clear;

  idLote     := '1';
  nSeqEvento := IntToStr(Random(5));
  dm_rc.AcbrNFe.EventoNFe.idLote := StrToInt(idLote);

  with dm_rc.ACBrNFe.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe               := dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString;
      infEvento.detEvento.nProt     := dm_rc.FDQryMvmestre.FindField('PROTOCOLO').AsString;
      infEvento.CNPJ                := dm_rc.tbempresas.FindField('CNPJ').AsString;;
      infEvento.dhEvento            := now;
      infEvento.tpEvento            := teCCe;
      infEvento.nSeqEvento          := StrToInt(nSeqEvento);
      infEvento.detEvento.xCorrecao := UniMemocartacorrecao.Text;
    end;

  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathEvento        := Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'NFe',dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,'Correcao');

  try
    if dm_rc.ACBrNFe.EnviarEvento(StrToInt(idLote)) then
      begin
        UniMemorespostaXML.Lines.Text  := UTF8Encode(dm_rc.ACBrNFe.WebServices.EnvEvento.RetornoWS);

        UniMemorespostacartaXML.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.AcbrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
        UniMemorespostacartaXML.Lines.Add('cStat........: ' + IntToStr(dm_rc.AcbrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
        UniMemorespostacartaXML.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
        UniMemorespostacartaXML.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
        UniMemorespostacartaXML.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));

        dm_rc.FDQryMvmestre.Edit;
        dm_rc.FDQryMvmestre.FindField('DATACARTA').AsString         := DateToStr(Date);
        dm_rc.FDQryMvmestre.FindField('LOGCARTA').AsString          := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
        dm_rc.FDQryMvmestre.FindField('BARRASCORRECAO').AsString    := dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.chNFe;
        dm_rc.FDQryMvmestre.FindField('PROTOCOLOCORRECAO').AsString := dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
        dm_rc.FDQryMvmestre.Post;

        EventoXmlAcbr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,
                      dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString,
                      dm_rc.FDQryMvmestre.FindField('EMPRESA').AsString,
                      'CCE');
      end;
  except
    on e: exception do
    begin
      gera_log(e.message);
      UniMemorespostacartaXML.Lines.Add('Motivo.......: ' + e.message);
    end;
  end;
end;

procedure TfrmSEFAZNOTA.enviaremailClick(Sender: TObject);
begin
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  if (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'A') then
    begin
      TabelaPessoas('select * from pessoas where codigo = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
      if StrEmpty(StrAllTrim(dm_rc.FDQryPessoas.FindField('EMAIL').AsString)) then
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Informe um Email no Cadastro da Pessoa!' , 'warning' , false )
        end
      else
        begin
          ConfiguraAcbr(mm.varI_Code_Company);
          CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
          dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;

          if Enviar_Email('Segue em Anexo o XML e PDF de sua Nota Eletrônica de Compra' + '<br>' +
                          'Mensagem Automática Enviada pelo Sistema - FAVOR NÃO RESPONDER' + '<br>' +
                          'Sislite - Sistema de Gestão Empresarial' + '<br>' +
                          'Acesse: www.sislite.com.br',
                          mm.varC_CompanyName + ' - Anexo Nota Eletrônica emitida para seu CPF/CNPJ: ' + dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString,
                          mm.varC_CompanyName,
                          dm_rc.FDQryPessoas.FindField('EMAIL').AsString,
                          M_ARQUIVOXML,
                          mm.M_PATHIMPRESSAO + M_ARQUIVOPDF) then
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Arquivo XML e PDF para: ' + dm_rc.FDQryPessoas.FindField('EMAIL').AsString + ' - Enviado com sucesso' , 'success' , false )
          else
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui Enviar E-mail' , 'warning' , false );
        end;
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Permitido Apenas para Nota Fiscal Valida' , 'warning' , false )
    end
end;

procedure TfrmSEFAZNOTA.HabilitaBotoes;
begin
  SqlPesquisa('select codigobarras, protocolo, cancelada from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A' then
    begin
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
      btnENVIA.Enabled               := False;
      btnCONSULTA.Enabled            := True;
      cancelamentoeletronico.Enabled := true;
      enviaremail.Enabled            := True;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := False;
    end
  else
  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'C' then
    begin
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
      btnENVIA.Enabled               := False;
      btnCONSULTA.Enabled            := True;
      cancelamentoeletronico.Enabled := False;
      enviaremail.Enabled            := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := True;
    end
  else
    begin
      btnENVIA.Enabled               := True;
      btnCONSULTA.Enabled            := False;
      cancelamentoeletronico.Enabled := False;
      enviaremail.Enabled            := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := False;
    end;
end;

procedure TfrmSEFAZNOTA.I1Click(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  dm_rc.ACBrNFe.EventoNFe.Evento.Clear;
  TabelaMvmestre (' select * from mvmestre   where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEventoXML(' select * from eventosxml where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                  ' and                            documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                  ' and                            empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger)   +
                  ' and tipo                                 = ' + QuotedStr('CCE'));
  if not dm_rc.fdqryeventoxml.IsEmpty then
    begin
      if dm_rc.fdqryeventoxml.FindField('xml').AsString <> '' then
        begin
          dm_rc.AcbrNFE.EventoNFe.LerXMLFromString(dm_rc.fdqryeventoxml.FindField('xml').AsString);
          dm_rc.AcbrNFE.ImprimirEventoPDF;
          mm.varC_caminhopdf :=  M_ARQUIVOPDF;
          unfImpressao.ShowModal();
        end
      else
        begin
          M_ARQUIVOXML := Validacaminho(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger,
                                        mm.M_PATHXML,
                                        mm.varC_Doc_Customer,
                                        'NFe',
                                        dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,
                                        'Correcao') + '110110' + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString + '01-procEventoNFe.xml';

          try
            dm_rc.AcbrNFE.EventoNFe.LerXML(M_ARQUIVOXML);
            dm_rc.AcbrNFE.ImprimirEventoPDF;
            mm.varC_caminhopdf :=  M_ARQUIVOPDF;
            unfImpressao.ShowModal();
          except
            on e: exception do
            begin
              gera_log(e.message);
              dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error' , false );
            end;
          end;
        end;
    end
  else
    begin
      M_ARQUIVOXML := Validacaminho(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger,
                                    mm.M_PATHXML,
                                    mm.varC_Doc_Customer,
                                    'NFe',
                                    dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,
                                    'Correcao') + '110110' + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString + '01-procEventoNFe.xml';

      try
        dm_rc.AcbrNFE.EventoNFe.LerXML(M_ARQUIVOXML);
        dm_rc.AcbrNFE.ImprimirEventoPDF;
        mm.varC_caminhopdf :=  M_ARQUIVOPDF;
        unfImpressao.ShowModal();
      except
        on e: exception do
        begin
          gera_log(e.message);
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error' , false );
        end;
      end;
    end;
end;

procedure TfrmSEFAZNOTA.i2Click(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  dm_rc.ACBrNFe.EventoNFe.Evento.Clear;
  TabelaMvmestre (' select * from mvmestre   where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEventoXML(' select * from eventosxml where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                  ' and                            documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                  ' and                            empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger)   +
                  ' and tipo                                 = ' + QuotedStr('C'));
  if not dm_rc.fdqryeventoxml.IsEmpty then
    begin
      if dm_rc.fdqryeventoxml.FindField('xml').AsString <> '' then
        begin
          dm_rc.AcbrNFE.EventoNFe.LerXMLFromString(dm_rc.fdqryeventoxml.FindField('xml').AsString);
          dm_rc.AcbrNFE.ImprimirEventoPDF;
          mm.varC_caminhopdf :=  M_ARQUIVOPDF;
          unfImpressao.ShowModal();

        end
      else
        begin
          M_ARQUIVOXML := Validacaminho(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger,
                                        mm.M_PATHXML,
                                        mm.varC_Doc_Customer,
                                        'NFe',
                                        dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,
                                        'Cancelamento') + '110111' + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString + '01-procEventoNFe.xml';

          try
            dm_rc.AcbrNFE.EventoNFe.LerXML(M_ARQUIVOXML);
            dm_rc.AcbrNFE.ImprimirEventoPDF;
            mm.varC_caminhopdf :=  M_ARQUIVOPDF;
            unfImpressao.ShowModal();
          except
            on e: exception do
            begin
              gera_log(e.message);
              dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error' , false );
            end;
          end;
        end;
    end
  else
    begin
      M_ARQUIVOXML := Validacaminho(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger,
                                    mm.M_PATHXML,
                                    mm.varC_Doc_Customer,
                                    'NFe',
                                    dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,
                                    'Cancelamento') + '110111' + dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString + '01-procEventoNFe.xml';

      try
        dm_rc.AcbrNFE.EventoNFe.LerXML(M_ARQUIVOXML);
        dm_rc.AcbrNFE.ImprimirEventoPDF;
        mm.varC_caminhopdf :=  M_ARQUIVOPDF;
        unfImpressao.ShowModal();
      except
        on e: exception do
        begin
          gera_log(e.message);
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error' , false );
        end;
      end;
    end;
end;

procedure TfrmSEFAZNOTA.i7Click(Sender: TObject);
var
  NumeroLote      : Integer;
  Modelo, Serie, Ano, NumeroInicial, NumeroFinal, Justificativa: String;
begin
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  //preenche informacao
  //**************************************************************************//
  modelo        := '55';
  serie         := dm_rc.tbempresas.FindField('SERIE').AsString;
  Numeroinicial := IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger);
  NumeroFinal   := IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger);
  Justificativa := 'Numero de nota não utilizado pela empresa emissora';
  ano           := FormatDateTime('yyyy',Date);
  //**************************************************************************//
  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathEvento        := Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'NFe',dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,'Inutilizacao');
  try
    dm_rc.ACBrNFe.WebServices.Inutiliza(dm_rc.tbempresas.FindField('CNPJ').AsString,
                                        Justificativa,
                                        StrToInt(Ano),
                                        StrToInt(Modelo),
                                        StrToInt(Serie),
                                        StrToInt(NumeroInicial),
                                        StrToInt(NumeroFinal));

    UniMemorespostaXML.Lines.Text             := UTF8Encode(dm_rc.ACBrNFe.WebServices.EnvEvento.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.Inutilizacao.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.Inutilizacao.cStat));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Inutilizacao.xMotivo);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.Inutilizacao.Protocolo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.Inutilizacao.dhRecbto));

    AtualizaNotas('I');

  except
    on e: exception do
    begin
      gera_log(e.message);
      UniMemorespostaTXT.Lines.Add('Motivo.....: ' + dm_rc.ACBrNFe.WebServices.Inutilizacao.xMotivo);
    end;
  end;
end;

procedure TfrmSEFAZNOTA.MontaXML(pcontrole: integer);
var
  M_ITENS                               : Integer;
  base0, base1, UFDestino               : Real;
  totpis,totcofins                      : Real;
  consumidor, estado, contribuinte, desc: string;
  Total_Imposto, Perc_Imposto           : Real;
begin
  TabelaMvmestre  (' select * from mvmestre where codigo      = ' + IntToStr(pcontrole));
  TabelaEmpresas  (' select * from empresas where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaPessoas   (' select * from pessoas  where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' select * from transportes where codigo   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));
  TabelaOperacao  (' select * from operacoes where codigo     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));
  Tabelaescritas  (' select * from escritas where codigo      = ' + IntToStr(dm_rc.FDQryoperacoes.FindField('ESCRITA').AsInteger));
  TabelaTitulos   (' select * from                              ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber','pagar')+
                   ' where numero                             = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                         ');
  TabelaMvitens   (' select * from mvitens  where numero      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                      ');

  dm_rc.ACBrNFe.NotasFiscais.Clear;
  with dm_rc.ACBrNFe.NotasFiscais.Add.NFe do
    begin
      infRespTec.CNPJ     := '13308121000147';
      infRespTec.xContato := 'DIOGENES HENRIQUE DA FONSECA SILVA';
      infRespTec.email    := 'contato@sislite.com.br';
      infRespTec.fone     := '18996573931';

      Ide.natOp           := dm_rc.FDQryoperacoes.FindField('DESCRICAO').AsString;
      Ide.nNF             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
      Ide.cNF             := StrToInt(StrZeros(IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) + copy(DateToStr(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime), 1, 2), 9));//GerarCodigoDFe(Ide.nNF);
      Ide.serie           := 1;
      Ide.modelo          := 55;

      if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar' then
        begin
          Ide.finNFe           := fnComplementar;
          Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
        end
      else
      if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Devolucao' then
        begin
          Ide.finNFe           := fnDevolucao;
          Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
        end
      else
        Ide.finNFe  := fnNormal;

      Ide.dEmi      := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime;
      Ide.dSaiEnt   := dm_rc.FDQryMvmestre.FindField('RECEPCAODESPACHO').AsDateTime;
      Ide.hSaiEnt   := Now;

      if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
        Ide.tpAmb     := taProducao
      else
        Ide.tpAmb     := taHomologacao;

      Ide.tpImp     := tiRetrato;
      Ide.verProc   := 'Sislite 3.0.0';
      Ide.cUF       := StrToInt(Copy(dm_rc.tbempresas .FindField('IBGE').AsString,1,2));
      Ide.cMunFG    := StrToInt(dm_rc.tbempresas .FindField('IBGE').AsString);
      Ide.indFinal  := cfNao;

      if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
        Ide.tpNF      := tnSaida
      else
        Ide.tpNF      := tnEntrada;

      if StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
        Ide.indPag    := ipOutras
      else
        begin
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger < 3 then
             Ide.indPag    := ipVista
          else
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger > 9 then
            Ide.indPag    := ipPrazo   else  Ide.indPag    := ipOutras;
        end;

      if dm_rc.tbempresas.FindField('ESTADO').AsString = dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
        Ide.idDest := doInterna
      else
        if dm_rc.tbempresas.FindField('ESTADO').AsString <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
          Ide.idDest := doInterestadual
      else
        if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
          Ide.idDest := doExterior;

      //********************************************************************************************************************************
      // EMITENTE
      //********************************************************************************************************************************
      Emit.CNPJCPF            := StrAllTrim(dm_rc.tbempresas.FindField('CNPJ').AsString);
      Emit.IE                 := RemoverEspeciais(dm_rc.tbempresas.FindField('INSCRICAO').AsString);
      Emit.xNome              := RemoverEspeciais(dm_rc.tbempresas.FindField('NOME').AsString);
      Emit.xFant              := RemoverEspeciais(dm_rc.tbempresas.FindField('FANTASIA').AsString);
      Emit.EnderEmit.fone     := RemoverEspeciais(dm_rc.tbempresas.FindField('TELEFONE').AsString);
      Emit.EnderEmit.CEP      := StrToInt(dm_rc.tbempresas.FindField('CEP').AsString);
      Emit.EnderEmit.xLgr     := RemoverEspeciais(dm_rc.tbempresas.FindField('ENDERECO').AsString);
      Emit.EnderEmit.nro      := RemoverEspeciais(dm_rc.tbempresas.FindField('NUMERO').AsString);
      Emit.EnderEmit.xBairro  := RemoverEspeciais(dm_rc.tbempresas.FindField('BAIRRO').AsString);
      Emit.EnderEmit.cMun     := StrToInt(dm_rc.tbempresas.FindField('IBGE').AsString);
      Emit.EnderEmit.xMun     := RemoverEspeciais(dm_rc.tbempresas.FindField('CIDADE').AsString);
      Emit.EnderEmit.UF       := dm_rc.tbempresas.FindField('ESTADO').AsString;
      Emit.enderEmit.cPais    := 1058;
      Emit.enderEmit.xPais    := 'BRASIL';

      if dm_rc.tbempresas.FindField('TIPO').AsString = 'Lucro Real/Presumido' then
        Emit.CRT              := crtRegimeNormal
      else
      if dm_rc.tbempresas.FindField('TIPO').AsString = 'Normal' then
        Emit.CRT              := crtRegimeNormal
      else
        Emit.CRT              := crtSimplesNacional;

      Emit.CNAE               := '';
      Emit.IM                 := '';

      if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Dest.EnderDest.xLgr         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString);
          Dest.EnderDest.nro          := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NUMERO').AsString);
          Dest.EnderDest.CEP          := StrToInt(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xMun         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('CIDADE').AsString);
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString);
          Dest.EnderDest.xBairro      := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString);
          Dest.EnderDest.cPais        := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xPais        := dm_rc.FDQryPessoas.FindField('PAIS').AsString;

          //******************************************************************************************************************************//
          // DADOS PARA EXPORTAÇÃO
          //******************************************************************************************************************************//
          exporta.UFSaidaPais         := dm_rc.FDQryPessoas.FindField('ESTADOEXPORTACAO').AsString;
          exporta.xLocExporta         := dm_rc.FDQryPessoas.FindField('LOCALEXPORTACAO').AsString;
        end
      else
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Dest.EnderDest.xLgr         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString);
          Dest.EnderDest.nro          := variif(dm_rc.FDQryPessoas.FindField('NUMERO').AsString = '','S/N',RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NUMERO').AsString));
          Dest.EnderDest.CEP          := StrToInt(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xMun         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('CIDADE').AsString);
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString);
          Dest.ISUF                   := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('SUFRAMA').AsString);

          if not StrEmpty(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString) then
            Dest.EnderDest.xBairro    := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString)
          else
            Dest.EnderDest.xBairro    := 'RURAL';

          Dest.EnderDest.cPais        := 1058;
          Dest.EnderDest.xPais        := 'BRASIL';

          //****************************************************************//
          // ENDERECO DE ENTREGA
          //****************************************************************//
          if dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString <> '' then
            begin
              Entrega.xNome   := StrAllTrim(dm_rc.FDQryPessoas.FindField('NOME').AsString);
              Entrega.IE      := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Entrega.CNPJCPF := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
              Entrega.xLgr    := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString);
              Entrega.nro     := variif(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString = '','S/N',RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString));
              Entrega.xCpl    := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
              Entrega.xBairro := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString);
              Entrega.cMun    := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsInteger;
              Entrega.xMun    := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString);
              Entrega.UF      := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
              Entrega.CEP     := StrToInt(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);
              Entrega.fone    := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
            end;
          //****************************************************************//
        end;

      if StrContains('EX',dm_rc.FDQryPessoas.FindField('ESTADO').AsString) then
        Dest.indIEDest  := inNaoContribuinte
      else
        begin
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Nao Contribuinte' then
            begin
              Dest.indIEDest  := inNaoContribuinte;
              Ide.indFinal    := cfConsumidorFinal;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Isento' then
            begin
              Dest.indIEDest  := inIsento;
              Ide.indFinal    := cfConsumidorFinal;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Consumidor' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = '' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;
        end;

      //******************************************************************************************************************************//
      //TRANSPORTADOR
      //******************************************************************************************************************************//
      with Transp do
        begin
          Transporta.xNome        := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('NOME').AsString);
          if not StrEmpty(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString) then
            Transporta.CNPJCPF    := StrAllTrim(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);
          if not StrEmpty(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString) then
            Transporta.IE         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString);
          Transporta.xEnder       := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('ENDERECO').AsString);
          Transporta.xMun         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('CIDADE').AsString);
          Transporta.UF           := dm_rc.FDQryTransportes.FindField('ESTADO').AsString;

          with Vol.New do
            begin
              qVol    := StrToInt(FloatToStr(dm_rc.FDQryMVmestre.FindField('TRAQUANTIDADE').AsInteger));
              esp     := dm_rc.FDQryMVmestre.FindField('TRAESPECIE').AsString;
              marca   := dm_rc.FDQryMVmestre.FindField('TRAMARCA').AsString;
              nVol    := dm_rc.FDQryMVmestre.FindField('TRANUMERONOTA').AsString;
              pesoL   := dm_rc.FDQryMVmestre.FindField('TRAPESOLIQUIDO').AsFloat;
              pesoB   := dm_rc.FDQryMVmestre.FindField('TRAPESOBRUTO').AsFloat;
            end;

          if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 0 then
            Transp.modFrete := mfSemFrete
          else
            if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 1 then
              Transp.modFrete := mfContaEmitente
            else
              if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 2 then
                Transp.modFrete := mfContaDestinatario
              else
                if dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 3 then
                  Transp.modFrete := mfContaTerceiros;
        end;

      Total_Imposto := 0;
      dm_rc.tbmvitens.First;
      M_ITENS := 0;
      while not dm_rc.tbmvitens.Eof do
        begin
          if dm_rc.tbmvitens.FindField('PRODUTO').AsInteger > 0 then
            begin
              with Det.New do
                begin
                  Inc(M_ITENS);
                  Prod.nItem    := M_ITENS;

                  TabelaProdutos( ' SELECT * FROM PRODUTOS, SALDOS WHERE PRODUTOS.CODIGO = SALDOS.PRODUTO AND PRODUTOS.CODIGO   = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger) +
                                  ' AND SALDOS.EMPRESA                                                                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));

                  Prod.xProd    := RemoverEspeciais(dm_rc.tbmvitens.FindField('DESCRICAO').AsString);
                  Prod.CFOP     := copy(dm_rc.tbmvitens.FindField('OPERACAO').AsString,1,4);
                  Prod.cProd    := IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger);
                  Prod.NCM      := RemoverEspeciais(dm_rc.FDQryProdutos.FindField('NUMERONCM').AsString);
                  Prod.vFrete   := MRound(dm_rc.tbmvitens.FindField('FRETE').AsFloat,4);
                  Prod.vSeg     := MRound(dm_rc.tbmvitens.FindField('SEGURO').AsFloat,4);
                  Prod.vOutro   := MRound(dm_rc.tbmvitens.FindField('DESPESAS').AsFloat,4);
                  Prod.qCom     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
                  Prod.qTrib    := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;

                  if dm_rc.tbmvitens.FindField('DESCONTO').AsFloat > 0 then
                    begin
                      Prod.vDesc    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('DESCONTO').AsFloat,2));
                      Prod.vUnCom   := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4)); //4
                      Prod.vUnTrib  := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4)); //4
                      Prod.vProd    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4)); //4
                    end
                  else
                    begin
                      Prod.vUnCom   := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vUnTrib  := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4));
                      Prod.vProd    := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4));
                    end;

                  Prod.cEAN     := 'SEM GTIN';
                  Prod.cEANTrib := 'SEM GTIN';

                  if StrEmpty(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString) then
                    begin
                      Prod.uCom   := 'UN';
                      Prod.uTrib  := 'UN';
                    end
                  else
                    begin
                      Prod.uCom   := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);
                      Prod.uTrib  := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);
                    end;

                  with Imposto do
                    begin
                      with ICMS do
                        begin
                          orig := oeNacional;
                          if (dm_rc.tbempresas.FindField('TIPO').AsString = 'Simples Nacional') then
                            begin
                              if dm_rc.tbmvitens.FindField('CST').AsString = '0101' then
                                CSOSN := csosn101
                              else
                                if dm_rc.tbmvitens.FindField('CST').AsString = '0201' then
                                  CSOSN := csosn201
                                else
                                  if dm_rc.tbmvitens.FindField('CST').AsString = '0300' then
                                    CSOSN := csosn300
                                  else
                                    if dm_rc.tbmvitens.FindField('CST').AsString = '0102' then
                                      CSOSN := csosn102
                                    else
                                      if dm_rc.tbmvitens.FindField('CST').AsString = '0500' then
                                        CSOSN := csosn500
                                      else
                                        if dm_rc.tbmvitens.FindField('CST').AsString = '0103' then
                                          CSOSN := csosn103
                                        else
                                          if dm_rc.tbmvitens.FindField('CST').AsString = '0400' then
                                            CSOSN := csosn400
                                          else
                                            if dm_rc.tbmvitens.FindField('CST').AsString = '0202' then
                                              begin
                                                CSOSN   := csosn202;
                                                modBC   := dbiValorOperacao;
                                                pICMS   := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                                vICMS   := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                                vBC     := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;

                                                if dm_rc.tbmvitens.FindField('PERCSUB').AsFloat > 0 then
                                                  begin
                                                    vBCST   := dm_rc.tbmvitens.FindField('BASESUB').AsFloat;
                                                    pICMSST := dm_rc.tbmvitens.FindField('PERCSUB').AsFloat;
                                                    vICMSST := dm_rc.tbmvitens.FindField('VALORSUB').AsFloat;
                                                  end;
                                              end
                                            else
                                              if dm_rc.tbmvitens.FindField('CST').AsString = '0900' then
                                                begin
                                                  CSOSN   := csosn900;
                                                  modBC   := dbiValorOperacao;
                                                  pICMS   := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                                  vICMS   := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                                  vBC     := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;

                                                  if dm_rc.tbmvitens.FindField('PERCSUB').AsFloat > 0 then
                                                    begin
                                                      vBCST   := dm_rc.tbmvitens.FindField('BASESUB').AsFloat;
                                                      pICMSST := dm_rc.tbmvitens.FindField('PERCSUB').AsFloat;
                                                      vICMSST := dm_rc.tbmvitens.FindField('VALORSUB').AsFloat;
                                                    end;
                                                end;
                            end
                          else
                          if (dm_rc.tbempresas.FindField('TIPO').AsString = 'Normal') then
                            begin
                              CST         := cst40;
                              modBC       := dbiValorOperacao;
                              orig        := oeNacional;
                              pICMS       := 0;
                              vICMS       := 0;
                              vBC         := 0;
                            end
                          else
                            begin
                              if dm_rc.tbmvitens.FindField('CST').AsString = '000' then
                                begin
                                  CST         := cst00;
                                  modBC       := dbiValorOperacao;
                                  pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '010' then
                                begin
                                  CST         := cst10;
                                  modBC       := dbiValorOperacao;
                                  pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '020' then
                                 begin
                                   CST         := cst20;
                                   modBC       := dbiValorOperacao;
                                   pRedBC      := dm_rc.tbmvitens.FindField('PERCREDUCAO').AsFloat;
                                   pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                   vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                   vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                 end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '030' then
                                begin
                                  CST         := cst30;
                                  modBC       := dbiValorOperacao;
                                  pICMS       := 0;
                                  vICMS       := 0;
                                  vBC         := 0;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '040' then
                                begin
                                  CST         := cst40;
                                  modBC       := dbiValorOperacao;
                                  orig        := oeNacional;
                                  pRedBC      := dm_rc.tbmvitens.FindField('PERCREDUCAO').AsFloat;
                                  pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '041' then
                                begin
                                  CST    := cst41;
                                  modBC  := dbiValorOperacao;
                                  orig   := oeNacional;
                                  pICMS  := 0;
                                  vICMS  := 0;
                                  vBC    := 0;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '050' then
                                begin
                                  CST    := cst50;
                                  modBC  := dbiValorOperacao;
                                  orig   := oeNacional;
                                  pICMS  := 0;
                                  vICMS  := 0;
                                  vBC    := 0;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '051' then
                                begin
                                  CST    := cst51;
                                  modBC  := dbiValorOperacao;
                                  pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '060' then
                                begin
                                   CST    := cst60;
                                   modBC  := dbiValorOperacao;
                                   vBCST  := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '070' then
                                begin
                                  CST         := cst70;
                                  modBC       := dbiValorOperacao;
                                  pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                  vICMSDeson  := dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat;
                                  motDesICMS  := mdiProdutorAgropecuario;
                                end;
                              if dm_rc.tbmvitens.FindField('CST').AsString = '090' then
                                begin
                                  CST         := cst90;
                                  modBC       := dbiValorOperacao;
                                  pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                                  vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                                  vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                                  vICMSDeson  := dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat;
                                  motDesICMS  := mdiProdutorAgropecuario;
                                end;
                            end;
                        end;

                      with PIS do
                        begin
                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('PIS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                             0 : CST := pis01;    //01
                             1 : CST := pis02;    //02
                             2 : CST := pis03;    //03
                             3 : CST := pis04;    //04
                             4 : CST := pis05;    //05
                             5 : CST := pis06;    //06
                             6 : CST := pis07;    //07
                             7 : CST := pis08;    //08
                             8 : CST := pis09;    //09
                             9 : CST := pis49;    //49
                            10 : CST := pis50;    //50
                            11 : CST := pis51;    //51
                            12 : CST := pis52;    //52
                            13 : CST := pis53;    //53
                            14 : CST := pis54;    //54
                            15 : CST := pis55;    //55
                            16 : CST := pis56;    //56
                            17 : CST := pis60;    //60
                            18 : CST := pis61;    //61
                            19 : CST := pis62;    //62
                            20 : CST := pis63;    //63
                            21 : CST := pis64;    //64
                            22 : CST := pis65;    //65
                            23 : CST := pis66;    //66
                            24 : CST := pis67;    //67
                            25 : CST := pis70;    //70
                            26 : CST := pis71;    //71
                            27 : CST := pis72;    //72
                            28 : CST := pis73;    //73
                            29 : CST := pis74;    //74
                            30 : CST := pis75;    //75
                            31 : CST := pis98;    //98
                            32 : CST := pis99;    //99
                           end;

                          if dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0 then
                            begin
                              vBC       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              pPIS      := dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat;
                              vPIS      := MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat / 100,2);
                            end
                          else
                            begin
                              vBC       := 0;
                              pPIS      := 0;
                              vPIS      := 0;
                            end;
                          totpis  := totpis + vPIS;
                        end;

                      with COFINS do
                        begin
                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('COFINS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                             0 : CST := cof01;    //01
                             1 : CST := cof02;    //02
                             2 : CST := cof03;    //03
                             3 : CST := cof04;    //04
                             4 : CST := cof05;    //05
                             5 : CST := cof06;    //06
                             6 : CST := cof07;    //07
                             7 : CST := cof08;    //08
                             8 : CST := cof09;    //09
                             9 : CST := cof49;    //49
                            10 : CST := cof50;    //50
                            11 : CST := cof51;    //51
                            12 : CST := cof52;    //52
                            13 : CST := cof53;    //53
                            14 : CST := cof54;    //54
                            15 : CST := cof55;    //55
                            16 : CST := cof56;    //56
                            17 : CST := cof60;    //60
                            18 : CST := cof61;    //61
                            19 : CST := cof62;    //62
                            20 : CST := cof63;    //63
                            21 : CST := cof64;    //64
                            22 : CST := cof65;    //65
                            23 : CST := cof66;    //66
                            24 : CST := cof67;    //67
                            25 : CST := cof70;    //70
                            26 : CST := cof71;    //71
                            27 : CST := cof72;    //72
                            28 : CST := cof73;    //73
                            29 : CST := cof74;    //74
                            30 : CST := cof75;    //75
                            31 : CST := cof98;    //98
                            32 : CST := cof99;    //99
                           end;

                          if dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0 then
                            begin
                              vBC       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              pCOFINS   := dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat;
                              vCOFINS   := MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat / 100,2);
                            end
                          else
                            begin
                              vBC       := 0;
                              pCOFINS   := 0;
                              vCOFINS   := 0;
                            end;
                          totcofins  := totcofins + vCOFINS;
                        end;

                      if dm_rc.FDQryProdutos.FindField('TIPO').AsString = 'Produto Acabado' then
                        begin
                          vTotTrib      := MRound((dm_rc.tbmvitens.FindField('TOTAL').AsFloat * 13.45) / 100,2);
                          Total_Imposto := Total_Imposto + vTotTrib;
                        end
                      else
                        vTotTrib      := 0;

                      if (dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Nao Contribuinte') and
                         (dm_rc.tbempresas.FindField('ESTADO').AsString <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString)  and
                         (Length(RemoverEspeciais(DM_RC.FDQryPessoas.FindField('CPFCNPJ').AsString)) >= 11) then
                        begin
                          with ICMSUFDest do
                            begin
                              vBCUFDest       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              vBCFCPUFDest    := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                              pFCPUFDest      := 2;
                              pICMSInterPart  := 100;
                              pICMSUFDest     := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);
                              pICMSInter      := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);
                              vICMSUFDest     := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                              vICMSUFRemet    := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                              vFCPUFDest      := MRound((DM_RC.tbmvitens.FindField('TOTAL').AsFloat * pFCPUFDest) / 100 ,2);
                              base0           := base0 + vICMSUFDest;
                              base1           := base1 + vICMSUFRemet;
                              UFDestino       := UFDestino + vFCPUFDest;
                            end;
                        end
                      else
                        begin
                          with ICMSUFDest do
                            begin
                              vBCUFDest      := 0.00;
                              pFCPUFDest     := 0.00;
                              pICMSUFDest    := 0.00;
                              pICMSInter     := 0.00;
                              pICMSInterPart := 0.00;
                              vICMSUFDest    := 0.00;
                              vICMSUFRemet   := 0.00;
                              base0          := base0 + vICMSUFDest;
                              base1          := base1 + vICMSUFRemet;
                            end;
                        end;
                    end;
                end;
            end;
          dm_rc.tbmvitens.Next;
        end;

      if (dm_rc.fdqrytitulos.RecordCount                          > 0) and
         (dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger <> 2) then
        begin
          with Cobr.Fat do
            begin
              if not StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
                begin
                  nFat  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;    // NUMERO DA NOTA
                  vOrig := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;   // VALOR DA NOTA
                  vLiq  := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;   // VALOR DA NOTA
                  vDesc := 0.00;                                                // VALOR DESCONTO

                  //**********************************************************//
                  // INFORMANDO O FINANCEIRO NO XML
                  //**********************************************************//
                  if dm_rc.fdqrytitulos.RecordCount > 0 then
                    begin
                      dm_rc.fdqrytitulos.First;
                      while not dm_rc.fdqrytitulos.Eof  do
                        begin
                          with Cobr.Dup.Add do
                            begin
                              nFat  := dm_rc.fdqrytitulos.FindField('NUMERO').AsString;
                              nDup  := StrZeros(dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsString,3);
                              dVenc := dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime;
                              vDup  := dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat;
                            end;
                          dm_rc.fdqrytitulos.Next;
                        end;
                    end;
                end;
              //***********************************************************//
              // INFORMANDO O TIPO DE PAGAMENTO
              //***********************************************************//
              with pag.new do
               begin
                 if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 2 then
                   tPag := fpOutro
                 else
                   tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpOutro,fpDuplicataMercantil);

                 vPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
               end;
            end;
        end
      else
        begin
          with pag.new do
           begin
             tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,fpSemPagamento);
             vPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),0.00,0.00);
           end;
        end;


      InfAdic.infCpl :=
//      'DOCUMENTO EMITIDO POR ME OU EPP' + #10 +
//                        'EMPRESA OPTANTE PELO SIMPLES NACIONAL' + #10 +
//                        'NAO GERA DIREITO A CREDITO DE ICMS/IPI E ISS' + #10 +
//                        'PERMITE APROVEITAMENTO DE CREDITO DE ICMS NO VALOR DE R$ ' + FormatFloat('###,###,##0.00',((dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat * 0.01) * 3.91)) + ' ALIQUOTA DE 3,91% ART 23-LC 123' + #10 +
                        variif(StrEmpty(dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString),'',dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString + #10) +
                        variif(StrEmpty(dm_rc.fdqryescritas.FindField('DESCRICAO').AsString),'',DM_RC.fdqryescritas.FindField('DESCRICAO').AsString);


      Total.ICMSTot.vST          := dm_rc.FDQryMvmestre.FindField('VLRSUBSTITUICAO').AsFloat;
      Total.ICMSTot.vBCST        := dm_rc.FDQryMvmestre.FindField('VLRBASESUBSTITUICAO').AsFloat;

      Total.ICMSTot.vBC          := dm_rc.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
      Total.ICMSTot.vICMS        := dm_rc.FDQryMvmestre.FindField('VLRICMS').AsFloat;

      Total.ICMSTot.vFrete       := dm_rc.FDQryMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
      Total.ICMSTot.vSeg         := dm_rc.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;

      Total.ICMSTot.vDesc        := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat,2);
      Total.ICMSTot.vOutro       := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat,2);
      Total.ICMSTot.vIPI         := dm_rc.FDQryMvmestre.FindField('VLRIPI').AsFloat;

      Total.ICMSTot.vProd        := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0, dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
      Total.ICMSTot.vNF          := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', 0,    dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);

      Total.ICMSTot.vICMSDeson   := 0;
      Total.ICMSTot.vFCPUFDest   := UFDestino;

      Total.ICMSTot.vICMSUFDest  := base0;
      Total.ICMSTot.vICMSUFRemet := base1;

      Total.ICMSTot.vPIS         := totpis;
      Total.ICMSTot.vCOFINS      := totcofins;
      Total.ICMSTot.vTotTrib     := Total_Imposto;
    end;
end;

procedure TfrmSEFAZNOTA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSEFAZNOTA.UniBitBtn2Click(Sender: TObject);
begin
  UniPopupMenucartacorrecao.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZNOTA.UniBitBtnimpressaoClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  if (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'A') or (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'C') then
    CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle)
  else
    begin
      MontaXML(mm.varI_Code_Documento_Controle);
      dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
    end;

  dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;
  mm.varC_caminhopdf :=  M_ARQUIVOPDF;

  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.UniFormCreate(Sender: TObject);
var
   i : integer;
begin

  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                 end;
       ltzn_CH : begin

                 end;
       ltin_ID : begin

                 end;
       ltth_TH : begin

                 end;
       lthi_IN : begin

                 end;
       ltar_SA    : begin

                 end;
  end;
  cFormModal   := mm.varC_Form_Modal;
end;

procedure TfrmSEFAZNOTA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSEFAZNOTA.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmSEFAZNOTA.UniFormShow(Sender: TObject);
begin
  HabilitaBotoes();
  UniMemorespostaTXT.Clear;
  UniMemorespostaTXT.Lines.Add(' *** ATENÇÃO *** ');
  UniMemorespostaTXT.Lines.Add('SEMPRE CONFIRA OS DADOS DA "NOTA" ANTES DE ENVIAR-LA AO SEFAZ!');
end;

procedure TfrmSEFAZNOTA.ValidaErros;
var
  Msg, Tempo: String;
  Inicio: TDateTime;
  Ok: Boolean;
begin
    Inicio := Now;
    Ok     := dm_rc.ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(Msg);
    Tempo  := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

    if not Ok then
    begin
      UniMemorespostaTXT.Lines.Add('Erro: ' + Msg);
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'ERROS ENCONTRADOS' +
                                           sLineBreak         +
                                           ' Tempo: '         + Tempo, 'error' , false );
    end
end;

end.
