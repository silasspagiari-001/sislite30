inherited frmcadPONTOS: TfrmcadPONTOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            Height = 582
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              Height = 582
              ExplicitHeight = 582
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TIPO'
                Title.Caption = 'TIPO'
                Width = 60
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'DATA'
                Title.Caption = 'Emiss'#227'o'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'SERIE'
                Width = 60
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PRODUTO'
                Title.Caption = 'PRODUTO'
                Width = 60
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O'
                Width = 200
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'QUANTIDADE'
                Title.Caption = 'QUANTIDADE'
                Width = 70
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 319
                ScrollWidth = 855
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    150
                    48)
                  object edCodigo: TUniDBEdit
                    Left = 3
                    Top = 18
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
                    Left = 3
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
                  Left = 196
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 44
                    Height = 15
                    Hint = ''
                    Caption = 'Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditprodutoponto: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'PRODUTO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnExit = UniButtonDbEditprodutopontoExit
                    OnButtonClick = UniButtonDbEditprodutopontoButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit7: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel16: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 119
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o do Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniLabel6: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'Cadastro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DATA'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniLabel4: TUniLabel
                    Left = 3
                    Top = -1
                    Width = 54
                    Height = 15
                    Hint = ''
                    Caption = 'Opera'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditoperacao: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'OPERACAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnExit = UniButtonDbEditoperacaoExit
                    OnButtonClick = UniButtonDbEditoperacaoButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniLabel5: TUniLabel
                    Left = 3
                    Top = -1
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Numero'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniLabel7: TUniLabel
                    Left = 3
                    Top = -1
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Serie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SERIE'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'PTS'
                      'PED'
                      'ORC'
                      'NOC'
                      'NFE'
                      'EST')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 60
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 22
                    Height = 15
                    Hint = ''
                    Caption = 'Seq.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit3: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'SEQUENCIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 118
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'Atualiza'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'ENTRADA'
                      'SAIDA')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 118
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'QUANTIDADE'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel14: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'Quantidade'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniLabel22: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'Pessoas'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEdit3: TUniButtonDbEdit
                    Tag = 1
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESSOA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit3ButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniLabel23: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 19
                    Height = 15
                    Hint = ''
                    Caption = 'U.F.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox4: TUniDBComboBox
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'UF'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'SP'
                      'PR'
                      'MT'
                      'MS'
                      'SC'
                      'RJ'
                      'TO'
                      'PA'
                      'AM'
                      'AC'
                      'PB'
                      'RN'
                      'SE'
                      'PE'
                      'MG'
                      'ES'
                      'RO'
                      'AP'
                      'AL'
                      'CE'
                      'BA'
                      'DF'
                      'GO'
                      'MA'
                      'NO'
                      'RS'
                      'PI'
                      'RR'
                      'EX'
                      'BR')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Left = 3
                  Top = 241
                  Width = 852
                  Height = 24
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  TabOrder = 12
                  object UniLabel27: TUniLabel
                    AlignWithMargins = True
                    Left = 6
                    Top = 2
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'OBSERVA'#199#195'O'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Left = 3
                  Top = 271
                  Width = 150
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniLabel28: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 22
                    Height = 15
                    Hint = ''
                    Caption = 'Obs'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit6: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'OBSERVACOES'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PONTOS')
    object FDQryFiltroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = FDQryFiltroTIPOGetText
      Size = 10
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      Size = 3
    end
    object FDQryFiltroPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 80
    end
    object FDQryFiltroQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object FDQryFiltroLOTESEMENTE: TStringField
      FieldName = 'LOTESEMENTE'
      Origin = 'LOTESEMENTE'
    end
    object FDQryFiltroBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Origin = 'BOLETIM'
    end
    object FDQryFiltroTERMO: TStringField
      FieldName = 'TERMO'
      Origin = 'TERMO'
      Size = 10
    end
    object FDQryFiltroDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object FDQryFiltroPUREZA: TFMTBCDField
      FieldName = 'PUREZA'
      Origin = 'PUREZA'
      Precision = 18
      Size = 3
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PONTOS'
    SQL.Strings = (
      'SELECT * FROM PONTOS WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
