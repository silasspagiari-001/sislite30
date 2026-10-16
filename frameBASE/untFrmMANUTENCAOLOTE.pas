unit untFrmMANUTENCAOLOTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, UniButtonDbEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, uniBasicGrid, uniDBGrid, UniButtonEdit,
  uniDateTimePicker;

type
  TfrmMANUTENCAOLOTE = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniButtonEditlote: TUniButtonEdit;
    UniLabelv1: TUniLabel;
    UniLabel1: TUniLabel;
    UniFormattedNumberEditpureza: TUniFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniEditboletim: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdittermo: TUniEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniFormattedNumberEditqtde: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock80: TUniContainerPanel;
    eddataemissao: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  procedure GeraSaldo();
  end;

function frmMANUTENCAOLOTE: TfrmMANUTENCAOLOTE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_funcoes,
  mkm_func_web;
function frmMANUTENCAOLOTE: TfrmMANUTENCAOLOTE;
begin
  Result := TfrmMANUTENCAOLOTE(mm.GetFormInstance(TfrmMANUTENCAOLOTE));
end;

procedure TfrmMANUTENCAOLOTE.btnimpressaoClick(Sender: TObject);
begin
  try
    GeraSaldo();
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Saldo Gerado com SUCESSO!' , 'success' , false );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO GERAR O SALDO' , 'error' , false );
  end;
end;

procedure TfrmMANUTENCAOLOTE.GeraSaldo;
begin
  TabelaPontos  (' select * from pontos where codigo    = 999999999');
  TabelaSementes(' select * from sementes where codigo  =          ' + IntToStr(mm.varI_Code_Codigo_Semente));

  dm_rc.fdqrypontos.Append;
  dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
  dm_rc.fdqrypontos.FindField('CODIGO').AsInteger     := Ultimo_Codigo('PONTOS','CODIGO',True);
  dm_rc.fdqrypontos.FindField('KEY').AsString         := Gera_Guid();
  dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger  := 300;
  dm_rc.fdqrypontos.FindField('OPERACAO').AsInteger   := variif(cbxtipo.ItemIndex = 0,8888,7777) ;
  dm_rc.fdqrypontos.FindField('PESSOA').AsInteger     := 99999;
  dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger  := 1;
  dm_rc.fdqrypontos.FindField('TIPO').AsString        := cbxtipo.Text;
  dm_rc.fdqrypontos.FindField('CANCELADA').AsString   := 'P';
  dm_rc.fdqrypontos.FindField('NUMERO').AsInteger     := Ultimo_Codigo('PONTOS','CODIGO',True);
  dm_rc.fdqrypontos.FindField('SERIE').AsString       := 'PRD';
  dm_rc.fdqrypontos.FindField('DATA').AsDateTime      := eddataemissao.DateTime;
  dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger    := DM_RC.fdqrysementes.FindField('PRODUTO').AsInteger;
  dm_rc.fdqrypontos.FindField('DESCRICAO').AsString   := DM_RC.fdqrysementes.FindField('NOME').AsString;
  dm_rc.fdqrypontos.FindField('CATEGORIA').AsString   := DM_RC.fdqrysementes.FindField('CATEGORIA').AsString;
  dm_rc.fdqrypontos.FindField('TERMO').AsString       := DM_RC.fdqrysementes.FindField('TERMO').AsString;
  dm_rc.fdqrypontos.FindField('BOLETIM').AsString     := DM_RC.fdqrysementes.FindField('BOLETIM').AsString;
  dm_rc.fdqrypontos.FindField('PESOSACO').AsString    := DM_RC.fdqrysementes.FindField('PESOEMBALAGEM').AsString;
  dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString := DM_RC.fdqrysementes.FindField('LOTE').AsString;
  dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat   := UniFormattedNumberEditqtde.Value;
  dm_rc.fdqrypontos.FindField('PUREZA').AsFloat       := DM_RC.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  dm_rc.fdqrypontos.FindField('PONTOS').AsFloat       := UniFormattedNumberEditqtde.Value * DM_RC.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  dm_rc.fdqrypontos.Findfield('QTEPESO').AsFloat      := UniFormattedNumberEditqtde.Value * DM_RC.fdqrysementes.FindField('PESOEMBALAGEM').AsFloat;
  dm_rc.fdqrypontos.Post;

  Calcula_Lote(mm.varI_Code_Company,DM_RC.fdqrysementes.FindField('PRODUTO').AsInteger,
               DM_RC.fdqrysementes.FindField('LOTE').AsString,
               DM_RC.fdqrysementes.FindField('BOLETIM').AsString,
               DM_RC.fdqrysementes.FindField('TERMO').AsString,
               mm.M_TIPOPESO);
end;

procedure TfrmMANUTENCAOLOTE.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmMANUTENCAOLOTE.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmMANUTENCAOLOTE.UniFormDestroy(Sender: TObject);
begin
  mm.varI_Code_Codigo_Semente := 0;
  mm.varC_Form_Modal          := nil;
end;

procedure TfrmMANUTENCAOLOTE.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmMANUTENCAOLOTE.UniFormShow(Sender: TObject);
begin
  TabelaSementes('select * from sementes where codigo = ' + IntToStr(mm.varI_Code_Codigo_Semente));
  UniButtonEditlote.Text             := dm_rc.fdqrysementes.FindField('LOTE').AsString;
  UniEditboletim.Text                := dm_rc.fdqrysementes.FindField('BOLETIM').AsString;
  UniEdittermo.Text                  := dm_rc.fdqrysementes.FindField('TERMO').AsString;
  UniFormattedNumberEditpureza.Value := dm_rc.fdqrysementes.FindField('ANALISEPURA').AsFloat;
  cbxtipo.ItemIndex                  := 0;
  eddataemissao.DateTime             := Date;
end;

end.
