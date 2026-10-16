unit untFrmDEMONSTRATIVO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniDateTimePicker, uniLabel, uniScrollBox, uniPageControl,
  uniButton, uniBitBtn, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMONSTRATIVO = class(TfrmBase)
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
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDateTimePickerreferente: TUniDateTimePicker;
    UniContainerPanel1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditcodresponsavel: TUniButtonEdit;
    dbgSearchCRUD: TUniDBGrid;
    TB_DEMO: TFDMemTable;
    TB_DEMOESTADO: TStringField;
    TB_DEMOSAFRA: TStringField;
    TB_DEMOESPECIE: TStringField;
    TB_DEMOCULTIVAR: TStringField;
    TB_DEMOCATEGORIA: TStringField;
    TB_DEMOQTD_AMOSTRA: TFloatField;
    TB_DEMOREPRESENTATIVIDADE: TFloatField;
    TB_DEMOPE: TStringField;
    TB_DEMOPE90: TStringField;
    TB_DEMOField90: TStringField;
    TB_DEMOSP: TStringField;
    TB_DEMOOC: TStringField;
    TB_DEMOOE: TStringField;
    TB_DEMOSS: TStringField;
    TB_DEMONT: TStringField;
    TB_DEMONP: TStringField;
    TB_DEMOINF: TStringField;
    TB_DEMOGE: TStringField;
    TB_DEMONULO: TStringField;
    TB_DEMOAMOSTRA: TStringField;
    TB_DEMOCULTIVAR_CODIGO: TIntegerField;
    TB_DEMOESPECIE_CODIGO: TIntegerField;
    TB_DEMO_RESULTADO: TFDMemTable;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    TB_DEMO_RESULTADOAMOSTRA: TStringField;
    TB_DEMO_RESULTADOESPECIE_CODIGO: TIntegerField;
    TB_DEMO_RESULTADOCULTIVAR_CODIGO: TIntegerField;
    dsdemo: TDataSource;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchCRUDDtIniExit(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniButtonEditcodresponsavelClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ativabusca();
    procedure BuscaDemonstrativo();

  end;

var
  frmDEMONSTRATIVO: TfrmDEMONSTRATIVO;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, untDM_RC, mkm_procedures, System.Math,
  System.DateUtils, untFrmPesquisa, mkm_impressao, unReportImpressao;

{ TfrmDEMONSTRATIVO }

procedure TfrmDEMONSTRATIVO.ativabusca;
begin
  if not ( dsdemo.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;

end;

procedure TfrmDEMONSTRATIVO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if TB_DEMO.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  LABORATORIO_demonstrativo(edSearchCRUDDtIni.Text,
                                                      edSearchCRUDDtEnd.Text,
                                                      UniDateTimePickerreferente.Text,
                                                      mm.varI_Code_Company,
                                                      StrToInt(UniButtonEditcodresponsavel.Text),TB_DEMO);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmDEMONSTRATIVO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmDEMONSTRATIVO.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  BuscaDemonstrativo();
end;

procedure TfrmDEMONSTRATIVO.BuscaDemonstrativo;
var
  M_REPRESENTATIVIDADE  : Real;
  M_SQL                 : string;
begin

  TB_DEMO_RESULTADO.Close;
  TB_DEMO_RESULTADO.Open;
  TB_DEMO.Close;
  TB_DEMO.Open;

  M_SQL := 'SELECT P.estado_procedencia, P.safravalida, P.especie_codigo, P.cultivar_codigo, P.categoria, p.empresa, count(p.codigo) as numero, ' +
           ' cast(sum(p.representatividade) as numeric(15,2)) / 1000 as total                                                        ' +
           ' FROM PROTOCOLO P                                                                                                        ' +
           ' where  dataemissao between                                                                                              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
           ' and                                                                                                                     ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text)) +
           ' and empresa                                                                                                           = ' + IntToStr(mm.varI_Code_Company)               +
           ' and boletim <>                                                                                                          ' + QuotedStr('') +
           ' group by 1,2,3,4,5,6                                                                                                    ' +
           ' order by 1,2,5;                                                                                                         ';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          TB_DEMO_RESULTADO.Append;
          TB_DEMO_RESULTADO.FindField('ESTADO').AsString              := dm_rc.sqlBuscas.FindField('estado_procedencia').AsString;
          TB_DEMO_RESULTADO.FindField('SAFRA').AsString               := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;

          TB_DEMO_RESULTADO.FindField('ESPECIE_CODIGO').AsInteger     := dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsInteger;
          TB_DEMO_RESULTADO.FindField('CULTIVAR_CODIGO').AsInteger    := dm_rc.sqlBuscas.FindField('CULTIVAR_CODIGO').AsInteger;

          TB_DEMO_RESULTADO.FindField('ESPECIE').AsString             := Acha_Item('ESPECIE' ,dm_rc.sqlBuscas.FindField('ESPECIE_CODIGO').AsString);
          TB_DEMO_RESULTADO.FindField('CULTIVAR').AsString            := Acha_Item('CULTIVAR',dm_rc.sqlBuscas.FindField('CULTIVAR_CODIGO').AsString);
          TB_DEMO_RESULTADO.FindField('CATEGORIA').AsString           := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
          TB_DEMO_RESULTADO.FindField('QTD_AMOSTRA').AsFloat          := dm_rc.sqlBuscas.FindField('NUMERO').AsFloat;
          TB_DEMO_RESULTADO.FindField('REPRESENTATIVIDADE').AsFloat   := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;

          TB_DEMO_RESULTADO.FindField('PE').AsString                  := '-0-';
          TB_DEMO_RESULTADO.FindField('PE90').AsString                := '-0-';
          TB_DEMO_RESULTADO.FindField('90').AsString                  := '-0-';

          TB_DEMO_RESULTADO.FindField('SP').AsString                  := '-0-';
          TB_DEMO_RESULTADO.FindField('OC').AsFloat                   := 0;
          TB_DEMO_RESULTADO.FindField('OE').AsFloat                   := 0;//;//F_DATAMODULE.TB_ANALISE.FindField('TOTAL_OE').AsFloat;
          TB_DEMO_RESULTADO.FindField('SS').AsFloat                   := 0;//F_DATAMODULE.TB_ANALISE.FindField('TOTAL_SS').AsFloat;
          TB_DEMO_RESULTADO.FindField('NT').AsFloat                   := 0;//F_DATAMODULE.TB_ANALISE.FindField('TOTAL_TO').AsFloat;
          TB_DEMO_RESULTADO.FindField('NP').AsFloat                   := 0;//F_DATAMODULE.TB_ANALISE.FindField('TOTAL_PR').AsFloat;
          TB_DEMO_RESULTADO.FindField('INF').AsFloat                  := 0;
          TB_DEMO_RESULTADO.FindField('GE').AsFloat                   := 0;
          TB_DEMO_RESULTADO.FindField('NULO').AsString                := '0';
          TB_DEMO_RESULTADO.Post;

          dm_rc.sqlBuscas.Next;
        end;

      TB_DEMO_RESULTADO.First;
      while not TB_DEMO_RESULTADO.Eof do
        begin
          if not TB_DEMO.Locate('ESTADO;SAFRA;CULTIVAR',            VarArrayOf([TB_DEMO_RESULTADO.FindField('ESTADO').AsString,
                                                                                            TB_DEMO_RESULTADO.FindField('SAFRA').AsString,
                                                                                            StrAllTrim(TB_DEMO_RESULTADO.FindField('CULTIVAR').AsString)]),[]) then
            begin
              TB_DEMO.Append;
              TB_DEMO.FindField('ESTADO').AsString              := TB_DEMO_RESULTADO.FindField('ESTADO').AsString;
              TB_DEMO.FindField('SAFRA').AsString               := TB_DEMO_RESULTADO.FindField('SAFRA').AsString;
              TB_DEMO.FindField('ESPECIE').AsString             := TB_DEMO_RESULTADO.FindField('ESPECIE').AsString;;
              TB_DEMO.FindField('CULTIVAR').AsString            := TB_DEMO_RESULTADO.FindField('CULTIVAR').AsString;
              TB_DEMO.FindField('CATEGORIA').AsString           := TB_DEMO_RESULTADO.FindField('CATEGORIA').AsString;
              TB_DEMO.FindField('QTD_AMOSTRA').AsFloat          := TB_DEMO_RESULTADO.FindField('QTD_AMOSTRA').AsFloat;
              TB_DEMO.FindField('REPRESENTATIVIDADE').AsFloat   := TB_DEMO_RESULTADO.FindField('REPRESENTATIVIDADE').AsFloat;

              TB_DEMO.FindField('ESPECIE_CODIGO').AsInteger     := TB_DEMO_RESULTADO.FindField('ESPECIE_CODIGO').AsInteger;
              TB_DEMO.FindField('CULTIVAR_CODIGO').AsInteger    := TB_DEMO_RESULTADO.FindField('CULTIVAR_CODIGO').AsInteger;


              TB_DEMO.FindField('PE').AsString                  := '-0-';
              TB_DEMO.FindField('PE90').AsString                := '-0-';
              TB_DEMO.FindField('90').AsString                  := '-0-';

              TB_DEMO.FindField('SP').AsString                  := '-0-';
              TB_DEMO.FindField('OC').AsFloat                   := 0;
              TB_DEMO.FindField('OE').AsFloat                   := TB_DEMO_RESULTADO.FindField('OE').AsFloat;
              TB_DEMO.FindField('SS').AsFloat                   := TB_DEMO_RESULTADO.FindField('SS').AsFloat;
              TB_DEMO.FindField('NT').AsFloat                   := TB_DEMO_RESULTADO.FindField('NT').AsFloat;
              TB_DEMO.FindField('NP').AsFloat                   := TB_DEMO_RESULTADO.FindField('NP').AsFloat;
              TB_DEMO.FindField('INF').AsFloat                  := 0;
              TB_DEMO.FindField('GE').AsFloat                   := 0;
              TB_DEMO.FindField('NULO').AsString                := '0';

              TB_DEMO.Post;
            end
          else
            begin
              TB_DEMO.Edit;
              TB_DEMO.FindField('ESTADO').AsString              := TB_DEMO_RESULTADO.FindField('ESTADO').AsString;
              TB_DEMO.FindField('SAFRA').AsString               := TB_DEMO_RESULTADO.FindField('SAFRA').AsString;
              TB_DEMO.FindField('ESPECIE').AsString             := TB_DEMO_RESULTADO.FindField('ESPECIE').AsString;;
              TB_DEMO.FindField('CULTIVAR').AsString            := TB_DEMO_RESULTADO.FindField('CULTIVAR').AsString;
              TB_DEMO.FindField('CATEGORIA').AsString           := TB_DEMO_RESULTADO.FindField('CATEGORIA').AsString;

              TB_DEMO.FindField('ESPECIE_CODIGO').AsInteger     := TB_DEMO_RESULTADO.FindField('ESPECIE_CODIGO').AsInteger;
              TB_DEMO.FindField('CULTIVAR_CODIGO').AsInteger    := TB_DEMO_RESULTADO.FindField('CULTIVAR_CODIGO').AsInteger;


              TB_DEMO.FindField('QTD_AMOSTRA').AsFloat          := TB_DEMO.FindField('QTD_AMOSTRA').AsFloat         + TB_DEMO_RESULTADO.FindField('QTD_AMOSTRA').AsFloat;
              TB_DEMO.FindField('REPRESENTATIVIDADE').AsFloat   := TB_DEMO.FindField('REPRESENTATIVIDADE').AsFloat  + TB_DEMO_RESULTADO.FindField('REPRESENTATIVIDADE').AsFloat;

              TB_DEMO.FindField('PE').AsString                  := '-0-';
              TB_DEMO.FindField('PE90').AsString                := '-0-';
              TB_DEMO.FindField('90').AsString                  := '-0-';

              TB_DEMO.FindField('SP').AsString                  := '-0-';
              TB_DEMO.FindField('OC').AsFloat                   := 0;
              TB_DEMO.FindField('OE').AsFloat                   := TB_DEMO.FindField('OE').AsFloat  + TB_DEMO_RESULTADO.FindField('OE').AsFloat;
              TB_DEMO.FindField('SS').AsFloat                   := TB_DEMO.FindField('SS').AsFloat  + TB_DEMO_RESULTADO.FindField('SS').AsFloat;
              TB_DEMO.FindField('NT').AsFloat                   := TB_DEMO.FindField('NT').AsFloat  + TB_DEMO_RESULTADO.FindField('NT').AsFloat;
              TB_DEMO.FindField('NP').AsFloat                   := TB_DEMO.FindField('NP').AsFloat  + TB_DEMO_RESULTADO.FindField('NP').AsFloat;
              TB_DEMO.FindField('INF').AsFloat                  := 0;
              TB_DEMO.FindField('GE').AsFloat                   := 0;
              TB_DEMO.FindField('NULO').AsString                := '0';

              TB_DEMO.Post;
            end;

          TB_DEMO_RESULTADO.Next;
        end;

      TB_DEMO.First;
      while not TB_DEMO.Eof do
        begin
          M_REPRESENTATIVIDADE := 0;

          TB_DEMO.edit;
          M_REPRESENTATIVIDADE                             := TB_DEMO.FindField('REPRESENTATIVIDADE').AsFloat;
          TB_DEMO.FindField('REPRESENTATIVIDADE').AsFloat  := RoundTo(M_REPRESENTATIVIDADE,-2);
          TB_DEMO.Post;

          TB_DEMO.Next;
        end;
    end;

  if TB_DEMO.RecordCount > 0 then
    TB_DEMO.First;
end;
procedure TfrmDEMONSTRATIVO.edSearchCRUDDtIniExit(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtEnd.Text := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
end;

procedure TfrmDEMONSTRATIVO.labExitClick(Sender: TObject);
var
   I, F : integer;

begin

  inherited;

  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;

end;

procedure TfrmDEMONSTRATIVO.UniButtonEditcodresponsavelClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcodresponsavel.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmDEMONSTRATIVO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  edSearchCRUDDtIni.Text          := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text          := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));
  UniDateTimePickerreferente.Text := DateToStr(StartOfTheMonth(date));

  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TfrmDEMONSTRATIVO);
end.
