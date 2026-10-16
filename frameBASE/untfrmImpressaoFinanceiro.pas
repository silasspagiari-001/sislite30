unit untfrmImpressaoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniMultiItem, uniComboBox, uniLabel, uniScreenMask;

type
  Tfrmimpressaofinanceiro = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    cbxSearchCRUDFieldagpfinanceiro: TUniComboBox;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniScreenMask1: TUniScreenMask;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmimpressaofinanceiro: Tfrmimpressaofinanceiro;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, unReportImpressao, mkm_impressao,
  mkm_anim;

function frmimpressaofinanceiro: Tfrmimpressaofinanceiro;
begin
  Result := Tfrmimpressaofinanceiro(mm.GetFormInstance(Tfrmimpressaofinanceiro));
end;

procedure Tfrmimpressaofinanceiro.btnimpressaoClick(Sender: TObject);
begin
  if dm_rc.tbgenerico.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Financeiro(
                             MM.varSR_tipo,
                             mm.varSR_Dataini,
                             mm.varSR_Datafin,
                             mm.varI_Code_Company,
                             cbxSearchCRUDFieldagpfinanceiro.ItemIndex,
                             dm_rc.tbgenerico);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' , false );

end;

procedure Tfrmimpressaofinanceiro.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrmimpressaofinanceiro.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
  cbxSearchCRUDFieldagpfinanceiro.ItemIndex := 0;
end;

procedure Tfrmimpressaofinanceiro.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
  dm_rc.tbgenerico.Close;
end;

procedure Tfrmimpressaofinanceiro.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure Tfrmimpressaofinanceiro.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

end.


