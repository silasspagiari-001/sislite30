object untfrmRELATORIO: TuntfrmRELATORIO
  Left = 0
  Top = 0
  ClientHeight = 315
  ClientWidth = 595
  Caption = 'Relat'#243'rio do Sistema'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 315
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 72
    ExplicitWidth = 256
    ExplicitHeight = 128
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 256
      Width = 595
      Height = 59
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      object rcBlock20: TUniContainerPanel
        Left = 3
        Top = 5
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          150
          48)
        object btnimpressao: TUniBitBtn
          Left = 11
          Top = 13
          Width = 119
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-file-pdf"> Impress'#227'o</i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock30: TUniContainerPanel
        Left = 196
        Top = 5
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          150
          48)
        object UniBitBtn1: TUniBitBtn
          Left = 17
          Top = 13
          Width = 119
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'Sair'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn1Click
        end
      end
    end
    object UniPageControl: TUniPageControl
      Left = 0
      Top = 0
      Width = 595
      Height = 256
      Hint = ''
      ActivePage = UniTabSheetvendas
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 120
      ExplicitTop = 24
      ExplicitWidth = 289
      ExplicitHeight = 193
      object UniTabSheetvendas: TUniTabSheet
        Hint = ''
        Caption = 'Relat'#243'rio Vendas'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 595
        ExplicitHeight = 256
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 587
          Height = 228
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 184
          ExplicitTop = 24
          ExplicitWidth = 256
          ExplicitHeight = 128
        end
      end
    end
  end
end
