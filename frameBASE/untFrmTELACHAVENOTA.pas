unit untFrmTELACHAVENOTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniLabel, uniEdit;

type
  TFrmTELACHAVENOTA = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    unidchaveacesso: TUniEdit;
    UniLabel10: TUniLabel;
    Uniprotocolo: TUniEdit;
    UniLabel1: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmTELACHAVENOTA: TFrmTELACHAVENOTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, untDM_RC;

function FrmTELACHAVENOTA: TFrmTELACHAVENOTA;
begin
  Result := TFrmTELACHAVENOTA(mm.GetFormInstance(TFrmTELACHAVENOTA));
end;

procedure TFrmTELACHAVENOTA.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmTELACHAVENOTA.UniBitBtn1Click(Sender: TObject);
var
  sql:string;
  log:string;
begin
  log := '';
  sql := '';

  if unidchaveacesso.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORMAR CHAVE DE ACESSO' , 'error' , false );
      Abort
    end;

  if Uniprotocolo.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORMAR PROTOCOLO' , 'error' , false );
      Abort
    end;

  try
    log:= mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
    sql:= ' update mvmestre set codigobarras = ' + QuotedStr(unidchaveacesso.Text) + ',' +
          ' protocolo                        = ' + QuotedStr(Uniprotocolo.Text)    + ',' +
          ' cancelada                        = ' + QuotedStr('A')                  + ',' +
          ' LOGENVIO                         = ' + QuotedStr(log)                  +
          ' where codigo                     = ' + IntToStr(mm.varI_Code_Documento_Controle);
    executasql(sql);

    dm_rc.rc_ShowSweetAlert( 'SUCESSO', 'DADOS ATUALIZADOS COM SUCESSO - REGISTRAMOS NO LOG COMO LOGENVIO' , 'success' , false );

  except
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO GRAVAR' , 'error' , false );
  end;
end;

end.
