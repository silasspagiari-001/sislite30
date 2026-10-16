unit untFrmWEBCAM; // v. 3.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Soap.EncdDecd,
  uniGUIClasses, uniGUIForm, untFormBase, uniGUIBaseClasses, uniTimer, uniLabel,
  uniPanel, uniHTMLFrame, uniButton, Vcl.Imaging.jpeg, uniImage, uniEdit;

type
  TfrmWEBCAM = class(TformBase)
    paCamera: TUniContainerPanel;
    htmlWebCam: TUniHTMLFrame;
    btnCamPower: TUniButton;
    btnSelPhoto: TUniButton;
    btnCamShot: TUniButton;
    paPhoto: TUniContainerPanel;
    imgCap: TUniImage;
    labExit: TUniLabel;
    procedure btnCamPowerClick(Sender: TObject);
    procedure btnCamShotClick(Sender: TObject);
    procedure htmlWebCamAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnSelPhotoClick(Sender: TObject);
    procedure labExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    MS: TMemoryStream; //Memory-/Binary-Stream
    vFileName, vDestFileName : String;

    procedure rc_Exit;

  end;

function frmWEBCAM: TfrmWEBCAM;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, mkm_func_web, untdm_rc,
  mkm_layout;

function frmWEBCAM: TfrmWEBCAM;
begin
  Result := TfrmWEBCAM(mm.GetFormInstance(TfrmWEBCAM));
end;

procedure TfrmWEBCAM.htmlWebCamAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
Var
  SS: TStringStream; //String-Stream (base64 encoded)
  MS  : TMemoryStream;
  FSize  : Longint;
  iCompress : Integer;
  //PngImage : TPngImage;
  JpegImage: TJPEGImage;
  f     : file of Byte;
begin
  inherited;

  // Read fro AjaxEvent Click to save image
  if SameText(EventName, 'saveimg') then
  begin

      vFileName := sm.TempFolderPath + '_' + UniSession.SessionId+'.jpg';

      SS       := TStringStream.Create(Params.Values['img']);
      MS       := TMemoryStream.Create();
      JpegImage:= TJPEGImage.Create();

      DecodeStream(SS, MS);
      MS.Position := 0;
      try
         JpegImage.LoadFromStream(MS);
         JpegImage.SaveToFile(vFileName);
      finally
        SS.Free;
        MS.Free;
      end;

      vDestFileName := StringReplace( vFileName , '-', '_', [rfReplaceAll]);

      mm.varC_TempFile := vDestFileName;

      JpegImage.LoadFromFile( vDestFileName );
      imgCap.Picture.Graphic := JpegImage;
      JpegImage.Free;
  end;
end;

procedure TfrmWEBCAM.labExitClick(Sender: TObject);
begin
  inherited;
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;

    rc_Exit;
end;

procedure TfrmWEBCAM.rc_Exit;
begin
  timerClose.Enabled := true;
  rc_AddCssClass( self, 'drop_out' ); // v. 3.2.0.0
  if btnCamPower.tag = 1 then
     UniSession.AddJS( 'rc_cameraOff();' );
end;

procedure TfrmWEBCAM.btnCamPowerClick(Sender: TObject);
begin
  inherited;

  imgCap.Visible := false;

  if TUniButton( sender ).tag = 0 then
  begin

     paPhoto.Visible := false;

     rc_RemoveCssClass( TUniButton( sender ), 'ButtonGreen' );

     TUniButton( sender ).tag := 1;
     TUniButton( sender ).Caption := 'CAM OFF' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonRed]]' ;
     UniSession.AddJS( 'rc_cameraOn();' );

  end
  else
  begin

     rc_RemoveCssClass( TUniButton( sender ), 'ButtonRed' );

     TUniButton( sender ).tag := 0;
     TUniButton( sender ).Caption := 'CAM ON' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonGreen]]' ;
     UniSession.AddJS( 'rc_cameraOff();' );

  end;

  dm_rc.rc_RenderControls( self );

end;

procedure TfrmWEBCAM.btnCamShotClick(Sender: TObject);
begin
  inherited;
     UniSession.AddJS( 'rc_cameraSnapshot();' );

     paPhoto.Left := paCamera.Left;
     paPhoto.Top  := paCamera.Top;

     paPhoto.Visible := not paPhoto.Visible;

     btnCamPower.Click;
end;

procedure TfrmWEBCAM.btnSelPhotoClick(Sender: TObject);
begin
  inherited;

  mm.varB_Yes := True;
  Self.ModalResult := mrOk;
  rc_Exit;

end;

procedure TfrmWEBCAM.UniFormCreate(Sender: TObject);
begin
  inherited;
       htmlWebCam.HTML.Text :=
        '<style>' +
        '.commandArea{' +
        '    width: 320px;' +
        '    height: 48px;' +
        '}' +
        '.camArea{' +
        '    width: 320px;' +
        '    height: 240px;' +
        '}' +
        '</style>' +

        //'<iframe allow="camera;microphone">'+

        '<div class="camArea">' +
        '     <div>' +
        '        <video id="player" width=320 height=240 class=''center'' autoplay></video>' +
        '        <canvas hidden id="snapshot" width=320 height=240></canvas>' +
        '     </div>        ' +
        '</div>' +
        '<div class="commandArea">' +
        '     <button class="rc_btn rc_btnGreen" type="button" id="btnOn">On</button>' +
        '     <button class="rc_btn rc_btnBlue" type="button" id="btnCapture">Captura Foto</button>' +
        '     <button class="rc_btn rc_btnRed" type="button" id="btnOff">Off</button>' +
        '</div>' +
        //'<iframe>' +
        '<script type="text/javascript" src="files/js/rc_webcam/rc_webcam.js"></script>' ;

       mm.varC_TempFile := '';
       mm.varB_Yes      := false;
end;

procedure TfrmWEBCAM.UniFormShow(Sender: TObject);
begin
  inherited;
  paPhoto.Width  := paCamera.Width;
  paPhoto.Height := paCamera.Height;
end;

initialization
  RegisterClass(TfrmWEBCAM);

end.
