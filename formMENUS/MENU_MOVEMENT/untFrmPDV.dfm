object frmPDV: TfrmPDV
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 578
  ClientWidth = 961
  Caption = 'Frente de Caixa - PDV'
  BorderStyle = bsNone
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object paHeader: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 40
    Hint = ''
    ParentColor = False
    Color = 2763306
    Align = alTop
    TabOrder = 0
    DesignSize = (
      961
      40)
    object lblHeaderTitulo: TUniLabel
      AlignWithMargins = True
      Left = 12
      Top = 10
      Width = 157
      Height = 20
      Hint = ''
      Margins.Left = 12
      Margins.Top = 10
      Caption = 'PDV 01 - CAIXA LIVRE'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object lblTipoDoc: TUniLabel
      Left = 661
      Top = 11
      Width = 105
      Height = 14
      Hint = ''
      Caption = 'Tipo Documento:'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object cbTipoDocumento: TUniComboBox
      Left = 769
      Top = 6
      Width = 180
      Height = 26
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Pedido Simples'
        'Cupom Fiscal (NFC-e)')
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 3
      IconItems = <>
    end
  end
  object paFooter: TUniContainerPanel
    Left = 0
    Top = 536
    Width = 961
    Height = 42
    Hint = ''
    ParentColor = False
    Color = 2763306
    Align = alBottom
    TabOrder = 1
    object btnF2: TUniBitBtn
      Left = 10
      Top = 6
      Width = 115
      Height = 30
      Hint = '[[cls:ButtonPrimary]]'
      Caption = '[F2] Buscar'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = btnF2Click
    end
    object btnF3: TUniBitBtn
      Left = 132
      Top = 6
      Width = 115
      Height = 30
      Hint = '[[cls:ButtonPrimary]]'
      Caption = '[F3] Qtd'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = btnF3Click
    end
    object btnF4: TUniBitBtn
      Left = 254
      Top = 6
      Width = 120
      Height = 30
      Hint = '[[cls:ButtonWarning]]'
      Caption = '[F4] Desconto'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 3
      OnClick = btnF4Click
    end
    object btnF7: TUniBitBtn
      Left = 382
      Top = 6
      Width = 125
      Height = 30
      Hint = '[[cls:ButtonDanger]]'
      Caption = '[F7] Cancela Item'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 4
      OnClick = btnF7Click
    end
    object btnF9: TUniBitBtn
      Left = 515
      Top = 6
      Width = 145
      Height = 30
      Hint = '[[cls:ButtonSuccess]]'
      Caption = '[F9] Finalizar Venda'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 5
      OnClick = btnF9Click
    end
  end
  object paCorpo: TUniContainerPanel
    Left = 0
    Top = 40
    Width = 961
    Height = 496
    Hint = ''
    ParentColor = False
    Color = 15987699
    Align = alClient
    TabOrder = 2
    object paEsquerda: TUniContainerPanel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 340
      Height = 480
      Hint = ''
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 4
      Margins.Bottom = 8
      ParentColor = False
      Color = clWhite
      Align = alLeft
      TabOrder = 1
      object lblTitCodigo: TUniLabel
        Left = 10
        Top = 8
        Width = 110
        Height = 16
        Hint = ''
        Caption = 'C'#243'digo de Barras'
        ParentFont = False
        Font.Color = 3355443
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object paCodigoBox: TUniContainerPanel
        Left = 10
        Top = 26
        Width = 320
        Height = 42
        Hint = ''
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        object edtCodigoBarras: TUniEdit
          Left = 0
          Top = 0
          Width = 262
          Height = 42
          Hint = ''
          Text = ''
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          TabOrder = 1
          OnExit = edtCodigoBarrasExit
          OnKeyDown = edtCodigoBarrasKeyDown
        end
        object btnBuscaCodigo: TUniSpeedButton
          Left = 265
          Top = 0
          Width = 55
          Height = 42
          Hint = '[[ico:fas-search]]'
          Caption = 'Busca'
          ParentFont = False
          Font.Height = -12
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = btnBuscaCodigoClick
        end
      end
      object paQtdPreco: TUniContainerPanel
        Left = 10
        Top = 74
        Width = 320
        Height = 58
        Hint = ''
        ParentColor = False
        Color = clWhite
        TabOrder = 3
        object paQtd: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 152
          Height = 58
          Hint = ''
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          object lblQtd: TUniLabel
            Left = 0
            Top = 0
            Width = 71
            Height = 14
            Hint = ''
            Caption = 'Quantidade'
            ParentFont = False
            Font.Color = 3355443
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object edtQtd: TUniFormattedNumberEdit
            Left = 0
            Top = 18
            Width = 152
            Height = 34
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Height = -15
            Font.Style = [fsBold]
            TabOrder = 2
            Value = 1.000000000000000000
            DecimalSeparator = ','
            ThousandSeparator = '.'
            OnKeyDown = edtQtdKeyDown
          end
        end
        object paPrecoUnit: TUniContainerPanel
          Left = 168
          Top = 0
          Width = 152
          Height = 58
          Hint = ''
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          object lblPrecoUnit: TUniLabel
            Left = 0
            Top = 0
            Width = 67
            Height = 14
            Hint = ''
            Caption = 'Pre'#231'o Unit.'
            ParentFont = False
            Font.Color = 3355443
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object edtPrecoUnit: TUniFormattedNumberEdit
            Left = 0
            Top = 18
            Width = 152
            Height = 34
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Height = -15
            Font.Style = [fsBold]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
            OnExit = edtPrecoUnitExit
            OnEnter = edtPrecoUnitEnter
            OnKeyDown = edtPrecoUnitKeyDown
          end
        end
      end
      object paPreview: TUniContainerPanel
        Left = 10
        Top = 138
        Width = 320
        Height = 140
        Hint = ''
        ParentColor = False
        Color = clWhite
        TabOrder = 4
        object lblTitPreview: TUniLabel
          Left = 0
          Top = 0
          Width = 123
          Height = 14
          Hint = ''
          Caption = 'Preview do Produto'
          ParentFont = False
          Font.Color = 3355443
          Font.Height = -12
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object paCardProduto: TUniContainerPanel
          Left = 0
          Top = 18
          Width = 320
          Height = 118
          Hint = ''
          ParentColor = False
          Color = 16382457
          TabOrder = 2
          object lblNomeProduto: TUniLabel
            Left = 14
            Top = 10
            Width = 295
            Height = 18
            Hint = ''
            AutoSize = False
            Caption = 'Aguardando produto...'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object lblDescProduto: TUniLabel
            Left = 14
            Top = 30
            Width = 295
            Height = 28
            Hint = ''
            AutoSize = False
            Caption = 'Bipe o c'#243'digo de barras ou tecle F2'
            ParentFont = False
            Font.Color = clGray
            TabOrder = 2
          end
          object lblQtdUnitProduto: TUniLabel
            Left = 14
            Top = 60
            Width = 295
            Height = 16
            Hint = ''
            AutoSize = False
            Caption = '0 un            R$ 0,00'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 4
          end
          object lblSubtotalProduto: TUniLabel
            Left = 14
            Top = 82
            Width = 295
            Height = 18
            Hint = ''
            AutoSize = False
            Caption = 'subtotal: R$ 0,00'
            ParentFont = False
            Font.Color = 2763306
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 3
          end
        end
      end
      object UniImage1: TUniImage
        Left = 10
        Top = 284
        Width = 320
        Height = 193
        Hint = ''
        Center = True
        Transparent = True
      end
    end
    object paDireita: TUniContainerPanel
      AlignWithMargins = True
      Left = 356
      Top = 8
      Width = 597
      Height = 480
      Hint = ''
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ParentColor = False
      Color = clWhite
      Align = alClient
      TabOrder = 2
      object gridItens: TUniDBGrid
        Left = 0
        Top = 0
        Width = 597
        Height = 393
        Hint = ''
        DataSource = dsItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        TabOrder = 1
        OnDblClick = gridItensDblClick
        Columns = <
          item
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'ITEM'
            Title.Font.Style = [fsBold]
            Width = 45
            Alignment = taCenter
          end
          item
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'DIGO'
            Title.Font.Style = [fsBold]
            Width = 85
          end
          item
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Style = [fsBold]
            Width = 170
          end
          item
            FieldName = 'QTD'
            Title.Alignment = taRightJustify
            Title.Caption = 'QTD'
            Title.Font.Style = [fsBold]
            Width = 45
          end
          item
            FieldName = 'UNITARIO'
            Title.Alignment = taRightJustify
            Title.Caption = 'UNIT. (R$)'
            Title.Font.Style = [fsBold]
            Width = 75
          end
          item
            FieldName = 'SUBTOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'SUBTOTAL (R$)'
            Title.Font.Style = [fsBold]
            Width = 80
          end>
      end
      object pnlTotalGeral: TUniContainerPanel
        Left = 0
        Top = 398
        Width = 597
        Height = 59
        Hint = ''
        ParentColor = False
        Color = clBlack
        TabOrder = 2
        DesignSize = (
          597
          59)
        object lblTotalPagar: TUniLabel
          Left = 0
          Top = 13
          Width = 597
          Height = 34
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'TOTAL A PAGAR: R$ 0,00'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clLime
          Font.Height = -24
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object memItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 400
    Top = 140
    object memItensITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object memItensPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object memItensCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 30
    end
    object memItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object memItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object memItensQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '###,##0.00'
    end
    object memItensUNITARIO: TFloatField
      FieldName = 'UNITARIO'
      DisplayFormat = '###,##0.00'
    end
    object memItensSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '###,##0.00'
    end
    object memItensNCM: TStringField
      FieldName = 'NCM'
    end
    object memItensPRECO_ORIGINAL: TFloatField
      FieldName = 'PRECO_ORIGINAL'
      DisplayFormat = '###,##0.00'
    end
    object memItensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsItens: TDataSource
    DataSet = memItens
    Left = 450
    Top = 140
  end
end
