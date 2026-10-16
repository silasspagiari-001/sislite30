unit untFrmLaboratorioRAM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  UniButtonEdit, uniLabel, uniScrollBox, uniPageControl, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox;

type
  TfrmLaboratorioRAM = class(TfrmBase)
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
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditcodresponsavel: TUniButtonEdit;
    UniComboBoxmes: TUniComboBox;
    UniEditano: TUniEdit;
    TB_ATIVIDADES: TFDMemTable;
    TB_ATIVIDADESMES: TStringField;
    TB_ATIVIDADESFEV_REC: TFloatField;
    TB_ATIVIDADESJAN_REC: TFloatField;
    TB_ATIVIDADESMAR_REC: TFloatField;
    TB_ATIVIDADESABR_REC: TFloatField;
    TB_ATIVIDADESMAI_REC: TFloatField;
    TB_ATIVIDADESJUN_REC: TFloatField;
    TB_ATIVIDADESJUL_REC: TFloatField;
    TB_ATIVIDADESAGO_REC: TFloatField;
    TB_ATIVIDADESSET_REC: TFloatField;
    TB_ATIVIDADESNOV_REC: TFloatField;
    TB_ATIVIDADESDEZ_REC: TFloatField;
    TB_ATIVIDADESOUT_REC: TFloatField;
    TB_ATIVIDADESJAN_PRO: TFloatField;
    TB_ATIVIDADESFEV_PRO: TFloatField;
    TB_ATIVIDADESMAR_PRO: TFloatField;
    TB_ATIVIDADESABR_PRO: TFloatField;
    TB_ATIVIDADESMAI_PRO: TFloatField;
    TB_ATIVIDADESJUN_PRO: TFloatField;
    TB_ATIVIDADESJUL_PRO: TFloatField;
    TB_ATIVIDADESAGO_PRO: TFloatField;
    TB_ATIVIDADESSET_PRO: TFloatField;
    TB_ATIVIDADESOUT_PRO: TFloatField;
    TB_ATIVIDADESNOV_PRO: TFloatField;
    TB_ATIVIDADESDEZ_PRO: TFloatField;
    dsatividades: TDataSource;
    UniDBGrid1: TUniDBGrid;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure BuscaRAM();
  end;

var
  frmLaboratorioRAM: TfrmLaboratorioRAM;

implementation

{$R *.dfm}

uses mkm_func_web, mkm_procedures, MainModule, untDM_RC, mkm_impressao,
  unReportImpressao;

{ TfrmLaboratorioRAM }

procedure TfrmLaboratorioRAM.btnOptionsClick(Sender: TObject);
begin
  inherited;
  if TB_ATIVIDADES.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  LABORATORIO_RAM(UniComboBoxmes.Text,
                                                      UniEditano.Text,
                                                      mm.varI_Code_Company,
                                                      StrToInt(UniButtonEditcodresponsavel.Text),
                                                      TB_ATIVIDADES);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure TfrmLaboratorioRAM.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  BuscaRAM();
end;

procedure TfrmLaboratorioRAM.BuscaRAM;
var
  M_SQL : string;
begin
  TB_ATIVIDADES.Close;
  TB_ATIVIDADES.Open;

  M_SQL :=  ' SELECT                                                            ' +
            ' extract(month from p.datarecebimento) AS EMISSAO, P.EMPRESA,      ' +
            '   case                                                    ' +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 1  THEN ' + QuotedStr('Jan') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 2  THEN ' + QuotedStr('Fev') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 3  THEN ' + QuotedStr('Mar') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 4  THEN ' + QuotedStr('Abr') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 5  THEN ' + QuotedStr('Mai') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 6  THEN ' + QuotedStr('Jun') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 7  THEN ' + QuotedStr('Jul') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 8  THEN ' + QuotedStr('Ago') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 9  THEN ' + QuotedStr('Set') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 10 THEN ' + QuotedStr('Out') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 11 THEN ' + QuotedStr('Nov') +
            '     when EXTRACT(month  from P.DATARECEBIMENTO) = 12 THEN ' + QuotedStr('Dez') +
            '   end as Descricao,                                            ' +
            ' COUNT(P.CODIGO) as TOTAL                                       ' +
            ' FROM PROTOCOLO P                                               ' +
            ' WHERE EXTRACT(year from P.DATARECEBIMENTO) =                   ' + QuotedStr(UniEditano.Text)       +
            variif(UniComboBoxmes.Text <> '',' AND EXTRACT(month from P.DATARECEBIMENTO) <= ' + QuotedStr(UniComboBoxmes.Text),'') +
            ' AND P.EMPRESA   =                                              ' + IntToStr(mm.varI_Code_Company)                     +
            ' AND P.BOLETIM  <>                                              ' + QuotedStr('')                           +
            'GROUP BY extract(month from p.datarecebimento),p.empresa';

  if SqlPesquisa(M_SQL) then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin

          TB_ATIVIDADES.Append;
          TB_ATIVIDADES.FindField('MES').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jan' then
            TB_ATIVIDADES.FindField('JAN_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Fev' then
            TB_ATIVIDADES.FindField('FEV_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mar' then
            TB_ATIVIDADES.FindField('MAR_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Abr' then
            TB_ATIVIDADES.FindField('ABR_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mai' then
            TB_ATIVIDADES.FindField('MAI_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jun' then
            TB_ATIVIDADES.FindField('JUN_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jul' then
            TB_ATIVIDADES.FindField('JUL_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Ago' then
            TB_ATIVIDADES.FindField('AGO_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Set' then
            TB_ATIVIDADES.FindField('SET_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Out' then
            TB_ATIVIDADES.FindField('OUT_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Nov' then
            TB_ATIVIDADES.FindField('NOV_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Dez' then
            TB_ATIVIDADES.FindField('DEZ_REC').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
          TB_ATIVIDADES.Post;

          dm_rc.sqlBuscas.Next;
        end;

      M_SQL :=  ' SELECT                                                    ' +
                ' extract(month from p.DATAEMISSAO) AS EMISSAO, P.EMPRESA,  ' +
                '   case                                                    ' +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 1  THEN ' + QuotedStr('Jan') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 2  THEN ' + QuotedStr('Fev') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 3  THEN ' + QuotedStr('Mar') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 4  THEN ' + QuotedStr('Abr') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 5  THEN ' + QuotedStr('Mai') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 6  THEN ' + QuotedStr('Jun') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 7  THEN ' + QuotedStr('Jul') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 8  THEN ' + QuotedStr('Ago') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 9  THEN ' + QuotedStr('Set') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 10 THEN ' + QuotedStr('Out') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 11 THEN ' + QuotedStr('Nov') +
                '     when EXTRACT(month  from P.DATAEMISSAO) = 12 THEN ' + QuotedStr('Dez') +
                '   end as Descricao,                                            ' +
                ' COUNT(P.CODIGO) as TOTAL                                       ' +
                ' FROM PROTOCOLO P                                               ' +
                ' WHERE EXTRACT(year from P.DATAEMISSAO) =                       ' + QuotedStr(UniEditano.Text)  +
            variif(UniComboBoxmes.Text <> '',' AND EXTRACT(month from P.DATAEMISSAO) <= ' + QuotedStr(UniComboBoxmes.Text),'') +
                ' AND P.EMPRESA   =                                              ' + IntToStr(mm.varI_Code_Company)                +
                ' AND P.BOLETIM  <>                                              ' + QuotedStr('')                      +
                'GROUP BY extract(month from p.DATAEMISSAO),p.empresa';

      if SqlPesquisa(M_SQL) then
        begin
          dm_rc.sqlBuscas.First;
          while not dm_rc.sqlBuscas.Eof do
            begin
              if not TB_ATIVIDADES.Locate('MES',dm_rc.sqlBuscas.Findfield('DESCRICAO').AsString,[]) then
                begin
                  TB_ATIVIDADES.Append;
                  TB_ATIVIDADES.FindField('MES').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jan' then
                    TB_ATIVIDADES.FindField('JAN_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Fev' then
                    TB_ATIVIDADES.FindField('FEV_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mar' then
                    TB_ATIVIDADES.FindField('MAR_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Abr' then
                    TB_ATIVIDADES.FindField('ABR_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mai' then
                    TB_ATIVIDADES.FindField('MAI_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jun' then
                    TB_ATIVIDADES.FindField('JUN_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jul' then
                    TB_ATIVIDADES.FindField('JUL_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Ago' then
                    TB_ATIVIDADES.FindField('AGO_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Set' then
                    TB_ATIVIDADES.FindField('SET_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Out' then
                    TB_ATIVIDADES.FindField('OUT_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Nov' then
                    TB_ATIVIDADES.FindField('NOV_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Dez' then
                    TB_ATIVIDADES.FindField('DEZ_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  TB_ATIVIDADES.Post;
                end
              else
                begin
                  TB_ATIVIDADES.Edit;
                  TB_ATIVIDADES.FindField('MES').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jan' then
                    TB_ATIVIDADES.FindField('JAN_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Fev' then
                    TB_ATIVIDADES.FindField('FEV_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mar' then
                    TB_ATIVIDADES.FindField('MAR_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Abr' then
                    TB_ATIVIDADES.FindField('ABR_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Mai' then
                    TB_ATIVIDADES.FindField('MAI_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jun' then
                    TB_ATIVIDADES.FindField('JUN_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Jul' then
                    TB_ATIVIDADES.FindField('JUL_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Ago' then
                    TB_ATIVIDADES.FindField('AGO_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Set' then
                    TB_ATIVIDADES.FindField('SET_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Out' then
                    TB_ATIVIDADES.FindField('OUT_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Nov' then
                    TB_ATIVIDADES.FindField('NOV_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  if dm_rc.sqlBuscas.FindField('DESCRICAO').AsString = 'Dez' then
                    TB_ATIVIDADES.FindField('DEZ_PRO').AsFloat := dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
                  TB_ATIVIDADES.Post;
                end;
              dm_rc.sqlBuscas.Next;
            end;
        end;
    end;

end;

procedure TfrmLaboratorioRAM.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniEditano.Text     := FormatDateTime('yyyy',Date);
  UniComboBoxmes.Text := FormatDateTime('mm',Date);
end;

initialization
  RegisterClass(TfrmLaboratorioRAM);

end.
