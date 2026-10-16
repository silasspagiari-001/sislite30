inherited frmMESTRE: TfrmMESTRE
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
        Left = 45
        Top = 8
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
      TabOrder = 2
      ScrollHeight = 610
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 321
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
          Visible = False
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
        Height = 112
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
      ActivePage = paBaseRegData1
      Align = alClient
      TabOrder = 3
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
          ScrollHeight = 1403
          ScrollWidth = 868
          ScrollY = 486
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = -483
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 0
            DesignSize = (
              150
              48)
            object UniLabel8: TUniLabel
              Left = 3
              Top = 0
              Width = 43
              Height = 15
              Hint = ''
              Caption = 'Numero'
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
              DataField = 'NUMERO'
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
            Top = -483
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              150
              48)
            object UniLabel4: TUniLabel
              Left = 3
              Top = 0
              Width = 46
              Height = 15
              Hint = ''
              Caption = 'Emiss'#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBDateTimePickeremissao: TUniDBDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'EMISSAO'
              DataSource = dscrud
              DateTime = 44560.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 372
            Top = -483
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              150
              48)
            object UniLabel5: TUniLabel
              Left = 3
              Top = 0
              Width = 54
              Height = 15
              Hint = ''
              Caption = 'Opera'#231#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniButtonDbEditcodigopessoas: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'OPERACAO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              IconCls = 'search'
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 542
            Top = -483
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              150
              48)
            object UniButtonDbEditcondicao: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 2
              Top = 18
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'CONDICAO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clInfoBk
              OnExit = UniButtonDbEditcondicaoExit
              OnButtonClick = UniButtonDbEditcondicaoButtonClick
              IconCls = 'search'
            end
            object UniLabel6: TUniLabel
              Left = 2
              Top = 0
              Width = 79
              Height = 15
              Hint = ''
              Caption = 'Condi'#231#227'o Pgto'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 718
            Top = -483
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              150
              48)
            object UniEditdescricaocondicao: TUniEdit
              AlignWithMargins = True
              Left = 2
              Top = 18
              Width = 144
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
            object UniLabel7: TUniLabel
              Left = 2
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
          object rcBlock60: TUniContainerPanel
            Left = 3
            Top = -427
            Width = 865
            Height = 22
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 5
            object UniLabel18: TUniLabel
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
              Caption = 'D A D O S    DO    C L I E N T E '
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock70: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = -397
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              150
              48)
            object UniButtonDbEdit2: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'PESSOA'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clInfoBk
              OnExit = UniButtonDbEdit2Exit
              OnButtonClick = UniButtonDbEdit2ButtonClick
              IconCls = 'search'
            end
            object UniLabel9: TUniLabel
              Left = 3
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
          object rcBlock80: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = -397
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              150
              48)
            object UniLabel10: TUniLabel
              Left = 3
              Top = 0
              Width = 89
              Height = 15
              Hint = ''
              Caption = 'Nome do Cliente'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniEditnome: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
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
            end
          end
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = -397
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
            object UniEditclentecpf: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
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
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 558
            Top = -398
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              150
              48)
            object UniLabel12: TUniLabel
              Left = 3
              Top = 1
              Width = 72
              Height = 15
              Hint = ''
              Caption = 'Inscri'#231#227'o/RG'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniEditclienterg: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 144
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
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = -347
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              150
              48)
            object UniButtonEditclientecep: TUniButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 26
              Hint = ''
              Text = '0'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnExit = UniButtonEditclientecepExit
              OnButtonClick = UniButtonEditclientecepButtonClick
              IconCls = 'search'
            end
            object UniLabel13: TUniLabel
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
          object rcBlock120: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = -347
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              150
              48)
            object UniEditclienteendereco: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
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
            end
            object UniLabel14: TUniLabel
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
          object rcBlock130: TUniContainerPanel
            Tag = 1
            Left = 372
            Top = -347
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 12
            DesignSize = (
              150
              48)
            object UniEditclientenumero: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
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
            end
            object UniLabel15: TUniLabel
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
          object rcBlock140: TUniContainerPanel
            Tag = 1
            Left = 542
            Top = -347
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              150
              48)
            object UniEditclientebairro: TUniEdit
              AlignWithMargins = True
              Left = 2
              Top = 19
              Width = 144
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
            end
            object UniLabel16: TUniLabel
              Left = 2
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
          object rcBlock150: TUniContainerPanel
            Tag = 1
            Left = 710
            Top = -347
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 14
            DesignSize = (
              150
              48)
            object UniEditclientemunicipio: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
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
            end
            object UniLabel17: TUniLabel
              Left = 2
              Top = 0
              Width = 57
              Height = 15
              Hint = ''
              Caption = 'Municipio'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock160: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = -297
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 15
            DesignSize = (
              150
              48)
            object UniEditclienteestado: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
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
            end
            object UniLabel19: TUniLabel
              Left = 3
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
          object rcBlock170: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = -297
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 16
            DesignSize = (
              150
              48)
            object UniEditclientetelefone: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
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
            end
            object UniLabel20: TUniLabel
              Left = 3
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
          object rcBlock180: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = -297
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 17
            DesignSize = (
              150
              48)
            object UniEditclientecelular: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 17
              Width = 144
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
            end
            object UniLabel21: TUniLabel
              Left = 3
              Top = 0
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
          object rcBlock190: TUniContainerPanel
            Tag = 1
            Left = 558
            Top = -298
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 18
            DesignSize = (
              150
              48)
            object UniEditclienteemail: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 144
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecLowerCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel22: TUniLabel
              Left = 3
              Top = 0
              Width = 47
              Height = 15
              Hint = ''
              Caption = 'Email-@'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock200: TUniContainerPanel
            Left = 3
            Top = -245
            Width = 865
            Height = 22
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 19
            object UniLabel23: TUniLabel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'D A D O S    DA   V E N D A'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock210: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = -220
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 20
            DesignSize = (
              150
              48)
            object UniButtonDbEditvendedor: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 2
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'FUNCIONARIO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clInfoBk
              OnExit = UniButtonDbEditvendedorExit
              OnButtonClick = UniButtonDbEditvendedorButtonClick
              IconCls = 'search'
            end
            object UniLabel24: TUniLabel
              Left = 0
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
          object rcBlock220: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = -220
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 21
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
            object UniLabel25: TUniLabel
              Left = 2
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
          object rcBlock230: TUniContainerPanel
            Tag = 1
            Left = 372
            Top = -220
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 22
            DesignSize = (
              150
              48)
            object UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 147
              Height = 29
              Hint = ''
              DataField = 'COMISSAOFUNCIONARIO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel26: TUniLabel
              Left = 3
              Top = 0
              Width = 66
              Height = 15
              Hint = ''
              Caption = '% Comiss'#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock240: TUniContainerPanel
            Left = 3
            Top = -170
            Width = 865
            Height = 22
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 23
            object UniLabel27: TUniLabel
              AlignWithMargins = True
              Left = 0
              Top = 2
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'I N F O R M A '#199' '#195' O  A D I C I O N A L'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock250: TUniContainerPanel
            Left = 3
            Top = -142
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 24
            DesignSize = (
              150
              48)
            object UniLabel28: TUniLabel
              Left = 4
              Top = 0
              Width = 72
              Height = 15
              Hint = ''
              Caption = 'Testemunha I'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdittestemunhai: TUniDBEdit
              Left = 2
              Top = 19
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'TESTEMUNHAI'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock260: TUniContainerPanel
            Left = 196
            Top = -142
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 25
            DesignSize = (
              150
              48)
            object UniLabel29: TUniLabel
              Left = 2
              Top = 0
              Width = 27
              Height = 15
              Hint = ''
              Caption = 'CPF I'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEditcpftestemunhai: TUniDBEdit
              Left = 3
              Top = 19
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'TESTEMUNHACPFI'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock270: TUniContainerPanel
            Left = 3
            Top = -92
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 26
            DesignSize = (
              150
              48)
            object UniDBEdittestemunhaii: TUniDBEdit
              Left = 2
              Top = 17
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'TESTEMUNHAII'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel30: TUniLabel
              Left = 4
              Top = 0
              Width = 76
              Height = 15
              Hint = ''
              Caption = 'Testemunha II'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock280: TUniContainerPanel
            Left = 196
            Top = -92
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 27
            DesignSize = (
              150
              48)
            object UniDBEditcpftestemunhaii: TUniDBEdit
              Left = 4
              Top = 17
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'TESTEMUNHACPFII'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel31: TUniLabel
              Left = 2
              Top = 0
              Width = 31
              Height = 15
              Hint = ''
              Caption = 'CPF II'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock290: TUniContainerPanel
            Left = 3
            Top = -40
            Width = 865
            Height = 121
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 28
            DesignSize = (
              865
              121)
            object UniLabel32: TUniLabel
              Left = 4
              Top = 7
              Width = 71
              Height = 15
              Hint = ''
              Caption = 'Observa'#231#245'es'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBMemoobservacao: TUniDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 28
              Width = 860
              Height = 89
              Hint = ''
              DataField = 'OBSERVACOES'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock300: TUniContainerPanel
            Left = 3
            Top = 83
            Width = 865
            Height = 22
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 29
            object UniLabel33: TUniLabel
              AlignWithMargins = True
              Left = 0
              Top = 3
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'F I N A N C E I R O'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock310: TUniContainerPanel
            Left = 3
            Top = 111
            Width = 865
            Height = 200
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 30
            object dbgTITULOS: TUniDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 859
              Height = 194
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
                  Title.Caption = 'PARCELA'
                  Width = 74
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'VENCIMENTO'
                  Title.Caption = 'VENCIMENTO'
                  Width = 130
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'VALOR'
                  Title.Caption = 'VALOR'
                  Width = 74
                  Font.Name = 'Calibri'
                end>
            end
          end
          object rcBlock320: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 317
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 31
            DesignSize = (
              150
              48)
            object UniLabel34: TUniLabel
              Left = 3
              Top = -1
              Width = 52
              Height = 15
              Hint = ''
              Caption = 'Despesas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
              Left = 3
              Top = 16
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRDESPESAS'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock330: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 317
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 32
            DesignSize = (
              150
              48)
            object UniLabel35: TUniLabel
              Left = 3
              Top = -1
              Width = 43
              Height = 15
              Hint = ''
              Caption = 'Entrada'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBFormattedNumberEditvlrentrada: TUniDBFormattedNumberEdit
              Left = 2
              Top = 16
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRENTRADA'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock340: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = 317
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 33
            DesignSize = (
              150
              48)
            object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
              Left = 2
              Top = 16
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRPRODUTOS'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              ReadOnly = True
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel36: TUniLabel
              Left = 3
              Top = -1
              Width = 82
              Height = 15
              Hint = ''
              Caption = 'VLR PRODUTOS'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock350: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 367
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 34
            DesignSize = (
              150
              48)
            object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
              Left = 2
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRPERCDESCONTO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
              OnExit = UniDBFormattedNumberEditdescontosExit
            end
            object UniLabel37: TUniLabel
              Left = 3
              Top = 0
              Width = 63
              Height = 15
              Hint = ''
              Caption = '% Desconto'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock360: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 367
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 35
            DesignSize = (
              150
              48)
            object UniDBFormattedNumberEditdescontoreal: TUniDBFormattedNumberEdit
              Left = 2
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRDESCONTOS'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
              OnExit = UniDBFormattedNumberEditdescontorealExit
            end
            object UniLabel38: TUniLabel
              Left = 3
              Top = 0
              Width = 61
              Height = 15
              Hint = ''
              Caption = '$ Desconto'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock370: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = 367
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 36
            DesignSize = (
              150
              48)
            object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
              Left = 2
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'VLRTOTAL'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              ReadOnly = True
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel39: TUniLabel
              Left = 3
              Top = 0
              Width = 54
              Height = 15
              Hint = ''
              Caption = 'VLR TOTAL'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock380: TUniContainerPanel
            Left = 3
            Top = 417
            Width = 865
            Height = 500
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 37
            object UniDBGridprodutos: TUniDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 859
              Height = 494
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
              TabOrder = 1
              Summary.Enabled = True
              OnCellClick = UniDBGridprodutosCellClick
              Columns = <
                item
                  FieldName = 'buscaproduto'
                  Title.Caption = ' '
                  Width = 50
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'PRODUTO'
                  Title.Caption = 'Codigo'
                  Width = 60
                  Visible = False
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'CODREFERENCIA'
                  Title.Caption = 'COD. REF.'
                  Width = 80
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'DESCRICAO'
                  Title.Caption = 'Descri'#231#227'o do Item'
                  Width = 400
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'ALTURA'
                  Title.Caption = 'ALT'
                  Width = 50
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'LARGURA'
                  Title.Caption = 'LAR'
                  Width = 50
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'COMPRIMENTO'
                  Title.Caption = 'COM'
                  Width = 50
                  Font.Color = clBlack
                  Font.Name = 'Calibri'
                  Alignment = taCenter
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
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 411
    Top = 7
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      
        ' SELECT           M.CODIGO, M.NUMERO,M.DOCUMENTO,M.EMISSAO,M.SER' +
        'IE,M.CANCELADA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.STATUS,M.VLRT' +
        'OTAL  FROM'
      ' MVMESTRE  M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)')
    Left = 441
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
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
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
    object FDQryFiltroopcoes: TStringField
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = FDQryFiltroopcoesGetText
      Calculated = True
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object FDQryFiltroSTATUS: TStringField
      FieldName = 'STATUS'
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 483
    Top = 7
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM mvmestre where codigo = :codigo')
    Left = 513
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
    Left = 547
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
    Left = 577
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
    object tbtitulosexclui: TStringField
      FieldName = 'exclui'
      Size = 1
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
    Left = 610
    Top = 9
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
    end
    object memprodutosENTREGUE: TFloatField
      FieldName = 'ENTREGUE'
    end
    object memprodutosALTURA: TStringField
      FieldName = 'ALTURA'
    end
    object memprodutosLARGURA: TStringField
      FieldName = 'LARGURA'
    end
    object memprodutosCOMPRIMENTO: TStringField
      FieldName = 'COMPRIMENTO'
    end
    object memprodutosCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Size = 30
    end
  end
  object dsprodutos: TDataSource
    DataSet = memprodutos
    Left = 638
    Top = 9
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 847
    Top = 6
    object I3: TUniMenuItem
      Caption = 'Impress'#227'o Documento'
      ImageIndex = 36
      OnClick = I3Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object C1: TUniMenuItem
      Caption = 'Contrato do Cliente'
      ImageIndex = 27
      OnClick = C1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object O1: TUniMenuItem
      Caption = 'Or'#231'amento Simulado'
      ImageIndex = 26
      object M1: TUniMenuItem
        Caption = 'Material - MDF'
        ImageIndex = 26
        OnClick = M1Click
      end
      object N5: TUniMenuItem
        Caption = '-'
      end
      object M2: TUniMenuItem
        Caption = 'Material - METAL'
        ImageIndex = 26
        OnClick = M2Click
      end
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object P1: TUniMenuItem
      Caption = 'Produ'#231#227'o'
      ImageIndex = 104
      Visible = False
      object o2: TUniMenuItem
        Caption = 'O.S. para Produ'#231#227'o'
        ImageIndex = 103
        Visible = False
      end
      object N6: TUniMenuItem
        Caption = '-'
      end
      object O3: TUniMenuItem
        Caption = 'O.S. para Estoquista'
        ImageIndex = 116
      end
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 887
    Top = 6
    object I1: TUniMenuItem
      Caption = 'Importar Documento'
      ImageIndex = 61
      OnClick = I1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object i2: TUniMenuItem
      Caption = 'Impress'#227'o do Documento'
      ImageIndex = 52
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnSaveReg
    Enabled = True
    Left = 672
    Top = 13
  end
end
