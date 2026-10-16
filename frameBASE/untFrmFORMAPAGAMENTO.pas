unit untFrmFORMAPAGAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniLabel, uniEdit;

type
  TfrmFORMAPAGAMENTO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniFormattedNumberEditTOTAL: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniFormattedNumberEditdinheiro: TUniFormattedNumberEdit;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniFormattedNumberEditdebito: TUniFormattedNumberEdit;
    UniFormattedNumberEditcredito: TUniFormattedNumberEdit;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel5: TUniLabel;
    unieditcpf: TUniEdit;
    procedure UniFormShow(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmFORMAPAGAMENTO: TfrmFORMAPAGAMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmFORMAPAGAMENTO: TfrmFORMAPAGAMENTO;
begin
  Result := TfrmFORMAPAGAMENTO(mm.GetFormInstance(TfrmFORMAPAGAMENTO));
end;

procedure TfrmFORMAPAGAMENTO.btnLkpClearClick(Sender: TObject);
begin
  mm.var_vlr_dinheiro := UniFormattedNumberEditdinheiro.Value;
  mm.var_vlr_debito   := UniFormattedNumberEditdebito.Value;
  mm.var_vlr_credito  := UniFormattedNumberEditcredito.Value;
  mm.var_cpf_cliente  := unieditcpf.Text;

  ModalResult := mrOK;
end;

procedure TfrmFORMAPAGAMENTO.UniFormShow(Sender: TObject);
begin
  UniFormattedNumberEditTOTAL.Value    :=  mm.var_vlr_totalcupom;
  UniFormattedNumberEditdinheiro.Value :=  mm.var_vlr_dinheiro;
  UniFormattedNumberEditdebito.Value   :=  mm.var_vlr_debito;
  UniFormattedNumberEditcredito.Value  :=  mm.var_vlr_credito;

  UniFormattedNumberEditdinheiro.SetFocus;
end;

end.
