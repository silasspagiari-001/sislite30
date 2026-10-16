inherited frmcadPRODUTOS: TfrmcadPRODUTOS
  OnDestroy = UniFrameDestroy
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        inherited btnOptions: TUniBitBtn
          OnClick = btnOptionsClick
        end
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 582
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'SISTEMA'
                Width = 60
                Font.Name = 'Calibri'
                Sortable = True
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O'
                Width = 300
                Font.Name = 'Calibri'
                Sortable = True
              end
              item
                FieldName = 'CODIGOREFERENCIA'
                Title.Caption = 'REFER'#202'NCIA'
                Width = 120
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 494
                ScrollWidth = 855
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    150
                    48)
                  object UniLabel3: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 89
                    Height = 15
                    Hint = ''
                    Caption = 'Numero Sistema'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
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
                    TabOrder = 2
                    Color = clGray
                    ReadOnly = True
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 3
                  Width = 59
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  object UniLabel7: TUniLabel
                    Left = 8
                    Top = 0
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Ativo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 19
                    Top = 25
                    Width = 14
                    Height = 17
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dscrud
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBoxmedida: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'UNIDADE'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel4: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 91
                    Height = 15
                    Hint = ''
                    Caption = 'Unidade Medida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditGRUPOS: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'GRUPO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditGRUPOSButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel5: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Grupo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox5: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Produto Acabado'
                      'Materia Prima'
                      'Outros'
                      '')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel6: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 87
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo de produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 115
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'digo de Refer'#234'ncia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CODIGOREFERENCIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Altura'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ALTURA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniLabel10: TUniLabel
                    Left = 2
                    Top = 2
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'Largura'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'LARGURA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 71
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniLabel11: TUniLabel
                    Left = 3
                    Top = 3
                    Width = 74
                    Height = 15
                    Hint = ''
                    Caption = 'Comprimento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'COMPRIMENTO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Left = 3
                  Top = 131
                  Width = 705
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    705
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 699
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel12: TUniLabel
                    Left = 5
                    Top = 1
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o do Item'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit4: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERONCM'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel13: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 81
                    Height = 15
                    Hint = ''
                    Caption = 'Numero N.C.M.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniLabel14: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 104
                    Height = 15
                    Hint = ''
                    Caption = 'PRE'#199'O DE COMPRA'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'COMPRA'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 2
                    Color = clSkyBlue
                    DecimalPrecision = 4
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit15: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'MARGEM'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    Color = clSkyBlue
                    DecimalPrecision = 3
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEdit15Exit
                  end
                  object UniLabel31: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 62
                    Height = 15
                    Hint = ''
                    Caption = '% MARGEM'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 186
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit14: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 142
                    Height = 30
                    Hint = ''
                    DataField = 'VENDA'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    Color = clSkyBlue
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEdit14Exit
                  end
                  object UniLabel30: TUniLabel
                    Left = 4
                    Top = 1
                    Width = 75
                    Height = 15
                    Hint = ''
                    Caption = 'PRE'#199'O VENDA'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Left = 3
                  Top = 248
                  Width = 852
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  TabOrder = 14
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 6
                    Top = 4
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DETALHES FISCAIS DO ITEM'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 280
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAOLOCAL'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '0101'
                      '0102'
                      '0103'
                      '0202'
                      '0201'
                      '0400'
                      '0500'
                      '0900'
                      '000'
                      '010'
                      '020'
                      '030'
                      '040'
                      '050'
                      '060'
                      '070'
                      '080'
                      '090')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel17: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 110
                    Height = 15
                    Hint = ''
                    Caption = 'CST - DENTRO DO UF'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 280
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAOOUTRAS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '0101'
                      '0102'
                      '0103'
                      '0202'
                      '0201'
                      '0400'
                      '0500'
                      '0900'
                      '000'
                      '010'
                      '020'
                      '030'
                      '040'
                      '050'
                      '060'
                      '070'
                      '080'
                      '090')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel19: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 95
                    Height = 15
                    Hint = ''
                    Caption = 'CST - FORA DO UF'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 280
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniLabel20: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 39
                    Height = 15
                    Hint = ''
                    Caption = 'CST PIS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox3: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PIS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08'
                      '09'
                      '49'
                      '50'
                      '51'
                      '52'
                      '53'
                      '54'
                      '55'
                      '56'
                      '60'
                      '61'
                      '62'
                      '63'
                      '64'
                      '65'
                      '66'
                      '67'
                      '70'
                      '71'
                      '72'
                      '73'
                      '74'
                      '75'
                      '98'
                      '99')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 279
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox4: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'COFINS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08'
                      '09'
                      '49'
                      '50'
                      '51'
                      '52'
                      '53'
                      '54'
                      '55'
                      '56'
                      '60'
                      '61'
                      '62'
                      '63'
                      '64'
                      '65'
                      '66'
                      '67'
                      '70'
                      '71'
                      '72'
                      '73'
                      '74'
                      '75'
                      '98'
                      '99')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel21: TUniLabel
                    Left = 4
                    Top = 1
                    Width = 62
                    Height = 15
                    Hint = ''
                    Caption = 'CST COFINS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 336
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'BASE0'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel22: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 0'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 336
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'ICMS0'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel23: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 0'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 336
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'VLRPIS'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel24: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = 'Al'#237'quota PIS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 335
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 22
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'VLRCOFINS'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel25: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 89
                    Height = 15
                    Hint = ''
                    Caption = 'Al'#237'quota COFINS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 391
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 23
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'BASE1'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel26: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 391
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 24
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'ICMS1'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel27: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 391
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 25
                  DesignSize = (
                    150
                    48)
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Liquido'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'PESOLIQUIDO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock270: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 390
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 26
                  DesignSize = (
                    150
                    48)
                  object UniLabel16: TUniLabel
                    Left = 4
                    Top = 1
                    Width = 59
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Bruto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'PESOBRUTO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock280: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 446
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 27
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'BASE2'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel28: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock290: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 446
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 28
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'ICMS2'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel29: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock300: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 446
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 29
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit17: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 30
                    Hint = ''
                    DataField = 'IVA'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel33: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 17
                    Height = 15
                    Hint = ''
                    Caption = 'IVA'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock310: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 445
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 30
                  DesignSize = (
                    150
                    48)
                  object UniLabel32: TUniLabel
                    Left = 5
                    Top = 2
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Estoque'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit16: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DISPONIVEL'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Style = [fsBold]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
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
      'SELECT * FROM PRODUTOS')
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQryFiltroUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      OnGetText = FDQryFiltroUNIDADEGetText
      Size = 3
    end
    object FDQryFiltroALTURA: TFMTBCDField
      FieldName = 'ALTURA'
      Origin = 'ALTURA'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroCOMPRIMENTO: TFMTBCDField
      FieldName = 'COMPRIMENTO'
      Origin = 'COMPRIMENTO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroLARGURA: TFMTBCDField
      FieldName = 'LARGURA'
      Origin = 'LARGURA'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroTIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO'
      Size = 25
      Calculated = True
    end
    object FDQryFiltroCODIGOREFERENCIA: TStringField
      FieldName = 'CODIGOREFERENCIA'
      Size = 10
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PRODUTOS'
    SQL.Strings = (
      'SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryCaddetails: TFDQuery
    UpdateOptions.UpdateTableName = 'SALDOS'
    SQL.Strings = (
      'SELECT * FROM SALDOS WHERE PRODUTO = :PRODUTO'
      'AND EMPRESA = :EMPRESA')
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 631
    Top = 6
    object D1: TUniMenuItem
      Caption = 'Composi'#231#227'o do Produto - R$ CUSTO'
      ImageIndex = 36
      OnClick = D1Click
    end
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    Left = 829
    Top = 200
  end
end
