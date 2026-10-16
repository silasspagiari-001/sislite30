unit untFrmDEMOWITHFORMMODAL; // v. 3.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit;

type
  TfrmDEMOWithFormMODAL = class(TUniForm)
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel66: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel67: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel68: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel56: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel57: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel58: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    paFooter: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;
begin
  Result := TfrmDEMOWithFormMODAL(mm.GetFormInstance(TfrmDEMOWithFormMODAL));
end;

procedure TfrmDEMOWithFormMODAL.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDEMOWithFormMODAL.UniFormCreate(Sender: TObject);
begin
    // para formulários, deve-se efetuar o ResizeBlocks
    rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmDEMOWithFormMODAL.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmDEMOWithFormMODAL.UniFormReady(Sender: TObject);
begin
     Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );

     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

Initialization
   RegisterClass( TfrmDEMOWithFormMODAL );

end.
