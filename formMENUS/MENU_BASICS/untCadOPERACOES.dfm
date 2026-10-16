inherited frmCADOPERACOES: TfrmCADOPERACOES
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
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
                Width = 64
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'REFERENCIA'
                Title.Caption = 'REFER'#202'NCIA'
                Width = 250
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SUBSTITUICAO'
                Title.Caption = 'SUBSTITUICAO'
                Width = 64
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
                ScrollHeight = 267
                ScrollWidth = 929
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
                    Left = 0
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
                    Tag = 1
                    Left = 1
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
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 3
                  Width = 46
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 1
                  object UniLabel4: TUniLabel
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
                    Left = 15
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
                  Left = 382
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 3
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'REFERENCIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 1
                    Width = 58
                    Height = 15
                    Hint = ''
                    Caption = 'Refer'#234'ncia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 56
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Normal'
                      'Ajuste'
                      'Complementar'
                      'Devolucao')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel7: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 24
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 56
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
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
                    DataField = 'OPERACAO_OP'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Vendas'
                      'Bonificacao'
                      'Devolucao'
                      'Troca'
                      'Amostra'
                      'Venda EF'
                      'Estoque'
                      'Outros')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 97
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo de Opera'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 56
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcusto: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'SUBSTITUICAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcustoButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel9: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 68
                    Height = 15
                    Hint = ''
                    Caption = 'Substitui'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 55
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit1: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'ESCRITA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit1ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel10: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 44
                    Height = 15
                    Hint = ''
                    Caption = 'Escritas'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 126
                  Width = 190
                  Height = 141
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  object UniDBRadioGroup1: TUniDBRadioGroup
                    Left = 0
                    Top = 3
                    Width = 188
                    Height = 135
                    Hint = ''
                    DataField = 'ENTRADA_SAIDA'
                    DataSource = dscrud
                    Caption = 'Entrada/Saida'
                    TabOrder = 1
                    Items.Strings = (
                      'Entrada'
                      'Saida')
                    Values.Strings = (
                      '0'
                      '1')
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 240
                  Top = 126
                  Width = 197
                  Height = 141
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 9
                  object UniDBRadioGroup2: TUniDBRadioGroup
                    Left = 8
                    Top = 3
                    Width = 188
                    Height = 135
                    Hint = ''
                    DataField = 'ESTOQUE'
                    DataSource = dscrud
                    Caption = 'Estoque'
                    TabOrder = 1
                    Items.Strings = (
                      'Credita'
                      'Debita'
                      'Nulo')
                    Values.Strings = (
                      '0'
                      '1'
                      '2')
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 472
                  Top = 126
                  Width = 210
                  Height = 141
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  object UniDBRadioGroup3: TUniDBRadioGroup
                    Left = 0
                    Top = 3
                    Width = 208
                    Height = 135
                    Hint = ''
                    DataField = 'FINANCEIRO'
                    DataSource = dscrud
                    Caption = 'Financeiro'
                    TabOrder = 1
                    Items.Strings = (
                      'Pagar'
                      'Receber'
                      'Nulo')
                    Values.Strings = (
                      '0'
                      '1'
                      '2')
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 688
                  Top = 126
                  Width = 241
                  Height = 141
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 3
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'CALCULA_ICMS'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'Calcula I.C.MC.S'
                    TabOrder = 1
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox3: TUniDBCheckBox
                    Left = 115
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'UNICA'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'Opera'#231#227'o Unica'
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox4: TUniDBCheckBox
                    Left = 3
                    Top = 44
                    Width = 206
                    Height = 17
                    Hint = ''
                    DataField = 'CALCULA_ICMS_SOBRE_NOTA'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'I.C.M.S. sobre NOTA'
                    TabOrder = 3
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox5: TUniDBCheckBox
                    Left = 3
                    Top = 76
                    Width = 206
                    Height = 17
                    Hint = ''
                    DataField = 'GERA_SPED'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'Opera'#231#227'o GERA SPED'
                    TabOrder = 4
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox6: TUniDBCheckBox
                    Left = 3
                    Top = 108
                    Width = 102
                    Height = 17
                    Hint = ''
                    DataField = 'CALCULA_IPI'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'Calcula I.P.I.'
                    TabOrder = 5
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox7: TUniDBCheckBox
                    Left = 111
                    Top = 99
                    Width = 102
                    Height = 17
                    Hint = ''
                    DataField = 'CALCULA_ST'
                    DataSource = dscrud
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    Caption = 'Calcula S.T.'
                    TabOrder = 6
                    ParentColor = False
                    Color = clBtnFace
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
      'SELECT * FROM OPERACOES')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'OPERACOES'
    SQL.Strings = (
      'SELECT * FROM OPERACOES WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
