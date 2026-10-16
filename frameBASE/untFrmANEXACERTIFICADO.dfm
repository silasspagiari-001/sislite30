object frmANEXACERTIFICADO: TfrmANEXACERTIFICADO
  Left = 0
  Top = 0
  ClientHeight = 142
  ClientWidth = 519
  Caption = 'Certificado Digital'
  OnShow = UniFormShow
  Position = poDesktopCenter
  OldCreateOrder = False
  OnClose = UniFormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 105
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock490: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 513
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      DesignSize = (
        513
        48)
      object UniLabel32: TUniLabel
        Left = 0
        Top = -1
        Width = 99
        Height = 15
        Hint = ''
        Caption = 'Certificado Digital'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEdit9: TUniDBEdit
        Left = 1
        Top = 15
        Width = 471
        Height = 29
        Hint = ''
        DataField = 'CERTIFICADO_CAMINHO'
        DataSource = dm_rc.dstbempresas
        CharCase = ecLowerCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object btncertificado: TUniBitBtn
        AlignWithMargins = True
        Left = 477
        Top = 15
        Width = 33
        Height = 29
        Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-folder"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btncertificadoClick
      end
    end
    object rcBlock480: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 57
      Width = 513
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 2
      DesignSize = (
        513
        48)
      object UniLabel31: TUniLabel
        Left = 3
        Top = 2
        Width = 94
        Height = 15
        Hint = ''
        Caption = 'Senha certificado'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEdit8: TUniDBEdit
        Left = 3
        Top = 18
        Width = 507
        Height = 29
        Hint = ''
        DataField = 'CERTIFICADO_SENHA'
        DataSource = dm_rc.dstbempresas
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
  object rcBlock10: TUniContainerPanel
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 513
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object btnconfirmar: TUniBitBtn
      Left = 418
      Top = 0
      Width = 95
      Height = 31
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'CONFIRMAR'
      Align = alRight
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnconfirmarClick
    end
  end
  object uniFileUp: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Enviando...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no Envio'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Selecione um arquivo'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads'
    Overwrite = True
    OnCompleted = uniFileUpCompleted
    Left = 7
    Top = 82
  end
end
