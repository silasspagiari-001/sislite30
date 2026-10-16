object frmUsuariosOnline: TfrmUsuariosOnline
  Left = 0
  Top = 0
  Hint = '[['#13#10'frm-align:right |'#13#10'height:max |'#13#10'width:fix'#13#10']]'#13#10#13#10
  ClientHeight = 680
  ClientWidth = 350
  Caption = 'frmUsuariosOnline'
  OnShow = UniFormShow
  BorderStyle = bsNone
  Position = poDefaultPosOnly
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 680
    Hint = ''
    ParentColor = False
    Color = 16514043
    Align = alClient
    TabOrder = 0
    object paTitulo: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 350
      Height = 42
      Hint = ''
      ParentColor = False
      Color = 16514043
      Align = alTop
      TabOrder = 0
      object paSearchContent1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 350
        Height = 42
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        Color = 16514043
        Align = alClient
        TabOrder = 0
        DesignSize = (
          350
          42)
        object labbtnExit: TUniLabel
          AlignWithMargins = True
          Left = 315
          Top = 11
          Width = 30
          Height = 28
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-times |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Margins.Left = 0
          Margins.Top = 13
          Margins.Right = 10
          CreateOrder = 1
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 
            '<i class="fas fa-times" style="font-size:20px;color:#ef4444;"></' +
            'i>'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -16
          TabOrder = 0
          OnClick = labbtnExitClick
        end
        object labTitleFrm: TUniLabel
          AlignWithMargins = True
          Left = 12
          Top = 5
          Width = 172
          Height = 22
          Hint = ''
          Margins.Left = 12
          Margins.Top = 5
          TextConversion = txtHTML
          Caption = 'Bate-papo & Conectados'
          Align = alClient
          ParentFont = False
          Font.Color = 2758415
          Font.Height = -18
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object htmlOnline: TUniHTMLFrame
      Left = 0
      Top = 42
      Width = 350
      Height = 638
      Hint = ''
      Align = alClient
      OnAjaxEvent = htmlOnlineAjaxEvent
    end
  end
  object timerRefresh: TUniTimer
    Interval = 3000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerRefreshTimer
    Left = 40
    Top = 50
  end
  object UniFileUploadChat: TUniFileUpload
    Filter = 'image/*'
    Title = 'Enviar Imagem'
    Messages.Uploading = 'Enviando imagem...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no envio'
    Messages.Upload = 'Enviar'
    Messages.NoFileError = 'Selecione uma imagem'
    Messages.BrowseText = 'Selecionar...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads\chats'
    OnCompleted = UniFileUploadChatCompleted
    Left = 110
    Top = 50
  end
  object UniFileUploadPDF: TUniFileUpload
    Filter = 
      '.pdf,.doc,.docx,.xls,.xlsx,.csv,.txt,application/pdf,application' +
      '/msword,application/vnd.openxmlformats-officedocument.wordproces' +
      'singml.document,application/vnd.ms-excel,application/vnd.openxml' +
      'formats-officedocument.spreadsheetml.sheet,text/plain'
    Title = 'Enviar Arquivo (PDF, Word, Excel, Bloco de Notas)'
    Messages.Uploading = 'Enviando arquivo...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no envio'
    Messages.Upload = 'Enviar'
    Messages.NoFileError = 'Selecione um arquivo'
    Messages.BrowseText = 'Selecionar...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads\chats\docs'
    OnCompleted = UniFileUploadPDFCompleted
    Left = 180
    Top = 50
  end
end
