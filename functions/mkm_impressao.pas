unit mkm_impressao;

interface

uses
  FireDAC.Comp.Client;


function IMPRESSAO_extratobancario  (portador,dataini,datafin:string;table:TFDMemTable)           :string;
function IMPRESSAO_caixadiario      (dataini:string;table:TFDMemTable)                            :string;
function IMPRESSAO_Financeiro       (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDMemTable)    :string;
function IMPRESSAO_planoanalitico   (dataini,datafin:string;table:TFDMemTable)                    :string;
function IMPRESSAO_planoresumo      (planoini,planofin,mesini,mesfim,ano:string;table:TFDMemTable):string;
function IMPRESSAO_bancoresumo      (dataini:string;table:TFDMemTable)                            :string;
function IMPRESSAO_Duplicata        (empresa,controle,parcela:integer)                            :string;
function IMPRESSAO_Autorizareembalo (empresa,controle:integer)                                    :string;
function IMPRESSAO_DeclaracaoRET    (empresa,controle:integer;nome,cpfcnpj:string)                        :string;

function LABORATORIO_ficha        (protocolo:integer;tipo:string): string;
function LABORATORIO_Boletim      (protocolo,via:integer)        : string;
function LABORATORIO_Informativo  (protocolo:integer)            : string;
function LABORATORIO_Levantamento (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
function LABORATORIO_Demonstrativo(dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
function LABORATORIO_RAM          (mes,ano:string;empresa,responsavel:Integer;table:TFDMemTable)                  :string;
function LABORATORIO_SEMRENASEM   (dataini,datafin:string;empresa,responsavel:Integer;table:TFDMemTable)          :string;
function LABORATORIO_ENTRADAS     (dataini,datafin:string;empresa:Integer;table:TFDMemTable)                      :string;

function NOTA_ContratoTranporte   (empresa,numero,documento:Integer)                             :string;
function NOTA_ControleEtiqueta    (empresa,numero,documento:Integer)                             :string;

function PEDIDOORCAMENTO_impressao (empresa,numero,documento:Integer)                            :string;
function PEDIDOORCAMENTO_contrato  (empresa,numero,documento:Integer)                            :string;
function PEDIDOORCAMENTO_orsimulado(empresa,numero,documento:Integer;tipo:string)                :string;
function PEDIDOORCAMENTO_os        (empresa,numero,documento:Integer)                            :string;
function PEDIDOORCAMENTO_osestoque (empresa,numero,documento:Integer)                            :string;

function SEMENTES_Termo            (empresa,controle,assinado:Integer)                           :string;

function RELATORIO_Vendasporperiodo (empresa:Integer;sql,dataini,datafin,status:string)          :string;
function RELATORIO_ESTOQUELOTE      (empresa:Integer;sql:string)                                 :string;
function RELATORIO_LISTAPRODUTO     (const rempresa,rprodini,rprodfin,rtipo,rordem:integer)      :string;
function RELATORIO_CONSULTAESTOQUE  (const rempresa,rprodini,rprodfin,rordem:integer)            :string;
function RELATORIO_Movimento        (const ptipo,dataini,datafin:string;rempresa:Integer;table:TFDQuery)  :string;
function RELATORIO_VENDASPORPRODUTO (const empresa:Integer;sql,pessoaini,pessoafin,dataini,datafin:string)             :string;
function RELATORIO_VENDASQTEPRODUTO (const empresa:Integer;ptipo,sql,rprodutoini,rprodutofin,dataini,datafin:string)         :string;
function IMPRESSAO_SISGRAOSOS     (pempresa,psolicitacao:integer)    :string;

implementation

uses mkm_procedures, mkm_func_web, mkm_funcoes, untDM_IMP, System.SysUtils,ACBrExtenso,
  frxClass, untDM_RC, mkm_regrasnegocio, System.Classes, uconsts, MainModule,
  mkm_relatorios, System.Variants;

var
ldm                  : tdm_imp;
M_ARQUIVO,
imagem, M_ANARENA    : string;

I, S, P, O, T, E, PRAGA,
DOSN,QTDE_P,QTDE_D,QTDE_PD  : Integer;
   S1,P1,O1,T1              : Integer;
Total_Imposto               : Real;
TIPO_P, TIPO_D              : Integer;
diasgerminacao              : Integer;

ID, SD, PD, OD, TD, ED      : integer;

M_OE1, M_SS1, M_PR1, M_TO1  : array[1..36] of string;
M_OEB, M_SSB, M_PRB, M_TOB  : array[1..36] of string;
M_OED, M_SSD, M_PRD, M_TOD  : array[1..36] of string;

memoria                     : TFDMemTable;

DESC_INFEST : Tstringlist;


function IMPRESSAO_extratobancario(portador,dataini,datafin:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;
      frxReport.Script.Variables['PORTADOR'] := portador;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_extrato_bancario.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_caixadiario    (dataini:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_Caixa_diario.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_planoanalitico (dataini,datafin:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;
      frxReport.Script.Variables['DATAFIN']  := datafin;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_plano_analitico.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_planoresumo    (planoini,planofin,mesini,mesfim,ano:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['MESINI']  := mesini;
      frxReport.Script.Variables['MESFIN']  := mesfim;
      frxReport.Script.Variables['ANO']     := ano;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_plano_resumo.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_bancoresumo    (dataini:string;table:TFDMemTable):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  ldm                    := tdm_imp.Create(nil);

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']  := dataini;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := table;

      frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'Bancos_resumo.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_ficha (protocolo:integer;tipo:string):string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where mestre_id = ' + IntToStr(dm_rc.FDQryAnalise.FindField('CODIGO').AsInteger) + ' GROUP BY 1,2,3');


  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP')  then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(TIPO_D);
        end;

      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP') then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(TIPO_P);
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SS' then
        begin
          Inc(S);  Inc(E);  Inc(PRAGA);
          M_SS1[S] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString  + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'OEC' then
        begin
          Inc(O);  Inc(E); Inc(PRAGA);
          M_OE1[O] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NP' then
        begin
          Inc(P);  Inc(E); Inc(PRAGA);
          M_PR1[P] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NT' then
        begin
          Inc(T);  Inc(E); Inc(PRAGA);
          M_TO1[T] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      with frxReport do
        begin
          Script.Variables['CABE_EMISSAO']         := dm_rc.FDQryAnalise.FindField('EMISSAO').AsString;
          Script.Variables['AMOSTRA']              := dm_rc.FDQryAnalise.FindField('AMOSTRA').AsString;
          Script.Variables['LOTE']                 := dm_rc.FDQryAnalise.FindField('LOTE').AsString;
          Script.Variables['CATEGORIA']            := dm_rc.FDQryAnalise.FindField('CATEGORIA').AsString;
          Script.Variables['AMOSTRA']              := dm_rc.FDQryAnalise.FindField('AMOSTRA').AsString;
          Script.Variables['SAFRA']                := dm_rc.FDQryAnalise.FindField('SAFRA_VALIDA').AsString;
          Script.Variables['DATA_ENTRADA']         := dm_rc.FDQryAnalise.FindField('DATA_ENTRADA').AsString;

          Script.Variables['ANALISE_A']            := variif(dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString = 'Analise','X','');
          Script.Variables['ANALISE_B']            := variif(dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString = 'Reanalise','X','');

          Script.Variables['ESPECIE_NOME']         := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['ESPECIE_ESPECIE']      := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;
          Script.Variables['CULTIVAR']             := dm_rc.FDQRyCultivar.FindField('CULTIVAR').AsString;


          Script.Variables['NUMERO_IR']            := dm_rc.FDQryProtocolo.FindField('NUMEROIR').AsString;
          Script.Variables['BAS_NUMERO']           := variif(dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString <> '',dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString,'');

          Script.Variables['BALANCA_PUREZA']       := dm_rc.FDQryAnalise.FindField('BALANCA_AMOSTRA_PUREZA').AsString;
          Script.Variables['BALANCA_ANALITICA']    := dm_rc.FDQryAnalise.FindField('BALANCA_ANALITICA').AsString;

          Script.Variables['PESO_AMOSTRA_PUREZA']  := FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_PUREZA').AsFloat);
          Script.Variables['PESO_AMOSTRA_RECEBIDA']:= FormatFloat('##,###0',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_RECEBIDA').AsFloat);
          Script.Variables['PESO_AMOSTRA_ANALISE'] := FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_ANALISE').AsFloat);


          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_RECEBIDA').AsFloat > 1000 then
          begin
            Script.Variables['UNIDADE_AMOSTRA'] := 'Kg';
          end
          else
            Script.Variables['UNIDADE_AMOSTRA'] := 'g';

          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_ANALISE').AsFloat > 1000 then
          begin
            Script.Variables['UNIDADE_ANALISE_PUREZA'] := 'Kg';
          end
          else
            Script.Variables['UNIDADE_ANALISE_PUREZA'] := 'g';


          Script.Variables['PUREZA_PESO_INICIAL'] := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat), '-O-');
          Script.Variables['PUREZA_PURAS_KG']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_KG').AsFloat),'-O-');

          if Frac(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat) = 0.00 then
          begin
            Script.Variables['PUREZA_PURAS_PER']     := dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsString +',0';
          end
          else
          begin
            Script.Variables['PUREZA_PURASPUREZA_PURAS_PER_PER']     := FormatFloat('##,###0.0',MRound(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat,2));
          end;

          Script.Variables['PUREZA_PURAS_PER']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.0',MRound(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat,2)) ,'-N-');
          Script.Variables['PUREZA_INERTE_KG']     := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_KG').AsFloat),'-O-');
          Script.Variables['PUREZA_INERTE_PER']    := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat > 0,FormatFloat('##,###0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat),
                                                                    FormatFloat('##,###0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat)),'-N-');

          if dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat > 0 then
          begin
            Script.Variables['REVESTIDAS_OUTRA_KG']  := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat),'-O-');
            Script.Variables['REVESTIDAS_OUTRA_PER'] := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');
            Script.Variables['PUREZA_OUTRA_KG']      := '';
            Script.Variables['PUREZA_OUTRA_PER']     := '';
          end
          else
          begin
            Script.Variables['PUREZA_OUTRA_KG']      := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat),'-O-');
            Script.Variables['PUREZA_OUTRA_PER']     := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');
            Script.Variables['REVESTIDAS_OUTRA_KG']  := '-N-';
            Script.Variables['REVESTIDAS_OUTRA_PER'] := '-N-';
          end;

          if dm_rc.FDQryPMS.RecordCount > 0 then
          begin
            Script.Variables['MEDIA_PMS']    := dm_rc.FDQryPMS.FindField('MEDIA_8').AsFloat;
            Script.Variables['PESO_PMS_KG']  := dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat;
            Script.Variables['DATA_PMS']     := dm_rc.FDQryPMS.FindField('DATA_ANALISE').AsString;
            Script.Variables['VISTO_PMS']    := dm_rc.FDQryPMS.FindField('NOME_ANALISTA').AsString;
          end
          else
          begin
            Script.Variables['MEDIA_PMS']    := '';
            Script.Variables['PESO_PMS_KG']  := '';
            Script.Variables['DATA_PMS']     := '';
            Script.Variables['VISTO_PMS']    := '';
          end;

          Script.Variables['VE_OBSERVACAO']       := variif(dm_rc.FDQryAnalise.FindField('OBS_VE').AsString <> '',dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');
          Script.Variables['PUREZA_VARIACAO_KG']  := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('VARIACAO_KG').AsFloat,'-O-');
          Script.Variables['PUREZA_PESO_FINAL']   := variif(M_ANARENA = 'Analise',FormatFloat('##,###0.000',dm_rc.FDQryAnalise.FindField('PESO_FINAL_KG').AsFloat),'-O-');

          Script.Variables['PESO_PUREZA']         := variif(dm_rc.FDQryProtocolo.FindField('PUREZA').AsString       = 'T','X','');
          Script.Variables['PESO_DOSN']           := variif(dm_rc.FDQryProtocolo.FindField('DOSN').AsString         = 'T','X','');
          Script.Variables['PESO_TZ']             := variif(dm_rc.FDQryProtocolo.FindField('TETRAZOLIO').AsString   = 'T','X','');
          Script.Variables['PESO_GERMINACAO']     := variif(dm_rc.FDQryProtocolo.FindField('GERMINACAO').AsString   = 'T','X','');
          Script.Variables['PESO_UMIDADE']        := variif(dm_rc.FDQryProtocolo.FindField('UMIDADE').AsString      = 'T','X','');
          Script.Variables['PESO_VE']             := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString           = 'T','X','');
          Script.Variables['PESO_PMS']            := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString          = 'T','X','');
          Script.Variables['PESO_SI']             := variif(dm_rc.FDQryProtocolo.FindField('SI').AsString           = 'T','X','');
          Script.Variables['PESO_VOC']            := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString          = 'T','X','');
          Script.Variables['PESO_VIGOR']          := variif(dm_rc.FDQryProtocolo.FindField('VIGOR').AsString        = 'T','X','');


          if dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T' then
          begin
            Script.Variables['PUREZA_PESO_FINAL_DOSN']   := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat),FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat))),'-O-');
            Script.Variables['PESO_DOSN_INICIAL']        := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)       ,FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)))       ,'-O-');
            Script.Variables['TOTAL_DOSN']               := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat)      ,FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat)))      ,'-O-'); // olha aqui
          end
          else
          begin
            Script.Variables['PUREZA_PESO_FINAL_DOSN']   := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat))),'-O-');
            Script.Variables['PESO_DOSN_INICIAL']        := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat)      ,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat))),'-O-');
            Script.Variables['TOTAL_DOSN']               := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('PESO_DOSN').AsFloat  = 0,'',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat),FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat))),'-O-'); // olha aqui
          end;

          Script.Variables['NATUREZA_MATERIAL_INERTE']   := dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;

          Script.Variables['TOTAL_OE']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsFloat,'-N-');
          Script.Variables['TOTAL_SS']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsFloat,'-N-');
          Script.Variables['TOTAL_TO']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsFloat,'-N-');
          Script.Variables['TOTAL_PR']                   := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsFloat,'-N-');

          Script.Variables['EMBEBICAO_HORA']             := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA').AsString;
          Script.Variables['EMBEBICAO_GRAUS']            := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_GRAUS').AsString;

          Script.Variables['EMBEBICAO_INICIAL']          := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_INICIO').AsString;
          Script.Variables['EMBEBICAO_HORA_INICIO']      := dm_rc.FDQryAnalise.FindField('TRATAMENTO_HORA_INICIO').AsString;
          Script.Variables['EMBEBICAO_TERMINO']          := dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA_TERMI').AsString;
          Script.Variables['EMBEBICAO_HORA_TERMINO']     := dm_rc.FDQryAnalise.FindField('TRATAMENTO_HORA_TERMINO').AsString;


          Script.Variables['CORTE_INICIADO']             := dm_rc.FDQryAnalise.FindField('CORTE_SEMENTE_INICIO').AsString;
          Script.Variables['IMERSAO_HORA']               := dm_rc.FDQryAnalise.FindField('COLORACAO_IMERSAO_HORA').AsString;
          Script.Variables['IMERSAO_SOLUCAO_PER']        := dm_rc.FDQryAnalise.FindField('COLORACAO_SOLUCAO').AsFloat;


          Script.Variables['IMERSAO_INICIAL']            := dm_rc.FDQryAnalise.FindField('COLORACAO_INICIO').AsString;
          Script.Variables['IMERSAO_HORA_INICIO']        := dm_rc.FDQryAnalise.FindField('COLORACAO_HORA_INICIO').AsString;
          Script.Variables['IMERSAO_TERMINO']            := dm_rc.FDQryAnalise.FindField('COLORACAO_TERMINO').AsString;
          Script.Variables['IMERSAO_HORA_TERMINO']       := dm_rc.FDQryAnalise.FindField('COLORACAO_HORA_TERMINO').AsString;
          Script.Variables['IMERSAO_COLORACAO_GRAUS']    := dm_rc.FDQryAnalise.FindField('COLORACAO_IMERSAO_GRAUS').AsString;

          Script.Variables['AVALIACAO_INICIO']           := dm_rc.FDQryAnalise.FindField('AVALIACAO_SEMENTES_INICIO').AsString;
          Script.Variables['AVALIACAO_HORA']             := dm_rc.FDQryAnalise.FindField('AVALIACAO_SEMENTES_HORA').AsString;

          Script.Variables['SEMENTES_AVALIADAS_I']       := dm_rc.FDQryAnalise.FindField('SEMENTES_AVALIADAS_I').AsFloat;
          Script.Variables['SEMENTES_AVALIADAS_II']      := dm_rc.FDQryAnalise.FindField('SEMENTES_AVALIADAS_II').AsFloat;
          Script.Variables['SEMENTES_VIAVEIS_I']         := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_I').AsFloat;
          Script.Variables['SEMENTES_VIAVEIS_II']        := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_II').AsFloat;
          Script.Variables['SEMENTES_VIAVEL_TOTAL']      := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_TOTAL').AsFloat;
          Script.Variables['SEMENTES_VIAVEL_MEDIA']      := dm_rc.FDQryAnalise.FindField('SEMENTES_VIAVEIS_MEDIA').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEIS_I']     := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_I').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEIS_II']    := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_II').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEL_TOTAL']  := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_TOTAL').AsFloat;
          Script.Variables['SEMENTES_NAO_VIAVEL_MEDIA']  := dm_rc.FDQryAnalise.FindField('SEMENTES_NAOVIAVEIS_MEDIA').AsFloat;
          Script.Variables['MEDIA_VIAVEL']               := dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat;

          Script.Variables['OBSERVACAO']                 := dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString;
          Script.Variables['MATERIAL_INERTE']            := dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;
          Script.Variables['EMPNOME']                    := dm_rc.tbempresas.FindField('DESCRICAO').AsString;


          if dm_rc.FDQryAnalise.FindField('PESSOA_HOMO').AsString = '' then
          begin
            Script.Variables['NOME_HOMO']                    := '';
          end
          else
          begin
            Script.Variables['NOME_HOMO']                    := Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('PESSOA_HOMO').AsString);
          end;

          if dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_PUREZA').AsString = '' then
          begin
            Script.Variables['NOME_ANALISTA_PUREZA']                    := '';
          end
          else
          begin
            Script.Variables['NOME_ANALISTA_PUREZA']                    := StrAllTrim(Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_PUREZA').AsString));
          end;

          if dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_TETRA').AsString = '' then
          begin
            Script.Variables['NOME_ANALISTA_TETRA']                    := '';
          end
          else
          begin
            Script.Variables['NOME_ANALISTA_TETRA']                    := Acha_Item('FUNCIONARIOS',dm_rc.FDQryAnalise.FindField('CODIGO_ANALISTA_TETRA').AsString);
          end;

          Script.Variables['SS_1']                    := variif(length(StrAllTrim(M_SS1[1])) > 0,M_SS1[1],'');
          Script.Variables['SS_2']                    := variif(length(StrAllTrim(M_SS1[2])) > 0,M_SS1[2],'');
          Script.Variables['SS_3']                    := variif(length(StrAllTrim(M_SS1[3])) > 0,M_SS1[3],'');
          Script.Variables['SS_4']                    := variif(length(StrAllTrim(M_SS1[4])) > 0,M_SS1[4],'');
          Script.Variables['SS_5']                    := variif(length(StrAllTrim(M_SS1[5])) > 0,M_SS1[5],'');
          Script.Variables['SS_6']                    := variif(length(StrAllTrim(M_SS1[6])) > 0,M_SS1[6],'');
          Script.Variables['SS_7']                    := variif(length(StrAllTrim(M_SS1[7])) > 0,M_SS1[7],'');

          Script.Variables['TO_1']                    := variif(length(StrAllTrim(M_TO1[1])) > 0,M_TO1[1],'');
          Script.Variables['TO_2']                    := variif(length(StrAllTrim(M_TO1[2])) > 0,M_TO1[2],'');
          Script.Variables['TO_3']                    := variif(length(StrAllTrim(M_TO1[3])) > 0,M_TO1[3],'');
          Script.Variables['TO_4']                    := variif(length(StrAllTrim(M_TO1[4])) > 0,M_TO1[4],'');
          Script.Variables['TO_5']                    := variif(length(StrAllTrim(M_TO1[5])) > 0,M_TO1[5],'');
          Script.Variables['TO_6']                    := variif(length(StrAllTrim(M_TO1[6])) > 0,M_TO1[6],'');
          Script.Variables['TO_7']                    := variif(length(StrAllTrim(M_TO1[7])) > 0,M_TO1[7],'');

          Script.Variables['PR_1']                    := variif(length(StrAllTrim(M_PR1[1])) > 0,M_PR1[1],'');
          Script.Variables['PR_2']                    := variif(length(StrAllTrim(M_PR1[2])) > 0,M_PR1[2],'');
          Script.Variables['PR_3']                    := variif(length(StrAllTrim(M_PR1[3])) > 0,M_PR1[3],'');
          Script.Variables['PR_4']                    := variif(length(StrAllTrim(M_PR1[4])) > 0,M_PR1[4],'');
          Script.Variables['PR_5']                    := variif(length(StrAllTrim(M_PR1[5])) > 0,M_PR1[5],'');
          Script.Variables['PR_6']                    := variif(length(StrAllTrim(M_PR1[6])) > 0,M_PR1[6],'');
          Script.Variables['PR_7']                    := variif(length(StrAllTrim(M_PR1[7])) > 0,M_PR1[7],'');

          Script.Variables['OE_1']                    := variif(length(StrAllTrim(M_OE1[1])) > 0,M_OE1[1],'');
          Script.Variables['OE_2']                    := variif(length(StrAllTrim(M_OE1[2])) > 0,M_OE1[2],'');
          Script.Variables['OE_3']                    := variif(length(StrAllTrim(M_OE1[3])) > 0,M_OE1[3],'');
          Script.Variables['OE_4']                    := variif(length(StrAllTrim(M_OE1[4])) > 0,M_OE1[4],'');
          Script.Variables['OE_5']                    := variif(length(StrAllTrim(M_OE1[5])) > 0,M_OE1[5],'');
          Script.Variables['OE_6']                    := variif(length(StrAllTrim(M_OE1[6])) > 0,M_OE1[6],'');
          Script.Variables['OE_7']                    := variif(length(StrAllTrim(M_OE1[7])) > 0,M_OE1[7],'');
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'ficha_analise.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function LABORATORIO_Boletim      (protocolo,via:integer)        :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaPessoas       ('SELECT * FROM PESSOAS         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('PESSOA').AsInteger));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  TabelaGerminacao    ('SELECT * FROM GERMINACAO      WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaRTCliente     ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RESPONSAVEL').AsInteger));
  TabelaRTLaboratorio ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RTEMPRESA').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where protocolo = ' + IntToStr(protocolo) + ' GROUP BY 1,2,3');


  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP')  then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(TIPO_D);
        end;

      if (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS')  or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT') or
         (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC') or (dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP') then
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(TIPO_P);
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SS' then
        begin
          Inc(S);  Inc(E);  Inc(PRAGA);
          M_SS1[S] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString  + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'OEC' then
        begin
          Inc(O);  Inc(E); Inc(PRAGA);
          M_OE1[O] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NP' then
        begin
          Inc(P);  Inc(E); Inc(PRAGA);
          M_PR1[P] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'NT' then
        begin
          Inc(T);  Inc(E); Inc(PRAGA);
          M_TO1[T] := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' (' +  dm_rc.sqlBuscas.FindField('total').AsString + ')';
        end;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin

      with frxReport do
        begin

          if via = 1 then
            Script.Variables['VIA_BOLETIM'] := '1º Via'
          else
          if via = 2 then
            Script.Variables['VIA_BOLETIM'] := '2º Via'
          else
          if via = 3 then
            Script.Variables['VIA_BOLETIM'] := '3º Via'
          else
          if via = 4 then
            Script.Variables['VIA_BOLETIM'] := '4º Via';

          Script.Variables['GERMINACAO_PENEIRA'] := variif(dm_rc.FDQryProtocolo.FindField('GERMINACAO').AsString = 'T',variif(dm_rc.FDQryGerminacao.FindField('PENEIRA').AsString = '','-N-',dm_rc.FDQryGerminacao.FindField('PENEIRA').AsString),'-N-');
          Script.Variables['EMPNOM']             := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['ENDERECO']           := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + dm_rc.tbempresas.FindField('BAIRRO').AsString;
          Script.Variables['CIDADE']             := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['ESTADO']             := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['RENASEM']            := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['TELEFONE']           := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPRENASEM']         := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['EMPVALIDADE']        := dm_rc.tbempresas.FindField('VALIDADE').AsString;

          Script.Variables['AMOSTRA']            := dm_rc.FDQryProtocolo.FindField('AMOSTRA').AsString;
          Script.Variables['BOLETIM']            := dm_rc.FDQryProtocolo.FindField('BOLETIM').AsString;
          Script.Variables['VALIDADE']           := '';

          Script.Variables['CLINOM']             := tratanome(Trocarletra(dm_rc.FDQryPessoas.FindField('NOME').AsString));
          Script.Variables['CLIEND']             := PrimeiraLetraMaiscula(Trocarletra(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString)) + ' '   + dm_rc.FDQryPessoas.FindField('NUMERO').AsString + ' - ' +
                                                    PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString)   + ' - ' +
                                                    PrimeiraLetraMaiscula(dm_rc.FDQryPessoas.FindField('CIDADE').AsString) + '/' + dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Script.Variables['CLICEP']             := FORMATA_CEP(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Script.Variables['CLIRENASEM']         := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;

          Script.Variables['PRODUTO_COMUM']      := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['PRODUTO_ESPECIE']    := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;
          Script.Variables['PRODUTO_CULTIVAR']   := dm_rc.FDQRyCultivar.FindField('CULTIVAR').AsString;
          Script.Variables['AVEIA_NATIVA']       := dm_rc.FDQryAnalise.FindField('AVEIA_NATIVA').AsString;

          Script.Variables['PROTOCOLO_SAFRA']    := dm_rc.FDQryProtocolo.FindField('SAFRAVALIDA').AsString;
          Script.Variables['PROTOCOLO_CATEGORIA']:= dm_rc.FDQryProtocolo.FindField('CATEGORIA').AsString;
          Script.Variables['DATA_AMOSTRAGEM']    := dm_rc.FDQryProtocolo.FindField('DATAAMOSTRAGEM').AsString;

          Script.Variables['PROTOCOLO_CATEGORIA']          := dm_rc.FDQryProtocolo.FindField('CATEGORIA').AsString;
          Script.Variables['PROTOCOLO_RECEBIMENTO']        := dm_rc.FDQryProtocolo.FindField('DATARECEBIMENTO').AsString;
          Script.Variables['PROTOCOLO_LOTE']               := dm_rc.FDQryProtocolo.FindField('LOTE').AsString;
          Script.Variables['PROTOCOLO_REPRESENTATIVIDADE'] := variif(dm_rc.FDQryProtocolo.FindField('REPRESENTATIVIDADE').AsFloat > 0,FormatFloat('###,###,##0',dm_rc.FDQryProtocolo.FindField('REPRESENTATIVIDADE').AsFloat) + ' Kg',dm_rc.FDQryProtocolo.FindField('REPRESENTA_ESCRITA').AsString);

          Script.Variables['PROTOCOLO_PROCEDENCIA'] := PrimeiraLetraMaiscula(dm_rc.FDQryProtocolo.FindField('CIDADE_PROCEDENCIA').AsString) + '-'+dm_rc.FDQryProtocolo.FindField('ESTADO_PROCEDENCIA').AsString;

          Script.Variables['RT_NOME_CLIENTE']    := PrimeiraLetraMaiscula(dm_rc.FDQryRTCliente.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM_CLIENTE'] :=                       dm_rc.FDQryRTCliente.FindField('CREDENCIAL').AsString;

          Script.Variables['OBSERVACAO']         := dm_rc.FDQryProtocolo.FindField('OBSERVACAO').AsString;
          Script.Variables['VE_REVESTIDAS']      := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                                         ' SEMENTES REVESTIDAS ' +
                                                                         ' % sementes puras = % pelotas puras e % de outras sementes = % sementes não revestidas','');
          Script.Variables['VE_OBSERVACAO']      := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString = 'T',
                                                                         dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');



          Script.Variables['PESO_ANALISE_PUREZA'] := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                                                   FormatFloat('###,###,##0.000' ,dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),
                                                                                                   FormatFloat('###,###,##0.00'  ,dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat)),'-O-');

          Script.Variables['PESO_ANALISE_PUREZA_DOSN']  := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                                         FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_AMOSTRA_INC').AsFloat),
                                                                         variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                             FormatFloat('###,###,##0.000',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),
                                                                             FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat)));

          Script.Variables['PESO_ANALISE_PUREZA_VOC']  := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString = 'T',FormatFloat('###,###,##0.00',dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat),'-0-');

          Script.Variables['PERC_SEMENTES_PURAS'] := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat  > 0 ,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat) ,0) ,'-N-');//_DATAMODULE.TB_ANALISE.FindField('SEMENTES_PURAS_PERC').AsFloat;
          Script.Variables['PERC_MATERIAL_INERTE']  := variif(M_ANARENA = 'Analise',variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat >= 0,FormatFloat('###,###,##0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat),0) ,'-N-') ;//dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat;
          Script.Variables['PERC_OUTRAS_SEMENTES']  := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');

          Script.Variables['NATUREZA_MATERIAL_INERTE'] := PrimeiraLetraMaiscula(dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString);

          Script.Variables['TOTAL_OE']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsFloat, '-N-');
          Script.Variables['TOTAL_SS']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsFloat, '-N-');
          Script.Variables['TOTAL_TO']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsFloat, '-N-');
          Script.Variables['TOTAL_PR']            := variif(M_ANARENA = 'Analise',dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsFloat, '-N-');
          Script.Variables['TOTAL_VOC']           := variif(dm_rc.FDQryProtocolo.FindField('VOC').AsString   = 'T',
                                                                      dm_rc.FDQryAnalise.FindField('TOTAL_VOC').AsFloat, '-N-');

          Script.Variables['TOTAL_VE']            := variif(dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat    <>  0  ,  dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat,                              '-N-');
          Script.Variables['TOTAL_SI']            := variif(dm_rc.FDQryProtocolo.FindField('SI').AsString        = 'T' ,  FormatFloat('##,###0.0' ,dm_rc.FDQryAnalise.FindField('SI_AM_MEDIA').AsFloat), '-N-');
          Script.Variables['TOTAL_PMS']           := variif(dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat    <> 0  ,  FormatFloat('##,###0.00',dm_rc.FDQryPMS.FindField('RESULTADO_PMS').AsFloat)  , '-N-');
          Script.Variables['TOTAL_TZ']            := variif(dm_rc.FDQryProtocolo.FindField('TETRAZOLIO').AsString = 'T',  dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat               , '-N-');
          Script.Variables['MATERIAL_INERTE']     :=  dm_rc.FDQryAnalise.FindField('NATUREZA_MATERIAL').AsString;
          Script.Variables['DIAVIABILIDADE']      :=  dm_rc.FDQryAnalise.FindField('TRATAMENTO_EMBEBICAO_HORA_TERMI').AsString;


          Script.Variables['DOSN']                :=     variif(M_ANARENA = 'Analise',
                                                                       variif(dm_rc.FDQryEspecie.FindField('DECIMAIS').AsString = 'T',
                                                                       FormatFloat('###,###,##0.00',mround(dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat,2)),
                                                                       FormatFloat('###,###,##0.0' ,mround(dm_rc.FDQryAnalise.FindField('TOTAL_DOSN').AsFloat,2))),'-O-');

          Script.Variables['MES']                 := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsDateTime)));
          Script.Variables['ANO']                 := StrToFloat(StrRight(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,4));
          Script.Variables['DIA']                 := StrToFloat(StrLeft(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,2));

          Script.Variables['SS1']                 := variif(length(StrAllTrim(M_SS1[1])) > 0,'11 - '+M_SS1[1],'');
          Script.Variables['SS2']                 := variif(length(StrAllTrim(M_SS1[2])) > 0,','+M_SS1[2],'');
          Script.Variables['SS3']                 := variif(length(StrAllTrim(M_SS1[3])) > 0,','+M_SS1[3],'');
          Script.Variables['SS4']                 := variif(length(StrAllTrim(M_SS1[4])) > 0,','+M_SS1[4],'');
          Script.Variables['SS5']                 := variif(length(StrAllTrim(M_SS1[5])) > 0,','+M_SS1[5],'');
          Script.Variables['SS6']                 := variif(length(StrAllTrim(M_SS1[6])) > 0,','+M_SS1[6],'');
          Script.Variables['SS7']                 := variif(length(StrAllTrim(M_SS1[7])) > 0,','+M_SS1[7],'');
          Script.Variables['SS8']                 := variif(length(StrAllTrim(M_SS1[8])) > 0,','+M_SS1[8],'');
          Script.Variables['SS9']                 := variif(length(StrAllTrim(M_SS1[9])) > 0,','+M_SS1[9],'');

          Script.Variables['TO1']                 := variif(length(StrAllTrim(M_TO1[1])) > 0,'12 - '+M_TO1[1],'');
          Script.Variables['TO2']                 := variif(length(StrAllTrim(M_TO1[2])) > 0,','+M_TO1[2],'');
          Script.Variables['TO3']                 := variif(length(StrAllTrim(M_TO1[3])) > 0,','+M_TO1[3],'');
          Script.Variables['TO4']                 := variif(length(StrAllTrim(M_TO1[4])) > 0,','+M_TO1[4],'');
          Script.Variables['TO5']                 := variif(length(StrAllTrim(M_TO1[5])) > 0,','+M_TO1[5],'');
          Script.Variables['TO6']                 := variif(length(StrAllTrim(M_TO1[6])) > 0,','+M_TO1[6],'');
          Script.Variables['TO7']                 := variif(length(StrAllTrim(M_TO1[7])) > 0,','+M_TO1[7],'');
          Script.Variables['TO8']                 := variif(length(StrAllTrim(M_TO1[8])) > 0,','+M_TO1[8],'');
          Script.Variables['TO9']                 := variif(length(StrAllTrim(M_TO1[9])) > 0,','+M_TO1[9],'');

          Script.Variables['PR1']                 := variif(length(StrAllTrim(M_PR1[1])) > 0,'13 - '+M_PR1[1],'');
          Script.Variables['PR2']                 := variif(length(StrAllTrim(M_PR1[2])) > 0,','+M_PR1[2],'');
          Script.Variables['PR3']                 := variif(length(StrAllTrim(M_PR1[3])) > 0,','+M_PR1[3],'');
          Script.Variables['PR4']                 := variif(length(StrAllTrim(M_PR1[4])) > 0,','+M_PR1[4],'');
          Script.Variables['PR5']                 := variif(length(StrAllTrim(M_PR1[5])) > 0,','+M_PR1[5],'');
          Script.Variables['PR6']                 := variif(length(StrAllTrim(M_PR1[6])) > 0,','+M_PR1[6],'');
          Script.Variables['PR7']                 := variif(length(StrAllTrim(M_PR1[7])) > 0,','+M_PR1[7],'');
          Script.Variables['PR8']                 := variif(length(StrAllTrim(M_PR1[8])) > 0,','+M_PR1[8],'');
          Script.Variables['PR9']                 := variif(length(StrAllTrim(M_PR1[9])) > 0,','+M_PR1[9],'');

          Script.Variables['OE1']                 := variif(length(StrAllTrim(M_OE1[1])) > 0,'10 - '+M_OE1[1],'');
          Script.Variables['OE2']                 := variif(length(StrAllTrim(M_OE1[2])) > 0,','+M_OE1[2],'');
          Script.Variables['OE3']                 := variif(length(StrAllTrim(M_OE1[3])) > 0,','+M_OE1[3],'');
          Script.Variables['OE4']                 := variif(length(StrAllTrim(M_OE1[4])) > 0,','+M_OE1[4],'');
          Script.Variables['OE5']                 := variif(length(StrAllTrim(M_OE1[5])) > 0,','+M_OE1[5],'');
          Script.Variables['OE6']                 := variif(length(StrAllTrim(M_OE1[6])) > 0,','+M_OE1[6],'');
          Script.Variables['OE7']                 := variif(length(StrAllTrim(M_OE1[7])) > 0,','+M_OE1[7],'');
          Script.Variables['OE8']                 := variif(length(StrAllTrim(M_OE1[8])) > 0,','+M_OE1[8],'');
          Script.Variables['OE9']                 := variif(length(StrAllTrim(M_OE1[9])) > 0,','+M_OE1[9],'');
          Script.Variables['ZERO']                := variif(E > 0,'','0');

          if dm_rc.FDQryGerminacao.RecordCount > 0 then
            begin
               Script.Variables['PLANTULAS_NORMAIS']  := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat);
               Script.Variables['PLANTULAS_ANORMAIS'] := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_ANORMAIS').AsFloat);
               Script.Variables['SEMENTES_DURAS']     := variif(dm_rc.FDQryPMS.RecordCount > 0,'-N-',FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_DURAS').AsFloat));
               Script.Variables['SEMENTES_DORMENTES'] := variif(dm_rc.FDQryPMS.RecordCount > 0,'-N-',FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_DORMENTES').AsFloat));
               Script.Variables['SEMENTES_MORTAS']    := FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('SEMENTES_MORTAS').AsFloat);

               if dm_rc.FDQryGerminacao.FindField('MAIOR').AsString = 'A' then
                 begin
                   diasgerminacao :=  DaysBetween(dm_rc.FDQryGerminacao.FindField('DATAINICIAL_A').AsDateTime -1 ,dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsDateTime);

                   Script.Variables['SUBSTRATO_GERMINACAO']     := dm_rc.FDQryGerminacao.FindField('SUBSTRATO_A').AsString;
                   Script.Variables['TEMPERATURA_GERMINACAO']   := dm_rc.FDQryGerminacao.FindField('TEMPERATURA_A').AsString;
                   Script.Variables['TRATAMENTO_GERMINACAO']    := variif(dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString <> '',dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString,'-N-') ;
                   Script.Variables['DURACAO_GERMINACAO']       := IntToStr(diasgerminacao) + ' Dias.';
                 end
               else
                 begin
                   diasgerminacao :=  DaysBetween(dm_rc.FDQryGerminacao.FindField('DATAINICIAL_A').AsDateTime - 1,
                   dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsDateTime);

                   Script.Variables['SUBSTRATO_GERMINACAO']     := dm_rc.FDQryGerminacao.FindField('SUBSTRATO_B').AsString;
                   Script.Variables['TEMPERATURA_GERMINACAO']   := dm_rc.FDQryGerminacao.FindField('TEMPERATURA_B').AsString;
                   Script.Variables['TRATAMENTO_GERMINACAO']    := variif(dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString <> '',dm_rc.FDQryGerminacao.FindField('TRATAMENTO_A').AsString,'-N-') ;
                   Script.Variables['DURACAO_GERMINACAO']       := IntToStr(diasgerminacao) + ' Dias.';
                 end;
              Script.Variables['LEITURA_3_A']                   := dm_rc.FDQryGerminacao.FindField('LEITURA_3_A').AsString;
            end
          else
            begin
              Script.Variables['PLANTULAS_NORMAIS']             := '-N-';
              Script.Variables['PLANTULAS_ANORMAIS']            := '-N-';
              Script.Variables['SEMENTES_DURAS']                := '-N-';
              Script.Variables['SEMENTES_DORMENTES']            := '-N-';
              Script.Variables['SEMENTES_MORTAS']               := '-N-';

              Script.Variables['SUBSTRATO_GERMINACAO']          := '-N-';
              Script.Variables['TEMPERATURA_GERMINACAO']        := '-N-';
              Script.Variables['TRATAMENTO_GERMINACAO']         := '-N-';
              Script.Variables['DURACAO_GERMINACAO']            := '-N-';
              Script.Variables['LEITURA_3_A']                   := '-N-';
            end;

          Script.Variables['RT_NOME']                           := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']                        := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']                    := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']                           := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']                              := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']                       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_boletimpms.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_Informativo  (protocolo:integer)            : string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaProtocolo     ('SELECT * FROM PROTOCOLO       WHERE CODIGO    = ' + IntToStr(protocolo));
  TabelaPessoas       ('SELECT * FROM PESSOAS         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('PESSOA').AsInteger));
  TabelaEmpresas      ('SELECT * FROM EMPRESAS        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('EMPRESA').AsInteger));
  TabelaAnalise       ('SELECT * FROM ANALISE         WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaAnaliseItens  ('SELECT * FROM ANALISE_ITENS   WHERE PROTOCOLO = ' + IntToStr(protocolo) + ' ORDER BY SEQUENCIA');
  TabelaPMS           ('SELECT * FROM PMS             WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaEspecie       ('SELECT * FROM ESPECIE         WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('ESPECIE_CODIGO').AsInteger));
  TabelaCultivar      ('SELECT * FROM CULTIVAR        WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('CULTIVAR_CODIGO').AsInteger));
  TabelaGerminacao    ('SELECT * FROM GERMINACAO      WHERE PROTOCOLO = ' + IntToStr(protocolo));
  TabelaRTCliente     ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RESPONSAVEL').AsInteger));
  TabelaRTLaboratorio ('SELECT * FROM RESPONSAVEL     WHERE CODIGO    = ' + IntToStr(dm_rc.FDQryProtocolo.FindField('RTEMPRESA').AsInteger));
  SqlPesquisa         ('select PRODUTO, DESCRICAO, TIPO, SUM(QUANTIDADE) AS TOTAL from ANALISE_ITENS  where protocolo = ' + IntToStr(protocolo) + ' GROUP BY 1,2,3');

  M_ANARENA            := dm_rc.FDQryProtocolo.FindField('ANALISE_RE').AsString;

  I      := 0;
  S      := 0;
  O      := 0;
  P      := 0;
  T      := 0;
  E      := 0;
  DOSN   := 0;
  PRAGA  := 0;
  TIPO_P := 0;
  TIPO_D := 0;
  QTDE_P := 0;
  QTDE_D := 0;
  QTDE_PD:= 0;

  DESC_INFEST := TStringList.Create;
  DESC_INFEST.Clear;

  for I:=1 to 9 do
    begin
      M_SS1[I] := '';
      M_TO1[I] := '';
      M_PR1[I] := '';
      M_OE1[I] := '';
    end;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      Inc(QTDE_PD);
      DESC_INFEST.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString + ' - ' + '('+dm_rc.sqlBuscas.FindField('TOTAL').AsString+')');
      dm_rc.sqlBuscas.Next;
    end;

  dm_rc.FDQryAnaliseitens.First;
  while not dm_rc.FDQryAnaliseitens.Eof do
    begin
      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'PUR' then
        begin
          Inc(QTDE_P); Inc(TIPO_P);
          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS' then
            begin
              Inc(S);  Inc(E); Inc(PRAGA);
              M_SS1[S] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString  + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'OEC' then
            begin
              Inc(O);  Inc(E); Inc(PRAGA);
              M_OE1[O] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP' then
            begin
              Inc(P);  Inc(E); Inc(PRAGA);
              M_PR1[P] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT' then
            begin
              Inc(T);  Inc(E); Inc(PRAGA);
              M_TO1[T] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;
        end;

      if dm_rc.FDQryAnaliseitens.FindField('TIPO_PD').AsString = 'DOSN' then
        begin
          Inc(QTDE_D); Inc(TIPO_D);
          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'SS' then
            begin
              Inc(SD);  Inc(ED); Inc(PRAGA);
              M_SSD[SD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString  + ')';
            end;


          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NP' then
            begin
              Inc(PD);  Inc(ED);  Inc(PRAGA);
              M_PRD[PD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;

          if dm_rc.FDQryAnaliseitens.FindField('TIPO').AsString = 'NT' then
            begin
              Inc(TD);  Inc(ED); Inc(PRAGA);
              M_TOD[TD] := dm_rc.FDQryAnaliseitens.FindField('DESCRICAO').AsString + ' (' +  dm_rc.FDQryAnaliseitens.FindField('QUANTIDADE').AsString + ')';
            end;
        end;

      dm_rc.FDQryAnaliseitens.Next;
    end;

  I := dm_rc.FDQryAnalise.FindField('TOTAL_OE').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_SS').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_TO').AsInteger +
       dm_rc.FDQryAnalise.FindField('TOTAL_PR').AsInteger;


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['QTDE_P']  := variif(QTDE_P  > 0,'','-O-');
          Script.Variables['QTDE_D']  := variif(QTDE_D  > 0,'','-O-');
          Script.Variables['QTDE_PD'] := variif(QTDE_PD > 0,'','-O-');

          Script.Variables['NUMEROIR']             := dm_rc.FDQryProtocolo.FindField('NUMEROIR').AsString;
          Script.Variables['CULTIVAR']             := dm_rc.FDQryProtocolo.FindField('CULTIVAR').AsString;

          Script.Variables['ESPECIE_NOME']         := dm_rc.FDQryEspecie.FindField('POPULAR').AsString;
          Script.Variables['ESPECIE_ESPECIE']      := dm_rc.FDQryEspecie.FindField('SEMENTENOME').AsString;

          Script.Variables['CLINOME']              := tratanome(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Script.Variables['CLIENDERECO']          := tratanome(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' +
                                                                dm_rc.FDQryPessoas.FindField('NUMERO').AsString   + ' ' +
                                                                dm_rc.FDQryPessoas.FindField('CIDADE').AsString)  + '-' + dm_rc.FDQryPessoas.FindField('ESTADO').AsString;

          Script.Variables['AMOSTRA']              := dm_rc.FDQryProtocolo.FindField('AMOSTRA').AsString;
          Script.Variables['LOTE']                 := dm_rc.FDQryProtocolo.FindField('LOTE').AsString;
          Script.Variables['EMISSAO']              := dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString;
          Script.Variables['SAFRA']                := dm_rc.FDQryProtocolo.FindField('SAFRAVALIDA').AsString;
          Script.Variables['PUREZA']               := FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_PERC').AsFloat);
          Script.Variables['PESOINICIAL']          := CasasDecimais(dm_rc.FDQryAnalise.FindField('PESO_INICIAL_KG').AsFloat);
          Script.Variables['INERTE']               := variif(dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat = 0,'-0-', FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat));
          Script.Variables['GERMINACAO']           := variif(dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat   > 0, FormatFloat('##,###0',dm_rc.FDQryGerminacao.FindField('PLANTULAS_NORMAIS').AsFloat),'-0-');//variif(dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat = 0,'-0-',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_PERC').AsFloat);
          Script.Variables['TETRAZOLIO']           := variif(dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat = 0, '-0-',dm_rc.FDQryAnalise.FindField('MEDIA_SEMENTES_VIAVEIS').AsFloat);

          Script.Variables['PMS']                  := variif(dm_rc.FDQryPMS.RecordCount                       >  0,dm_rc.FDQryPMS.FindField('MEDIA_8').AsFloat,      '-0-');
          Script.Variables['VE']                   := variif(dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat >  0,dm_rc.FDQryAnalise.FindField('TOTAL_VE').AsFloat, '-0-');
          Script.Variables['DESC_INFEST']          := DESC_INFEST.Text;


          Script.Variables['SNR']                  := variif(M_ANARENA = 'Analise',AnalisaOS(PRAGA,dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,TIPO_P,TIPO_D),'-N-');

          Script.Variables['VE_REVESTIDAS']        := variif(dm_rc.FDQryProtocolo.FindField('PMS').AsString = 'T',
                                                          ' SEMENTES REVESTIDAS ' +
                                                          ' % sementes puras = % pelotas puras e % de outras sementes = % sementes não revestidas','');
          Script.Variables['VE_OBSERVACAO']        := variif(dm_rc.FDQryProtocolo.FindField('VE').AsString = 'T',
                                                          dm_rc.FDQryAnalise.FindField('OBS_VE').AsString,'');


          Script.Variables['EMPMUM']               := dm_rc.tbempresas.FindField('CIDADE').AsString;
          Script.Variables['EMPESTADO']            := dm_rc.tbempresas.FindField('UF').AsString;

          Script.Variables['EMPNOM']               := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['ENDERECO']             := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + dm_rc.tbempresas.FindField('BAIRRO').AsString);
          Script.Variables['CIDADE']               := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['ESTADO']               := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['RENASEM']              := dm_rc.tbempresas.FindField('RENASEM').AsString;

          Script.Variables['TELEFONE']             := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['OBSERVACOES']          := variif(dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString = '','-0-',
                                                          dm_rc.FDQryAnalise.FindField('OBSERVACOES').AsString);

          Script.Variables['MES']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',ExtensoMes(StrToInt(FormatDateTime('mm',dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsDateTime))),'');
          Script.Variables['ANO']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',StrToFloat(StrRight(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,4)),'');
          Script.Variables['DIA']                  := variif(dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString <>'',StrToFloat(StrLeft( dm_rc.FDQryProtocolo.FindField('DATAEMISSAO').AsString,2)),'');

          Script.Variables['VALIDADE']             := '27/04/2023';

          Script.Variables['SS1']                                := variif(length(StrAllTrim(M_SS1[1])) > 0,'SS - '+M_SS1[1],'');
          Script.Variables['SS2']                                := variif(length(StrAllTrim(M_SS1[2])) > 0,','+M_SS1[2],'');
          Script.Variables['SS3']                                := variif(length(StrAllTrim(M_SS1[3])) > 0,','+M_SS1[3],'');
          Script.Variables['SS4']                                := variif(length(StrAllTrim(M_SS1[4])) > 0,','+M_SS1[4],'');
          Script.Variables['SS5']                                := variif(length(StrAllTrim(M_SS1[5])) > 0,','+M_SS1[5],'');
          Script.Variables['SS6']                                := variif(length(StrAllTrim(M_SS1[6])) > 0,','+M_SS1[6],'');
          Script.Variables['SS7']                                := variif(length(StrAllTrim(M_SS1[7])) > 0,','+M_SS1[7],'');
          Script.Variables['SS8']                                := variif(length(StrAllTrim(M_SS1[8])) > 0,','+M_SS1[8],'');
          Script.Variables['SS9']                                := variif(length(StrAllTrim(M_SS1[9])) > 0,','+M_SS1[9],'');

          Script.Variables['ST1']                                := variif(length(StrAllTrim(M_TO1[1])) > 0,'NT - '+M_TO1[1],'');
          Script.Variables['ST2']                                := variif(length(StrAllTrim(M_TO1[2])) > 0,','+M_TO1[2],'');
          Script.Variables['ST3']                                := variif(length(StrAllTrim(M_TO1[3])) > 0,','+M_TO1[3],'');
          Script.Variables['ST4']                                := variif(length(StrAllTrim(M_TO1[4])) > 0,','+M_TO1[4],'');
          Script.Variables['ST5']                                := variif(length(StrAllTrim(M_TO1[5])) > 0,','+M_TO1[5],'');
          Script.Variables['ST6']                                := variif(length(StrAllTrim(M_TO1[6])) > 0,','+M_TO1[6],'');
          Script.Variables['ST7']                                := variif(length(StrAllTrim(M_TO1[7])) > 0,','+M_TO1[7],'');
          Script.Variables['ST8']                                := variif(length(StrAllTrim(M_TO1[8])) > 0,','+M_TO1[8],'');
          Script.Variables['ST9']                                := variif(length(StrAllTrim(M_TO1[9])) > 0,','+M_TO1[9],'');

          Script.Variables['SP1']                                := variif(length(StrAllTrim(M_PR1[1])) > 0,'NP - '+M_PR1[1],'');
          Script.Variables['SP2']                                := variif(length(StrAllTrim(M_PR1[2])) > 0,','+M_PR1[2],'');
          Script.Variables['SP3']                                := variif(length(StrAllTrim(M_PR1[3])) > 0,','+M_PR1[3],'');
          Script.Variables['SP4']                                := variif(length(StrAllTrim(M_PR1[4])) > 0,','+M_PR1[4],'');
          Script.Variables['SP5']                                := variif(length(StrAllTrim(M_PR1[5])) > 0,','+M_PR1[5],'');
          Script.Variables['SP6']                                := variif(length(StrAllTrim(M_PR1[6])) > 0,','+M_PR1[6],'');
          Script.Variables['SP7']                                := variif(length(StrAllTrim(M_PR1[7])) > 0,','+M_PR1[7],'');
          Script.Variables['SP8']                                := variif(length(StrAllTrim(M_PR1[8])) > 0,','+M_PR1[8],'');
          Script.Variables['SP9']                                := variif(length(StrAllTrim(M_PR1[9])) > 0,','+M_PR1[9],'');

          Script.Variables['OE1']                                := variif(length(StrAllTrim(M_OE1[1])) > 0,'OEC - '+M_OE1[1],'');
          Script.Variables['OE2']                                := variif(length(StrAllTrim(M_OE1[2])) > 0,','+M_OE1[2],'');
          Script.Variables['OE3']                                := variif(length(StrAllTrim(M_OE1[3])) > 0,','+M_OE1[3],'');
          Script.Variables['OE4']                                := variif(length(StrAllTrim(M_OE1[4])) > 0,','+M_OE1[4],'');
          Script.Variables['OE5']                                := variif(length(StrAllTrim(M_OE1[5])) > 0,','+M_OE1[5],'');
          Script.Variables['OE6']                                := variif(length(StrAllTrim(M_OE1[6])) > 0,','+M_OE1[6],'');
          Script.Variables['OE7']                                := variif(length(StrAllTrim(M_OE1[7])) > 0,','+M_OE1[7],'');
          Script.Variables['OE8']                                := variif(length(StrAllTrim(M_OE1[8])) > 0,','+M_OE1[8],'');
          Script.Variables['OE9']                                := variif(length(StrAllTrim(M_OE1[9])) > 0,','+M_OE1[9],'');

          //**************************************************************************//
          // NOCIVAS DOSN
          //**************************************************************************//
          Script.Variables['SS1D']                                     := variif(length(StrAllTrim(M_SSD[1])) > 0,'SS - '+M_SSD[1],'');
          Script.Variables['SS2D']                                     := variif(length(StrAllTrim(M_SSD[2])) > 0,','+M_SSD[2],'');
          Script.Variables['SS3D']                                     := variif(length(StrAllTrim(M_SSD[3])) > 0,','+M_SSD[3],'');
          Script.Variables['SS4D']                                     := variif(length(StrAllTrim(M_SSD[4])) > 0,','+M_SSD[4],'');
          Script.Variables['SS5D']                                     := variif(length(StrAllTrim(M_SSD[5])) > 0,','+M_SSD[5],'');
          Script.Variables['SS6D']                                     := variif(length(StrAllTrim(M_SSD[6])) > 0,','+M_SSD[6],'');
          Script.Variables['SS7D']                                     := variif(length(StrAllTrim(M_SSD[7])) > 0,','+M_SSD[7],'');
          Script.Variables['SS8D']                                     := variif(length(StrAllTrim(M_SSD[8])) > 0,','+M_SSD[8],'');
          Script.Variables['SS9D']                                     := variif(length(StrAllTrim(M_SSD[9])) > 0,','+M_SSD[9],'');

          Script.Variables['ST1D']                                   := variif(length(StrAllTrim(M_TOD[1])) > 0,'NT - '+M_TOD[1],'');
          Script.Variables['ST2D']                                   := variif(length(StrAllTrim(M_TOD[2])) > 0,','+M_TOD[2],'');
          Script.Variables['ST3D']                                   := variif(length(StrAllTrim(M_TOD[3])) > 0,','+M_TOD[3],'');
          Script.Variables['ST4D']                                   := variif(length(StrAllTrim(M_TOD[4])) > 0,','+M_TOD[4],'');
          Script.Variables['ST5D']                                   := variif(length(StrAllTrim(M_TOD[5])) > 0,','+M_TOD[5],'');
          Script.Variables['ST6D']                                   := variif(length(StrAllTrim(M_TOD[6])) > 0,','+M_TOD[6],'');
          Script.Variables['ST7D']                                   := variif(length(StrAllTrim(M_TOD[7])) > 0,','+M_TOD[7],'');
          Script.Variables['ST8D']                                   := variif(length(StrAllTrim(M_TOD[8])) > 0,','+M_TOD[8],'');
          Script.Variables['ST9D']                                   := variif(length(StrAllTrim(M_TOD[9])) > 0,','+M_TOD[9],'');

          Script.Variables['SP1D']                                   := variif(length(StrAllTrim(M_PRD[1])) > 0,'NP - '+M_PRD[1],'');
          Script.Variables['SP2D']                                   := variif(length(StrAllTrim(M_PRD[2])) > 0,','+M_PRD[2],'');
          Script.Variables['SP3D']                                   := variif(length(StrAllTrim(M_PRD[3])) > 0,','+M_PRD[3],'');
          Script.Variables['SP4D']                                   := variif(length(StrAllTrim(M_PRD[4])) > 0,','+M_PRD[4],'');
          Script.Variables['SP5D']                                   := variif(length(StrAllTrim(M_PRD[5])) > 0,','+M_PRD[5],'');
          Script.Variables['SP6D']                                   := variif(length(StrAllTrim(M_PRD[6])) > 0,','+M_PRD[6],'');
          Script.Variables['SP7D']                                   := variif(length(StrAllTrim(M_PRD[7])) > 0,','+M_PRD[7],'');
          Script.Variables['SP8D']                                   := variif(length(StrAllTrim(M_PRD[8])) > 0,','+M_PRD[8],'');
          Script.Variables['SP9D']                                   := variif(length(StrAllTrim(M_PRD[9])) > 0,','+M_PRD[9],'');
          //**************************************************************************//

          Script.Variables['RT_NOME']                                := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']                             := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']                         := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']                                := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']                                   := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']                            := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;

        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_informativopms.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_Movimento  (const ptipo,dataini,datafin:string;rempresa:Integer;table:TFDQuery)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(rempresa));

  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['DATAINI']          := dataini;
          Script.Variables['DATAFIN']          := datafin;
          Script.Variables['TIPO']             := ptipo;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'relacao_movimentodocelan.fr3');


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_Levantamento (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPNOME_TOP']      := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPFANTASIA']      := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          Script.Variables['EMPENDERECO']      := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          Script.Variables['EMPCIDADE']        := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMPESTADO']        := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMPCEP']           := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['EMPTELEFONE']      := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPEMAIL']         := dm_rc.tbempresas.FindField('EMAIL').AsString;
          Script.Variables['RENASEM']          := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['MES']              := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataini))));
          Script.Variables['ANO']              := StrToFloat(StrRight(dataref,4));

          Script.Variables['MES_ANO']          := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataref))));
          Script.Variables['ANO_ANO']          := StrToFloat(StrRight(dataref,4));
          Script.Variables['DIA']              := StrToFloat(StrLeft(dataref,2));

          Script.Variables['LOCAL']            := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;

          Script.Variables['RT_NOME']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']   := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']             := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']      := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
//      frxDBDatasetLevantamento.DataSet         := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_Levantamento.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;

function LABORATORIO_Demonstrativo (dataini,datafin,dataref:string;empresa,responsavel:Integer;table:TFDMemTable)  :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPFAN']           := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['EMPENDERECO']      := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          Script.Variables['EMPCIDADE']        := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMPESTADO']        := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMPCEP']           := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['EMPTELEFONE']      := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMPEMAIL']         := dm_rc.tbempresas.FindField('EMAIL').AsString;
          Script.Variables['RENASEM']          := dm_rc.tbempresas.FindField('RENASEM').AsString;

          Script.Variables['MES']              := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataini))));
          Script.Variables['ANO']              := StrToFloat(StrRight(dataref,4));

          Script.Variables['MES_ANO']          := ExtensoMes( StrToInt(FormatDateTime('mm', StrToDate(dataref))));
          Script.Variables['ANO_ANO']          := StrToFloat(StrRight(dataref,4));
          Script.Variables['DIA']              := StrToFloat(StrLeft(dataref,2));

          Script.Variables['LOCAL']            := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['NPAGINAS']         := IntToStr(frxReport.PreviewPages.Count);


          Script.Variables['RT_NOME']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['RT_RENASEM']       := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
          Script.Variables['RT_NOMECLATURA']   := variif(dm_rc.FDQryResponsavel.FindField('SUBSTITUTO').AsString = 'T','Responsável Técnico Substituto','Responsável Técnico');
          Script.Variables['RESPNOM']          := PrimeiraLetraMaiscula(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          Script.Variables['CREA']             := dm_rc.FDQryResponsavel.FindField('CREA').AsString;
          Script.Variables['RESPRENASEM']      := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_demonstrativo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_RAM          (mes,ano:string;empresa,responsavel:Integer;table:TFDMemTable)           :string;
  var
  JAN_REC, FEV_REC, MAR_REC, ABR_REC, MAI_REC, JUN_REC, JUL_REC, AGO_REC, SET_REC, OUT_REC, NOV_REC, DEZ_REC : Real;
  JAN_PRO, FEV_PRO, MAR_PRO, ABR_PRO, MAI_PRO, JUN_PRO, JUL_PRO, AGO_PRO, SET_PRO, OUT_PRO, NOV_PRO, DEZ_PRO : Real;

begin
  JAN_REC := 0; FEV_REC := 0; MAR_REC := 0; MAI_REC := 0; JUN_REC := 0; JUL_REC := 0; AGO_REC := 0; SET_REC := 0; OUT_REC := 0; NOV_REC := 0; DEZ_REC := 0;
  JAN_PRO := 0; FEV_PRO := 0; MAR_PRO := 0; MAI_PRO := 0; JUN_PRO := 0; JUL_PRO := 0; AGO_PRO := 0; SET_PRO := 0; OUT_PRO := 0; NOV_PRO := 0; DEZ_PRO := 0;

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  table.First;
  while not table.Eof do
    begin
      if table.FindField('MES').AsString = 'Jan' then
        JAN_REC := table.FindField('JAN_REC').AsFloat;
      if table.FindField('MES').AsString = 'Fev' then
        FEV_REC := table.FindField('FEV_REC').AsFloat;
      if table.FindField('MES').AsString = 'Mar' then
        MAR_REC := table.FindField('MAR_REC').AsFloat;
      if table.FindField('MES').AsString = 'Abr' then
        ABR_REC := table.FindField('ABR_REC').AsFloat;
      if table.FindField('MES').AsString = 'Mai' then
        MAI_REC := table.FindField('MAI_REC').AsFloat;
      if table.FindField('MES').AsString = 'Jun' then
        JUN_REC := table.FindField('JUN_REC').AsFloat;
      if table.FindField('MES').AsString = 'Jul' then
        JUL_REC := table.FindField('JUL_REC').AsFloat;
      if table.FindField('MES').AsString = 'Ago' then
        AGO_REC := table.FindField('AGO_REC').AsFloat;
      if table.FindField('MES').AsString = 'Set' then
        SET_REC := table.FindField('SET_REC').AsFloat;
      if table.FindField('MES').AsString = 'Out' then
        OUT_REC := table.FindField('OUT_REC').AsFloat;
      if table.FindField('MES').AsString = 'Nov' then
        NOV_REC := table.FindField('NOV_REC').AsFloat;
      if table.FindField('MES').AsString = 'Dez' then
        DEZ_REC := table.FindField('DEZ_REC').AsFloat;

      // AMOSTRAS PROCESSADAS
      if table.FindField('MES').AsString = 'Jan' then
        JAN_PRO := table.FindField('JAN_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Fev' then
        FEV_PRO := table.FindField('FEV_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Mar' then
        MAR_PRO := table.FindField('MAR_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Abr' then
        ABR_PRO := table.FindField('ABR_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Mai' then
        MAI_PRO := table.FindField('MAI_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Jun' then
        JUN_PRO := table.FindField('JUN_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Jul' then
        JUL_PRO := table.FindField('JUL_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Ago' then
        AGO_PRO := table.FindField('AGO_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Set' then
        SET_PRO := table.FindField('SET_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Out' then
        OUT_PRO := table.FindField('OUT_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Nov' then
        NOV_PRO := table.FindField('NOV_PRO').AsFloat;
      if table.FindField('MES').AsString = 'Dez' then
        DEZ_PRO := table.FindField('DEZ_PRO').AsFloat;

      table.Next;
    end;


  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOME']          := dm_rc.tbempresas.FindField('NOME').AsString;

          Script.Variables['JAN_REC']           := variif(JAN_REC > 0,JAN_REC,'');
          Script.Variables['FEV_REC']           := variif(FEV_REC > 0,FEV_REC,'');
          Script.Variables['MAR_REC']           := variif(MAR_REC > 0,MAR_REC,'');
          Script.Variables['ABR_REC']           := variif(ABR_REC > 0,ABR_REC,'');
          Script.Variables['MAI_REC']           := variif(MAI_REC > 0,MAI_REC,'');
          Script.Variables['JUN_REC']           := variif(JUN_REC > 0,JUN_REC,'');
          Script.Variables['JUL_REC']           := variif(JUL_REC > 0,JUL_REC,'');
          Script.Variables['AGO_REC']           := variif(AGO_REC > 0,AGO_REC,'');
          Script.Variables['SET_REC']           := variif(SET_REC > 0,SET_REC,'');
          Script.Variables['OUT_REC']           := variif(OUT_REC > 0,OUT_REC,'');
          Script.Variables['NOV_REC']           := variif(NOV_REC > 0,NOV_REC,'');
          Script.Variables['DEZ_REC']           := variif(DEZ_REC > 0,DEZ_REC,'');

          Script.Variables['JAN_PRO']           := variif(JAN_PRO > 0,JAN_PRO,'');
          Script.Variables['FEV_PRO']           := variif(FEV_PRO > 0,FEV_PRO,'');
          Script.Variables['MAR_PRO']           := variif(MAR_PRO > 0,MAR_PRO,'');
          Script.Variables['ABR_PRO']           := variif(ABR_PRO > 0,ABR_PRO,'');
          Script.Variables['MAI_PRO']           := variif(MAI_PRO > 0,MAI_PRO,'');
          Script.Variables['JUN_PRO']           := variif(JUN_PRO > 0,JUN_PRO,'');
          Script.Variables['JUL_PRO']           := variif(JUL_PRO > 0,JUL_PRO,'');
          Script.Variables['AGO_PRO']           := variif(AGO_PRO > 0,AGO_PRO,'');
          Script.Variables['SET_PRO']           := variif(SET_PRO > 0,SET_PRO,'');
          Script.Variables['OUT_PRO']           := variif(OUT_PRO > 0,OUT_PRO,'');
          Script.Variables['NOV_PRO']           := variif(NOV_PRO > 0,NOV_PRO,'');
          Script.Variables['DEZ_PRO']           := variif(DEZ_PRO > 0,DEZ_PRO,'');

          Script.Variables['TOTAL_REC']         := JAN_REC + FEV_REC + MAR_REC + ABR_REC + MAI_REC + NOV_REC +
                                                   JUN_REC + JUL_REC + AGO_REC + SET_REC + OUT_REC + DEZ_REC;

          Script.Variables['TOTAL_PRO']         := JAN_PRO + FEV_PRO + MAR_PRO + ABR_PRO + MAI_PRO + NOV_PRO +
                                                   JUN_PRO + JUL_PRO + AGO_PRO + SET_PRO + OUT_PRO + DEZ_PRO;


        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_ram.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function LABORATORIO_SEMRENASEM   (dataini,datafin:string;empresa,responsavel:Integer;table:TFDMemTable)          :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaRTLaboratorio('SELECT * FROM RESPONSAVEL WHERE CODIGO = ' + IntToStr(responsavel));
  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMISSAO']                   := dataini;
          Script.Variables['FANTASIA']                  := dm_rc.tbempresas.FindField('DESCRICAO').AsString;

          Script.Variables['EMP_NOME']                  := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('NOME').AsString);
          Script.Variables['EMP_CNPJ']                  := dm_rc.tbempresas.FindField('CNPJ').AsString;
          Script.Variables['EMP_RENASEM']               := dm_rc.tbempresas.FindField('RENASEM').AsString;
          Script.Variables['EMP_ENDERECO']              := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' nº ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' + PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('BAIRRO').AsString);
          Script.Variables['EMP_TELEFONE']              := dm_rc.tbempresas.FindField('TELEFONE').AsString + ' ' + dm_rc.tbempresas.FindField('CELULAR').AsString;
          Script.Variables['EMP_EMAIL']                 := LowerCase(dm_rc.tbempresas.FindField('EMAIL').AsString);
          Script.Variables['EMP_CIDADE']                := PrimeiraLetraMaiscula(dm_rc.tbempresas.FindField('CIDADE').AsString);
          Script.Variables['EMP_ESTADO']                := dm_rc.tbempresas.FindField('UF').AsString;
          Script.Variables['EMP_CEP']                   := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          Script.Variables['MES_ANO']                   := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini)))) + '/' + StrRight(dataini,4);

          Script.Variables['MES']                       := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini))));
          Script.Variables['ANO']                       := StrToFloat(StrRight(dataini,4));

          Script.Variables['MES_ANO1']                  := ExtensoMes( StrToInt(FormatDateTime('mm',StrToDate(dataini))));
          Script.Variables['ANO_ANO']                   := StrToFloat(StrRight(DateToStr(DATE),4));
          Script.Variables['DIA']                       := StrToFloat(StrLeft(DateToStr(DATE),2));

          Script.Variables['LOCAL']                     := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + '/' + dm_rc.tbempresas.FindField('UF').AsString;

        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_semrenasem.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function LABORATORIO_ENTRADAS (dataini,datafin:string;empresa:Integer;table:TFDMemTable)          :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas     ('SELECT * FROM EMPRESAS    WHERE CODIGO = ' + IntToStr(empresa));

  with ldm do
    begin

      with frxReport do
        begin
          Script.Variables['EMPNOM']   := dm_rc.tbempresas.FindField('NOME').AsString;
          Script.Variables['NPAGINAS'] := IntToStr(PreviewPages.Count);
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := table;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'laboratorio_relentradas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function NOTA_ContratoTranporte   (empresa,numero,documento:Integer)                            :string;
var
  tabela : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  tabela                 := CriaMemoria('CONTRATO_NOTA');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' SELECT * FROM TRANSPORTES WHERE CODIGO = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));

  tabela.Close;
  tabela.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      tabela.Append;
      tabela.FindField('PRODUTO').AsInteger  := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
      tabela.FindField('DESCRICAO').AsString := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      tabela.FindField('QUANTIDADE').AsFloat := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      tabela.Post;

      dm_rc.tbmvitens.Next;
    end;

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']        := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['EMPNOM']        := dm_rc.tbempresas.FindField('NOME').AsString;

          frxReport.Script.Variables['SAINUM']        := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']        := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']        := dm_rc.FDQryPessoas.FindField('CEP').AsString;

          frxReport.Script.Variables['TRANOM']        := dm_rc.FDQryTransportes.FindField('NOME').AsString;
          frxReport.Script.Variables['TRAEND']        := dm_rc.FDQryTransportes.FindField('ENDERECO').AsString + ' nº ' + dm_rc.FDQryTransportes.FindField('NUMERO').AsString + ' ' +
                                                         dm_rc.FDQryTransportes.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['TRAINSCRICAO']  := dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['TRACPF']        := Formata_Cnpj(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['TRACIDADE']     := dm_rc.FDQryTransportes.FindField('CIDADE').AsString + ' - ' + dm_rc.FDQryTransportes.FindField('ESTADO').AsString;
          frxReport.Script.Variables['TRAPLACA']      := dm_rc.FDQryTransportes.FindField('PLACA').AsString  + ' - ' + dm_rc.FDQryTransportes.FindField('PLACAESTADO').AsString;
          frxReport.Script.Variables['TRATELEFONE']   := dm_rc.FDQryTransportes.FindField('TELEFONE').AsString;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := tabela;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'contrato_transporte.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function NOTA_ControleEtiqueta    (empresa,numero,documento:Integer)                            :string;
var
  tabela : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  tabela                 := CriaMemoria('CONTRATO_NOTA');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' SELECT * FROM TRANSPORTES WHERE CODIGO = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));

  tabela.Close;
  tabela.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      tabela.Append;
      tabela.FindField('PRODUTO').AsInteger      := dm_rc.tbmvitens.FindField('PRODUTO').AsInteger;
      tabela.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      tabela.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      tabela.FindField('LOTE').AsString          := dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString;
      tabela.FindField('PESOSACO').AsFloat       := dm_rc.tbmvitens.FindField('PESOLIQUIDO').AsFloat;
      tabela.Post;

      dm_rc.tbmvitens.Next;
    end;

  with ldm do
    begin

      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('DESCRICAO').AsString;
          frxReport.Script.Variables['EMPNOM']  := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCEP']  := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;

          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']  := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString);
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := tabela;


      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'controle_etiquetas.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_impressao(empresa,numero,documento:Integer)                            :string;
var
  MT_DP                    : array[1..36] of string;
  MT_VC                    : array[1..36] of string;
  MT_PA                    : array[1..36] of string;
  I, R, P                  : integer;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));
  TabelaOperacao  ('select * from operacoes where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  SqlPesquisa     (' select * from                            ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber ','pagar ')+
                                                                                    'where numero                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                                                                                    'and documento                         = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                                                                                    'and empresa                           = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));


  I := 0; R := 0; P := 0;

  for I:=1 to 36 do
    begin
      MT_PA[I] := '';
      MT_VC[I] := '';
      MT_DP[I] := '';
    end;

  I:= 0; R:= 0; P:=0;

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      inc(I); inc(R); inc(P);
      MT_PA[P] := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString;
      MT_VC[I] := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsString;
      MT_DP[R] := FormatFloat('###,##0.00', dm_rc.sqlBuscas.FindField('VALORATUAL').AsFloat);
      dm_rc.sqlBuscas.Next;
    end;


  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['INSCEST'] := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CPFCNPJ'] := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['EMPNOM']  := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' - ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;


          frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
          frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 4 then
            frxReport.Script.Variables['DOCUMENTO']  := 'PEDIDO'
          else
          if dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger = 3 then
            frxReport.Script.Variables['DOCUMENTO']  := 'ORÇAMENTO';

          frxReport.Script.Variables['CLINOM']     := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNP']     := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIBAR']     := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLIIBG']     := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
          frxReport.Script.Variables['CLITLR']     := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['CLIEDR']     := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLIUFR']     := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIMUR']     := dm_rc.FDQryPessoas.FindField('CIDADE').AsString + ' - '+ dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLIIES']     := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLICPR']     := dm_rc.FDQryPessoas.FindField('CEP').AsString;
          frxReport.Script.Variables['CLIEMA']     := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;

          frxReport.Script.Variables['PGTO']       := Acha_Item('CONDICOES',dm_rc.FDQryMvmestre.FindField('CONDICAO').AsString);
          frxReport.Script.Variables['SAIVLP']     := dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsString;
          frxReport.Script.Variables['SAIDES']     := dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
          frxReport.Script.Variables['SAIVLN']     := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;
          frxReport.Script.Variables['SAIVLS']     := dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
          frxReport.Script.Variables['SAIVLF']     := dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;
          frxReport.Script.Variables['OBS']        := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;

          frxReport.Script.Variables['DUPVC1'] := variif(length(StrAllTrim(MT_VC[1]))  > 0, MT_VC[1] ,'');
          frxReport.Script.Variables['DUPVC2'] := variif(length(StrAllTrim(MT_VC[2]))  > 0, MT_VC[2] ,'');
          frxReport.Script.Variables['DUPVC3'] := variif(length(StrAllTrim(MT_VC[3]))  > 0, MT_VC[3] ,'');
          frxReport.Script.Variables['DUPVC4'] := variif(length(StrAllTrim(MT_VC[4]))  > 0, MT_VC[4] ,'');
          frxReport.Script.Variables['DUPVC5'] := variif(length(StrAllTrim(MT_VC[5]))  > 0, MT_VC[5] ,'');
          frxReport.Script.Variables['DUPVC6'] := variif(length(StrAllTrim(MT_VC[6]))  > 0, MT_VC[6] ,'');
          frxReport.Script.Variables['DUPVC7'] := variif(length(StrAllTrim(MT_VC[7]))  > 0, MT_VC[7] ,'');
          frxReport.Script.Variables['DUPVC8'] := variif(length(StrAllTrim(MT_VC[8]))  > 0, MT_VC[8] ,'');
          frxReport.Script.Variables['DUPVC9'] := variif(length(StrAllTrim(MT_VC[9]))  > 0, MT_VC[9] ,'');
          frxReport.Script.Variables['DUPVC10']:= variif(length(StrAllTrim(MT_VC[10])) > 0, MT_VC[10],'');
          frxReport.Script.Variables['DUPVC11']:= variif(length(StrAllTrim(MT_VC[11])) > 0, MT_VC[11],'');
          frxReport.Script.Variables['DUPVC12']:= variif(length(StrAllTrim(MT_VC[12])) > 0, MT_VC[12],'');


          frxReport.Script.Variables['DUPDP1'] := variif(length(StrAllTrim(MT_DP[1]))  > 0, StrRPad(MT_DP[1],  12),'');
          frxReport.Script.Variables['DUPDP2'] := variif(length(StrAllTrim(MT_DP[2]))  > 0, StrRPad(MT_DP[2],  12),'');
          frxReport.Script.Variables['DUPDP3'] := variif(length(StrAllTrim(MT_DP[3]))  > 0, StrRPad(MT_DP[3],  12),'');
          frxReport.Script.Variables['DUPDP4'] := variif(length(StrAllTrim(MT_DP[4]))  > 0, StrRPad(MT_DP[4],  12),'');
          frxReport.Script.Variables['DUPDP5'] := variif(length(StrAllTrim(MT_DP[5]))  > 0, StrRPad(MT_DP[5],  12),'');
          frxReport.Script.Variables['DUPDP6'] := variif(length(StrAllTrim(MT_DP[6]))  > 0, StrRPad(MT_DP[6],  12),'');
          frxReport.Script.Variables['DUPDP7'] := variif(length(StrAllTrim(MT_DP[7]))  > 0, StrRPad(MT_DP[7],  12),'');
          frxReport.Script.Variables['DUPDP8'] := variif(length(StrAllTrim(MT_DP[8]))  > 0, StrRPad(MT_DP[8],  12),'');
          frxReport.Script.Variables['DUPDP9'] := variif(length(StrAllTrim(MT_DP[9]))  > 0, StrRPad(MT_DP[9],  12),'');
          frxReport.Script.Variables['DUPDP10']:= variif(length(StrAllTrim(MT_DP[10])) > 0, StrRPad(MT_DP[10], 12),'');
          frxReport.Script.Variables['DUPDP11']:= variif(length(StrAllTrim(MT_DP[11])) > 0, StrRPad(MT_DP[11], 12),'');
          frxReport.Script.Variables['DUPDP12']:= variif(length(StrAllTrim(MT_DP[12])) > 0, StrRPad(MT_DP[12], 12),'');
        end;

      frxPDFExport.Author                      := 'Sistema Sislite';
      frxPDFExport.Creator                     := 'Sislite';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;

      frxDBDataset.DataSet                     := dm_rc.tbmvitens;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'pedidoorcamento.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function SEMENTES_Termo(empresa,controle,assinado:Integer):string;
  var
   data     : string;
   mes, ano : Integer;
   tp_g,tp_v: Integer;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('TERMO');

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaSementes    (' SELECT * FROM SEMENTES WHERE CODIGO     = ' + IntToStr(controle));
  TabelaResponsavel (' SELECT * FROM RESPONSAVEL WHERE CODIGO  = ' + IntToStr(dm_rc.fdqrysementes.FindField('RESPONSAVEL').AsInteger));
  TabelaLaboratorio (' SELECT * FROM LABORATORIO WHERE CODIGO  = ' + IntToStr(dm_rc.fdqrysementes.FindField('LABORATORIO').AsInteger));

  tp_g := 0; tp_v := 0;

  dm_rc.fdqrysementes.First;
  while not dm_rc.fdqrysementes.Eof do
    begin

      memoria.Append;

      mes  := StrToInt(FormatDateTime('MM'  , dm_rc.fdqrysementes.FindField('VALIDADE').AsDateTime));
      ano  := StrToInt(FormatDateTime('YYYY', dm_rc.fdqrysementes.FindField('VALIDADE').AsDateTime));
      data := IntToStr(mes) + '/' + IntToStr(ano);

      memoria.FindField('LOTE').AsString               := dm_rc.fdqrysementes.Findfield('LOTE').AsString;
      memoria.FindField('PESO').AsFloat                := dm_rc.fdqrysementes.Findfield('PESOEMBALAGEM').AsFloat;
      memoria.FindField('BOLETIM').AsString            := dm_rc.fdqrysementes.Findfield('BOLETIM').AsString;
      memoria.FindField('DATABOLETIM').AsString        := dm_rc.fdqrysementes.Findfield('RECEBIDA').AsString;
      memoria.FindField('PUREZA').AsFloat              := dm_rc.fdqrysementes.Findfield('ANALISEPURA').AsFloat;

      if dm_rc.fdqrysementes.Findfield('GERNORMAIS').AsFloat > 0 then
        begin
          memoria.FindField('GERMINACAO').AsFloat        := dm_rc.fdqrysementes.Findfield('GERNORMAIS').AsFloat;
          tp_g                                           := 1;
          tp_v                                           := 0;
        end
      else
        begin
          memoria.FindField('GERMINACAO').AsFloat        := dm_rc.fdqrysementes.Findfield('TETRAZOLIO').AsFloat;
          tp_g                                           := 0;
          tp_v                                           := 1;
        end;

      memoria.FindField('SEMDURAS').AsFloat            := dm_rc.fdqrysementes.Findfield('SEMDURAS').AsFloat;
      memoria.FindField('VALIDADEGERMINACAO').AsString := data;
      memoria.FindField('EMBALAGEM').AsString          := dm_rc.fdqrysementes.Findfield('NSACOS').AsString;
      memoria.FindField('CODIGO').AsInteger            := dm_rc.fdqrysementes.Findfield('CODIGO').AsInteger;

      memoria.FindField('OE').AsString                 := variif(dm_rc.fdqrysementes.Findfield('OUTCULTIVAR').AsString = '','0',dm_rc.fdqrysementes.Findfield('OUTCULTIVAR').AsString) ;
      memoria.FindField('SS').AsFloat                  := dm_rc.fdqrysementes.Findfield('SEMSILVESTRES').AsFloat;
      memoria.FindField('PN').AsString                 := variif(dm_rc.fdqrysementes.Findfield('PENEIRA').AsString = '','-',dm_rc.fdqrysementes.Findfield('PENEIRA').AsString);
      memoria.FindField('SNT').AsFloat                 := dm_rc.fdqrysementes.Findfield('SEMTOLERADAS').AsFloat;
      memoria.FindField('SI').AsFloat                  := dm_rc.fdqrysementes.Findfield('SEMPROIBIDAS').AsFloat;
      memoria.FindField('RP').AsFloat                  := 0;

      memoria.FindField('SILVESTRES').AsFloat          := dm_rc.fdqrysementes.Findfield('SEMSILVESTRES').AsFloat;
      memoria.FindField('NOCIVAS').AsFloat             := dm_rc.fdqrysementes.Findfield('SEMPROIBIDAS').AsFloat;
      memoria.FindField('CULTIVADAS').AsFloat          := dm_rc.fdqrysementes.Findfield('SEMTOLERADAS').AsFloat;

      memoria.Post;

      dm_rc.fdqrysementes.Next;
    end;
  dm_rc.fdqrysementes.First;


  with ldm do
    begin
      with frxReport do
        begin

          TabelaProdutos('select sementenome, cultivar from produtos where codigo = ' + IntToStr(dm_rc.fdqrysementes.FindField('PRODUTO').AsInteger));

          frxReport.Script.Variables['TERMO']       := dm_rc.fdqrysementes.FindField('TERMO').AsString;
          frxReport.Script.Variables['ESPECIE']     := dm_rc.FDQryProdutos.FindField('SEMENTENOME').AsString;
          frxReport.Script.Variables['CULTIVAR']    := dm_rc.FDQryProdutos.FindField('CULTIVAR').AsString;
          frxReport.Script.Variables['CATEGORIA']   := dm_rc.fdqrysementes.FindField('CATEGORIA').AsString;
          frxReport.Script.Variables['SAFRA']       := dm_rc.fdqrysementes.FindField('SAFRACAMPO').AsString;

          frxReport.Script.Variables['EMPFAN']      := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['RESPNOM']     := tratanome(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          frxReport.Script.Variables['RESPCPF']     := Formata_Cnpj(dm_rc.FDQryResponsavel.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['RESPEND']     := tratanome(dm_rc.FDQryResponsavel.FindField('ENDERECO').AsString) + ' ' + dm_rc.FDQryResponsavel.FindField('NUMERO').AsString;
          frxReport.Script.Variables['RESPTEL']     := dm_rc.FDQryResponsavel.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['RESPBAIRRO']  := tratanome(dm_rc.FDQryResponsavel.FindField('BAIRRO').AsString);
          frxReport.Script.Variables['RESPEMAIL']   := dm_rc.FDQryResponsavel.FindField('EMAIL').AsString;
          frxReport.Script.Variables['RESPCIDADE']  := tratanome(dm_rc.FDQryResponsavel.FindField('CIDADE').AsString) + ' ' + dm_rc.FDQryResponsavel.FindField('ESTADO').AsString;
          frxReport.Script.Variables['RESPCEP']     := Formata_Cep(dm_rc.FDQryResponsavel.FindField('CEP').AsString);
          frxReport.Script.Variables['RESPINC']     := dm_rc.FDQryResponsavel.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['RESPRENASEM'] := dm_rc.FDQryResponsavel.FindField('CREDENCIAL').AsString;

          frxReport.Script.Variables['CREA']        := dm_rc.FDQryResponsavel.FindField('CREA').AsString;

          frxReport.Script.Variables['EMPNOM']      := tratanome(dm_rc.tbempresas.FindField('NOME').AsString);
          frxReport.Script.Variables['EMPCPF']      := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['EMPINS']      := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPRENA']     := dm_rc.tbempresas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['EMPEND']      := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['EMPMUN']      := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString);
          frxReport.Script.Variables['EMPCEP']      := Formata_Cep(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPUF']       := dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['LOCAL']       := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;

          frxReport.Script.Variables['RESPNOME']    := tratanome(dm_rc.FDQryResponsavel.FindField('NOME').AsString);
          frxReport.Script.Variables['LABNOME']     := tratanome (dm_rc.fdqrylaboratorio.FindField('NOME').AsString);
          frxReport.Script.Variables['LABESTADO']   := NomeEstado(dm_rc.fdqrylaboratorio.FindField('ESTADO').AsString);
          frxReport.Script.Variables['LABRENASEM']  := dm_rc.fdqrylaboratorio.FindField('CREDENCIAL').AsString;

          frxReport.Script.Variables['TP_V']        := varIIF(tp_v = 1,'x','');
          frxReport.Script.Variables['TP_G']        := varIIF(tp_g = 1,'x','');


          frxReport.Script.Variables['MES']         := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.fdqrysementes.FindField('RECEBIDA').AsDateTime)));
          frxReport.Script.Variables['ANO']         := StrToFloat(StrRight(dm_rc.fdqrysementes.FindField('RECEBIDA').AsString,4));
          frxReport.Script.Variables['DIA']         := StrToFloat(StrRight(dm_rc.fdqrysementes.FindField('RECEBIDA').AsString,2));

          frxReport.Script.Variables['EMPENDERECO'] := tratanome(dm_rc.tbempresas.FindField('ENDERECO').AsString) + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString + ' ' +
                                                       tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;;

          frxReport.Script.Variables['EMPTEL']      := tratanome(dm_rc.tbempresas.FindField('TELEFONE').AsString);
          frxReport.Script.Variables['OBS_SEMENTES']:= dm_rc.fdqrysementes.FindField('OBSERVACOES').AsString;
          frxReport.Script.Variables['REEMBALADA']  := varIIF(dm_rc.fdqrysementes.FindField('REEMBALADA').AsString = 'T','*Semente Reembalada','');


          if dm_rc.fdqrysementes.FindField('REEMBALADA').AsString = 'T' then
            begin
              frxReport.Script.Variables['TIPO_EMPRESA']     := 'REEMBALADOR';
            end
          else
            begin
              frxReport.Script.Variables['TIPO_EMPRESA']     := 'PRODUTOR';
            end;
        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;
      frxDBDataset.DataSet                     := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'termo_conformidade_selegram.fr3');

      if assinado = 0 then
        TfrxPictureView(frxReport.FindComponent('assinatura')).Visible := False
      else
        begin
          TfrxPictureView(frxReport.FindComponent('assinatura')).Picture.CleanupInstance;
          TfrxPictureView(frxReport.FindComponent('assinatura')).Visible := True;
          TfrxPictureView(frxReport.FindComponent('assinatura')).Picture.LoadFromFile(dm_rc.FDQryResponsavel.FindField('ASSINATURA').AsString);
        end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;


  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Duplicata      (empresa,controle,parcela:integer)                            :string;
var
  ACBrExtensoDuplicata      : TACBrExtenso;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('DUPLICATAMERCANTIL');
  ACBrExtensoDuplicata   := TACBrExtenso.Create(NIL);

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));

  if parcela <> 0 then
    begin
      TabelaReceber     (' SELECT * FROM RECEBER  WHERE CODIGO     = ' + IntToStr(controle)   +
                         ' AND SEQUENCIA                           = ' + IntToStr(parcela));
      TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.tbreceber.FindField('PESSOA').AsInteger));
      TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE NUMERO     = ' + IntToStr(dm_rc.tbreceber.FindField('NUMERO').AsInteger) +
                         ' AND DOCUMENTO                           = ' + IntToStr(dm_rc.tbreceber.FindField('DOCUMENTO').AsInteger));
    end
  else
    begin

      TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
      TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
      TabelaReceber     (' SELECT * FROM RECEBER  WHERE NUMERO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)   +
                         ' AND                          DOCUMENTO  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger)+
                         ' ORDER BY SEQUENCIA');
    end;


  if dm_rc.tbreceber.RecordCount > 0 then
    begin
      memoria.Close;
      memoria.Open;

      dm_rc.tbreceber.First;
      while not dm_rc.tbreceber.Eof do
        begin
          Inc(I);

          ACBrExtensoDuplicata.Valor                    := dm_rc.tbreceber.FindField('VALORATUAL').AsFloat;
          memoria.Append;
          memoria.FindField('MEMNUM').AsString          := dm_rc.tbreceber.FindField('NUMERO').AsString;
          memoria.FindField('MEMDTE').AsString          := dm_rc.tbreceber.FindField('EMISSAO').AsString;
          memoria.FindField('MEMVCT').AsString          := dm_rc.tbreceber.FindField('VENCIMENTO').AsString;
          memoria.FindField('MEMORD') .AsString         := dm_rc.tbreceber.FindField('SEQUENCIA').AsString;
          memoria.FindField('MEMVALORPARCELA').AsString := dm_rc.tbreceber.FindField('VALORATUAL').AsString;
          memoria.FindField('MEMNOM').AsString          := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          memoria.FindField('MEMVALORTOTAL').AsString   := varIIF(dm_rc.FDQryMvmestre.RecordCount > 0,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsString,dm_rc.tbreceber.FindField('VALORORIGINAL').AsString);
          memoria.FindField('MEMVALORFINAL').AsString   := varIIF(dm_rc.FDQryMvmestre.RecordCount > 0,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsString,dm_rc.tbreceber.FindField('VALORORIGINAL').AsString);
          memoria.FindField('MEMPEDIDO').AsString       := dm_rc.tbreceber.FindField('PEDIDO').AsString;
          memoria.FindField('EXTENSAO').AsString        := ACBrExtensoDuplicata.Texto;
          memoria.Post;

          dm_rc.tbreceber.Next;
        end;
    end;

  with ldm do
    begin
      with frxReport do
        begin
            frxReport.Script.Variables['EMPNOM']        := dm_rc.tbempresas.FindField('NOME').AsString;
            frxReport.Script.Variables['EMPMUN']        := dm_rc.tbempresas.FindField('CIDADE').AsString;
            frxReport.Script.Variables['EMPTEL']        := dm_rc.tbempresas.FindField('TELEFONE').AsString;
            frxReport.Script.Variables['EMPEND']        := dm_rc.tbempresas.FindField('ENDERECO').AsString;
            frxReport.Script.Variables['EMPFAX']        := dm_rc.tbempresas.FindField('CELULAR').AsString;
            frxReport.Script.Variables['EMPCEP']        := Formata_Cep(dm_rc.tbempresas.FindField('CEP').AsString);
            frxReport.Script.Variables['EMPBAR']        := dm_rc.tbempresas.FindField('BAIRRO').AsString;
            frxReport.Script.Variables['EMPIES']        := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
            frxReport.Script.Variables['EMPCNPJ']       := dm_rc.tbempresas.FindField('CNPJ').AsString;

            frxReport.Script.Variables['CLINOM']        := dm_rc.FDQryPessoas.FindField('NOME').AsString;
            frxReport.Script.Variables['CLICNP']        := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
            frxReport.Script.Variables['CLIBAR']        := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
            frxReport.Script.Variables['CLIIBG']        := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
            frxReport.Script.Variables['CLIEMA']        := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
            frxReport.Script.Variables['SAIOB1']        := '';
            frxReport.Script.Variables['CLITLR']        := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
            frxReport.Script.Variables['CLIEDR']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' n. ' +dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
            frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
            frxReport.Script.Variables['CLIMUR']        := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
            frxReport.Script.Variables['CLIIES']        := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
            frxReport.Script.Variables['CLIUFR']        := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
            frxReport.Script.Variables['CLICPR']        := Formata_Cep(dm_rc.FDQryPessoas.FindField('CEP').AsString);

//            ACBrExtensoDuplicata.Valor                  := memoria.FindField('MEMVALORTOTAL').AsFloat;
            frxReport.Script.Variables['EXTENSAO']      := StrAllTrim(ExtensoValor(StrToFloat(memoria.FindField('MEMVALORTOTAL').AsString),true)) + ' ' + StrReplicate('*',60 - Length(StrAlltrim(ExtensoValor(StrToFloat(memoria.FindField('MEMVALORTOTAL').AsString),true))));
            frxReport.Script.Variables['SAINUM']        := memoria.FindField('MEMNUM').AsString;
            frxReport.Script.Variables['SAIDTE']        := memoria.FindField('MEMDTE').AsString;
            frxReport.Script.Variables['TOTAL']         := memoria.FindField('MEMVALORTOTAL').AsString;

          frxPDFExport.Author                 := 'Sistema Sisgraos';
          frxPDFExport.Creator                := 'Sislite';
          frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
          frxPDFExport.FileName               := M_ARQUIVO;
          frxPDFExport.OpenAfterExport        := False;
          frxPDFExport.ShowDialog             := False;
          frxPDFExport.ShowProgress           := False;
          frxPDFExport.OverwritePrompt        := False;

          frxDBDataset.DataSet                := memoria;

          frxReport.Clear;
          frxReport.LoadFromFile(mm.M_FASTREPORT+'duplicata_mercantil.fr3');

          if (FileExists(mm.M_IMAGEM)) then
              begin
                TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
              end;

          frxReport.PrepareReport(True);
          frxReport.Export(frxPDFExport);
        end;
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Autorizareembalo (empresa,controle:integer)                                    :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas    (' SELECT * FROM EMPRESAS WHERE CODIGO     = ' + IntToStr(empresa));
  TabelaMvmestre    (' SELECT * FROM MVMESTRE WHERE CODIGO     = ' + IntToStr(controle));
  TabelaMvitens     (' SELECT * FROM MVITENS  WHERE NUMERO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                     ' AND                          DOCUMENTO  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                     ' ORDER BY SEQUENCIA');
  TabelaPessoas     (' SELECT * FROM PESSOAS  WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  memoria.Close;
  memoria.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      TabelaProdutos('SELECT SEMENTENOME, CULTIVAR FROM PRODUTOS WHERE CODIGO = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger));

      memoria.Append;
      memoria.FindField('ESPECIE').AsString       := dm_rc.FDQryProdutos.FindField('SEMENTENOME').AsString;
      memoria.FindField('CULTIVAR').AsString      := dm_rc.FDQryProdutos.FindField('CULTIVAR').AsString;
      memoria.FindField('CATEGORIA').AsString     := dm_rc.tbmvitens.FindField('CATEGORIA').AsString;
      memoria.FindField('LOTE').AsString          := dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString;
      memoria.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      memoria.FindField('TERMO').AsString         := dm_rc.tbmvitens.FindField('TERMOSEMENTE').AsString;
      memoria.FindField('NUMERONOTA').AsString    := dm_rc.tbmvitens.FindField('NUMERO').AsString;
      memoria.Post;

      dm_rc.tbmvitens.Next;
    end;


  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPRESA']         := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLICNPJ']         := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          frxReport.Script.Variables['CLIIE']           := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['ENDERECO']        := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CIDADE']          := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['CLIRENASEM']      := dm_rc.FDQryPessoas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['ESTADO']          := NomeEstado(dm_rc.FDQryPessoas.FindField('ESTADO').AsString);
          frxReport.Script.Variables['NUMERONOTA']      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;

          frxReport.Script.Variables['NOMEEMPRESA']     := dm_rc.tbempresas.FindField('NOME').AsString;
          frxReport.Script.Variables['RENASEM']         := dm_rc.tbempresas.FindField('RENASEM').AsString;
          frxReport.Script.Variables['EMPFAN']          := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPEND']          := dm_rc.tbempresas.FindField('ENDERECO').AsString + ' ' + dm_rc.tbempresas.FindField('NUMERO').AsString ;
          frxReport.Script.Variables['EMPBAR']          := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPMUN']          := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCEP']          := FORMATA_CEP(dm_rc.tbempresas.FindField('CEP').AsString);
          frxReport.Script.Variables['EMPTEL']          := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEMAIL']        := dm_rc.tbempresas.FindField('EMAIL').AsString;


          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES1']            := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));
        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'autorizacao_reembalo.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;


      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;

end;
function IMPRESSAO_DeclaracaoRET (empresa,controle:integer;nome,cpfcnpj:string)                        :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(controle));
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaPessoas( 'select * from pessoas where codigo  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPNOM']           := tratanome(dm_rc.tbempresas.FindField('NOME').AsString);
          frxReport.Script.Variables['EMPCNPJ']          := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
          frxReport.Script.Variables['NUMERONOTA']       := tratanome(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString);

          frxReport.Script.Variables['CLINOM']           := tratanome(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          frxReport.Script.Variables['CLICNPJ']          := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);

          frxReport.Script.Variables['LOCAL']           := tratanome(dm_rc.tbempresas.FindField('CIDADE').AsString) + ' - ' + dm_rc.tbempresas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['MES']             := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
          frxReport.Script.Variables['ANO']             := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
          frxReport.Script.Variables['DIA']             := StrToFloat(StrLeft(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));

          frxReport.Script.Variables['TESTEMUNHANOME']  := tratanome(nome);
          frxReport.Script.Variables['TESTEMUNHACPF']   := Formata_Cnpj(cpfcnpj);

        end;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'declaracaoderetirada.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    dm_rc.tbempresas.close;
    dm_rc.FDQryMvmestre.Close;
    dm_rc.FDQryPessoas.Close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_Financeiro  (tipo,dataini,datafin:string;empresa,agrupamento:Integer;table:TFDMemTable)    :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('FINANCEIRO_SINTETICO');
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));

  memoria.Close;
  memoria.Open;

  table.First;
  while not table.Eof do
    begin
      memoria.Append;
      memoria.FindField('NUMERO').AsInteger             := table.FindField('NUMERO').AsInteger;
      memoria.FindField('SERIE').AsString               := table.FindField('SERIE').AsString;
      memoria.FindField('PARCELA').AsInteger            := table.FindField('SEQUENCIA').AsInteger;
      memoria.FindField('PESSOA').AsInteger             := table.FindField('PESSOA').AsInteger;
      memoria.FindField('NOME').AsString                := copy(table.FindField('NOME').AsString,1,24);
      memoria.FindField('EMISSAO').AsString             := table.FindField('EMISSAO').AsString;
      memoria.FindField('VENCIMENTO').AsString          := table.FindField('VENCIMENTO').AsString;
      memoria.FindField('PAGAMENTO').AsString           := table.FindField('PAGAMENTO').AsString;
      memoria.FindField('ORIGINAL').AsFloat             := table.FindField('VALORORIGINAL').AsFloat;
      memoria.FindField('PAGO').AsFloat                 := table.FindField('VALORPAGO').AsFloat;
      memoria.FindField('ATUAL').AsFloat                := table.FindField('VALORATUAL').AsFloat;
      memoria.FindField('PRAZO').AsInteger              := DaysBetween(Date,StrToDate(table.FindField('VENCIMENTO').AsString));
      memoria.FindField('OBSERVACOES').AsString         := table.FindField('OBSERVACOES').AsString;
      memoria.Post;

      table.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['EMISSAO']     := dataini;
      frxReport.Script.Variables['EMISSAOATE']  := datafin;
      frxReport.Script.Variables['TIPO']        := varIIF(tipo = '0','CONTAS A PAGAR','CONTAS A RECEBER');
      frxReport.Script.Variables['FANTASIA']    := dm_rc.tbempresas.FindField('FANTASIA').AsString;


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      if dm_rc.tbempresas.FindField('CNPJ').AsString = '47681243000104' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'financeiro_tempercom_financeiro.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'financeiro_temperfarma_financeiro.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;
  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_VENDASQTEPRODUTO (const empresa:Integer;ptipo,sql,rprodutoini,rprodutofin,dataini,datafin:string)         :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  SqlPesquisa(sql);

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      memoria.Append;
      memoria.FindField('PRODUTO').AsInteger           := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      memoria.FindField('DESCRICAO').AsString          := Acha_Item('PRODUTOS',dm_rc.sqlBuscas.FindField('PRODUTO').AsString);
      memoria.FindField('TOTAL_QUANTIDADE').AsFloat    := dm_rc.sqlBuscas.FindField('TOTAL_QUANTIDADE').AsFloat;
      memoria.FindField('TOTAL_VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('TOTAL_VALOR').AsFloat;
      memoria.FindField('MEDIA_PRECO').AsFloat         := dm_rc.sqlBuscas.FindField('MEDIA_PRECO').AsFloat;
      memoria.Post;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']   := dataini;
      frxReport.Script.Variables['DATAFIN']   := datafin;
      frxReport.Script.Variables['CLIINI']    := rprodutoini;
      frxReport.Script.Variables['CLIFIN']    := rprodutofin;
      frxReport.Script.Variables['TIPO']      := ptipo;



      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'vendadeprodutototal_docelan.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;

end;
function RELATORIO_VENDASPORPRODUTO (const empresa:Integer;sql,pessoaini,pessoafin,dataini,datafin:string)             :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  SqlPesquisa(sql);

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      memoria.Append;
      memoria.FindField('PRODUTO').AsInteger           := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      memoria.FindField('PESSOA').AsInteger            := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
      memoria.FindField('DESCRICAO').AsString          := Acha_Item('PRODUTOS',dm_rc.sqlBuscas.FindField('PRODUTO').AsString);
      memoria.FindField('NOME').AsString               := Acha_Item('PESSOAS' ,dm_rc.sqlBuscas.FindField('PESSOA').AsString);
      memoria.FindField('TOTAL_QUANTIDADE').AsFloat    := dm_rc.sqlBuscas.FindField('TOTAL_QUANTIDADE').AsFloat;
      memoria.FindField('TOTAL_VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('TOTAL_VALOR').AsFloat;
      memoria.FindField('MEDIA_PRECO').AsFloat         := dm_rc.sqlBuscas.FindField('MEDIA_PRECO').AsFloat;
      memoria.Post;

      dm_rc.sqlBuscas.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']   := dataini;
      frxReport.Script.Variables['DATAFIN']   := datafin;
      frxReport.Script.Variables['CLIINI']    := pessoaini;
      frxReport.Script.Variables['CLIFIN']    := pessoafin;



      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'vendadeprodutoporpessoa_docelan.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_Vendasporperiodo (empresa:Integer;sql,dataini,datafin,status:string)  :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaMvmestre(sql);

  dm_rc.FDQryMvmestre.First;
  while not dm_rc.FDQryMvmestre.Eof do
    begin
      TabelaMvitens(' select sum(quantidade) AS QUANTIDADE from mvitens where ' +
                    ' empresa                                =  ' + IntToStr(empresa) +
                    ' and numero                             =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString) +
                    ' and serie                              =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('SERIE').AsString)  +
                    ' and documento                          =  ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString));

      memoria.Append;
      memoria.FindField('OPERACAO').AsInteger     := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger;
      memoria.FindField('CODIGO').AsInteger       := dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger;
      memoria.FindField('DATAINICIAL').AsString   := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
      memoria.FindField('NUMERO') .AsInteger      := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
      memoria.FindField('SERIE').AsString         := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
      memoria.FindField('CIDADE').AsString        := dm_rc.FDQryMvmestre.FindField('CIDADE').AsString;
      memoria.FindField('ESTADO').AsString        := dm_rc.FDQryMvmestre.FindField('ESTADO').AsString;
      memoria.FindField('NOME')   .AsString       := dm_rc.FDQryMvmestre.FindField('NOME').AsString;
      memoria.FindField('EMISSAO').AsString       := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
      memoria.FindField('TIPO_OP').AsString       := dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString;
      memoria.FindField('VALORPAGO')  .AsFloat    := variif(StrContains('Complementar',dm_rc.FDQryMvmestre.FindField('TIPO').AsString),0,variif(dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString = 'Devolucao',(dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat) * - 1 ,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat));
      memoria.FindField('ENDERECO').AsString      := dm_rc.FDQryMvmestre.FindField('OPERACAO').AsString + ' - ' +
                                                     dm_rc.FDQryMvmestre.FindField('DESCRICAO').AsString;
      memoria.FindField('QUANTIDADE') .AsFloat    := variif(StrContains('Complementar',dm_rc.FDQryMvmestre.FindField('TIPO').AsString),0,variif(dm_rc.FDQryMvmestre.FindField('OPERACAO_OP').AsString = 'Devolucao',(dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat) * - 1 ,dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat));

      memoria.Post;

      dm_rc.FDQryMvmestre.Next;
    end;

  with ldm do
    begin
      frxReport.Script.Variables['DATAINI']   := dataini;
      frxReport.Script.Variables['DATAFIN']   := datafin;
      frxReport.Script.Variables['STATUS']    := variif(status = '0','AUTORIZADA','CANCELADAS');


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'vendasporperiodo.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_LISTAPRODUTO     (const rempresa,rprodini,rprodfin,rtipo,rordem:integer)   :string;
var
  tipo,ordem,sql:string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  case rtipo of
    0 : tipo := ' AND P.TIPO = ' + QuotedStr('Produto Acabado');
    1 : tipo := ' AND P.TIPO = ' + QuotedStr('Materia Prima');
    2 : tipo := ' AND P.TIPO = ' + QuotedStr('Outros');
    3 : tipo := '';
  end;

  case rordem of
    0 : ordem := ' ORDER BY P.CODIGO';
    1 : ordem := ' ORDER BY P.DESCRICAO';
  end;


 sql:=
 'SELECT P.CODIGO, P.DESCRICAO, P.ALTURA, P.LARGURA, P.comprimento AS PROFUNDIDADE, S.VENDA FROM PRODUTOS P INNER JOIN SALDOS S ON (P.CODIGO = S.PRODUTO)' +
 'WHERE S.EMPRESA =                                                                                                                                      ' + IntToStr(rempresa) + tipo + ordem;

  SqlPesquisa(sql);

  with ldm do
    begin
      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                :=  dm_rc.sqlBuscas;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'listaprodutos_temperfarma.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;

end;
function RELATORIO_ESTOQUELOTE (empresa:Integer;sql:string)                                :string;
var
  memoria:TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := TFDMemTable.Create(nil);
  memoria                := CriaMemoria('MEMCAD');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaSementes(sql);

  dm_rc.fdqrysementes.First;
  while not dm_rc.fdqrysementes.Eof do
    begin
      memoria.Append;
      memoria.FindField('NOME').AsString          := ' Cultivar : ' +
                                                     dm_rc.fdqrysementes.FindField('CULTIVAR').AsString + ' - ' +
                                                     dm_rc.fdqrysementes.FindField('PRODUTO').AsString  + '   ' +
                                                     dm_rc.fdqrysementes.FindField('NOME').AsString;
      memoria.FindField('PRODUTO').AsString       := dm_rc.fdqrysementes.FindField('PRODUTO').AsString;
      memoria.FindField('LOTE').AsString          := dm_rc.fdqrysementes.FindField('LOTE').AsString;
      memoria.FindField('TIPO').AsString          := dm_rc.fdqrysementes.FindField('TIPO').AsString;
      memoria.FindField('BOLETIM').AsString       := dm_rc.fdqrysementes.FindField('BOLETIM').AsString;
      memoria.FindField('TERMO').AsString         := dm_rc.fdqrysementes.FindField('TERMO').AsString;
      memoria.FindField('SALDOKG').AsFloat        := dm_rc.fdqrysementes.FindField('DISPONIVEL').AsFloat;
      memoria.FindField('VALORCULTURAL').AsFloat  := dm_rc.fdqrysementes.FindField('VALORCULTURAL').AsFloat;
      memoria.FindField('PUREZA').AsFloat         := dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
      memoria.Post;

      dm_rc.fdqrysementes.Next;
    end;

  with ldm do
    begin
      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'Relatorio_Lotes.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_contrato (empresa,numero,documento:Integer)                            :string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaMvmestre('select * from mvmestre where numero = ' + IntToStr(numero)   +
                 'and documento                       = ' + IntToStr(documento)+
                 'and empresa                         = ' + IntToStr(empresa));
  TabelaPessoas ('select * from pessoas where codigo  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  with ldm do
    begin

      frxReport.Script.Variables['NUMPEDIDO']    := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;

      frxReport.Script.Variables['FANTASIA']     := dm_rc.tbempresas.FindField('FANTASIA').AsString;
//      frxReport.Script.Variables['NOME_EMP']     := dm_rc.tbempresas.FindField('NOME').AsString;
      frxReport.Script.Variables['CNPJ_EMP']     := Formata_Cnpj(dm_rc.tbempresas.FindField('CNPJ').AsString);
      frxReport.Script.Variables['ENDERECO_EMP'] := dm_rc.tbempresas.FindField('ENDERECO').AsString;
      frxReport.Script.Variables['BAIRRO_EMP']   := dm_rc.tbempresas.FindField('BAIRRO').AsString;
      frxReport.Script.Variables['CIDADE_EMP']   := dm_rc.tbempresas.FindField('CIDADE').AsString;

      frxReport.Script.Variables['NOMEPESSOA']   := dm_rc.FDQryPessoas.FindField('NOME').AsString;
      frxReport.Script.Variables['CPFCNPJ']      := Formata_Cnpj(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
      frxReport.Script.Variables['INSCRICAO']    := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
      frxReport.Script.Variables['ENDERECO']     := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
      frxReport.Script.Variables['BAIRRO']       := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
      frxReport.Script.Variables['CIDADE']       := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['ESTADO']       := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;

      frxReport.Script.Variables['MES']                   := ExtensoMes( StrToInt(FormatDateTime('mm', dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime)));
      frxReport.Script.Variables['ANO']                   := StrToFloat(StrRight(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,4));
      frxReport.Script.Variables['DIA']                   := StrToFloat(StrLeft(dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,2));

      frxReport.Script.Variables['NOMETESTEMUNHA1']       := dm_rc.FDQryMvmestre.FindField('TESTEMUNHAI').AsString;
      frxReport.Script.Variables['NOMETESTEMUNHA2']       := dm_rc.FDQryMvmestre.FindField('TESTEMUNHAII').AsString;
      frxReport.Script.Variables['CPF1']                  := Formata_Cnpj(dm_rc.FDQryMvmestre.FindField('TESTEMUNHACPFI').AsString);
      frxReport.Script.Variables['CPF2']                  := Formata_Cnpj(dm_rc.FDQryMvmestre.FindField('TESTEMUNHACPFII').AsString);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
//      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      if dm_rc.tbempresas.FindField('CNPJ').AsString = '47681243000104' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'contrato_pessoa_tempercom.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'contrato_pessoa_temperfarma.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_orsimulado(empresa,numero,documento:Integer;tipo:string)                :string;
var
juros, descontos, total, totaljuros, totaldescontos, totalnota, parcelas, porcentagemdesconto, porcentagemjuros: Real;
begin

  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('PARCELAS');

  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(empresa));
  TabelaMvmestre('select * from mvmestre where numero = ' + IntToStr(numero)   +
                 'and documento                       = ' + IntToStr(documento)+
                 'and empresa                         = ' + IntToStr(empresa));
  SqlPesquisa   ('select * from condicoes where ativo = ' + QuotedStr('T') + ' order by codigo ');
  TabelaPessoas ('select * from pessoas where codigo  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  juros               := 0;
  total               := 0;
  descontos           := 0;
  totaljuros          := 0;
  totaldescontos      := 0;
  totalnota           := 0;
  parcelas            := 0;
  porcentagemjuros    := 0;
  porcentagemdesconto := 0;
  totalnota           := ((dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat)); // - dxCurrencyEditvalorentrada.Value);

  memoria.Close;
  memoria.Open;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      juros           := MRound(dm_rc.sqlBuscas.findfield('JUROS').AsFloat  * dm_rc.sqlBuscas.findfield('PARCELAS').AsInteger,2);

      if tipo = 'MDF' then
        begin
          if (dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger = 1) then
            begin
              porcentagemdesconto := dm_rc.sqlBuscas.FindField('DESCONTOS').AsFloat;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := MRound(dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat  - (totalnota * porcentagemdesconto)/100,2);//totalnota;
            end
          else
            begin
              porcentagemdesconto := Abs(dm_rc.sqlBuscas.FindField('DESCONTOS').AsFloat - (1.67 * dm_rc.sqlBuscas.findfield('PARCELAS').AsInteger));
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat );
              total               := MRound((dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat ) - (totalnota * porcentagemdesconto)/100,2);
            end;


          if dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger = 9 then
            begin
              porcentagemdesconto := 0;
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
            end;

          if dm_rc.sqlBuscas.FindField('DESCONTOS').AsInteger > 0 then
            begin
              porcentagemdesconto :=  dm_rc.sqlBuscas.FindField('DESCONTOS').AsInteger;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat) - (totalnota * porcentagemdesconto)/100;
            end
          else
          if dm_rc.sqlBuscas.FindField('JUROS').AsInteger > 0 then
            begin
              porcentagemdesconto := 0;
              porcentagemjuros    := dm_rc.sqlBuscas.FindField('JUROS').AsInteger;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat) + (totalnota * porcentagemjuros)/100;
            end
          else
            begin
              porcentagemdesconto := 0;
              porcentagemjuros    := 0;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
            end;
        end
      else
        begin
          if (dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger = 1) then
            begin
              porcentagemdesconto := dm_rc.sqlBuscas.FindField('DESCONTOS_METAL').AsFloat;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := MRound(dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat  - (totalnota * porcentagemdesconto)/100,2);//totalnota;
            end
          else
            begin
              porcentagemdesconto := Abs(dm_rc.sqlBuscas.FindField('DESCONTOS_METAL').AsFloat - (1.67 * dm_rc.sqlBuscas.findfield('PARCELAS').AsInteger));
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat ); //- dxCurrencyEditvalorentrada.Value);
              total               := MRound((dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat ) - (totalnota * porcentagemdesconto)/100,2);
            end;


          if dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger = 9 then
            begin
              porcentagemdesconto := 0;
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
            end;

          if dm_rc.sqlBuscas.FindField('DESCONTOS_METAL').AsInteger > 0 then
            begin
              porcentagemdesconto := dm_rc.sqlBuscas.FindField('DESCONTOS_METAL').AsInteger;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat); //- dxCurrencyEditvalorentrada.Value);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat) - (totalnota * porcentagemdesconto)/100;
            end
          else
          if dm_rc.sqlBuscas.FindField('JUROS').AsInteger > 0 then
            begin
              porcentagemdesconto := 0;
              porcentagemjuros    := dm_rc.sqlBuscas.FindField('JUROS').AsInteger;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat) + (totalnota * porcentagemjuros)/100;
            end
          else
            begin
              porcentagemdesconto := 0;
              porcentagemjuros    := 0;
              totalnota           := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
              total               := (dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
            end;
        end;


      memoria.Append;
      memoria.FindField('JUROS').AsFloat        := dm_rc.sqlBuscas.findfield('JUROS').AsFloat;
      memoria.FindField('PARC').AsFloat         := dm_rc.sqlBuscas.findfield('PARCELAS').AsInteger;
      memoria.FindField('DESCONTO').AsFloat     := porcentagemdesconto;
      memoria.FindField('VLRPARCELA').AsFloat   := 0;
      memoria.FindField('DESCRICAO').AsString   := dm_rc.sqlBuscas.findfield('DESCRICAO').AsString;
      memoria.FindField('TOTAL').AsFloat        := total + dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;
      memoria.Post;

      dm_rc.sqlBuscas.Next;
    end;


  with ldm do
    begin
      frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
      frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['EMPCNPJ'] := Formata_Cnpj(dm_rc.tbempresas.FindField('CPFCNPJ').AsString);
      frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
      frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
      frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString;
      frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
      frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
      frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
      frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
      frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('EMAIL').AsString;
      frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;

      frxReport.Script.Variables['CLIFUN']  := Acha_Item('FUNCIONARIOS',dm_rc.FDQryMvmestre.FindField('FUNCIONARIO').AsString);

      frxReport.Script.Variables['SAINUM']  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
      frxReport.Script.Variables['SAIDTE']  := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;

      frxReport.Script.Variables['CLINOM']  := dm_rc.FDQryPessoas.FindField('NOME').AsString;
      frxReport.Script.Variables['CLICNP']  := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
      frxReport.Script.Variables['CLIBAR']  := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
      frxReport.Script.Variables['CLIIBG']  := dm_rc.FDQryPessoas.FindField('IBGE').AsString;
      frxReport.Script.Variables['CLITLR']  := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
      frxReport.Script.Variables['CLIEDR']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
      frxReport.Script.Variables['CLIUFR']  := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
      frxReport.Script.Variables['CLIMUR']  := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
      frxReport.Script.Variables['CLIIES']  := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
      frxReport.Script.Variables['CLICPR']  := dm_rc.FDQryPessoas.FindField('CEP').AsString;
      frxReport.Script.Variables['CPFCNPJ'] := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;



      frxReport.Script.Variables['SAIVLP']  := dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsString;
      frxReport.Script.Variables['SAIDES']  := dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
      frxReport.Script.Variables['SAIVLN']  := dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat + dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;//dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;
      frxReport.Script.Variables['SAIOB1']  := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;

      frxReport.Script.Variables['INSCEST'] := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
      frxReport.Script.Variables['CLIEMA']  := '';
      frxReport.Script.Variables['EMPCEL']  := '';
      frxReport.Script.Variables['SAIVLS']  := 0.00;//dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsString;
      frxReport.Script.Variables['SAIVLF']  := dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsString;
      frxReport.Script.Variables['OBS']     := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;

      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      if dm_rc.tbempresas.FindField('CNPJ').AsString = '47681243000104' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'orcamentosimulado_tempercom.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'orcamentosimulado_temperfarma.fr3');

      if ( FileExists(imagem)) then
          begin
            TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(imagem);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm.Free;
    memoria.Free;
    dm_rc.tbempresas.close;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_os        (empresa,numero,documento:Integer)                            :string;
var
  itens,financeiro : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  itens                  := CriaMemoria('CONTRATO_NOTA');
  financeiro             := CriaMemoria('VNC');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));
  TabelaOperacao  ('select * from operacoes where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));

  TabelaMvitens   (' SELECT * FROM MVITENS WHERE NUMERO     = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa)  +
                   ' ORDER BY SEQUENCIA');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));

  itens.Close;
  itens.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      SqlPesquisa('SELECT CODIGOREFERENCIA FROM PRODUTOS WHERE CODIGO = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger));

      itens.Append;
      itens.FindField('PRODUTO').AsString       := varIIF(dm_rc.sqlBuscas.FindField('CODIGOREFERENCIA').AsString <> '',dm_rc.sqlBuscas.FindField('CODIGOREFERENCIA').AsString,dm_rc.tbmvitens.FindField('CODIGO').AsString) ;
      itens.FindField('DESCRICAO').AsString     := dm_rc.tbmvitens.FindField('DESCRICAO').AsString;
      itens.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      itens.FindField('PRECO').AsFloat          := dm_rc.tbmvitens.FindField('PRECO').AsFloat;
      itens.FindField('TOTAL').AsFloat          := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;

      itens.FindField('ALTURA').AsString        := dm_rc.tbmvitens.FindField('ALTURA').AsString;
      itens.FindField('LARGURA').AsString       := dm_rc.tbmvitens.FindField('LARGURA').AsString;
      itens.FindField('COMPRIMENTO').AsString   := dm_rc.tbmvitens.FindField('COMPRIMENTO').AsString;

      itens.Post;

      dm_rc.tbmvitens.Next;
    end;

  financeiro.Close;
  financeiro.Open;

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['INSCEST'] := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CPFCNPJ'] := dm_rc.tbempresas.FindField('CPFCNPJ').AsString;

          frxReport.Script.Variables['CLI_NOME']      := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLI_CELULAR']   := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['CLI_ENDERECO']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' Nº ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLI_BAIRRO']    := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLI_CPFCNPJ']   := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['CLI_INSCRICAO'] := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLI_CIDADE']    := dm_rc.FDQryPessoas.FindField('CIDADE').AsString + '/'+ dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLI_EMAIL']     := '';

          frxReport.Script.Variables['PEDIDO_EMISSAO'] := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
          frxReport.Script.Variables['PEDIDO_NUMERO']  := StrZeroS(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,5);
          frxReport.Script.Variables['OBSERVACAO']     := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString;

        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;

      frxDBDataset.DataSet                     := itens;
//      frxDBDatasetTitulos.DataSet              := financeiro;


      frxReport.Clear;
      if dm_rc.tbempresas.FindField('CNPJ').AsString = '47681243000104' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'ordemdeservico_tempercom.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'ordemdeservico_temperfarma.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function RELATORIO_CONSULTAESTOQUE  (const rempresa,rprodini,rprodfin,rordem:integer)            :string;
var
  memoria : TFDMemTable;
  grupo   : Integer;
  order   : string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  memoria                := CriaMemoria('ESTOQUE');

  memoria.Close;
  memoria.Open;

  case rordem of
    0 : order := ' order by p.grupo, p.descricao  asc';
    1 : order := ' order by p.grupo, p.codigo     asc';
    2 : order := ' order by p.grupo, s.disponivel asc';
    3 : order := ' order by p.grupo, s.disponivel desc';
  end;


  if SqlPesquisa(' SELECT * FROM PRODUTOS P                     ' +
                 ' INNER JOIN SALDOS S ON (P.CODIGO = S.PRODUTO)' +
                 ' WHERE P.CODIGO BETWEEN                       ' + IntToStr(rprodini)    +
                 ' AND                                          ' + IntToStr(rprodfin)    +
                 ' AND S.EMPRESA                             =  ' + IntToStr(rempresa)    + order) then
  begin

    dm_rc.sqlBuscas.first;
    while not dm_rc.sqlBuscas.eof do
      begin
        memoria.Append;
        memoria.FindField('GRUPO').AsInteger          := dm_rc.sqlBuscas.FindField('GRUPO').AsInteger;
        memoria.FindField('GRUPO_DESCRICAO').AsString := Acha_Item('GRUPOS',IntToStr(dm_rc.sqlBuscas.FindField('GRUPO').AsInteger));
        memoria.FindField('CODIGO').AsInteger         := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memoria.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memoria.FindField('DISPONIVEL').AsFloat       := dm_rc.sqlBuscas.FindField('DISPONIVEL').AsFloat;
        memoria.Post;

        dm_rc.sqlBuscas.Next;
      end;

    memoria.First;
    memoria.EnableControls;

    with ldm do
      begin

        frxPDFExport.Author                      := 'Sistema Sisgraos';
        frxPDFExport.Creator                     := 'Sisgraos';
        frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
        frxPDFExport.FileName                    := M_ARQUIVO;
        frxPDFExport.OpenAfterExport             := False;
        frxPDFExport.ShowDialog                  := False;
        frxPDFExport.ShowProgress                := False;
        frxPDFExport.OverwritePrompt             := False;
        frxDBDataset.DataSet                     := memoria;


        frxReport.Clear;
        frxReport.LoadFromFile(mm.M_FASTREPORT+'relatorio_estoque_docelan.fr3');

        if ( FileExists(mm.M_IMAGEM)) then
            begin
              TfrxPictureView(frxReport.FindComponent('Picture1')).Picture.LoadFromFile(mm.M_IMAGEM);
            end;

        frxReport.PrepareReport(True);
        frxReport.Export(frxPDFExport);

      end;

  end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function PEDIDOORCAMENTO_osestoque        (empresa,numero,documento:Integer)                            :string;
var
  itens,itensfinal,
  financeiro : TFDMemTable;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);
  itens                  := CriaMemoria('CONTRATO_NOTA');
  itensfinal             := CriaMemoria('CONTRATO_NOTA');

  TabelaEmpresas  (' SELECT * FROM EMPRESAS WHERE CODIGO    = ' + IntToStr(empresa));
  TabelaMvmestre  (' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(numero)   +
                   ' AND DOCUMENTO                          = ' + IntToStr(documento)+
                   ' AND EMPRESA                            = ' + IntToStr(empresa));

  TabelaMvitens   (' SELECT                                                 ' +
                   ' mvitens.produto, sum(mvitens.quantidade) as quantidade ' +
                   ' FROM MVITENS WHERE NUMERO               = '  + IntToStr(numero)    +
                   ' AND DOCUMENTO                           = '  + IntToStr(documento) +
                   ' AND EMPRESA                             = '  + IntToStr(empresa)   +
                   ' group by 1                                '  +
                   ' ORDER BY PRODUTO                          ');

  TabelaPessoas   (' SELECT * FROM PESSOAS WHERE CODIGO     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));


  itens     .Close;
  itens     .Open;
  itensfinal.Close;
  itensfinal.Open;

  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      if TabelaComposicaoitens(' SELECT                                                                    ' +
                               ' CI.produto,                                                               ' +
                               ' SUM(CI.quantidade) AS QUANTIDADE                                          ' +
                               ' FROM COMPOSICAOITENS CI INNER JOIN COMPOSICAO C ON (C.CODIGO = CI.MESTRE) ' +
                               ' WHERE C.PRODUTO                                                         = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger) +
                               ' GROUP BY 1 ORDER BY 1') then
      begin
        dm_rc.fdqrycomposicaoitens.First;
        while not dm_rc.fdqrycomposicaoitens.Eof do
          begin
            itens.Append;
            itens.FindField('PRODUTO').AsString       := dm_rc.fdqrycomposicaoitens.FindField('PRODUTO').AsString;
            itens.FindField('DESCRICAO').AsString     := Acha_Item('PRODUTOS',dm_rc.fdqrycomposicaoitens.FindField('PRODUTO').AsString);
            itens.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat * dm_rc.fdqrycomposicaoitens.FindField('QUANTIDADE').AsFloat;
            itens.Post;

            dm_rc.fdqrycomposicaoitens.Next;
          end;
      end;
      dm_rc.tbmvitens.Next;
    end;

  itens.First;
  while not itens.Eof do
    begin
      if not itensfinal.Locate('PRODUTO',VarArrayOf([itens.FindField('PRODUTO').AsString]),[]) then
        begin
          itensfinal.Append;
          itensfinal.FindField('PRODUTO').AsString       := itens.FindField('PRODUTO').AsString;
          itensfinal.FindField('DESCRICAO').AsString     := itens.FindField('DESCRICAO').AsString;
          itensfinal.FindField('QUANTIDADE').AsFloat     := itens.FindField('QUANTIDADE').AsFloat;
          itensfinal.Post;
        end
      else
        begin
          itensfinal.Edit;
          itensfinal.FindField('PRODUTO').AsString       := itens.FindField('PRODUTO').AsString;
          itensfinal.FindField('QUANTIDADE').AsFloat     := itens.FindField('QUANTIDADE').AsFloat + itensfinal.FindField('QUANTIDADE').AsFloat;
          itensfinal.Post;
        end;

      itens.Next;
    end;


{
  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin

      itens.Append;
      itens.FindField('PRODUTO').AsString       := dm_rc.tbmvitens.FindField('PRODUTO').AsString;
      itens.FindField('DESCRICAO').AsString     := Acha_Item('PRODUTOS',dm_rc.tbmvitens.FindField('PRODUTO').AsString);
      itens.FindField('QUANTIDADE').AsFloat     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
      itens.Post;

      dm_rc.tbmvitens.Next;
    end;
}

  with ldm do
    begin
      with frxReport do
        begin
          frxReport.Script.Variables['EMPFAN']  := dm_rc.tbempresas.FindField('FANTASIA').AsString;
          frxReport.Script.Variables['EMPMUN']  := dm_rc.tbempresas.FindField('CIDADE').AsString;
          frxReport.Script.Variables['EMPCNPJ'] := dm_rc.tbempresas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['EMPINS']  := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['EMPTEL']  := dm_rc.tbempresas.FindField('TELEFONE').AsString;
          frxReport.Script.Variables['EMPEND']  := dm_rc.tbempresas.FindField('ENDERECO').AsString;
          frxReport.Script.Variables['EMPFAX']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['EMPCEP']  := dm_rc.tbempresas.FindField('CEP').AsString;
          frxReport.Script.Variables['EMPBAR']  := dm_rc.tbempresas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['EMPSITE'] := dm_rc.tbempresas.FindField('SMTP').AsString;
          frxReport.Script.Variables['EMPEMA']  := dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['EMPEMAIL']:= dm_rc.tbempresas.FindField('EMAIL').AsString;
          frxReport.Script.Variables['EMPCEL']  := dm_rc.tbempresas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['INSCEST'] := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CPFCNPJ'] := dm_rc.tbempresas.FindField('CPFCNPJ').AsString;

          frxReport.Script.Variables['CLI_NOME']      := dm_rc.FDQryPessoas.FindField('NOME').AsString;
          frxReport.Script.Variables['CLI_CELULAR']   := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
          frxReport.Script.Variables['CLI_ENDERECO']  := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString + ' Nº ' + dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          frxReport.Script.Variables['CLI_BAIRRO']    := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          frxReport.Script.Variables['CLI_CPFCNPJ']   := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          frxReport.Script.Variables['CLI_INSCRICAO'] := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
          frxReport.Script.Variables['CLI_CIDADE']    := dm_rc.FDQryPessoas.FindField('CIDADE').AsString + '/'+ dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          frxReport.Script.Variables['CLI_EMAIL']     := '';

          frxReport.Script.Variables['PEDIDO_EMISSAO'] := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString;
          frxReport.Script.Variables['PEDIDO_NUMERO']  := StrZeroS(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,5);

        end;

      frxPDFExport.Author                      := 'Sistema Sisgraos';
      frxPDFExport.Creator                     := 'Sisgraos';
      frxPDFExport.DefaultPath                 := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName                    := M_ARQUIVO;
      frxPDFExport.OpenAfterExport             := False;
      frxPDFExport.ShowDialog                  := False;
      frxPDFExport.ShowProgress                := False;
      frxPDFExport.OverwritePrompt             := False;

      frxDBDataset.DataSet                     := itensfinal;
//      frxDBDatasetTitulos.DataSet              := financeiro;


      frxReport.Clear;
      if dm_rc.tbempresas.FindField('CNPJ').AsString = '47681243000104' then
        frxReport.LoadFromFile(mm.M_FASTREPORT+'ordemdeservicoestoquista_tempercom.fr3')
      else
        frxReport.LoadFromFile(mm.M_FASTREPORT+'ordemdeservicoestoquista_temperfarma.fr3');

      if ( FileExists(mm.M_IMAGEM)) then
          begin
            TfrxPictureView(frxReport.FindComponent('PictureLogo')).Picture.LoadFromFile(mm.M_IMAGEM);
          end;

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);

    end;

  try
    ldm.Free;
  finally
    Result := M_ARQUIVO;
  end;
end;
function IMPRESSAO_SISGRAOSOS      (pempresa,psolicitacao:integer)    :string;
var
  nomearqsolicitacao:string;
  caminhoraiz       :string;
begin

  TabelaEmpresas        ('SELECT * FROM EMPRESAS          WHERE CODIGO    = ' + IntToStr(pempresa));
  SqlPesquisa           ('SELECT * FROM SUPORTE           WHERE CODIGO    = ' + IntToStr(psolicitacao));


  M_ARQUIVO              := Gera_Guid()+'.pdf';
  ldm                    := tdm_imp.Create(nil);


  with ldm do
    begin

      frxReport.Script.Variables['CODIGO']               := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
      frxReport.Script.Variables['DATAPEDIDO']           := dm_rc.sqlBuscas.FindField('DATAPEDIDO').AsString;
      frxReport.Script.Variables['SOLICITANTE']          := tratanome(dm_rc.sqlBuscas.FindField('SOLICITANTE').AsString);
      frxReport.Script.Variables['VALOR']                := dm_rc.sqlBuscas.FindField('VALOR').AsFloat;
      frxReport.Script.Variables['SOLICITACAO']          := dm_rc.sqlBuscas.FindField('SOLICITACAO').AsString;
      frxReport.Script.Variables['SERVICO']              := dm_rc.sqlBuscas.FindField('SERVICO').AsString;
      frxReport.Script.Variables['PREVISAO']             := dm_rc.sqlBuscas.FindField('PREVISAO').AsString;
      frxReport.Script.Variables['DATACONCLUSAO']        := dm_rc.sqlBuscas.FindField('DATACONCLUSAO').AsString;
      frxReport.Script.Variables['STATUS']               := dm_rc.sqlBuscas.FindField('STATUS').AsString;
      frxReport.Script.Variables['DIFICULDADE']          := dm_rc.sqlBuscas.FindField('DIFICULDADE').AsString;
      frxReport.Script.Variables['NEGATIVA']             := dm_rc.sqlBuscas.FindField('NEGATIVA').AsString;
      frxReport.Script.Variables['DESENVOLVEDOR']        := tratanome(dm_rc.sqlBuscas.FindField('DESENVOLVEDOR').AsString);


      frxPDFExport.Author                 := 'Sistema Sisgraos';
      frxPDFExport.Creator                := 'Sisgraos';
      frxPDFExport.DefaultPath            := mm.M_PATHIMPRESSAO;
      frxPDFExport.FileName               := M_ARQUIVO;
      frxPDFExport.OpenAfterExport        := False;
      frxPDFExport.ShowDialog             := False;
      frxPDFExport.ShowProgress           := False;
      frxPDFExport.OverwritePrompt        := False;
      frxDBDataset.DataSet                := memoria;

      frxReport.Clear;
      frxReport.LoadFromFile(mm.M_FASTREPORT+'ficha_sisgraosorcamento.fr3');

      frxReport.PrepareReport(True);
      frxReport.Export(frxPDFExport);
    end;

  try
    ldm  .Free;
    dm_rc.sqlBuscas            .Close;
  finally
    Result := M_ARQUIVO;
  end;
end;

end.

