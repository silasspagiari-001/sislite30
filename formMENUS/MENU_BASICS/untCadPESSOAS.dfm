inherited frmcadPESSOAS: TfrmcadPESSOAS
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
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
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
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 60
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CPFCNPJ'
                Title.Caption = 'CPFCNPJ'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'NOME'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CIDADE'
                Title.Caption = 'CIDADE'
                Width = 150
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'ESTADO'
                Title.Caption = 'ESTADO'
                Width = 70
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 967
              ExplicitHeight = 554
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 454
                ScrollWidth = 761
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
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'digo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edCodigo: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 142
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
                  Left = 180
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
                  Left = 259
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel4: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 82
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo de Pessoa'
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
                      'Cliente'#11
                      'Fornecedor'
                      'Cliente/Fornecedor')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 429
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniLabel5: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Situa'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Consumidor'
                      'Isento'
                      'Nao Contribuinte')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 608
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
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
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CADASTRO'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CPFCNPJ'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Cpf/Cnpj'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'INSCRICAO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel9: TUniLabel
                    Left = 4
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Rg/Inscri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 61
                  Width = 215
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    215
                    48)
                  object UniLabel10: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 112
                    Height = 15
                    Hint = ''
                    Caption = 'Inscri'#231#227'o Municipal'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit3: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 210
                    Height = 29
                    Hint = ''
                    DataField = 'PRODUTOR'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 611
                  Top = 61
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigocondicaomestre: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'FUNCIONARIO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcodigocondicaomestreButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel12: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 67
                    Height = 15
                    Hint = ''
                    Caption = 'Funcion'#225'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Left = 81
                  Top = 118
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit5: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NOME'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel13: TUniLabel
                    Left = 3
                    Top = -1
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'Nome'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Left = 274
                  Top = 118
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit6: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'FANTASIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel14: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Fantasia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 194
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditCEPP: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'CEP'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditCEPPExit
                    OnButtonClick = UniButtonDbEditCEPPButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 20
                    Height = 15
                    Hint = ''
                    Caption = 'Cep'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 194
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit7: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel16: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'Endere'#231'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 194
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit8: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel17: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Numero'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 193
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit9: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'BAIRRO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel18: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 35
                    Height = 15
                    Hint = ''
                    Caption = 'Bairro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 1
                  Top = 273
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit10: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'CIDADE'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel19: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'Cidade'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 194
                  Top = 273
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    48)
                  object UniLabel20: TUniLabel
                    Left = 4
                    Top = 1
                    Width = 37
                    Height = 15
                    Hint = ''
                    Caption = 'Estado'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBoxestado: TUniDBComboBox
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'ESTADO'
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
                      'BR'
                      '')
                    ItemIndex = 0
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 381
                  Top = 272
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit3: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'IBGE'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit3ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel22: TUniLabel
                    Left = 5
                    Top = 1
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'I.B.G.E'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 1
                  Top = 340
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit11: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'TELEFONE'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel23: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'Telefone'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 194
                  Top = 340
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit12: TUniDBEdit
                    Left = 4
                    Top = 17
                    Width = 143
                    Height = 29
                    Hint = ''
                    DataField = 'CELULAR'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel24: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 40
                    Height = 15
                    Hint = ''
                    Caption = 'Celular'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 381
                  Top = 340
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit13: TUniDBEdit
                    Left = 5
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'CONTATOENTREGA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel25: TUniLabel
                    Left = 5
                    Top = 1
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Contato'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 556
                  Top = 339
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    48)
                  object UniLabel26: TUniLabel
                    Left = 5
                    Top = 2
                    Width = 37
                    Height = 15
                    Hint = ''
                    Caption = 'Regi'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBoxregiao: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'REGIAO'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Left = 3
                  Top = 402
                  Width = 150
                  Height = 52
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 22
                  DesignSize = (
                    150
                    52)
                  object UniDBEdit14: TUniDBEdit
                    Left = 1
                    Top = 17
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'EMAIL'
                    DataSource = dscrud
                    CharCase = ecLowerCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel27: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'Email'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Left = 196
                  Top = 402
                  Width = 150
                  Height = 52
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 23
                  DesignSize = (
                    150
                    52)
                  object UniDBEdit15: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'URL'
                    DataSource = dscrud
                    CharCase = ecLowerCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel28: TUniLabel
                    Left = 1
                    Top = 1
                    Width = 20
                    Height = 15
                    Hint = ''
                    Caption = 'Site'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
              end
            end
            object UniTabSheetdadosdemais: TUniTabSheet
              Hint = ''
              Caption = 'Dados Adicionais'
              object rcBlock270: TUniContainerPanel
                Left = 3
                Top = 8
                Width = 935
                Height = 25
                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                ParentColor = False
                Color = clSkyBlue
                TabOrder = 0
                object UniLabel29: TUniLabel
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
                  Caption = 'DADOS DE ENTREGA'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock280: TUniContainerPanel
                Tag = 1
                Left = 2
                Top = 47
                Width = 152
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 1
                DesignSize = (
                  152
                  48)
                object UniButtonDbEditCEPENTREGA: TUniButtonDbEdit
                  Left = 1
                  Top = 17
                  Width = 148
                  Height = 29
                  Hint = ''
                  DataField = 'CEPENTREGA'
                  DataSource = dscrud
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  Color = clInfoBk
                  OnExit = UniButtonDbEditCEPENTREGAExit
                  OnButtonClick = UniButtonDbEditCEPENTREGAButtonClick
                  IconCls = 'search'
                end
                object UniLabel30: TUniLabel
                  Left = 2
                  Top = 0
                  Width = 20
                  Height = 15
                  Hint = ''
                  Caption = 'Cep'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock290: TUniContainerPanel
                Tag = 1
                Left = 195
                Top = 47
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-5]]'
                ParentColor = False
                TabOrder = 2
                DesignSize = (
                  150
                  48)
                object UniDBEdit16: TUniDBEdit
                  Left = 3
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'ENDERECOENTREGA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel31: TUniLabel
                  Left = 3
                  Top = 0
                  Width = 50
                  Height = 15
                  Hint = ''
                  Caption = 'Endere'#231'o'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock300: TUniContainerPanel
                Tag = 1
                Left = 382
                Top = 47
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 3
                DesignSize = (
                  150
                  48)
                object UniDBEdit17: TUniDBEdit
                  Left = 4
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'NUMEROENTREGA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel32: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 43
                  Height = 15
                  Hint = ''
                  Caption = 'Numero'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock310: TUniContainerPanel
                Tag = 1
                Left = 558
                Top = 47
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  150
                  48)
                object UniDBEdit18: TUniDBEdit
                  Left = 3
                  Top = 18
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'BAIRROENTREGA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel33: TUniLabel
                  Left = 3
                  Top = 1
                  Width = 35
                  Height = 15
                  Hint = ''
                  Caption = 'Bairro'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock320: TUniContainerPanel
                Left = 3
                Top = 104
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-10]]'
                ParentColor = False
                TabOrder = 5
                DesignSize = (
                  150
                  48)
                object UniDBEdit19: TUniDBEdit
                  Left = 1
                  Top = 16
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'CIDADEENTREGA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel34: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 38
                  Height = 15
                  Hint = ''
                  Caption = 'Cidade'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock330: TUniContainerPanel
                Left = 196
                Top = 104
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 6
                object UniDBComboBox3: TUniDBComboBox
                  Left = 5
                  Top = 16
                  Width = 143
                  Height = 29
                  Hint = ''
                  DataField = 'ESTADOENTREGA'
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
                    'BR'
                    '')
                  ItemIndex = 0
                  TabOrder = 1
                  IconItems = <>
                end
                object UniLabel35: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 37
                  Height = 15
                  Hint = ''
                  Caption = 'Estado'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock340: TUniContainerPanel
                Left = 3
                Top = 157
                Width = 935
                Height = 27
                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                ParentColor = False
                Color = clSkyBlue
                TabOrder = 7
                object UniLabel36: TUniLabel
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
                  Caption = 'DADOS DE FATURAMENTO'
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock350: TUniContainerPanel
                Tag = 1
                Left = 3
                Top = 192
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 8
                DesignSize = (
                  150
                  48)
                object UniButtonDbEditcepfaturamento: TUniButtonDbEdit
                  Left = 2
                  Top = 17
                  Width = 147
                  Height = 29
                  Hint = ''
                  DataField = 'CEPCOBRANCA'
                  DataSource = dscrud
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  Color = clInfoBk
                  OnExit = UniButtonDbEditcepfaturamentoExit
                  OnButtonClick = UniButtonDbEditcepfaturamentoButtonClick
                  IconCls = 'search'
                end
                object UniLabel37: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 20
                  Height = 15
                  Hint = ''
                  Caption = 'Cep'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock360: TUniContainerPanel
                Tag = 1
                Left = 196
                Top = 192
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-5]]'
                ParentColor = False
                TabOrder = 9
                DesignSize = (
                  150
                  48)
                object UniDBEdit20: TUniDBEdit
                  Left = 3
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'ENDERECOCOBRANCA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel38: TUniLabel
                  Left = 3
                  Top = 0
                  Width = 50
                  Height = 15
                  Hint = ''
                  Caption = 'Endere'#231'o'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock370: TUniContainerPanel
                Tag = 1
                Left = 382
                Top = 192
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 10
                DesignSize = (
                  150
                  48)
                object UniDBEdit21: TUniDBEdit
                  Left = 4
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'NUMEROCOBRANCA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel39: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 43
                  Height = 15
                  Hint = ''
                  Caption = 'Numero'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock380: TUniContainerPanel
                Tag = 1
                Left = 558
                Top = 191
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 11
                DesignSize = (
                  150
                  48)
                object UniDBEdit22: TUniDBEdit
                  Left = 3
                  Top = 18
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'BAIRROCOBRANCA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel40: TUniLabel
                  Left = 4
                  Top = 1
                  Width = 35
                  Height = 15
                  Hint = ''
                  Caption = 'Bairro'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock390: TUniContainerPanel
                Left = 3
                Top = 249
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-10]]'
                ParentColor = False
                TabOrder = 12
                DesignSize = (
                  150
                  48)
                object UniDBEdit23: TUniDBEdit
                  Left = 1
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'CIDADECOBRANCA'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel41: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 38
                  Height = 15
                  Hint = ''
                  Caption = 'Cidade'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock400: TUniContainerPanel
                Left = 196
                Top = 249
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 13
                object UniDBComboBox4: TUniDBComboBox
                  Left = 5
                  Top = 17
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'ESTADOCOBRANCA'
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
                    'BR'
                    '')
                  ItemIndex = 0
                  TabOrder = 1
                  IconItems = <>
                end
                object UniLabel42: TUniLabel
                  Left = 4
                  Top = 0
                  Width = 37
                  Height = 15
                  Hint = ''
                  Caption = 'Estado'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
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
      'SELECT * FROM PESSOAS')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PESSOAS'
    SQL.Strings = (
      'select * from pessoas where codigo = :codigo')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 823
    Top = 6
    object R1: TUniMenuItem
      Caption = 'Hist'#243'rico da Pessoa'
      ImageIndex = 94
      OnClick = R1Click
    end
  end
end
