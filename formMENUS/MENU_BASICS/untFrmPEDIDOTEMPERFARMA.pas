unit untFrmPEDIDOTEMPERFARMA;

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
  TfrmPEDIDOTEMPERFARMA = class(TfrmMESTRE)
    rcBlock390: TUniContainerPanel;
    rcBlock400: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel40: TUniLabel;
    UniLabel41: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure o2Click(Sender: TObject);
    procedure O3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPEDIDOTEMPERFARMA: TfrmPEDIDOTEMPERFARMA;

implementation

{$R *.dfm}

uses unReportImpressao, MainModule, mkm_impressao;
procedure TfrmPEDIDOTEMPERFARMA.btnNewRegClick(Sender: TObject);
begin
  inherited;
  I1.Enabled := True;
end;

procedure TfrmPEDIDOTEMPERFARMA.o2Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_OS(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOTEMPERFARMA.O3Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  PEDIDOORCAMENTO_osestoque(mm.varI_Code_Company,
                         FDQryFiltro.FindField('NUMERO').AsInteger,
                         FDQryFiltro.FindField('DOCUMENTO').AsInteger);

  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOTEMPERFARMA.UniFrameCreate(Sender: TObject);
begin
  inherited;
  labTitleForm.Caption        := 'PEDIDO';
  varC_Documento_Mvmestre     := 4;
end;

initialization
  RegisterClass(TfrmPEDIDOTEMPERFARMA);
end.
