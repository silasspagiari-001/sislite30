inherited frmCADCONDICOES: TfrmCADCONDICOES
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 954
        ExplicitHeight = 572
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 572
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 572
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 572
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
                Title.Caption = 'DESCRICAO'
                Width = 300
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 954
        ExplicitHeight = 572
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 572
          ScrollHeight = 572
          ScrollWidth = 954
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 946
              ExplicitHeight = 544
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 242
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
                    ReadOnly = True
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
                  Left = 372
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
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
                    TabOrder = 1
                  end
                  object UniLabel5: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
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
                  Height = 67
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    67)
                  object UniDBRadioGroup1: TUniDBRadioGroup
                    Left = 0
                    Top = 0
                    Width = 146
                    Height = 66
                    Hint = ''
                    DataField = 'ENTRADA_SAIDA'
                    DataSource = dscrud
                    Caption = 'Tipo'
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 1
                    Items.Strings = (
                      'Entrada'
                      'Saida')
                    Columns = 2
                    Values.Strings = (
                      '0'
                      '1')
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PARCELAS'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel6: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'Parcela'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Left = 3
                  Top = 72
                  Width = 208
                  Height = 113
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    208
                    113)
                  object UniLabel7: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'Parametros'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBMemo1: TUniDBMemo
                    Left = 3
                    Top = 21
                    Width = 202
                    Height = 89
                    Hint = ''
                    DataField = 'OBSERVACOES'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 191
                  Width = 150
                  Height = 51
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    51)
                  object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'JUROS'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    ParentFont = False
                    Font.Color = clBlue
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel8: TUniLabel
                    Left = 1
                    Top = 3
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = '% Juros'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 191
                  Width = 150
                  Height = 51
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    51)
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'DESCONTOS'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    ParentFont = False
                    Font.Color = clBlue
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel9: TUniLabel
                    Left = 2
                    Top = 3
                    Width = 91
                    Height = 15
                    Hint = ''
                    Caption = '% Desconto MDF'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 191
                  Width = 150
                  Height = 51
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    51)
                  object UniLabel10: TUniLabel
                    Left = 3
                    Top = 3
                    Width = 100
                    Height = 15
                    Hint = ''
                    Caption = '% Desconto METAL'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'DESCONTOS_METAL'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    ParentFont = False
                    Font.Color = clBlue
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
      'SELECT * FROM CONDICOES')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'CONDICOES'
    SQL.Strings = (
      'SELECT * FROM CONDICOES WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
