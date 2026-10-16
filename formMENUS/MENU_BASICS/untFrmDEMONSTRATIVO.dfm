inherited frmDEMONSTRATIVO: TfrmDEMONSTRATIVO
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
        OnClick = labExitClick
      end
      object labTitleForm: TUniLabel
        Left = 49
        Top = 8
        Width = 150
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'DEMONSTRATIVO'
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
      TabOrder = 2
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
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-file-pdf | '#13#10'cls-ico:font-black'#13 +
            #10']]'
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
      ActivePage = tabSearch
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
              ScrollHeight = 269
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
                Top = 233
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
                Height = 181
                Hint = ''
                Margins.Left = 10
                Margins.Top = 6
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 2
                object paSearchFilterPeriodSelect: TUniContainerPanel
                  AlignWithMargins = True
                  Left = -1
                  Top = 0
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
                  TabOrder = 1
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
                      OnExit = edSearchCRUDDtIniExit
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
                    Left = 3
                    Top = 60
                    Width = 248
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 3
                    object UniLabel1: TUniLabel
                      AlignWithMargins = True
                      Left = 0
                      Top = 9
                      Width = 93
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Refer'#234'nte ao m'#234's'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDateTimePickerreferente: TUniDateTimePicker
                      AlignWithMargins = True
                      Left = 0
                      Top = 28
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
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 1
                  Top = 120
                  Width = 248
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    248
                    60)
                  object UniLabelc1: TUniLabel
                    AlignWithMargins = True
                    Left = -1
                    Top = 6
                    Width = 69
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Respons'#225'vel'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditcodresponsavel: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 1
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnClick = UniButtonEditcodresponsavelClick
                    IconCls = 'search'
                  end
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
            DataSource = dsdemo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            ForceFit = True
            Align = alClient
            Font.Height = -13
            Font.Name = 'Calibri'
            ParentFont = False
            TabOrder = 2
            Exporter.Enabled = True
            Columns = <
              item
                FieldName = 'ESTADO'
                Title.Caption = 'ESTADO'
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'ESPECIE'
                Title.Caption = 'ESPECIE'
                Width = 350
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CULTIVAR'
                Title.Caption = 'CULTIVAR'
                Width = 170
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'CATEGORIA'
                Title.Caption = 'CATEGORIA'
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'QTD_AMOSTRA'
                Title.Caption = 'QTD AMOSTRA'
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'REPRESENTATIVIDADE'
                Title.Caption = 'REPRE.'
                Width = 120
                Font.Name = 'Calibri'
              end>
          end
        end
      end
    end
  end
  object TB_DEMO: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SAFRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESPECIE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CULTIVAR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CATEGORIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QTD_AMOSTRA'
        DataType = ftFloat
      end
      item
        Name = 'REPRESENTATIVIDADE'
        DataType = ftFloat
      end
      item
        Name = 'PE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PE90'
        DataType = ftString
        Size = 20
      end
      item
        Name = '90'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NULO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 906
    Top = 1
    object TB_DEMOESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object TB_DEMOSAFRA: TStringField
      FieldName = 'SAFRA'
    end
    object TB_DEMOESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 50
    end
    object TB_DEMOCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 50
    end
    object TB_DEMOCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
    end
    object TB_DEMOQTD_AMOSTRA: TFloatField
      FieldName = 'QTD_AMOSTRA'
    end
    object TB_DEMOREPRESENTATIVIDADE: TFloatField
      FieldName = 'REPRESENTATIVIDADE'
      DisplayFormat = '#,0.000'
    end
    object TB_DEMOPE: TStringField
      FieldName = 'PE'
    end
    object TB_DEMOPE90: TStringField
      FieldName = 'PE90'
    end
    object TB_DEMOField90: TStringField
      FieldName = '90'
    end
    object TB_DEMOSP: TStringField
      FieldName = 'SP'
    end
    object TB_DEMOOC: TStringField
      FieldName = 'OC'
    end
    object TB_DEMOOE: TStringField
      FieldName = 'OE'
    end
    object TB_DEMOSS: TStringField
      FieldName = 'SS'
    end
    object TB_DEMONT: TStringField
      FieldName = 'NT'
    end
    object TB_DEMONP: TStringField
      FieldName = 'NP'
    end
    object TB_DEMOINF: TStringField
      FieldName = 'INF'
    end
    object TB_DEMOGE: TStringField
      FieldName = 'GE'
    end
    object TB_DEMONULO: TStringField
      FieldName = 'NULO'
    end
    object TB_DEMOAMOSTRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'AMOSTRA'
      Calculated = True
    end
    object TB_DEMOCULTIVAR_CODIGO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CULTIVAR_CODIGO'
      Calculated = True
    end
    object TB_DEMOESPECIE_CODIGO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ESPECIE_CODIGO'
      Calculated = True
    end
  end
  object TB_DEMO_RESULTADO: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SAFRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESPECIE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CULTIVAR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CATEGORIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QTD_AMOSTRA'
        DataType = ftFloat
      end
      item
        Name = 'REPRESENTATIVIDADE'
        DataType = ftFloat
      end
      item
        Name = 'PE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PE90'
        DataType = ftString
        Size = 20
      end
      item
        Name = '90'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NULO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 960
    Top = 1
    object StringField3: TStringField
      FieldName = 'ESTADO'
    end
    object StringField4: TStringField
      FieldName = 'SAFRA'
    end
    object StringField5: TStringField
      FieldName = 'ESPECIE'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'CULTIVAR'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'CATEGORIA'
    end
    object FloatField5: TFloatField
      FieldName = 'QTD_AMOSTRA'
    end
    object FloatField6: TFloatField
      FieldName = 'REPRESENTATIVIDADE'
    end
    object StringField8: TStringField
      FieldName = 'PE'
    end
    object StringField9: TStringField
      FieldName = 'PE90'
    end
    object StringField10: TStringField
      FieldName = '90'
    end
    object StringField11: TStringField
      FieldName = 'SP'
    end
    object StringField12: TStringField
      FieldName = 'OC'
    end
    object StringField13: TStringField
      FieldName = 'OE'
    end
    object StringField14: TStringField
      FieldName = 'SS'
    end
    object StringField15: TStringField
      FieldName = 'NT'
    end
    object StringField16: TStringField
      FieldName = 'NP'
    end
    object StringField17: TStringField
      FieldName = 'INF'
    end
    object StringField18: TStringField
      FieldName = 'GE'
    end
    object StringField19: TStringField
      FieldName = 'NULO'
    end
    object TB_DEMO_RESULTADOAMOSTRA: TStringField
      FieldKind = fkCalculated
      FieldName = 'AMOSTRA'
      Calculated = True
    end
    object TB_DEMO_RESULTADOESPECIE_CODIGO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ESPECIE_CODIGO'
      Calculated = True
    end
    object TB_DEMO_RESULTADOCULTIVAR_CODIGO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CULTIVAR_CODIGO'
      Calculated = True
    end
  end
  object dsdemo: TDataSource
    DataSet = TB_DEMO
    Left = 867
    Top = 2
  end
end
