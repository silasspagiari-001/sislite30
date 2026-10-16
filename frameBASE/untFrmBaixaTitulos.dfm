object frmBAIXATITULOS: TfrmBAIXATITULOS
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 881
  Caption = 'Baixa Titulos'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Tag = 1
    Left = 8
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      150
      48)
    object edSearchCRUDDtIni: TUniDateTimePicker
      AlignWithMargins = True
      Left = 1
      Top = 19
      Width = 144
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 193
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Data do Pagamento'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock20: TUniContainerPanel
    Tag = 1
    Left = 187
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      150
      48)
    object UniFormattedNumberEdittotal: TUniFormattedNumberEdit
      Left = 3
      Top = 19
      Width = 145
      Height = 29
      Hint = ''
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ReadOnly = True
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 193
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Valor Total'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock30: TUniContainerPanel
    Tag = 1
    Left = 373
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 2
    object UniCheckBoxgerabanco: TUniCheckBox
      Left = 24
      Top = 19
      Width = 97
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Gera Banco'
      TabOrder = 1
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 554
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      150
      48)
    object btnLkpSearch: TUniBitBtn
      Left = 17
      Top = 19
      Width = 119
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Baixa Titulo(s)'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpSearchClick
    end
  end
  object rcBlock50: TUniContainerPanel
    Left = 8
    Top = 64
    Width = 865
    Height = 403
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 4
    object UniDBGridbaixas: TUniDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 859
      Height = 397
      Hint = ''
      DataSource = DS_MEMBAI
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Lendo Registros ... '
      ForceFit = True
      Align = alClient
      Font.Height = -16
      ParentFont = False
      TabOrder = 1
      ParentColor = False
      Color = clInfoBk
      OnCellClick = UniDBGridbaixasCellClick
      Columns = <
        item
          ShowToolTipAlways = False
          FieldName = 'exclui'
          Title.Alignment = taCenter
          Title.Caption = '<i class="fa fa-lg fa-chevron-down"></i>'
          Width = 30
          Alignment = taCenter
          ReadOnly = True
        end
        item
          FieldName = 'BAINDC'
          Title.Caption = 'Numero'
          Width = 60
        end
        item
          FieldName = 'BAISDC'
          Title.Caption = 'S'#233'rie'
          Width = 40
        end
        item
          FieldName = 'BAIODC'
          Title.Caption = 'Seq.'
          Width = 30
        end
        item
          FieldName = 'BAINOM'
          Title.Caption = 'Nome'
          Width = 170
        end
        item
          FieldName = 'PES_PORTADOR'
          Title.Caption = ' '
          Width = 30
          Alignment = taCenter
        end
        item
          ActionColumn.Buttons = <
            item
              ButtonId = 0
              UI = 'normal'
              Hint = 'Busca Bancos'
              IconCls = 'search'
            end>
          FieldName = 'BAIPOR'
          Title.Caption = 'Banco'
          Width = 60
        end
        item
          FieldName = 'PES_PLANOCONTAS'
          Title.Caption = ' '
          Width = 30
          Alignment = taCenter
        end
        item
          ActionColumn.Buttons = <
            item
              ButtonId = 0
              UI = 'normal'
              Hint = 'Busca Plano de Contas'
              IconCls = 'search'
            end>
          FieldName = 'BAIPLA'
          Title.Caption = 'Plano'
          Width = 80
          Alignment = taRightJustify
        end
        item
          FieldName = 'BAIVLA'
          Title.Caption = 'Valor'
          Width = 80
        end
        item
          FieldName = 'BAIPAR'
          Title.Caption = 'Parcial'
          Width = 80
        end
        item
          FieldName = 'BAIVLP'
          Title.Caption = ' Valor Pago'
          Width = 100
        end>
    end
  end
  object rcBlock60: TUniContainerPanel
    Left = 8
    Top = 469
    Width = 865
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 5
    DesignSize = (
      865
      48)
    object UniBitBtn1: TUniBitBtn
      Left = 733
      Top = 11
      Width = 129
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = UniBitBtn1Click
    end
    object labTotReg: TUniLabel
      Left = 1
      Top = 26
      Width = 687
      Height = 19
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = '0 registro(s)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object TB_MEMBAI: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 749
    Top = 2
    object TB_MEMBAIBAITDC: TIntegerField
      FieldName = 'BAITDC'
    end
    object TB_MEMBAIBAINDC: TFloatField
      FieldName = 'BAINDC'
    end
    object TB_MEMBAIBAISDC: TStringField
      FieldName = 'BAISDC'
    end
    object TB_MEMBAIBAIODC: TIntegerField
      FieldName = 'BAIODC'
    end
    object TB_MEMBAIBAICLF: TIntegerField
      FieldName = 'BAICLF'
    end
    object TB_MEMBAIBAINOM: TStringField
      FieldName = 'BAINOM'
      Size = 100
    end
    object TB_MEMBAIBAIAPL: TIntegerField
      FieldName = 'BAIAPL'
    end
    object TB_MEMBAIBAIPOR: TIntegerField
      FieldName = 'BAIPOR'
    end
    object TB_MEMBAIBAIBAN: TStringField
      FieldName = 'BAIBAN'
      Size = 60
    end
    object TB_MEMBAIBAIDTE: TDateField
      FieldName = 'BAIDTE'
    end
    object TB_MEMBAIBAIVCT: TDateField
      FieldName = 'BAIVCT'
    end
    object TB_MEMBAIBAIVLA: TFloatField
      FieldName = 'BAIVLA'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAICOM: TFloatField
      FieldName = 'BAICOM'
      currency = True
    end
    object TB_MEMBAIBAICAR: TIntegerField
      FieldName = 'BAICAR'
    end
    object TB_MEMBAIBAIVEN: TIntegerField
      FieldName = 'BAIVEN'
    end
    object TB_MEMBAIBAIPED: TStringField
      FieldName = 'BAIPED'
    end
    object TB_MEMBAIBAIOB1: TStringField
      FieldName = 'BAIOB1'
      Size = 600
    end
    object TB_MEMBAIBAIPER: TFloatField
      FieldName = 'BAIPER'
      currency = True
    end
    object TB_MEMBAIBAICOMP: TDateField
      FieldName = 'BAICOMP'
    end
    object TB_MEMBAIBAIJUR: TFloatField
      FieldName = 'BAIJUR'
      currency = True
    end
    object TB_MEMBAIBAITAX: TFloatField
      FieldName = 'BAITAX'
      currency = True
    end
    object TB_MEMBAIBAIDSC: TFloatField
      FieldName = 'BAIDSC'
      currency = True
    end
    object TB_MEMBAIBAIVLP: TFloatField
      FieldName = 'BAIVLP'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAIPAR: TFloatField
      FieldName = 'BAIPAR'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAICONT: TIntegerField
      FieldName = 'BAICONT'
    end
    object TB_MEMBAIBAIPRZ: TIntegerField
      FieldName = 'BAIPRZ'
    end
    object TB_MEMBAIBAIPLA: TStringField
      FieldName = 'BAIPLA'
    end
    object TB_MEMBAIexclui: TStringField
      FieldName = 'exclui'
      OnGetText = TB_MEMBAIexcluiGetText
    end
    object TB_MEMBAIPES_PORTADOR: TStringField
      FieldName = 'PES_PORTADOR'
      OnGetText = TB_MEMBAIPES_PORTADORGetText
    end
    object TB_MEMBAIPES_PLANOCONTAS: TStringField
      FieldName = 'PES_PLANOCONTAS'
      OnGetText = TB_MEMBAIPES_PLANOCONTASGetText
    end
    object TB_MEMBAIBAIANEXO: TStringField
      FieldName = 'BAIANEXO'
    end
    object TB_MEMBAIdetalhesanexo: TStringField
      FieldName = 'detalhesanexo'
    end
    object TB_MEMBAITABELA: TStringField
      FieldName = 'TABELA'
    end
  end
  object DS_MEMBAI: TDataSource
    DataSet = TB_MEMBAI
    Left = 777
    Top = 2
  end
  object FDQryTitulos: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from receber ')
    Left = 750
    Top = 31
  end
end
