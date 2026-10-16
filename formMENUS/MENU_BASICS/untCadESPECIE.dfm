inherited frmCADESPECIE: TfrmCADESPECIE
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 572
          ExplicitHeight = 572
          inherited paSearchFilters: TUniPanel
            Height = 572
            ExplicitHeight = 572
            inherited UniScrollBox1: TUniScrollBox
              Height = 572
              ExplicitHeight = 572
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 572
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 64
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEMENTENOME'
                Title.Caption = 'NOME SEMENTES'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'POPULAR'
                Title.Caption = 'POPULAR'
                Width = 300
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegData1: TUniContainerPanel
          Height = 572
          ExplicitHeight = 572
          ScrollHeight = 572
          ScrollWidth = 954
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 105
                ScrollWidth = 708
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
                    TabOrder = 1
                    Color = clGray
                    ReadOnly = True
                  end
                  object UniLabel3: TUniLabel
                    Left = 0
                    Top = 1
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
                  Width = 47
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
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
                    TabOrder = 1
                    ParentColor = False
                    Color = clBtnFace
                  end
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
                    TabOrder = 2
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
                  object UniDBEdit1: TUniDBEdit
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'SEMENTENOME'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 96
                    Height = 15
                    Hint = ''
                    Caption = 'Nome da Semente'
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
                  object UniDBEdit2: TUniDBEdit
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'POPULAR'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 102
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o Popular'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Left = 3
                  Top = 57
                  Width = 78
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 4
                  object UniLabel7: TUniLabel
                    Left = 7
                    Top = 2
                    Width = 54
                    Height = 15
                    Hint = ''
                    Caption = 'Decimal ?'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 24
                    Top = 28
                    Width = 14
                    Height = 17
                    Hint = ''
                    DataField = 'DECIMAIS'
                    DataSource = dscrud
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Left = 196
                  Top = 57
                  Width = 512
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    512
                    48)
                  object UniButtonDbEditcodigogrupo: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 507
                    Height = 29
                    Hint = ''
                    DataField = 'GRUPO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcodigogrupoButtonClick
                    IconCls = 'search'
                    ExplicitWidth = 145
                  end
                  object UniLabel8: TUniLabel
                    Left = 6
                    Top = 2
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
              end
            end
          end
        end
      end
    end
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM ESPECIE')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'ESPECIE'
    SQL.Strings = (
      'SELECT * FROM ESPECIE WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
