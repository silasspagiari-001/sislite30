unit untFrmANEXACERTIFICADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit, uniDBEdit,
  uniLabel, uniButton, uniBitBtn, uniFileUpload;

type
  TfrmANEXACERTIFICADO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    btnconfirmar: TUniBitBtn;
    rcBlock490: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    btncertificado: TUniBitBtn;
    rcBlock480: TUniContainerPanel;
    UniLabel31: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    uniFileUp: TUniFileUpload;
    procedure uniFileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btncertificadoClick(Sender: TObject);
    procedure btnconfirmarClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmANEXACERTIFICADO: TfrmANEXACERTIFICADO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, Data.DB;

function frmANEXACERTIFICADO: TfrmANEXACERTIFICADO;
begin
  Result := TfrmANEXACERTIFICADO(mm.GetFormInstance(TfrmANEXACERTIFICADO));
end;

procedure TfrmANEXACERTIFICADO.btncertificadoClick(Sender: TObject);
begin
  uniFileUp.Filter       := '*.pfx';
  uniFileUp.TargetFolder := 'uploads';

  if dm_rc.rc_ForceDirectories( uniFileUp.TargetFolder ) then
     uniFileUp.Execute;
end;

procedure TfrmANEXACERTIFICADO.btnconfirmarClick(Sender: TObject);
begin
  try
    dm_rc.tbempresas.Post;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Certificado Anexado com Sucesso' , 'success' , false );
  except
    dm_rc.rc_ShowSweetAlert( 'Atenção', 'Erro ao anexar' , 'error' , false );
  end;
  ModalResult := mrOK;
end;

procedure TfrmANEXACERTIFICADO.uniFileUpCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  dm_rc.tbempresas.edit;
  dm_rc.tbempresas.FieldByName( 'CERTIFICADO_CAMINHO' ).AsString := AStream.FileName;
end;

procedure TfrmANEXACERTIFICADO.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dm_rc.tbempresas.State in [dsEdit, dsInsert] then
    dm_rc.tbempresas.Cancel;
end;

procedure TfrmANEXACERTIFICADO.UniFormShow(Sender: TObject);
begin
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Empresa_Configuranota));
end;

end.
