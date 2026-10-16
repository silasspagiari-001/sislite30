unit untFrmARQUIVOXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  uniScreenMask, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniMultiItem, uniComboBox, system.zip, uniListBox, uniMemo;

type
  TfrmARQUIVOXML = class(TfrmBase)
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    dbgSearchCRUD: TUniDBGrid;
    dsfiltro: TDataSource;
    tbbusca: TFDMemTable;
    tbbuscadetalhes: TStringField;
    tbbuscaSERIE: TStringField;
    tbbuscaDOCUMENTO: TIntegerField;
    tbbuscaOPERACAO: TStringField;
    tbbuscaPESSOA: TIntegerField;
    tbbuscaCODIGOBARRAS: TStringField;
    tbbuscaPROTOCOLO: TStringField;
    tbbuscaVLRBASEICMS: TFloatField;
    tbbuscaVLRICMS: TFloatField;
    tbbuscaVLRDESCONTOS: TFloatField;
    tbbuscaVLRPRODUTOS: TFloatField;
    tbbuscaVLRTOTAL: TFloatField;
    tbbuscaCONDICAO: TIntegerField;
    tbbuscaCANCELADA: TStringField;
    tbbuscaEMISSAO: TDateField;
    tbbuscaEMPRESA: TIntegerField;
    tbbuscaVLRDSPTRIBUTADA: TFloatField;
    tbbuscaTRAFRETE: TIntegerField;
    tbbuscaVLRIPI: TFloatField;
    tbbuscaCODIGOBARRASCOMPLEMENTO: TStringField;
    tbbuscaNUMERO: TStringField;
    tbbuscaENTRADA_SAIDA: TIntegerField;
    tbbuscadoc: TStringField;
    UniScreenMask1: TUniScreenMask;
    UniListBox: TUniListBox;
    UniScreenMask2: TUniScreenMask;
    UniLabel1: TUniLabel;
    cbxarquivo: TUniComboBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure tbbuscadetalhesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbbuscadocGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOptionsClick(Sender: TObject);
    procedure cbxarquivoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure Saidas      (const rempresa:integer;dataini,datafin:TDateTime);
  function  CompactarArquivo() : string;
  procedure ListarArquivos(const Diretorio:string;Sub:Boolean);
  function  TemAtributo(Attr, Val: Integer): Boolean;
  procedure Listar(Path: string);
  end;

var
  frmARQUIVOXML: TfrmARQUIVOXML;

implementation

{$R *.dfm}

uses mkm_func_web, System.DateUtils, MainModule, untDM_RC, mkm_procedures,
  mkm_relatorios, mkm_funcoes, Vcl.Clipbrd, ServerModule;

procedure TfrmARQUIVOXML.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmARQUIVOXML.btnOptionsClick(Sender: TObject);
var
  caminho,lArquivo,
  arquivonormal,
  arquivocompatado : string;
  zipfile          : TZipFile;
  I                : integer;
begin
  inherited;

  if tbbusca.RecordCount > 0 then
    begin
      Listar('');
      try
        UniListBox.Clear;

        caminho          := ExtractFileDir(CompactarArquivo());
        arquivonormal    := variif(cbxarquivo.ItemIndex = 0,'ARQUIVONOTAXML_','ARQUIVOMANIFESTOXML_')+RemoverEspeciais(DateToStr(date)+TimeToStr(Time));
        arquivocompatado := arquivonormal+'.zip';
        zipfile          := TZipFile.Create;

        ListarArquivos(caminho,True);

        try
          zipfile.Open(caminho+arquivocompatado,zmWrite);
          for I := 0 to UniListBox.Count - 1 do
            begin
              zipfile.Add(UniListBox.Items[I]);
            end;

        finally
          zipfile.Free;
        end;

        try
          sleep(3000);
          MoveFile(pchar(caminho + arquivocompatado), pchar(sm.LocalCachePath + arquivocompatado ));
          dm_rc.rc_ShowSweetAlert( 'OK', 'ARQUIVO COMPACTADO COM SUCESSO' , 'sucess' , false );
        except
          on e: exception do
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.Message , 'error' , false );
        end;

        unisession.SendFile(sm.LocalCachePath + arquivocompatado);

      except

        on e: exception do
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.Message , 'error' , false );
      end;
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'BUSQUE O PERIODO QUE DESEJA' , 'error' , false );
    end;
end;

procedure TfrmARQUIVOXML.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmARQUIVOXML.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
  Saidas(mm.varI_Code_Company,edSearchCRUDDtIni.DateTime,EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmARQUIVOXML.cbxarquivoChange(Sender: TObject);
begin
  inherited;
  tbbusca.Close;
end;

function TfrmARQUIVOXML.CompactarArquivo():string;
begin
  Result := Validacaminho(mm.varI_Code_Company,
                          mm.M_PATHXML,
                          mm.varC_Doc_Customer,
                          variif(cbxarquivo.ItemIndex = 0,'NFe','MDFe'),
                          DateToStr(edSearchCRUDDtIni.DateTime),
                          '');
end;


procedure TfrmARQUIVOXML.Listar(Path: string);
var
  SR       : TSearchRec;
  caminho  : string;
  arqoriginal,
  arqfinal : string;

  function RemoverE(Str:String): String;
  begin
    Str := StrSubst(Str,'-nfe.xml','',0);
    result := Str;
  end;
  procedure deletararq(caminhoarq,arq:string);
  begin
    DeleteFile(caminhoarq+arq);
  end;
  function buscaarquivo(caminho,arquivo:string) : boolean;
  begin
    arqfinal := RemoverE(arquivo);

    if SqlPesquisa(' select * from mvmestre where codigobarras = ' + QuotedStr(arqfinal) +  ' and cancelada = ' + QuotedStr('A') +
                   ' and documento                             = ' + IntToStr(1)) then
    Result := True
    else
      begin
        deletararq(caminho,arquivo);
        result := false;
      end;
  end;
begin
  caminho := ExtractFileDir(CompactarArquivo())+'\';
  if FindFirst(caminho + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
        begin
          if buscaarquivo(caminho,SR.Name) = True then
        end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TfrmARQUIVOXML.ListarArquivos(const Diretorio: string;Sub:Boolean);
var

  F: TSearchRec;

  Ret: Integer;

  TempNome: string;

begin

  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);

  try

    while Ret = 0 do

    begin

      if TemAtributo(F.Attr, faDirectory) then

      begin

        if (F.Name <> '.') And (F.Name <> '..') then

          if Sub = True then

          begin

            TempNome := Diretorio+'\' + F.Name;

            ListarArquivos(TempNome, True);

          end;

      end

      else

      begin

        UniListBox.Items.Add(Diretorio+'\'+F.Name);

      end;

        Ret := FindNext(F);

    end;

  finally

    begin
      FindClose(F);
    end;
  end;

end;

procedure TfrmARQUIVOXML.Saidas(const rempresa: integer; dataini,
  datafin: TDateTime);
begin
  if cbxarquivo.ItemIndex = 0 then
    SqlPesquisa(XML_SAIDAS(rempresa,dataini,datafin))
  else
    SqlPesquisa(XML_MANIFESTO(rempresa,dataini,datafin));

  if dm_rc.sqlBuscas.recordcount > 0 then
    begin
      tbbusca.CopyDataSet(dm_rc.sqlBuscas);
    end;
end;

procedure TfrmARQUIVOXML.tbbuscadetalhesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if tbbuscaCANCELADA.AsString = 'A' then
        Text := '<span class="badge badge-success">Homologada</span>'
      else
      if tbbuscaCANCELADA.AsString = 'C' then
        Text := '<span class="badge badge-danger">Cancelada</span>'
      else
      if tbbuscaCANCELADA.AsString = 'E' then
        Text := '<span class="badge badge-info">Encerrada</span>'
      else
        Text := '<span class="badge badge-warning">Aguarde</span>';
    end;
end;

procedure TfrmARQUIVOXML.tbbuscadocGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-file-alt fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

function TfrmARQUIVOXML.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmARQUIVOXML.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text := DateToStr(StartOfTheMonth(date));
end;
initialization
  RegisterClass(TfrmARQUIVOXML);
end.
