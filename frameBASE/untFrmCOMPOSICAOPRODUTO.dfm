object frmCOMPOSICAOPRODUTO: TfrmCOMPOSICAOPRODUTO
  Left = 0
  Top = 0
  ClientHeight = 420
  ClientWidth = 723
  Caption = 'Composi'#231#227'o do Produto Acabado'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paBaseButtons: TUniContainerPanel
    AlignWithMargins = True
    Left = 4
    Top = 2
    Width = 37
    Height = 415
    Hint = ''
    Margins.Left = 4
    Margins.Top = 2
    Margins.Right = 6
    ParentColor = False
    Color = clWhite
    Align = alLeft
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    AutoScroll = True
    TabOrder = 0
    ScrollHeight = 415
    ScrollWidth = 37
    object paNAE: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 20
      Width = 37
      Height = 110
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object btnNewReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-plus"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnNewRegClick
      end
      object btnEditReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-pencil-alt"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnEditRegClick
      end
      object btnDeleteReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 74
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 0
        Caption = '<i class="fas fa-trash-alt"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnDeleteRegClick
      end
    end
    object paGC: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 150
      Width = 37
      Height = 139
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object btnSaveReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-save"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnSaveRegClick
      end
      object btnCancelReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 74
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-times"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCancelRegClick
      end
      object btnCalcReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-calculator | '#13#10'cls-ico:font-blac' +
          'k'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-calculator"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCalcRegClick
      end
    end
  end
  object rcBlock10: TUniContainerPanel
    Tag = 1
    Left = 44
    Top = 2
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      150
      48)
    object edCodigo: TUniDBEdit
      Left = 1
      Top = 17
      Width = 144
      Height = 29
      Hint = ''
      DataField = 'CODIGO'
      DataSource = dscrud
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 1
      Color = clGray
      ReadOnly = True
    end
    object UniLabel3: TUniLabel
      Left = 0
      Top = 0
      Width = 38
      Height = 15
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock20: TUniContainerPanel
    Tag = 1
    Left = 197
    Top = 2
    Width = 140
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      140
      48)
    object UniButtonDbEditproduto: TUniButtonDbEdit
      Tag = 1
      Left = 3
      Top = 17
      Width = 135
      Height = 29
      Hint = ''
      DataField = 'PRODUTO'
      DataSource = dscrud
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Color = clInfoBk
      IconCls = 'search'
    end
    object UniLabel1: TUniLabel
      Left = 0
      Top = 0
      Width = 44
      Height = 15
      Hint = ''
      Caption = 'Produto'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 339
    Top = 2
    Width = 125
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      125
      48)
    object UniDBFormattedNumberEditvlrcusto: TUniDBFormattedNumberEdit
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 119
      Height = 29
      Hint = ''
      DataField = 'TOTALCUSTO'
      DataSource = dscrud
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      TabOrder = 1
      ReadOnly = True
      DecimalPrecision = 4
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel4: TUniLabel
      Left = 0
      Top = 0
      Width = 61
      Height = 15
      Hint = ''
      Caption = 'Total Custo'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock50: TUniContainerPanel
    Left = 44
    Top = 56
    Width = 679
    Height = 323
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 4
    object UniDBGridprodutos: TUniDBGrid
      Left = 0
      Top = 0
      Width = 679
      Height = 323
      Hint = ''
      DataSource = dscompostoitens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
      OnCellClick = UniDBGridprodutosCellClick
      Columns = <
        item
          FieldName = 'buscaproduto'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'PRODUTO'
          Title.Caption = 'PRODUTO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 200
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'QUANTIDADE'
          Title.Caption = 'QTDE'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VLRCUSTO'
          Title.Caption = 'CUSTO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'TOTALCUSTO'
          Title.Caption = 'TOTAL'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'exclui'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end>
    end
  end
  object rcBlock60: TUniContainerPanel
    Left = 44
    Top = 382
    Width = 679
    Height = 35
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 5
    object btnLkpClear: TUniBitBtn
      Left = 581
      Top = 2
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Tag = 1
    Left = 467
    Top = 2
    Width = 102
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 6
    DesignSize = (
      102
      48)
    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 96
      Height = 29
      Hint = ''
      DataField = 'MARGEM'
      DataSource = dscrud
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      TabOrder = 1
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel2: TUniLabel
      Left = 0
      Top = 0
      Width = 57
      Height = 15
      Hint = ''
      Caption = '% Margem'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Tag = 1
    Left = 572
    Top = 2
    Width = 148
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 7
    DesignSize = (
      148
      48)
    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 142
      Height = 29
      Hint = ''
      DataField = 'VENDA'
      DataSource = dscrud
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      TabOrder = 1
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel5: TUniLabel
      Left = 0
      Top = 0
      Width = 130
      Height = 15
      Hint = ''
      Caption = 'Sugest'#227'o de Pre'#231'o Final'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'COMPOSICAO'
    SQL.Strings = (
      'select * from COMPOSICAO WHERE CODIGO = :CODIGO')
    Left = 16
    Top = 262
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 15
    Top = 301
  end
  object tbcompostoitens: TFDMemTable
    BeforePost = tbcompostoitensBeforePost
    AfterPost = tbcompostoitensAfterPost
    BeforeDelete = tbcompostoitensBeforeDelete
    AfterDelete = tbcompostoitensAfterDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 80
    Top = 301
    object tbcompostoitensPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbcompostoitensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object tbcompostoitensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbcompostoitensVLRCOMPRA: TFloatField
      FieldName = 'VLRCOMPRA'
      DisplayFormat = '0.0000'
      currency = True
    end
    object tbcompostoitensVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      DisplayFormat = '0.0000'
      currency = True
    end
    object tbcompostoitensTOTALCOMPRA: TFloatField
      FieldName = 'TOTALCOMPRA'
      DisplayFormat = '0.0000'
      currency = True
    end
    object tbcompostoitensTOTALCUSTO: TFloatField
      FieldName = 'TOTALCUSTO'
      DisplayFormat = '0.0000'
      currency = True
    end
    object tbcompostoitensbuscaproduto: TStringField
      Alignment = taCenter
      FieldName = 'buscaproduto'
      OnGetText = tbcompostoitensbuscaprodutoGetText
      Size = 1
    end
    object tbcompostoitensexclui: TStringField
      FieldName = 'exclui'
      OnGetText = tbcompostoitensexcluiGetText
      Size = 1
    end
  end
  object dscompostoitens: TDataSource
    AutoEdit = False
    DataSet = tbcompostoitens
    Left = 7
    Top = 362
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'COMPOSICAO'
    SQL.Strings = (
      'SELECT * FROM COMPOSICAO')
    Left = 47
    Top = 262
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 47
    Top = 302
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnSaveReg
    Enabled = True
    DisplayMessage = 'Gravando ... '
    Left = 76
    Top = 384
  end
end
