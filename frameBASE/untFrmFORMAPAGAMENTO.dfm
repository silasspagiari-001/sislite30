object frmFORMAPAGAMENTO: TfrmFORMAPAGAMENTO
  Left = 0
  Top = 0
  ClientHeight = 349
  ClientWidth = 435
  Caption = 'FORMAS DE PAGAMENTO'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 318
    Width = 435
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 340
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
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 318
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 73
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 1
      DesignSize = (
        435
        73)
      object UniFormattedNumberEditTOTAL: TUniFormattedNumberEdit
        Left = 3
        Top = 32
        Width = 429
        Height = 37
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clRed
        Font.Height = -27
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 4
        Width = 427
        Height = 26
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'Total da NOTA'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 0
      Top = 120
      Width = 145
      Height = 89
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        145
        89)
      object UniFormattedNumberEditdinheiro: TUniFormattedNumberEdit
        Left = 3
        Top = 49
        Width = 139
        Height = 37
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 137
        Height = 26
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'DINHEIRO'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 143
      Top = 120
      Width = 145
      Height = 89
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        145
        89)
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 137
        Height = 26
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'D'#201'BITO'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEditdebito: TUniFormattedNumberEdit
        Left = 2
        Top = 49
        Width = 139
        Height = 37
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 287
      Top = 120
      Width = 145
      Height = 89
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        145
        89)
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 137
        Height = 26
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'CR'#201'DITO'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEditcredito: TUniFormattedNumberEdit
        Left = 3
        Top = 49
        Width = 139
        Height = 37
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 3
      Top = 216
      Width = 432
      Height = 89
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        432
        89)
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 429
        Height = 26
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'CPF'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object unieditcpf: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 44
        Width = 424
        Height = 38
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -27
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
end
