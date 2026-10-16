inherited frmCADprotocolo: TfrmCADprotocolo
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      object labExit: TUniLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
      end
    end
    object pgBaseCadControl: TUniPageControl
      AlignWithMargins = True
      Left = 49
      Top = 42
      Width = 962
      Height = 600
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 9
      Margins.Bottom = 8
      ActivePage = tabRegister
      Align = alClient
      TabOrder = 2
      object tabSearch: TUniTabSheet
        Hint = ''
        Caption = 'Pesquisa'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegSearch: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 954
          Height = 570
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object paSearchFilters: TUniPanel
            Left = 0
            Top = 0
            Width = 266
            Height = 570
            Hint = ''
            Margins.Top = 0
            Margins.Right = 0
            Align = alLeft
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 0
            BorderStyle = ubsNone
            Title = 'Filtros da Pesquisa'
            Caption = ''
            CollapseDirection = cdLeft
            object UniScrollBox1: TUniScrollBox
              Left = 0
              Top = 0
              Width = 266
              Height = 570
              Hint = ''
              Margins.Left = 0
              Margins.Right = 0
              Align = alClient
              Color = 15724527
              TabOrder = 1
              ScrollHeight = 398
              ScrollWidth = 262
              object paSearchFilter1: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 49
                Width = 250
                Height = 178
                Hint = ''
                Margins.Left = 10
                Margins.Top = 6
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 1
                object paSearchField1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 0
                  Width = 249
                  Height = 60
                  Hint = ''
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    249
                    60)
                  object UniLabelc1: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 52
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Conteudo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edSearchCRUDconteudo: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 25
                    Width = 246
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ClearButton = True
                  end
                end
                object paSearchOp1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 59
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 2
                  object UniContainerPanel2: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 250
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      250
                      60)
                    object cbxSearchCRUDmes: TUniComboBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 31
                      Width = 246
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      Style = csDropDownList
                      Text = ''
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
                        '10'
                        '11'
                        '12')
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel1: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 9
                      Width = 23
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'M'#234's'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 118
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 3
                  object UniContainerPanel5: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 250
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      250
                      60)
                    object UniComboBoxCRUDano: TUniComboBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 29
                      Width = 246
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      Style = csDropDownList
                      Text = ''
                      Items.Strings = (
                        '2018'
                        '2019'
                        '2020'
                        '2021'
                        '2022'
                        '2023'
                        '2024'
                        '2025')
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel2: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 9
                      Width = 21
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Ano'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
              end
              object labTitleSearch: TUniLabel
                AlignWithMargins = True
                Left = 10
                Top = 10
                Width = 158
                Height = 23
                Hint = ''
                Margins.Left = 10
                Margins.Top = 10
                Margins.Right = 0
                Margins.Bottom = 10
                TextConversion = txtHTML
                Caption = 'Pesquisar Registro(s)'
                Align = alTop
                ParentFont = False
                Font.Color = clGray
                Font.Height = -19
                Font.Name = 'Calibri Light'
                ParentColor = False
                Color = clSilver
                TabOrder = 0
              end
              object paSearchFilterPeriodSelect: TUniContainerPanel
                AlignWithMargins = True
                Left = 11
                Top = 226
                Width = 251
                Height = 127
                Hint = ''
                Margins.Left = 10
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                AlignmentControl = uniAlignmentClient
                ParentAlignmentControl = False
                TabOrder = 2
                DesignSize = (
                  251
                  127)
                object UniContainerPanel3: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 60
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    250
                    60)
                  object UniLabel4: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 5
                    Width = 37
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Ordem'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniComboBoxCRUDordem: TUniComboBox
                    AlignWithMargins = True
                    Left = 4
                    Top = 31
                    Width = 246
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Lote'
                      'Nome'
                      'Numero I.R.'
                      'Numero Boletim'
                      'Numero Amostra')
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object UniComboBoxCRUDstatus: TUniComboBox
                  AlignWithMargins = True
                  Left = 4
                  Top = 29
                  Width = 246
                  Height = 29
                  Hint = ''
                  Margins.Right = 5
                  Style = csDropDownList
                  Text = ''
                  Items.Strings = (
                    'Aberto'
                    'Andamento'
                    'Fechada'
                    'Confirma'#231#227'o'
                    'Todos')
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                end
                object UniLabel3: TUniLabel
                  AlignWithMargins = True
                  Left = 4
                  Top = 9
                  Width = 34
                  Height = 15
                  Hint = ''
                  Margins.Top = 1
                  Margins.Bottom = 2
                  Caption = 'Status'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 3
                end
              end
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 362
                Width = 235
                Height = 36
                Hint = ''
                Margins.Left = 10
                Margins.Top = 12
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 3
                object btnSearchCRUD: TUniBitBtn
                  AlignWithMargins = True
                  Left = 120
                  Top = 2
                  Width = 114
                  Height = 30
                  Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-search |'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = '@'
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  OnClick = btnSearchCRUDClick
                end
                object btnSearchMoreFilters: TUniBitBtn
                  AlignWithMargins = True
                  Left = 4
                  Top = 2
                  Width = 115
                  Height = 30
                  Hint = '[['#13#10'ico:fas-filter |'#13#10'cls:ButtonThemeCrud-no-border-right'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = '+ ...'
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
            end
          end
          object dbgSearchCRUD: TUniDBGrid
            Left = 266
            Top = 0
            Width = 688
            Height = 570
            Hint = ''
            DataSource = dsfiltro
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            ForceFit = True
            Align = alClient
            Font.Height = -13
            Font.Name = 'Calibri'
            ParentFont = False
            TabOrder = 2
            Exporter.Enabled = True
            OnCellClick = dbgSearchCRUDCellClick
            OnDblClick = dbgSearchCRUDDblClick
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = ' '
                Width = 50
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SITUACAO'
                Title.Caption = 'SITUACAO'
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'DATAEMISSAO'
                Title.Caption = 'EMISS'#195'O'
                Width = 110
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'AMOSTRA'
                Title.Caption = 'AMOSTRA'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'BOLETIM'
                Title.Caption = 'BOLETIM'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMEROIR'
                Title.Caption = 'I.R.'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CATEGORIA'
                Title.Caption = 'CAT.'
                Width = 60
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'NOMEPESSOA'
                Title.Caption = 'NOME'
                Width = 350
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CULTIVAR'
                Title.Caption = 'CULTIVAR'
                Width = 300
                Font.Name = 'Calibri'
                Alignment = taCenter
              end>
          end
        end
      end
      object tabRegister: TUniTabSheet
        Hint = ''
        Caption = 'Cadastro'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegData1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 954
          Height = 570
          Hint = ''
          ParentColor = False
          Align = alClient
          AutoScroll = True
          TabOrder = 0
          ScrollHeight = 570
          ScrollWidth = 954
          object UniPageControlcadastros: TUniPageControl
            Left = 0
            Top = 0
            Width = 954
            Height = 572
            Hint = ''
            ActivePage = UniTabSheetCRUD
            Align = alClient
            TabOrder = 1
            object UniTabSheetCRUD: TUniTabSheet
              Hint = ''
              Caption = 'Geral'
              object UniScrollBox2: TUniScrollBox
                Left = 0
                Top = 0
                Width = 946
                Height = 544
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 539
                ScrollWidth = 855
                object rcBlock350: TUniContainerPanel
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
                  object UniLabel5: TUniLabel
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
                object rcBlock360: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 53
                    Height = 15
                    Hint = ''
                    Caption = 'AMOSTRA'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock370: TUniContainerPanel
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
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DATAAMOSTRAGEM'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel6: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 97
                    Height = 15
                    Hint = ''
                    Caption = 'Data Amostragem'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock380: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DATARECEBIMENTO'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel7: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Data Recebimento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock390: TUniContainerPanel
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
                  object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESO_RECEBIDA'
                    DataSource = dscrud
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
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 128
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Amostra Recebida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock400: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 54
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESO_RECEBIDA'
                    DataSource = dscrud
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
                  object UniLabel10: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'Rep. 0,00'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock410: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 54
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'REPRESENTA_ESCRITA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel11: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'Rep. Escrita'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock420: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 54
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object cbxdbpeneira: TUniDBComboBox
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PENEIRA'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel12: TUniLabel
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
                object rcBlock430: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 54
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object cbxdbcategoria: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'CATEGORIA'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel13: TUniLabel
                    Left = 2
                    Top = 2
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
                object rcBlock440: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 54
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel14: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 67
                    Height = 15
                    Hint = ''
                    Caption = 'Safra V'#225'lida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock450: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 106
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditCEPP: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ESPECIE_CODIGO'
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
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = #201'specie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock460: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 106
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit4: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ESPECIE'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel16: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o '#201'specie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock470: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 106
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit1: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'CULTIVAR_CODIGO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEdit1Exit
                    OnButtonClick = UniButtonDbEdit1ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel17: TUniLabel
                    Left = 2
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
                object rcBlock480: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 106
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit5: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CULTIVAR'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel18: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 101
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o Cultivar'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock490: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 106
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit6: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'LOTE'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel19: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 22
                    Height = 15
                    Hint = ''
                    Caption = 'Lote'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock500: TUniContainerPanel
                  Left = 3
                  Top = 158
                  Width = 852
                  Height = 21
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clMoneyGreen
                  TabOrder = 15
                  object UniLabel21: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 1
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DADOS DO REQUERENTE'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock510: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    48)
                  object UniLabel20: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 88
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd. Requerente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEdit2: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESSOA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnExit = UniButtonDbEdit2Exit
                    OnButtonClick = UniButtonDbEdit2ButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock520: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit7: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NOMEPESSOA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel22: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 112
                    Height = 15
                    Hint = ''
                    Caption = 'Nome do Requerente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock530: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit8: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CPFCNPJ'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel23: TUniLabel
                    Left = 2
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
                object rcBlock540: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 183
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit9: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ESTADO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel24: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 19
                    Height = 15
                    Hint = ''
                    Caption = 'U.F.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock550: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 235
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit3: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'SIGLA_PROCEDENCIA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEdit3Exit
                    OnButtonClick = UniButtonDbEdit3ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel25: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 109
                    Height = 15
                    Hint = ''
                    Caption = 'Cidade Proced'#234'ncia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock560: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 235
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit10: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CIDADE_PROCEDENCIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel26: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 113
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o da Cidade'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock570: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 235
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 22
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit11: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ESTADO_PROCEDENCIA'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel27: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 19
                    Height = 15
                    Hint = ''
                    Caption = 'U.F.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock580: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 234
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 23
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit4: TUniButtonDbEdit
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RESPONSAVEL'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit4ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel28: TUniLabel
                    Left = 2
                    Top = 1
                    Width = 67
                    Height = 15
                    Hint = ''
                    Caption = 'R.T. Empresa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock590: TUniContainerPanel
                  Left = 3
                  Top = 286
                  Width = 852
                  Height = 21
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clMoneyGreen
                  TabOrder = 24
                  object UniLabel29: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 2
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DADOS DO PROTOCOLO'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock600: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 311
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 25
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker3: TUniDBDateTimePicker
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DATAEMISSAO'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel30: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 81
                    Height = 15
                    Hint = ''
                    Caption = 'Emiss'#227'o BO/IR'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock610: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 311
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 26
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit5: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NUMEROIR'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    ReadOnly = True
                    IconCls = 'search'
                  end
                  object UniLabel31: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 33
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' I.R.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock620: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 311
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 27
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit6: TUniButtonDbEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'BOLETIM'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    ReadOnly = True
                    IconCls = 'search'
                  end
                  object UniLabel32: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' BAS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock630: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 311
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 28
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEdit7: TUniButtonDbEdit
                    Tag = 1
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RTEMPRESA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEdit7Exit
                    OnButtonClick = UniButtonDbEdit7ButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel33: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 85
                    Height = 15
                    Hint = ''
                    Caption = 'R.T. Laborat'#243'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock640: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 311
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 29
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit12: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RTNOME'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel34: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 136
                    Height = 15
                    Hint = ''
                    Caption = 'Nome do R.T. Laborat'#243'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock650: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 363
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 30
                  DesignSize = (
                    150
                    48)
                  object cbxdbtipoamostra: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'ANALISE_RE'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Analise'
                      'Reanalise')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel35: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 89
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo de Amostra'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock660: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 363
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 31
                  DesignSize = (
                    150
                    48)
                  object cbxdbsituacao: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAO'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Aberto'
                      'Aguarde'
                      'Fechado')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel36: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Situa'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock670: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 363
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 32
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESO_RECEBIDA'
                    DataSource = dscrud
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
                  object UniLabel37: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 79
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Cobrado'
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock680: TUniContainerPanel
                  Left = 3
                  Top = 415
                  Width = 852
                  Height = 124
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 33
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 5
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'PUREZA'
                    DataSource = dscrud
                    Caption = 'PUREZA'
                    TabOrder = 1
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 108
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'TETRAZOLIO'
                    DataSource = dscrud
                    Caption = 'TETRAZ'#211'LIO'
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox3: TUniDBCheckBox
                    Left = 211
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'UMIDADE'
                    DataSource = dscrud
                    Caption = 'UMIDADE'
                    TabOrder = 3
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox4: TUniDBCheckBox
                    Left = 314
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'GERMINACAO'
                    DataSource = dscrud
                    Caption = 'GERMINA'#199#195'O'
                    TabOrder = 4
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox5: TUniDBCheckBox
                    Left = 428
                    Top = 16
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'DOSN'
                    DataSource = dscrud
                    Caption = 'DOSN'
                    TabOrder = 5
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox6: TUniDBCheckBox
                    Left = 5
                    Top = 52
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'VE'
                    DataSource = dscrud
                    Caption = 'V.E.'
                    TabOrder = 6
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox7: TUniDBCheckBox
                    Left = 108
                    Top = 52
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'PMS'
                    DataSource = dscrud
                    Caption = 'P.M.S.'
                    TabOrder = 7
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox8: TUniDBCheckBox
                    Left = 211
                    Top = 52
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'SI'
                    DataSource = dscrud
                    Caption = 'S.I.'
                    TabOrder = 8
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox9: TUniDBCheckBox
                    Left = 314
                    Top = 52
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'VOC'
                    DataSource = dscrud
                    Caption = 'V.O.C.'
                    TabOrder = 9
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox10: TUniDBCheckBox
                    Left = 428
                    Top = 52
                    Width = 97
                    Height = 17
                    Hint = ''
                    DataField = 'VIGOR'
                    DataSource = dscrud
                    Caption = 'VIGOR'
                    TabOrder = 10
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
    object paBaseButtons: TUniContainerPanel
      AlignWithMargins = True
      Left = 4
      Top = 42
      Width = 37
      Height = 605
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
      TabOrder = 3
      ScrollHeight = 605
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 282
        Width = 37
        Height = 89
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 4
        object btnCloseForm: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 56
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
            '-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 20
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
        end
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '='
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnOptionsClick
        end
      end
      object paP: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 37
        Height = 39
        Hint = ''
        Margins.Top = 6
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object btnSearch: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 0
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:Abre para Pesquisas t:Search w:200 d:10000 c:rc-bg-info'#13#10']]' +
            #13#10
          Margins.Left = 2
          Margins.Top = 0
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '@'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSearchClick
        end
      end
      object paNAE: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 59
        Width = 37
        Height = 110
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 2
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
          Caption = '+'
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
          Caption = '!'
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
          Caption = '#'
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
        Top = 189
        Width = 37
        Height = 73
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object btnSaveReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'V'
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
          Top = 38
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'X'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCancelRegClick
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 875
    Top = 7
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'PROTOCOLO'
    SQL.Strings = (
      'select'
      'CODIGO,SITUACAO,'
      'PLATAFORMA , DATAEMISSAO, AMOSTRA, BOLETIM, NUMEROIR,'
      'CATEGORIA, NOMEPESSOA, CULTIVAR'
      'from PROTOCOLO')
    Left = 905
    Top = 7
    object FDQryFiltroPLATAFORMA: TStringField
      FieldName = 'PLATAFORMA'
      Origin = 'PLATAFORMA'
      Size = 10
    end
    object FDQryFiltroDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object FDQryFiltroAMOSTRA: TStringField
      FieldName = 'AMOSTRA'
      Origin = 'AMOSTRA'
      Size = 10
    end
    object FDQryFiltroBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Origin = 'BOLETIM'
      Size = 10
    end
    object FDQryFiltroNUMEROIR: TStringField
      FieldName = 'NUMEROIR'
      Origin = 'NUMEROIR'
      Size = 10
    end
    object FDQryFiltroCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 8
    end
    object FDQryFiltroNOMEPESSOA: TStringField
      FieldName = 'NOMEPESSOA'
      Origin = 'NOMEPESSOA'
      Size = 80
    end
    object FDQryFiltroCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Origin = 'CULTIVAR'
      Size = 250
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      OnGetText = FDQryFiltroCODIGOGetText
    end
    object FDQryFiltroSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = FDQryFiltroSITUACAOGetText
      Size = 10
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 939
    Top = 7
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'PROTOCOLO'
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO WHERE CODIGO = :CODIGO')
    Left = 969
    Top = 7
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
    Top = 7
    object GINFORMATIVO: TUniMenuItem
      Caption = 'Gerar N'#186' de INFORMATIVO'
      ImageIndex = 27
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object GBAS: TUniMenuItem
      Caption = 'Gerar N'#186' do BAS'
      ImageIndex = 61
    end
  end
end
