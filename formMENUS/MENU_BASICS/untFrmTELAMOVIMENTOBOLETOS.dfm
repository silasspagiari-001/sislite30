object frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Emiss'#227'o de Boletos'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 557
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object UniContainerPanel3: TUniContainerPanel
      Left = 396
      Top = 5
      Width = 150
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        38)
      object UniBitBtn1: TUniBitBtn
        Left = 17
        Top = 3
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
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 242
    Width = 557
    Height = 56
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object paSearchField1: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 1
      Width = 81
      Height = 55
      Hint = ''
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        81
        55)
      object UniLabelc1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 40
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Bancos'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonEditpbancos: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 23
        Width = 78
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnExit = UniButtonEditpbancosExit
        OnButtonClick = UniButtonEditpbancosButtonClick
        IconCls = 'search'
      end
    end
    object paSearchOp1: TUniContainerPanel
      AlignWithMargins = True
      Left = 83
      Top = 1
      Width = 357
      Height = 55
      Hint = ''
      Margins.Left = 0
      Margins.Top = 8
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        357
        55)
      object UniEditdescricaobanco: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 23
        Width = 352
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
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 92
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Descri'#231#227'o Banco'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 443
      Top = 2
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      object btngerar: TUniBitBtn
        AlignWithMargins = True
        Left = 11
        Top = 14
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-cogs"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btngerarClick
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 500
      Top = 2
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object btnimprimir: TUniBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 14
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Enabled = False
        Caption = '<i class="fas fa-file-pdf"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnimprimirClick
      end
    end
  end
  object rcBlock30: TUniContainerPanel
    Left = 0
    Top = 48
    Width = 557
    Height = 194
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 2
    object UniDBGridboletos: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 194
      Hint = ''
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando Item(s)...'
      ForceFit = True
      Align = alClient
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 1
      Summary.Enabled = True
      OnCellClick = UniDBGridboletosCellClick
      Columns = <
        item
          FieldName = 'confirmaboleto'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'NUMERO'
          Title.Caption = 'NUMERO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SERIE'
          Title.Caption = 'SERIE'
          Width = 60
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NOME'
          Title.Caption = 'NOME'
          Width = 230
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VENCIMENTO'
          Title.Caption = 'VENCIMENTO'
          Width = 100
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALOR'
          Title.Caption = 'VALOR'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SITUACAO'
          Title.Caption = ' '
          Width = 60
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end>
    end
  end
  object rcBlock40: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 3
    DesignSize = (
      557
      48)
    object UniContainerPanel4: TUniContainerPanel
      Left = 500
      Top = 0
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object btngravar: TUniBitBtn
        AlignWithMargins = True
        Left = 11
        Top = 14
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-save"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btngravarClick
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      AlignWithMargins = True
      Left = 384
      Top = 0
      Width = 57
      Height = 48
      Hint = ''
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 2
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 50
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        AutoSize = False
        Caption = 'Parcelas'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniNumberEditparcelas: TUniNumberEdit
        Left = 3
        Top = 17
        Width = 50
        Height = 29
        Hint = ''
        Alignment = taCenter
        TabOrder = 2
        DecimalSeparator = ','
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 443
      Top = 0
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      object btncalcula: TUniBitBtn
        AlignWithMargins = True
        Left = 11
        Top = 14
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-calculator"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btncalculaClick
      end
    end
    object UniFormattedNumberEditVLRPEDIDO: TUniFormattedNumberEdit
      Left = 1
      Top = 17
      Width = 377
      Height = 29
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ReadOnly = True
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 87
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Valor do pedido'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 5
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnimprimir
    Enabled = True
    Left = 152
    Top = 65528
  end
end
