object frmMENUNOTIFICACOES: TfrmMENUNOTIFICACOES
  Left = 0
  Top = 0
  Hint = '[['#13#10'frm-align:right |'#13#10'height:max |'#13#10'width:fix'#13#10']]'#13#10#13#10
  ClientHeight = 680
  ClientWidth = 350
  Caption = 'frmMENUNOTIFICACOES'
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
          Caption = '<i class="fas fa-times" style="font-size:20px;color:#ef4444;"></i>'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 9143396
          Font.Height = -16
          TabOrder = 0
          OnClick = labbtnExitClick
        end
        object labTitleFrm: TUniLabel
          AlignWithMargins = True
          Left = 12
          Top = 8
          Width = 220
          Height = 26
          Hint = ''
          Margins.Left = 12
          Margins.Top = 8
          Caption = 'Notifica'#231#245'es & Suporte'
          Align = alClient
          ParentFont = False
          Font.Color = 2758415
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object htmlNotificacoes: TUniHTMLFrame
      Left = 0
      Top = 42
      Width = 350
      Height = 638
      Hint = ''
      Align = alClient
      OnAjaxEvent = htmlNotificacoesAjaxEvent
    end
  end
  object timerRefresh: TUniTimer
    Interval = 5000
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
end
