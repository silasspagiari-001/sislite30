inherited frmNOTAELETRONICA: TfrmNOTAELETRONICA
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
      object labTitleForm: TUniLabel
        Left = 49
        Top = 6
        Width = 37
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'Title'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object UniMemolog: TUniMemo
        Left = 978
        Top = 3
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 3
      end
    end
    object pgBaseCadControl: TUniPageControl
      Left = 37
      Top = 40
      Width = 983
      Height = 610
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 9
      Margins.Bottom = 8
      ActivePage = tabSearch
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
          Width = 975
          Height = 580
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object paSearchFilters: TUniPanel
            Left = 0
            Top = 0
            Width = 266
            Height = 580
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
              Height = 580
              Hint = ''
              Margins.Left = 0
              Margins.Right = 0
              Align = alClient
              Color = 15724527
              TabOrder = 1
              ScrollHeight = 389
              ScrollWidth = 254
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
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 353
                Width = 235
                Height = 36
                Hint = ''
                Margins.Left = 10
                Margins.Top = 12
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 1
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
              object paSearchFilter1: TUniContainerPanel
                AlignWithMargins = True
                Left = 4
                Top = 49
                Width = 250
                Height = 294
                Hint = ''
                Margins.Left = 10
                Margins.Top = 6
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 2
                object paSearchField1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 1
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
                    Width = 39
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditpessoas: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnButtonClick = UniButtonEditpessoasButtonClick
                    IconCls = 'search'
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
                  DesignSize = (
                    250
                    60)
                  object UniButtonEditnumero: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    IconCls = 'search'
                  end
                  object UniLabel1: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 6
                    Width = 43
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Numero'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object paSearchFilterPeriodSelect: TUniContainerPanel
                  AlignWithMargins = True
                  Left = -1
                  Top = 114
                  Width = 251
                  Height = 121
                  Hint = ''
                  Margins.Left = 10
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  Color = 15724527
                  AlignmentControl = uniAlignmentClient
                  ParentAlignmentControl = False
                  TabOrder = 3
                  object paSearchFilterDtIni: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 3
                    Top = 0
                    Width = 118
                    Height = 60
                    Hint = ''
                    Margins.Top = 0
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    object UniLabelDtIni: TUniLabel
                      AlignWithMargins = True
                      Left = 0
                      Top = 1
                      Width = 65
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Data Inicial'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edSearchCRUDDtIni: TUniDateTimePicker
                      AlignWithMargins = True
                      Left = 0
                      Top = 20
                      Width = 110
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      DateTime = 43232.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      TabOrder = 2
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ClientEvents.ExtEvents.Strings = (
                        
                          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                          ':"  /  /   "});'#13#10'}')
                    end
                  end
                  object paSearchFilterDtEnd: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 133
                    Top = 0
                    Width = 118
                    Height = 60
                    Hint = ''
                    Margins.Top = 0
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 2
                    object UniLabelDtEnd: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 1
                      Width = 57
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Data Final'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edSearchCRUDDtEnd: TUniDateTimePicker
                      AlignWithMargins = True
                      Left = 3
                      Top = 20
                      Width = 110
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      DateTime = 43597.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      TabOrder = 2
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ClientEvents.ExtEvents.Strings = (
                        
                          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                          ':"  /  /   "});'#13#10'}')
                    end
                  end
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
                    TabOrder = 3
                    DesignSize = (
                      250
                      60)
                    object UniLabel2: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 7
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
                    object cbxSearchCRUDFieldordem: TUniComboBox
                      AlignWithMargins = True
                      Left = 1
                      Top = 28
                      Width = 250
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      Style = csDropDownList
                      Text = 'Emiss'#227'o'
                      Items.Strings = (
                        'Emiss'#227'o'
                        'Numero'
                        'Pessoa')
                      ItemIndex = 0
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 234
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    250
                    60)
                  object UniLabel3: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 7
                    Width = 34
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Status'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object cbxSearchCRUDFieldstatus: TUniComboBox
                    AlignWithMargins = True
                    Left = 0
                    Top = 28
                    Width = 250
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = 'Todos'
                    Items.Strings = (
                      'Enviada'
                      'Cancelada'
                      'Todos')
                    ItemIndex = 2
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
              end
            end
          end
          object dbgSearchCRUD: TUniDBGrid
            Left = 266
            Top = 0
            Width = 709
            Height = 580
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
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            OnDblClick = dbgSearchCRUDDblClick
            Columns = <
              item
                FieldName = 'opcoes'
                Title.Caption = ' '
                Width = 50
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'status'
                Title.Caption = ' '
                Width = 110
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISSAO'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PESSOA'
                Title.Caption = 'PESSOA'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'NOME'
                Width = 250
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'CIDADE'
                Title.Caption = 'CIDADE'
                Width = 250
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'ESTADO'
                Title.Caption = 'U.F.'
                Width = 50
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'VLRTOTAL'
                Title.Caption = 'TOTAL'
                Width = 150
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      object paBaseRegData1: TUniTabSheet
        Hint = ''
        Caption = 'Movimento'
        object UniScrollBox2: TUniScrollBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 969
          Height = 574
          Hint = ''
          Align = alClient
          TabOrder = 0
          object UniPageControlnota: TUniPageControl
            Left = 0
            Top = 0
            Width = 967
            Height = 572
            Hint = ''
            ActivePage = UniTabSheetgeral
            Align = alClient
            TabOrder = 0
            object UniTabSheetgeral: TUniTabSheet
              Hint = ''
              Caption = 'Geral'
              object UniScrollBox3: TUniScrollBox
                Left = 0
                Top = 0
                Width = 959
                Height = 544
                Hint = ''
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  940
                  542)
                ScrollHeight = 713
                ScrollWidth = 847
                ScrollY = 50
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = -47
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    150
                    48)
                  object UniComboBoxparaop: TUniComboBox
                    AlignWithMargins = True
                    Left = 2
                    Top = 16
                    Width = 139
                    Height = 29
                    Hint = ''
                    Style = csDropDownList
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 81
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo Opera'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = -47
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    AlignWithMargins = True
                    Left = 3
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'EMISSAO'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 46
                    Height = 15
                    Hint = ''
                    Caption = 'Emiss'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = -47
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    AlignWithMargins = True
                    Left = 3
                    Top = 16
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'RECEPCAODESPACHO'
                    DataSource = dscrud
                    DateTime = 44561.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'Saida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = -47
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigooperacaomestre: TUniButtonDbEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 2
                    Top = 16
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'OPERACAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    IconCls = 'search'
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 54
                    Height = 15
                    Hint = ''
                    Caption = 'Opera'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 697
                  Top = -47
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object edCodigo: TUniDBEdit
                    AlignWithMargins = True
                    Left = 0
                    Top = 16
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
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
                  object UniLabel7: TUniLabel
                    Left = 1
                    Top = 0
                    Width = 89
                    Height = 15
                    Hint = ''
                    Caption = 'Numero da Nota'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 7
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigocondicaomestre: TUniButtonDbEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 8
                    Top = 19
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'CONDICAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditcodigocondicaomestreExit
                    OnButtonClick = UniButtonDbEditcodigocondicaomestreButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel9: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 95
                    Height = 15
                    Hint = ''
                    Caption = 'Condi'#231#227'o de Pgto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 7
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniEditdescricaocondicao: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel10: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 82
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o Pgto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 7
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigofuncionariomestre: TUniButtonDbEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'FUNCIONARIO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditcodigofuncionariomestreExit
                    OnButtonClick = UniButtonDbEditcodigofuncionariomestreButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel11: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'Vendedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 7
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniEditnomevendedor: TUniEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel12: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 102
                    Height = 15
                    Hint = ''
                    Caption = 'Nome do Vendedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 697
                  Top = 7
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 0
                    Top = 18
                    Width = 141
                    Height = 29
                    Hint = ''
                    DataField = 'COMISSAOFUNCIONARIO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel13: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = '% Com'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Left = 3
                  Top = 61
                  Width = 866
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 15
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 3
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DADOS FATURAMENTO'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 89
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigopessoas: TUniButtonDbEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 2
                    Top = 18
                    Width = 139
                    Height = 29
                    Hint = ''
                    DataField = 'PESSOA'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditcodigopessoasExit
                    OnButtonClick = UniButtonDbEditcodigopessoasButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel14: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 39
                    Height = 15
                    Hint = ''
                    Caption = 'Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 89
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniEditnome: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 17
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 90
                    Height = 15
                    Hint = ''
                    Caption = 'Nome da Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 89
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniEditcpfcnpj: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel16: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'CPF/CNPJ'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 89
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniEditinscricao: TUniEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel17: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 97
                    Height = 15
                    Hint = ''
                    Caption = 'Incri'#231#227'o Estadual'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 697
                  Top = 87
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    48)
                  object UniEditrenasem: TUniEdit
                    AlignWithMargins = True
                    Left = 0
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel19: TUniLabel
                    Left = 2
                    Top = 0
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
                object rcBlock210: TUniContainerPanel
                  Left = 3
                  Top = 141
                  Width = 866
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 16
                  object UniLabel21: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 2
                    Width = 338
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'TOTAIS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 170
                  Width = 343
                  Height = 109
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 17
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 2
                    Top = 21
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'VLRBASEICMS'
                    DataSource = dscrud
                    TabOrder = 1
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel22: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 57
                    Height = 15
                    Hint = ''
                    Caption = 'Base ICMS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 113
                    Top = 21
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'VLRICMS'
                    DataSource = dscrud
                    TabOrder = 3
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel23: TUniLabel
                    Left = 113
                    Top = 0
                    Width = 60
                    Height = 15
                    Hint = ''
                    Caption = 'Valor ICMS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                  end
                  object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                    Left = 228
                    Top = 79
                    Width = 102
                    Height = 29
                    Hint = ''
                    DataField = 'VLRDSPTRIBUTADA'
                    DataSource = dscrud
                    TabOrder = 5
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                    Left = 230
                    Top = 21
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'VLRDSPNTRIBUTADA'
                    DataSource = dscrud
                    TabOrder = 6
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel30: TUniLabel
                    Left = 228
                    Top = 2
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Frete'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 7
                  end
                  object UniLabel31: TUniLabel
                    Left = 228
                    Top = 60
                    Width = 37
                    Height = 15
                    Hint = ''
                    Caption = 'Seguro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 8
                  end
                  object UniLabel73: TUniLabel
                    Left = 0
                    Top = 60
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = 'Base ST'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 9
                  end
                  object UniDBFormattedNumberEditVLRBASEST: TUniDBFormattedNumberEdit
                    Left = 2
                    Top = 79
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'VLRBASESUBSTITUICAO'
                    DataSource = dscrud
                    TabOrder = 10
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel74: TUniLabel
                    Left = 113
                    Top = 60
                    Width = 44
                    Height = 15
                    Hint = ''
                    Caption = 'Valor ST'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 11
                  end
                  object UniDBFormattedNumberEditVLRST: TUniDBFormattedNumberEdit
                    Left = 113
                    Top = 79
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'VLRSUBSTITUICAO'
                    DataSource = dscrud
                    TabOrder = 12
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 352
                  Top = 170
                  Width = 250
                  Height = 109
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  object dbgTITULOS: TUniDBGrid
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 244
                    Height = 103
                    Hint = ''
                    ClientEvents.UniEvents.Strings = (
                      
                        'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'  sende' +
                        'r.setRemoteSort(false);'#13#10'}')
                    TitleFont.Name = 'Calibri'
                    TitleFont.Style = [fsBold]
                    DataSource = dstitulos
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
                    WebOptions.Paged = False
                    LoadMask.Message = 'Loading data...'
                    ForceFit = True
                    BorderStyle = ubsNone
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight]
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    ParentFont = False
                    TabOrder = 1
                    ParentColor = False
                    Color = 15395562
                    TabKeyBehavior = tkNextComponent
                    Columns = <
                      item
                        FieldName = 'PARCELA'
                        Title.Caption = 'Parcela'
                        Width = 60
                        Font.Name = 'Calibri'
                      end
                      item
                        FieldName = 'VENCIMENTO'
                        Title.Caption = 'Vencimento'
                        Width = 130
                        Font.Name = 'Calibri'
                      end
                      item
                        FieldName = 'VALOR'
                        Title.Caption = 'Valor'
                        Width = 100
                        Font.Name = 'Calibri'
                      end>
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 608
                  Top = 170
                  Width = 239
                  Height = 109
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    239
                    109)
                  object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 129
                    Top = 21
                    Width = 104
                    Height = 29
                    Hint = ''
                    DataField = 'VLRPRODUTOS'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 129
                    Top = 79
                    Width = 104
                    Height = 29
                    Hint = ''
                    DataField = 'VLRTOTAL'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 2
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 79
                    Width = 110
                    Height = 29
                    Hint = ''
                    DataField = 'VLRDESPESAS'
                    DataSource = dscrud
                    TabOrder = 3
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEditvlrdespesasExit
                  end
                  object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 21
                    Width = 110
                    Height = 29
                    Hint = ''
                    DataField = 'VLRDESCONTOS'
                    DataSource = dscrud
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEditdescontosExit
                  end
                  object UniLabel24: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'Desconto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 5
                  end
                  object UniLabel25: TUniLabel
                    Left = 129
                    Top = 0
                    Width = 112
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Total Produtos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 6
                  end
                  object UniLabel26: TUniLabel
                    Left = 129
                    Top = 60
                    Width = 59
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Total'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 7
                  end
                  object UniLabel27: TUniLabel
                    Left = 3
                    Top = 60
                    Width = 52
                    Height = 15
                    Hint = ''
                    Caption = 'Despesas'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 8
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Left = 3
                  Top = 281
                  Width = 866
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 20
                  object UniLabel32: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 3
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'PRODUTOS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Left = 3
                  Top = 313
                  Width = 844
                  Height = 350
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 21
                  object UniPageControlprodutos: TUniPageControl
                    Left = 0
                    Top = 0
                    Width = 844
                    Height = 350
                    Hint = ''
                    ActivePage = UniTabSheetProdutos
                    Align = alClient
                    TabOrder = 1
                    object UniTabSheetProdutos: TUniTabSheet
                      Hint = ''
                      Caption = 'Produtos'
                      object UniDBGridprodutos: TUniDBGrid
                        Left = 0
                        Top = 0
                        Width = 836
                        Height = 322
                        Hint = ''
                        DataSource = dsprodutos
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                        WebOptions.Paged = False
                        LoadMask.Message = 'Carregando Item(s)...'
                        ForceFit = True
                        Align = alClient
                        Font.Color = clBlack
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        ParentFont = False
                        TabOrder = 0
                        Summary.Enabled = True
                        OnCellClick = UniDBGridprodutosCellClick
                        Columns = <
                          item
                            FieldName = 'opcoes'
                            Title.Caption = ' '
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end
                          item
                            FieldName = 'PRODUTO'
                            Title.Caption = 'Produtos'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'buscaproduto'
                            Title.Caption = ' '
                            Width = 50
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end
                          item
                            FieldName = 'DESCRICAO'
                            Title.Caption = 'Descri'#231#227'o do Item'
                            Width = 400
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'QUANTIDADE'
                            Title.Caption = 'Qtde'
                            Width = 74
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'PRECO'
                            Title.Caption = 'Pre'#231'o R$'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'DESCONTO'
                            Title.Caption = 'DESCONTO'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            ReadOnly = True
                          end
                          item
                            FieldName = 'TOTAL'
                            Title.Caption = 'R$ Total'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            ReadOnly = True
                          end
                          item
                            FieldName = 'exclui'
                            Title.Caption = ' '
                            Width = 50
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end>
                      end
                    end
                    object UniTabSheettransporte: TUniTabSheet
                      Hint = ''
                      Caption = 'Transporte'
                      object rcBlock270: TUniContainerPanel
                        Left = -9
                        Top = 3
                        Width = 845
                        Height = 25
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        Color = clSkyBlue
                        TabOrder = 0
                        object UniLabel20: TUniLabel
                          AlignWithMargins = True
                          Left = 10
                          Top = 2
                          Width = 251
                          Height = 19
                          Hint = '[[cols:12 | round:all]]'
                          Margins.Left = 6
                          Margins.Top = 6
                          Margins.Right = 6
                          Margins.Bottom = 6
                          AutoSize = False
                          Caption = 'TRANSPORTADORA'
                          ParentFont = False
                          Font.Color = clGray
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                      end
                      object rcBlock280: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 1
                        DesignSize = (
                          150
                          48)
                        object UniButtonDbEditTRANSPORTADORA: TUniButtonDbEdit
                          Tag = 1
                          AlignWithMargins = True
                          Left = 2
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'TRANSPORTADORA'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          Color = clInfoBk
                          OnExit = UniButtonDbEditTRANSPORTADORAExit
                          OnButtonClick = UniButtonDbEditTRANSPORTADORAButtonClick
                          IconCls = 'search'
                        end
                        object UniLabel35: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 40
                          Height = 15
                          Hint = ''
                          Caption = 'Transp.'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock290: TUniContainerPanel
                        Tag = 1
                        Left = 188
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 2
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit3: TUniDBEdit
                          AlignWithMargins = True
                          Left = 2
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'TRANOME'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel36: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 120
                          Height = 15
                          Hint = ''
                          Caption = 'Nome Transportadora'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock300: TUniContainerPanel
                        Tag = 1
                        Left = 364
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 3
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit4: TUniDBEdit
                          AlignWithMargins = True
                          Left = 1
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'TRACPFCNPJ'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel37: TUniLabel
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
                      object rcBlock310: TUniContainerPanel
                        Tag = 1
                        Left = 528
                        Top = 34
                        Width = 144
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 4
                        DesignSize = (
                          144
                          48)
                        object UniDBEdit5: TUniDBEdit
                          AlignWithMargins = True
                          Left = 3
                          Top = 19
                          Width = 133
                          Height = 29
                          Hint = ''
                          DataField = 'TRANUMERO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel38: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 99
                          Height = 15
                          Hint = ''
                          Caption = 'N'#186' IDENTIFICA'#199#195'O'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock320: TUniContainerPanel
                        Tag = 1
                        Left = 686
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 5
                        DesignSize = (
                          150
                          48)
                        object UniLabel47: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 74
                          Height = 15
                          Hint = ''
                          Caption = 'Tipo Emitente'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniComboBoxtrafrete: TUniComboBox
                          AlignWithMargins = True
                          Left = 3
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'Sem Frete'
                            'Emitente'
                            'Destinatario'
                            'Terceiros')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          IconItems = <>
                        end
                      end
                      object rcBlock650: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 94
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 6
                        DesignSize = (
                          150
                          48)
                        object UniLabel28: TUniLabel
                          Left = 2
                          Top = 2
                          Width = 41
                          Height = 15
                          Hint = ''
                          Caption = 'Esp'#233'cie'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBComboBoxESPECIE: TUniDBComboBox
                          Tag = 1
                          AlignWithMargins = True
                          Left = 2
                          Top = 18
                          Width = 144
                          Height = 29
                          Hint = ''
                          Anchors = [akLeft, akTop, akRight]
                          DataField = 'TRAESPECIE'
                          DataSource = dscrud
                          Style = csDropDownList
                          Items.Strings = (
                            'SACO(s)'
                            'KILO(s)'
                            'PE'#199'A(s)'
                            'UNIDADE(s)'
                            'CAIXA(s)'
                            'VOLUME(s)')
                          TabOrder = 2
                          IconItems = <>
                        end
                      end
                      object rcBlock660: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 94
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 7
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit2: TUniDBEdit
                          AlignWithMargins = True
                          Left = 2
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'TRAMARCA'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel29: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 36
                          Height = 15
                          Hint = ''
                          Caption = 'Marca'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock670: TUniContainerPanel
                        Tag = 1
                        Left = 382
                        Top = 94
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 8
                        DesignSize = (
                          150
                          48)
                        object UniDBFormattedNumberEditpesobruto: TUniDBFormattedNumberEdit
                          Tag = 1
                          AlignWithMargins = True
                          Left = 3
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'TRAPESOBRUTO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                        object UniLabel33: TUniLabel
                          Left = 3
                          Top = 0
                          Width = 59
                          Height = 15
                          Hint = ''
                          Caption = 'Peso Bruto'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock680: TUniContainerPanel
                        Tag = 1
                        Left = 558
                        Top = 93
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 9
                        DesignSize = (
                          150
                          48)
                        object UniDBFormattedNumberEditpesoliquido: TUniDBFormattedNumberEdit
                          Tag = 1
                          AlignWithMargins = True
                          Left = 0
                          Top = 19
                          Width = 147
                          Height = 29
                          Hint = ''
                          DataField = 'TRAPESOLIQUIDO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                        object UniLabel34: TUniLabel
                          Left = 0
                          Top = 1
                          Width = 70
                          Height = 15
                          Hint = ''
                          Caption = 'Peso Liquido'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock750: TUniContainerPanel
                        Tag = 1
                        Left = 1
                        Top = 158
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 10
                        DesignSize = (
                          150
                          48)
                        object UniLabel72: TUniLabel
                          Left = 3
                          Top = 2
                          Width = 64
                          Height = 15
                          Hint = ''
                          Caption = 'Quantidade'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBFormattedNumberEditQUANTIDADE: TUniDBFormattedNumberEdit
                          Tag = 1
                          Left = 3
                          Top = 17
                          Width = 121
                          Height = 29
                          Hint = ''
                          DataField = 'TRAQUANTIDADE'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          DecimalSeparator = ','
                          ThousandSeparator = '.'
                        end
                      end
                      object rcBlock760: TUniContainerPanel
                        Tag = 1
                        Left = 194
                        Top = 158
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 11
                      end
                      object rcBlock770: TUniContainerPanel
                        Tag = 1
                        Left = 380
                        Top = 158
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 12
                      end
                      object rcBlock780: TUniContainerPanel
                        Tag = 1
                        Left = 556
                        Top = 157
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 13
                      end
                    end
                    object UniTabSheetobs: TUniTabSheet
                      Hint = ''
                      Caption = 'Observa'#231#245'es'
                      DesignSize = (
                        836
                        322)
                      object rcBlock350: TUniContainerPanel
                        Left = 3
                        Top = 3
                        Width = 845
                        Height = 25
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        Color = clSkyBlue
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 0
                        DesignSize = (
                          845
                          25)
                        object UniLabel40: TUniLabel
                          AlignWithMargins = True
                          Left = 3
                          Top = 3
                          Width = 251
                          Height = 19
                          Hint = '[[cols:12 | round:all]]'
                          Margins.Left = 6
                          Margins.Top = 6
                          Margins.Right = 6
                          Margins.Bottom = 6
                          AutoSize = False
                          Caption = 'OBSERVA'#199#213'ES'
                          Anchors = [akLeft, akTop, akRight]
                          ParentFont = False
                          Font.Color = clGray
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                      end
                      object rcBlock690: TUniContainerPanel
                        Left = 3
                        Top = 37
                        Width = 830
                        Height = 123
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        TabOrder = 1
                        object UniDBMemoobs: TUniDBMemo
                          AlignWithMargins = True
                          Left = 3
                          Top = 3
                          Width = 824
                          Height = 117
                          Hint = ''
                          DataField = 'OBSERVACOES'
                          DataSource = dscrud
                          Align = alClient
                          TabOrder = 1
                        end
                      end
                      object rcBlock710: TUniContainerPanel
                        Left = 3
                        Top = 164
                        Width = 833
                        Height = 25
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        Color = clSkyBlue
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        DesignSize = (
                          833
                          25)
                        object UniLabel39: TUniLabel
                          AlignWithMargins = True
                          Left = 3
                          Top = 2
                          Width = 251
                          Height = 19
                          Hint = '[[cols:12 | round:all]]'
                          Margins.Left = 6
                          Margins.Top = 6
                          Margins.Right = 6
                          Margins.Bottom = 6
                          AutoSize = False
                          Caption = 'OBSERVA'#199#195'O FISCAL'
                          Anchors = [akLeft, akTop, akRight]
                          ParentFont = False
                          Font.Color = clGray
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                      end
                    end
                    object UniTabSheetreferencia: TUniTabSheet
                      Hint = ''
                      Caption = 'Refer'#234'ncia'
                      DesignSize = (
                        836
                        322)
                      object rcBlock410: TUniContainerPanel
                        Left = 3
                        Top = 3
                        Width = 848
                        Height = 25
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        Color = clSkyBlue
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 0
                        object UniLabel45: TUniLabel
                          AlignWithMargins = True
                          Left = 0
                          Top = 4
                          Width = 251
                          Height = 19
                          Hint = '[[cols:12 | round:all]]'
                          Margins.Left = 6
                          Margins.Top = 6
                          Margins.Right = 6
                          Margins.Bottom = 6
                          AutoSize = False
                          Caption = 'REFER'#202'NCIA DE NOTA'
                          ParentFont = False
                          Font.Color = clGray
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                      end
                      object rcBlock700: TUniContainerPanel
                        Left = 3
                        Top = 37
                        Width = 830
                        Height = 48
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        TabOrder = 1
                        DesignSize = (
                          830
                          48)
                        object UniDBEditdevolucao: TUniDBEdit
                          AlignWithMargins = True
                          Left = 3
                          Top = 19
                          Width = 824
                          Height = 29
                          Hint = ''
                          DataField = 'CODIGOBARRASCOMPLEMENTO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel46: TUniLabel
                          Left = 3
                          Top = 0
                          Width = 212
                          Height = 15
                          Hint = ''
                          Caption = 'Codigo de Barras da nota refer'#234'nciada'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                    end
                    object UniTabSheetdetalhesnota: TUniTabSheet
                      Hint = ''
                      Caption = 'Detalhes Nota'
                      DesignSize = (
                        836
                        322)
                      object rcBlock370: TUniContainerPanel
                        Left = -4
                        Top = 6
                        Width = 848
                        Height = 25
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        Color = clSkyBlue
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 0
                        object UniLabel41: TUniLabel
                          AlignWithMargins = True
                          Left = 3
                          Top = 2
                          Width = 251
                          Height = 19
                          Hint = '[[cols:12 | round:all]]'
                          Margins.Left = 6
                          Margins.Top = 6
                          Margins.Right = 6
                          Margins.Bottom = 6
                          AutoSize = False
                          Caption = 'RETORNO NOTA ELETR'#212'NICA'
                          ParentFont = False
                          Font.Color = clGray
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                      end
                      object rcBlock380: TUniContainerPanel
                        Tag = 1
                        Left = 2
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-8]]'
                        ParentColor = False
                        TabOrder = 1
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit6: TUniDBEdit
                          AlignWithMargins = True
                          Left = 4
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'CODIGOBARRAS'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel42: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 94
                          Height = 15
                          Hint = ''
                          Caption = 'Codigo de Barras'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock390: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 2
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit7: TUniDBEdit
                          AlignWithMargins = True
                          Left = 4
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'PROTOCOLO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel43: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 54
                          Height = 15
                          Hint = ''
                          Caption = 'Protocolo'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock400: TUniContainerPanel
                        Tag = 1
                        Left = 372
                        Top = 34
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-1]]'
                        ParentColor = False
                        TabOrder = 3
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit8: TUniDBEdit
                          AlignWithMargins = True
                          Left = 4
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'CANCELADA'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel44: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 26
                          Height = 15
                          Hint = ''
                          Caption = 'TIPO'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock720: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 91
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-6]]'
                        ParentColor = False
                        TabOrder = 4
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit13: TUniDBEdit
                          AlignWithMargins = True
                          Left = 4
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'PEDIDO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel70: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 54
                          Height = 15
                          Hint = ''
                          Caption = 'N'#186' Pedido'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock730: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 91
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 5
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit22: TUniDBEdit
                          AlignWithMargins = True
                          Left = 4
                          Top = 19
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'CODIGO'
                          DataSource = dscrud
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          ReadOnly = True
                        end
                        object UniLabel71: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 93
                          Height = 15
                          Hint = ''
                          Caption = 'Controle Sistema'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock740: TUniContainerPanel
                        Tag = 1
                        Left = 372
                        Top = 91
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 6
                      end
                    end
                  end
                end
              end
            end
            object UniTabSheetfaturamento: TUniTabSheet
              Hint = ''
              Caption = 'Faturamento'
              object UniScrollBox5: TUniScrollBox
                Left = 0
                Top = 0
                Width = 959
                Height = 544
                Hint = ''
                Align = alClient
                TabOrder = 0
                DesignSize = (
                  957
                  542)
                ScrollHeight = 386
                ScrollWidth = 847
                object rcBlock430: TUniContainerPanel
                  Left = 2
                  Top = 3
                  Width = 866
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  object UniLabel48: TUniLabel
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
                    Caption = 'DADOS PARA FATURAMENTO'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock440: TUniContainerPanel
                  Left = 88
                  Top = 32
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniLabel49: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'Nome'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit10: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'NOME'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                end
                object rcBlock450: TUniContainerPanel
                  Left = 281
                  Top = 32
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel50: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Fantasia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit11: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'FANTASIA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                end
                object rcBlock460: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 85
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniLabel51: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Cpf/Cnpj'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit12: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'CPFCNPJ'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                end
                object rcBlock470: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 85
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniLabel52: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Rg/Inscri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEditinscricao: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'INSCRICAO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                end
                object rcBlock480: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 85
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniLabel53: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Rg/Inscri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit14: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'INSCRICAO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                  end
                end
                object rcBlock490: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 85
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit15: TUniDBEdit
                    Left = 4
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'RENASEM'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel54: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'RENASEM'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock500: TUniContainerPanel
                  Tag = 1
                  Left = 697
                  Top = 85
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit16: TUniDBEdit
                    Left = 4
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'PRODUTOR'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel55: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 65
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' Produtor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock510: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 143
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit17: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'CEP'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel56: TUniLabel
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
                object rcBlock520: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 143
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit18: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel57: TUniLabel
                    Left = 2
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
                object rcBlock530: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 143
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit19: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel58: TUniLabel
                    Left = 2
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
                object rcBlock540: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 142
                  Width = 171
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 11
                  DesignSize = (
                    171
                    48)
                  object UniDBEdit20: TUniDBEdit
                    Left = 4
                    Top = 20
                    Width = 167
                    Height = 29
                    Hint = ''
                    DataField = 'BAIRRO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel59: TUniLabel
                    Left = 2
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
                object rcBlock550: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 198
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-9]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit21: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'CIDADE'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel60: TUniLabel
                    Left = 2
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
                object rcBlock560: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 198
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBEditestado: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'ESTADO'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel61: TUniLabel
                    Left = 2
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
                object rcBlock570: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 198
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit23: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'IBGE'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel62: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 25
                    Height = 15
                    Hint = ''
                    Caption = 'IBGE'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock580: TUniContainerPanel
                  Left = 3
                  Top = 249
                  Width = 866
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 15
                  object UniLabel63: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 3
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DADOS PARA COBRAN'#199'A'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock590: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 278
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit24: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'CEPCOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel64: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 76
                    Height = 15
                    Hint = ''
                    Caption = 'Cep Cobran'#231'a'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock600: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 278
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit25: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECOCOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel65: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 106
                    Height = 15
                    Hint = ''
                    Caption = 'Endere'#231'o Cobran'#231'a'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock610: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 278
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit26: TUniDBEdit
                    Left = 2
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'NUMEROCOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel66: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Numero Cobran'#231'a'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock620: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 277
                  Width = 171
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 19
                  DesignSize = (
                    171
                    48)
                  object UniDBEdit27: TUniDBEdit
                    Left = 4
                    Top = 19
                    Width = 167
                    Height = 29
                    Hint = ''
                    DataField = 'NUMEROCOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel67: TUniLabel
                    Left = 2
                    Top = 1
                    Width = 91
                    Height = 15
                    Hint = ''
                    Caption = 'Bairro Cobran'#231'a'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock630: TUniContainerPanel
                  Left = 88
                  Top = 335
                  Width = 150
                  Height = 51
                  Hint = '[[cols:xs-12 sm-12 md-10]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    51)
                  object UniDBEdit28: TUniDBEdit
                    Left = 1
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'CIDADECOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel68: TUniLabel
                    Left = 2
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
                object rcBlock640: TUniContainerPanel
                  Left = 281
                  Top = 335
                  Width = 150
                  Height = 51
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    51)
                  object UniDBEdit29: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 146
                    Height = 29
                    Hint = ''
                    DataField = 'ESTADOCOBRANCA'
                    DataSource = dspessoas
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel69: TUniLabel
                    Left = 2
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
    object paBaseButtons: TUniContainerPanel
      Left = 0
      Top = 40
      Width = 37
      Height = 610
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
      ScrollHeight = 610
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 358
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
          Visible = False
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
            'hint:Abre para Pesquisas t:Busca(s) w:200 d:10000 c:rc-bg-info'#13#10 +
            ']]'#13#10
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
        Height = 149
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
          Top = 38
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-save | '#13#10'cls-ico:font-black'#13#10']]'
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
          Top = 74
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
          Caption = 'C'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCalcRegClick
        end
        object btntransp: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 110
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-truck | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'T'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 4
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btntranspClick
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 299
    Top = 7
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      
        ' SELECT           M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELA' +
        'DA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME, M.CODIGOBARRAS, M.VLRTOTAL' +
        '  FROM'
      ' MVMESTRE  M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)')
    Left = 329
    Top = 7
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object FDQryFiltroCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Size = 1
    end
    object FDQryFiltroPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object FDQryFiltroCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQryFiltroESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQryFiltroCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 45
    end
    object FDQryFiltroNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object FDQryFiltroVLRTOTAL: TFMTBCDField
      FieldName = 'VLRTOTAL'
      Origin = 'VLRTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQryFiltrostatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      OnGetText = FDQryFiltrostatusGetText
      Calculated = True
    end
    object FDQryFiltroopcoes: TStringField
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = FDQryFiltroopcoesGetText
      Calculated = True
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 371
    Top = 7
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'MVMESTRE'
    SQL.Strings = (
      'SELECT * FROM mvmestre where codigo = :codigo')
    Left = 401
    Top = 7
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dstitulos: TDataSource
    AutoEdit = False
    DataSet = tbtitulos
    Left = 435
    Top = 7
  end
  object tbtitulos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 465
    Top = 7
    object tbtitulosPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object tbtitulosVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object tbtitulosVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
  end
  object memprodutos: TFDMemTable
    BeforePost = memprodutosBeforePost
    AfterPost = memprodutosAfterPost
    BeforeDelete = memprodutosBeforeDelete
    AfterDelete = memprodutosAfterDelete
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 496
    Top = 7
    object IntegerField1: TIntegerField
      FieldName = 'PRODUTO'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object memprodutosPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '##,###,##0.0000'
      EditFormat = '##,###,##0.0000'
      currency = True
    end
    object memprodutosTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object memprodutosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '##,###,##0.000'
    end
    object memprodutosBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      currency = True
    end
    object memprodutosVALORICMS: TFloatField
      FieldName = 'VALORICMS'
      currency = True
    end
    object memprodutosPERCICMS: TFloatField
      FieldName = 'PERCICMS'
    end
    object memprodutosCST: TStringField
      FieldName = 'CST'
    end
    object memprodutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
    object memprodutosPIS: TStringField
      FieldName = 'PIS'
    end
    object memprodutosCOFINS: TStringField
      FieldName = 'COFINS'
    end
    object memprodutosICM0: TFloatField
      FieldName = 'ICM0'
    end
    object memprodutosICM1: TFloatField
      FieldName = 'ICM1'
    end
    object memprodutosICM2: TFloatField
      FieldName = 'ICM2'
    end
    object memprodutosBAS0: TFloatField
      FieldName = 'BAS0'
    end
    object memprodutosBAS1: TFloatField
      FieldName = 'BAS1'
    end
    object memprodutosBAS2: TFloatField
      FieldName = 'BAS2'
    end
    object memprodutosSITUACAOLOCAL: TStringField
      FieldName = 'SITUACAOLOCAL'
    end
    object memprodutosSITUACAOOUTRAS: TStringField
      FieldName = 'SITUACAOOUTRAS'
    end
    object memprodutosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object memprodutosDESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object memprodutosNUMERONCM: TStringField
      FieldName = 'NUMERONCM'
      Size = 0
    end
    object memprodutosSERIE: TStringField
      FieldName = 'SERIE'
    end
    object memprodutosSAFRA: TIntegerField
      FieldName = 'SAFRA'
    end
    object memprodutosNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memprodutosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object memprodutosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object memprodutosUF: TStringField
      FieldName = 'UF'
    end
    object memprodutosPESSOA: TIntegerField
      FieldName = 'PESSOA'
    end
    object memprodutosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object memprodutosCOMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object memprodutosNCM: TStringField
      FieldName = 'NCM'
    end
    object memprodutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object memprodutosPERCIPI: TFloatField
      FieldName = 'PERCIPI'
    end
    object memprodutosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object memprodutosVALORIPI: TFloatField
      FieldName = 'VALORIPI'
    end
    object memprodutosOPERACAO: TIntegerField
      FieldName = 'OPERACAO'
    end
    object memprodutosPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object memprodutosSALDOPONTO: TFloatField
      FieldName = 'SALDOPONTO'
    end
    object memprodutosTERMOSEMENTE: TStringField
      FieldName = 'TERMOSEMENTE'
    end
    object memprodutosBOLETIMSEMENTE: TStringField
      FieldName = 'BOLETIMSEMENTE'
    end
    object memprodutosVALORCULTURAL: TFloatField
      FieldName = 'VALORCULTURAL'
    end
    object memprodutosLOTESEMENTE: TStringField
      FieldName = 'LOTESEMENTE'
    end
    object memprodutosLOTEORIGEM: TStringField
      FieldName = 'LOTEORIGEM'
    end
    object memprodutosSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
    end
    object memprodutosCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object memprodutosCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
    end
    object memprodutosGERMINACAO: TFloatField
      FieldName = 'GERMINACAO'
    end
    object memprodutosSAFRAVALIDA: TStringField
      FieldName = 'SAFRAVALIDA'
    end
    object memprodutosLOTEENTRADA: TStringField
      FieldName = 'LOTEENTRADA'
    end
    object memprodutosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
    end
    object memprodutosCUSTOPONTO: TFloatField
      FieldName = 'CUSTOPONTO'
    end
    object memprodutosTOTALPONTO: TFloatField
      FieldName = 'TOTALPONTO'
    end
    object memprodutosPERCREDUCAO: TFloatField
      FieldName = 'PERCREDUCAO'
    end
    object memprodutosexclui: TStringField
      FieldName = 'exclui'
      OnGetText = memprodutosexcluiGetText
    end
    object memprodutosbuscaproduto: TStringField
      FieldName = 'buscaproduto'
      OnGetText = memprodutosbuscaprodutoGetText
    end
    object memprodutosbuscalote: TStringField
      FieldName = 'buscalote'
      OnGetText = memprodutosbuscaloteGetText
    end
    object memprodutosDESCRICAO_NOTA: TStringField
      FieldName = 'DESCRICAO_NOTA'
      Size = 150
    end
    object memprodutosCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 50
    end
    object memprodutosCANCELADA: TStringField
      FieldName = 'CANCELADA'
    end
    object memprodutosESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object memprodutosCONTRATO: TIntegerField
      FieldName = 'CONTRATO'
    end
    object memprodutosDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object memprodutosFRETE: TFloatField
      FieldName = 'FRETE'
    end
    object memprodutosPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object memprodutosPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object memprodutosEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 15
    end
    object memprodutosCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object memprodutosPESOSACO: TFloatField
      FieldName = 'PESOSACO'
    end
    object memprodutosVALIDADE: TStringField
      FieldName = 'VALIDADE'
      Size = 10
    end
    object memprodutosTOTALPIS: TFloatField
      FieldName = 'TOTALPIS'
    end
    object memprodutosTOTALCOFINS: TFloatField
      FieldName = 'TOTALCOFINS'
    end
    object memprodutosVLRPIS: TFloatField
      FieldName = 'VLRPIS'
    end
    object memprodutosVLRCOFINS: TFloatField
      FieldName = 'VLRCOFINS'
    end
    object memprodutosPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object memprodutosSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object memprodutosDESPESA: TFloatField
      FieldName = 'DESPESA'
    end
    object memprodutoserro: TStringField
      Alignment = taCenter
      FieldName = 'erro'
    end
    object memprodutosopcoes: TStringField
      FieldName = 'opcoes'
      OnGetText = memprodutosopcoesGetText
    end
    object memprodutosENTREGUE: TFloatField
      FieldName = 'ENTREGUE'
    end
    object memprodutosSEMENTENOME: TStringField
      FieldName = 'SEMENTENOME'
      Size = 100
    end
    object memprodutosPERCCOFINS: TFloatField
      FieldName = 'PERCCOFINS'
    end
    object memprodutosPERCPIS: TFloatField
      FieldName = 'PERCPIS'
    end
    object memprodutosCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Size = 30
    end
    object memprodutosBASESUB: TFloatField
      FieldName = 'BASESUB'
    end
    object memprodutosVALORSUB: TFloatField
      FieldName = 'VALORSUB'
    end
    object memprodutosPESOLIQUIDOPRODUTO: TFloatField
      FieldName = 'PESOLIQUIDOPRODUTO'
    end
    object memprodutosPESOBRUTOPRODUTO: TFloatField
      FieldName = 'PESOBRUTOPRODUTO'
    end
    object memprodutosPERCSUB: TFloatField
      FieldName = 'PERCSUB'
    end
    object memprodutosIVA: TFloatField
      FieldName = 'IVA'
    end
    object memprodutosPERCST: TFloatField
      FieldName = 'PERCST'
    end
  end
  object dsprodutos: TDataSource
    DataSet = memprodutos
    Left = 524
    Top = 7
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 663
    Top = 6
    object D1: TUniMenuItem
      Caption = 'Duplicata Mercantil'
      ImageIndex = 10
      OnClick = D1Click
    end
    object N9: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object C1: TUniMenuItem
      Caption = 'Contrato de Transporte'
      ImageIndex = 52
      Visible = False
      OnClick = C1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object C2: TUniMenuItem
      Caption = 'Controle de Etiqueta'
      ImageIndex = 36
      Visible = False
      OnClick = C2Click
    end
    object N5: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object A1: TUniMenuItem
      Caption = 'Autoriza'#231#227'o de Reembalo'
      ImageIndex = 101
      Visible = False
      OnClick = A1Click
    end
    object N7: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object d2: TUniMenuItem
      Caption = 'Declara'#231#227'o de Retirada'
      ImageIndex = 68
      Visible = False
      OnClick = d2Click
    end
    object N8: TUniMenuItem
      Caption = '-'
    end
    object L1: TUniMenuItem
      Caption = 'Log do Movimento'
      ImageIndex = 27
      OnClick = L1Click
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object O1: TUniMenuItem
      Caption = 'Op'#231'oes da Nota'
      ImageIndex = 40
      object P1: TUniMenuItem
        Caption = 'PDF da Nota Eletr'#244'nica'
        ImageIndex = 36
        Visible = False
      end
      object N10: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object B1: TUniMenuItem
        Caption = 'Baixar XML da Nota'
        ImageIndex = 14
        OnClick = B1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object C3: TUniMenuItem
        Caption = 'Colocar Chave/Protocolo'
        ImageIndex = 50
        OnClick = C3Click
      end
    end
  end
  object dspessoas: TDataSource
    AutoEdit = False
    DataSet = FDQrypessoas
    Left = 563
    Top = 7
  end
  object FDQrypessoas: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from pessoas where codigo = :pessoa')
    Left = 593
    Top = 7
    ParamData = <
      item
        Name = 'PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 695
    Top = 6
    object I1: TUniMenuItem
      Caption = 'Importar Documento'
      ImageIndex = 112
      OnClick = I1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object I2: TUniMenuItem
      Caption = 'Imposto Diferenciado'
      ImageIndex = 26
      OnClick = I2Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object E1: TUniMenuItem
      Caption = 'Envio Eletr'#244'nico'
      ImageIndex = 24
      OnClick = E1Click
    end
  end
  object UniPopupMenudetalhesnota: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 727
    Top = 6
    object UniMenuItem1: TUniMenuItem
      Caption = 'Editar Detalhes Simples da Nota'
      ImageIndex = 112
      OnClick = UniMenuItem1Click
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnSaveReg
    Enabled = True
    Left = 824
    Top = 65533
  end
  object UniPopupMenuopcaoprodutos: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 664
    Top = 40
    object D4: TUniMenuItem
      Caption = 'Detalhes do Produto'
      ImageIndex = 31
      OnClick = D4Click
    end
  end
end
