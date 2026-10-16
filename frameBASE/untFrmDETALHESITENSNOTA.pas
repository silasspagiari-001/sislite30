unit untFrmDETALHESITENSNOTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel, uniEdit,
  uniDBEdit, UniButtonDbEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniButton, uniBitBtn;

type
  TfrmDETALHESITENSNOTA = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    UniButtonDbEditcodigopessoas: TUniButtonDbEdit;
    UniLabel3: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniDBComboBoxregiao: TUniDBComboBox;
    UniLabel2: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmDETALHESITENSNOTA: TfrmDETALHESITENSNOTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_funcoes, mkm_func_web;

function frmDETALHESITENSNOTA: TfrmDETALHESITENSNOTA;
begin
  Result := TfrmDETALHESITENSNOTA(mm.GetFormInstance(TfrmDETALHESITENSNOTA));
end;

procedure TfrmDETALHESITENSNOTA.btnimpressaoClick(Sender: TObject);
begin
  DM_RC.memprodutos.Post;
  ModalResult := mrOK;
end;

procedure TfrmDETALHESITENSNOTA.UniBitBtn1Click(Sender: TObject);
begin
  dm_rc.memprodutos.FindField('DESCRICAO_NOTA').AsString := 'Sementes de '  + StrAllTrim(dm_rc.memprodutos.FindField('SEMENTENOME').AsString)          +
                                                      ' CV '          + StrAllTrim(dm_rc.memprodutos.FindField('CULTIVAR').AsString)             + ' - '  +
                                                      'Termo  '       + dm_rc.memprodutos.FindField('TERMOSEMENTE').AsString                     + ' - '  +
                                                      'Lote:  '       + StrAllTrim(dm_rc.memprodutos.FindField('LOTESEMENTE').AsString)          + ' - ' +
                                                      'Categoria: '   + StrAllTrim(dm_rc.memprodutos.FindField('CATEGORIA').AsString);

end;

procedure TfrmDETALHESITENSNOTA.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmDETALHESITENSNOTA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal          := nil;
end;

procedure TfrmDETALHESITENSNOTA.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmDETALHESITENSNOTA.UniFormShow(Sender: TObject);
begin
  DM_RC.memprodutos.Edit;
end;

end.
