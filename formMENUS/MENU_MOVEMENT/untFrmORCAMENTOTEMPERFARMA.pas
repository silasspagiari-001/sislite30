unit untFrmORCAMENTOTEMPERFARMA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMESTRE, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  uniHTMLFrame, uniMemo, uniDBMemo, uniDBEdit, UniButtonDbEdit,
  uniDBDateTimePicker, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniGUIClasses, uniEdit, UniButtonEdit, uniScrollBox,
  uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel, uniGUIBaseClasses,
  uniDBComboBox;

type
  TfrmORCAMENTOTEMPERFARMA = class(TfrmMESTRE)
    E1: TUniMenuItem;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel42: TUniLabel;
    N7: TUniMenuItem;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure FDQryFiltroSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure o2Click(Sender: TObject);
    procedure O3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmORCAMENTOTEMPERFARMA: TfrmORCAMENTOTEMPERFARMA;

implementation

{$R *.dfm}

uses MainModule, untFrmTELAGENERICA, unReportImpressao, mkm_relatorios,
  mkm_impressao, mkm_funcoes, mkm_procedures;
procedure TfrmORCAMENTOTEMPERFARMA.btnNewRegClick(Sender: TObject);
begin
  inherited;
  FDQryCad.FindField('TESTEMUNHAI').AsString     :=  'Cintia Almeida Gazzoto M.';
  FDQryCad.FindField('TESTEMUNHACPFI').AsString  :=  '37297522864';
  FDQryCad.FindField('TESTEMUNHAII').AsString    :=  'Felipe Marcel Junior dos Santos';
  FDQryCad.FindField('TESTEMUNHACPFII').AsString :=  '42466901803';
  FDQryCad.FindField('STATUS').AsString          :=  'Andamento';
end;

procedure TfrmORCAMENTOTEMPERFARMA.E1Click(Sender: TObject);
begin
  inherited;
  mm.VarC_Atelagenerica            := 'INDICATIVOORC';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmORCAMENTOTEMPERFARMA.FDQryFiltroSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroSTATUS.AsString = 'Vendido' then
        Text := '<span class="badge badge-success">Vendido</span>';
      if FDQryFiltroSTATUS.AsString = 'Perdido' then
        Text := '<span class="badge badge-danger">Perdido</span>';
      if FDQryFiltroSTATUS.AsString = 'Andamento' then
        Text := '<span class="badge badge-primary">Andamento</span>';
      if FDQryFiltroSTATUS.AsString = 'Produção' then
        Text := '<span class="badge badge-warning">Produção</span>';
    end;
end;

procedure TfrmORCAMENTOTEMPERFARMA.o2Click(Sender: TObject);
begin
  inherited;
  try
    mm.varC_caminhopdf :=  PEDIDOORCAMENTO_OS(mm.varI_Code_Company,
                           FDQryFiltro.FindField('NUMERO').AsInteger,
                           FDQryFiltro.FindField('DOCUMENTO').AsInteger);

    unfImpressao.ShowModal();
  except
    on e: exception do
    begin
      gera_log(e.message);
    end;
  end;
end;

procedure TfrmORCAMENTOTEMPERFARMA.O3Click(Sender: TObject);
begin
  inherited;
  try
    mm.varC_caminhopdf :=  PEDIDOORCAMENTO_osestoque(mm.varI_Code_Company,
                           FDQryFiltro.FindField('NUMERO').AsInteger,
                           FDQryFiltro.FindField('DOCUMENTO').AsInteger);

    unfImpressao.ShowModal();

  except
    on e: exception do
    begin
      gera_log(e.message);
    end;
  end;
end;

procedure TfrmORCAMENTOTEMPERFARMA.UniFrameCreate(Sender: TObject);
begin
  labTitleForm.Caption        := 'ORÇAMENTO';
  varC_Documento_Mvmestre     := 3;
  inherited;
end;

initialization
  RegisterClass(TfrmORCAMENTOTEMPERFARMA);
end.
