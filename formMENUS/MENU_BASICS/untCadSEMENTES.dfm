inherited frmCADSEMENTES: TfrmCADSEMENTES
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
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
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            Columns = <
              item
                FieldName = 'opcoes'
                Title.Caption = ' '
                Width = 50
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'C'#211'DIGO'
                Width = 60
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TIPO'
                Title.Caption = 'TIPO'
                Width = 60
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PRODUTO'
                Title.Caption = 'Produto'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CULTIVAR'
                Title.Caption = 'CULTIVAR'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'LOTE'
                Title.Caption = 'LOTE'
                Width = 150
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'BOLETIM'
                Title.Caption = 'BOLETIM'
                Width = 150
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TERMO'
                Title.Caption = 'TERMO'
                Width = 150
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CATEGORIA'
                Title.Caption = 'CATEGORIA'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DISPONIVEL'
                Title.Caption = 'ESTOQUE'
                Width = 100
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
                ScrollHeight = 484
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
                    Width = 146
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
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
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
                  Width = 101
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  object UniLabel5: TUniLabel
                    Left = 8
                    Top = 0
                    Width = 77
                    Height = 15
                    Hint = ''
                    Caption = 'Reembalada ?'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 43
                    Top = 25
                    Width = 14
                    Height = 17
                    Hint = ''
                    DataField = 'REEMBALADA'
                    DataSource = dscrud
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
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
                  object UniButtonDbEditcodPRODUTO: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PRODUTO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditcodPRODUTOExit
                    OnButtonClick = UniButtonDbEditcodPRODUTOButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel10: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 0
                    Width = 44
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Produto'
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
                  object UniDBEdit2: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'NOME'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel11: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 0
                    Width = 119
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Descri'#231#227'o do Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 68
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBoxcultivar: TUniDBComboBox
                    Tag = 1
                    Left = 1
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'CULTIVAR'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'S1'
                      'S2'
                      'C1'
                      'C2'
                      'Basica'
                      'S2+S1'
                      '')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Cultivar'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 68
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBoxcategoria: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'CATEGORIA'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'S1'
                      'S2'
                      'C1'
                      'C2'
                      'Basica'
                      'S2+S1'
                      '')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel7: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 53
                    Height = 15
                    Hint = ''
                    Caption = 'Categoria'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 68
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Aguarde'
                      'Entrada'
                      'Saida'
                      'Fiscal')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo do Lote'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 68
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit1: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'REMETENTE'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit1ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel9: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 0
                    Width = 56
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Remetente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 68
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit2: TUniButtonDbEdit
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RESPONSAVEL'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit2ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel12: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 0
                    Width = 73
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Resp. T'#233'cnico'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Left = 3
                  Top = 126
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditlaboratorio: TUniButtonDbEdit
                    Tag = 1
                    Left = 1
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'LABORATORIO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditlaboratorioExit
                    OnButtonClick = UniButtonDbEditlaboratorioButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel13: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 0
                    Width = 65
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Laborat'#243'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Left = 196
                  Top = 126
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-9]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'NOMELABORATORIO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel14: TUniLabel
                    AlignWithMargins = True
                    Left = 5
                    Top = 0
                    Width = 116
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Nome do Laborat'#243'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Left = 3
                  Top = 180
                  Width = 852
                  Height = 26
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  TabOrder = 12
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 4
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DADOS DO LOTE/BOLETIM'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 212
                  Width = 150
                  Height = 50
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    50)
                  object UniDBEdit3: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'LOTE'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel15: TUniLabel
                    AlignWithMargins = True
                    Left = 1
                    Top = 1
                    Width = 87
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Lote da Semente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 212
                  Width = 150
                  Height = 50
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    50)
                  object UniDBEdit4: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'BOLETIM'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel16: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 1
                    Width = 74
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'N'#186' do Boletim'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 212
                  Width = 150
                  Height = 50
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    150
                    50)
                  object UniDBEdit5: TUniDBEdit
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'TERMO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel17: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 66
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'N'#186' do Termo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 212
                  Width = 150
                  Height = 50
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    50)
                  object UniDBEdit6: TUniDBEdit
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'SAFRAVALIDA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel19: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 75
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Safra do LOTE'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 266
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit7: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'AMOSTRA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel20: TUniLabel
                    AlignWithMargins = True
                    Left = 1
                    Top = 1
                    Width = 79
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'N'#186' da Amostra'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 266
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RECEBIDA'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel21: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 1
                    Width = 50
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Recebida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 266
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'VALIDADE'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel22: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 1
                    Width = 48
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Validade'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 320
                  Width = 150
                  Height = 54
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    54)
                  object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                    Left = 1
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ANALISEPURA'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel23: TUniLabel
                    AlignWithMargins = True
                    Left = 1
                    Top = 1
                    Width = 49
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Pureza %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 320
                  Width = 150
                  Height = 54
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    54)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'MATINERTES'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel24: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 83
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Material Inerte'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 320
                  Width = 150
                  Height = 54
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 22
                  DesignSize = (
                    150
                    54)
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESOEMBALAGEM'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalPrecision = 0
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel25: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 92
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Peso Embalagem'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 320
                  Width = 150
                  Height = 54
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 23
                  DesignSize = (
                    150
                    54)
                  object UniDBComboBoxpeneira: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PENEIRA'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel26: TUniLabel
                    Left = 2
                    Top = 2
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'Peneira'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 381
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 24
                  DesignSize = (
                    150
                    48)
                  object UniLabel27: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = -1
                    Width = 31
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'V.C. %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'VALORCULTURAL'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 381
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 25
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'GERNORMAIS'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel28: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = -1
                    Width = 79
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Germina'#231#227'o %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock270: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 381
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 26
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'TETRAZOLIO'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel29: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = -1
                    Width = 66
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Tetraz'#243'lio %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock280: TUniContainerPanel
                  Left = 3
                  Top = 436
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 27
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NSACOS'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel30: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'N'#186' Sacos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock290: TUniContainerPanel
                  Left = 196
                  Top = 436
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 28
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DISPONIVEL'
                    DataSource = dscrud
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel31: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Estoque'
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
      'SELECT * FROM SEMENTES')
    object FDQryFiltroopcoes: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = FDQryFiltroopcoesGetText
      Calculated = True
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 3
    end
    object FDQryFiltroLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 50
    end
    object FDQryFiltroBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Origin = 'BOLETIM'
      Size = 15
    end
    object FDQryFiltroTERMO: TStringField
      FieldName = 'TERMO'
      Origin = 'TERMO'
      Size = 15
    end
    object FDQryFiltroCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Origin = 'CULTIVAR'
      Size = 30
    end
    object FDQryFiltroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = FDQryFiltroTIPOGetText
      Size = 15
    end
    object FDQryFiltroPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object FDQryFiltroDISPONIVEL: TFMTBCDField
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      Precision = 18
      Size = 2
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'SEMENTES'
    SQL.Strings = (
      'SELECT * FROM SEMENTES WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 847
    Top = 6
    object A1: TUniMenuItem
      Caption = 'Manuten'#231#227'o do Saldo Lote/BAS'
      ImageIndex = 20
      OnClick = A1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object H1: TUniMenuItem
      Caption = 'Hist'#243'rico de Vendas - (NOTAS EMITIDAS)'
      ImageIndex = 45
      OnClick = H1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Impress'#227'o to Termo'
      ImageIndex = 36
      object T1: TUniMenuItem
        Caption = 'Termo de Conformidade'
        ImageIndex = 112
        OnClick = T1Click
      end
    end
  end
end
