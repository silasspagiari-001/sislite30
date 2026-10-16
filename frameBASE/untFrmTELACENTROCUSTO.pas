unit untFrmTELACENTROCUSTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniEdit, uniLabel,
  UniButtonEdit, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmTELACENTROCUSTO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn12: TUniBitBtn;
    rcBlock30: TUniContainerPanel;
    UniButtonEditcentrocusto: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniEditdescricao: TUniEdit;
    UniLabel2: TUniLabel;
    UniFormattedNumberEditvalor: TUniFormattedNumberEdit;
    UniLabel3: TUniLabel;
    UniDBGridEntrega: TUniDBGrid;
    procedure UniButtonEditcentrocustoButtonClick(Sender: TObject);
    procedure UniButtonEditcentrocustoExit(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure limpavars();
  end;

function frmTELACENTROCUSTO: TfrmTELACENTROCUSTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, untFrmPesquisa;

function frmTELACENTROCUSTO: TfrmTELACENTROCUSTO;
begin
  Result := TfrmTELACENTROCUSTO(mm.GetFormInstance(TfrmTELACENTROCUSTO));
end;

procedure TfrmTELACENTROCUSTO.limpavars;
begin
  UniButtonEditcentrocusto.Text     := '0';
  UniEditdescricao.Text             := '';
  UniFormattedNumberEditvalor.Value := 0.00;
end;

procedure TfrmTELACENTROCUSTO.UniBitBtn12Click(Sender: TObject);
begin
  dm_rc.tbcentrocustofin.Append;
  dm_rc.tbcentrocustofin.FindField('CENTROCUSTO').AsInteger := StrToInt(UniButtonEditcentrocusto.Text);
  dm_rc.tbcentrocustofin.FindField('DESCRICAO').AsString    := UniEditdescricao.Text;
  dm_rc.tbcentrocustofin.FindField('VALOR').AsFloat         := UniFormattedNumberEditvalor.Value;
  dm_rc.tbcentrocustofin.post;

  limpavars;
end;

procedure TfrmTELACENTROCUSTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmTELACENTROCUSTO.UniButtonEditcentrocustoButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CENTROCUSTO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcentrocusto.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELACENTROCUSTO.UniButtonEditcentrocustoExit(Sender: TObject);
begin
  UniEditdescricao.Text := Acha_Item('CENTROCUSTO',UniButtonEditcentrocusto.Text);
end;

procedure TfrmTELACENTROCUSTO.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      dm_rc.tbcentrocustofin.Delete;
    end;
end;

procedure TfrmTELACENTROCUSTO.UniFormShow(Sender: TObject);
begin
  if mm.vari_statuscentrocusto = 'T' then
    begin
      UniButtonEditcentrocusto.Enabled     := True;
      UniEditdescricao.Enabled             := True;
      UniFormattedNumberEditvalor.Enabled  := True;
      UniBitBtn12.Enabled                  := True;
      UniDBGridEntrega.Columns[3].Visible  := True;
    end
  else
    begin
      UniButtonEditcentrocusto.Enabled     := False;
      UniEditdescricao.Enabled             := False;
      UniFormattedNumberEditvalor.Enabled  := False;
      UniBitBtn12.Enabled                  := False;
      UniDBGridEntrega.Columns[3].Visible  := False;
    end;
end;

end.
