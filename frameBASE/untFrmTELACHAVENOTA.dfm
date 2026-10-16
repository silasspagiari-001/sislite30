object FrmTELACHAVENOTA: TFrmTELACHAVENOTA
  Left = 0
  Top = 0
  ClientHeight = 203
  ClientWidth = 439
  Caption = 'Chave/Protocolo - Nota'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 172
    Width = 439
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -294
    ExplicitTop = 238
    ExplicitWidth = 723
    object btnLkpClear: TUniBitBtn
      Left = 344
      Top = 0
      Width = 95
      Height = 31
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      Align = alRight
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
      ExplicitLeft = 625
      ExplicitTop = 1
      ExplicitHeight = 29
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 172
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 122
    ExplicitHeight = 48
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 439
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 122
      DesignSize = (
        439
        48)
      object unidchaveacesso: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 434
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel10: TUniLabel
        Left = 3
        Top = 2
        Width = 90
        Height = 15
        Hint = ''
        Caption = 'Chave de Acesso'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 0
      Top = 48
      Width = 439
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 24
      ExplicitTop = 112
      ExplicitWidth = 122
      DesignSize = (
        439
        48)
      object Uniprotocolo: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 434
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = 2
        Width = 54
        Height = 15
        Hint = ''
        Caption = 'Protocolo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Left = 0
      Top = 96
      Width = 439
      Height = 36
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object UniBitBtn1: TUniBitBtn
        Left = 2
        Top = 4
        Width = 95
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Gravar'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = UniBitBtn1Click
      end
    end
  end
end
