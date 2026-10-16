unit untCadRESPONSAVEL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, UniButtonDbEdit,
  uniDBComboBox, uniImage, uniFileUpload, uniMemo;

type
  TfrmCADRESPONSAVEL = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    UniButtonDbEditcep: TUniButtonDbEdit;
    UniLabel12: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBComboBox4: TUniDBComboBox;
    rcBlock150: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniLabel18: TUniLabel;
    rcBlock160: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    imgUser: TUniImage;
    btnLoadImg: TUniBitBtn;
    uniFileUp: TUniFileUpload;
    procedure UniButtonDbEditcepButtonClick(Sender: TObject);
    procedure UniButtonDbEditcepExit(Sender: TObject);
    procedure btnLoadImgClick(Sender: TObject);
    procedure uniFileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregaimagem(f_caminho:string);
  end;

var
  frmCADRESPONSAVEL: TfrmCADRESPONSAVEL;

implementation

{$R *.dfm}

uses mkm_procedures, untDM_RC, untFrmPesquisa, MainModule, uconsts;
procedure TfrmCADRESPONSAVEL.btnLoadImgClick(Sender: TObject);
begin
  uniFileUp.Filter := '*.png';
  uniFileUp.TargetFolder := 'uploads';// + BACKSLASH ;//+ trim(UniDBEdit12.Text) ;

  if dm_rc.rc_ForceDirectories( uniFileUp.TargetFolder ) then
     uniFileUp.Execute;
end;

procedure TfrmCADRESPONSAVEL.carregaimagem(f_caminho: string);
begin
  imgUser.Picture.CleanupInstance;
  imgUser.Picture.LoadFromFile(f_caminho);
end;

procedure TfrmCADRESPONSAVEL.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;
  carregaimagem(FDQryFiltro.FindField('assinatura').AsString);
end;

procedure TfrmCADRESPONSAVEL.UniButtonDbEditcepButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CEP');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CEP').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCADRESPONSAVEL.UniButtonDbEditcepExit(Sender: TObject);
begin
  inherited;
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcep.Text <> '') and (UniButtonDbEditcep.Text <> '0') then
        begin
          SqlPesquisa('select DESCRICAO, UF from cidades where cep = ' + QuotedStr(FDQryCad.FindField('CEP').AsString));
            FDQryCad.FindField('CIDADE').AsString     := dm_rc.sqlBuscas.Findfield('DESCRICAO').asstring;
            FDQryCad.FindField('ESTADO').AsString     := dm_rc.sqlBuscas.Findfield('UF').asstring;
        end;
    end;
end;

procedure TfrmCADRESPONSAVEL.uniFileUpCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  imgUser.Picture.LoadFromFile( AStream.FileName );

  if FDQryCad.State in [dsEdit, dsInsert] then
  begin
     FDQryCad.FieldByName( 'assinatura' ).AsString := AStream.FileName;
  end;
end;

initialization
  RegisterClass(TfrmCADRESPONSAVEL);
end.
