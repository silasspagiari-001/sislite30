inherited frmBaseTITULOS: TfrmBaseTITULOS
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
        Left = 280
        Top = 10
        Width = 37
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Visible = False
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
      object ed_Table_ItemSel: TUniEdit
        Left = 573
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 3
      end
      object ed_FormOrigin: TUniEdit
        Left = 593
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 4
      end
      object ed_FormOrigin_Tab: TUniEdit
        Left = 613
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 5
      end
      object ed_Table_Status: TUniEdit
        Left = 634
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 6
      end
      object ed_Order_Search: TUniEdit
        Left = 655
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 7
      end
      object ed_Where_Search: TUniEdit
        Left = 675
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 8
      end
      object ed_CodMaster: TUniEdit
        Left = 693
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 9
      end
      object ed_PK: TUniEdit
        Left = 711
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 10
      end
      object ed_FieldMasks: TUniEdit
        Left = 728
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 11
      end
      object ed_OldPKValue: TUniEdit
        Left = 747
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 12
      end
      object ed_Table_Status_OLD: TUniEdit
        Left = 764
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 13
      end
      object ed_GenNextID_OnNew: TUniEdit
        Left = 782
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 14
      end
      object ed_AskNewRec_AfterPost: TUniEdit
        Left = 799
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 15
      end
      object dbgExport: TUniDBGrid
        Left = 820
        Top = -10
        Width = 15
        Height = 22
        Hint = ''
        WebOptions.Paged = False
        WebOptions.PageSize = 10000
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        TabOrder = 16
        Exporter.Enabled = True
      end
      object ed_PKS: TUniEdit
        Left = 843
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 17
      end
      object ed_OLDPKS: TUniEdit
        Left = 861
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 18
      end
      object UniLabelTOTALTITULOS: TUniLabel
        Left = 49
        Top = 8
        Width = 54
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'SOMA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 19
      end
      object UniMemolog: TUniMemo
        Left = 882
        Top = 3
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 20
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
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-dollar-sign | '#13#10'cls-ico:font-blac' +
            'k'#13#10']]'
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
          OnClick = btnCloseFormClick
        end
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-file-pdf |'#13#10'cls-ico:font-black'#13#10 +
            ']]'
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
              ScrollHeight = 446
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
                    Width = 40
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Bancos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditpbancos: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnButtonClick = UniButtonEditpbancosButtonClick
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
                    object UniButtonEditppessoas: TUniButtonEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 30
                      Width = 246
                      Height = 26
                      Hint = ''
                      Text = '0'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      OnButtonClick = UniButtonEditppessoasButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel1: TUniLabel
                      AlignWithMargins = True
                      Left = 4
                      Top = 5
                      Width = 45
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Pessoas'
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
                    Width = 119
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      119
                      60)
                    object UniButtonEditpnumero: TUniButtonEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 30
                      Width = 115
                      Height = 26
                      Hint = ''
                      Text = '0'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      IconCls = 'search'
                      ExplicitWidth = 246
                    end
                    object UniLabel2: TUniLabel
                      AlignWithMargins = True
                      Left = 4
                      Top = 5
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
                  object UniContainerPanel6: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 132
                    Top = -1
                    Width = 118
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      118
                      60)
                    object UniLabel28: TUniLabel
                      AlignWithMargins = True
                      Left = 4
                      Top = 6
                      Width = 27
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Serie'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniComboBoxserie: TUniComboBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 31
                      Width = 110
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      Style = csDropDownList
                      Text = 'TT'
                      Items.Strings = (
                        'NFE'
                        'PED'
                        'NOC'
                        'CAR'
                        'DUP'
                        'CHE'
                        'TT')
                      ItemIndex = 6
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
                Height = 179
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
                  object UniLabel4: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 5
                    Width = 76
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Tipo de Busca'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object cbxSearchCRUDField2: TUniComboBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 28
                    Width = 229
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Emiss'#227'o'
                      'Vencimento'
                      'Pagamento')
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                    OnChange = cbxSearchCRUDField2Change
                  end
                end
                object UniContainerPanel4: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 119
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
                  object UniLabel5: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 5
                    Width = 24
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Tipo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniComboBoxSTATUS: TUniComboBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 28
                    Width = 229
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Aberto'
                      'Pago'
                      'Todos')
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
              end
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 410
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
            Width = 709
            Height = 580
            Hint = ''
            DataSource = dsfiltro
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
            OnDblClick = dbgSearchCRUDDblClick
            Columns = <
              item
                FieldName = 'SITUACAO'
                Title.Caption = 'Situa'#231#227'o'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'Numero'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'Ser.'
                Width = 25
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'Seq.'
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PESSOA'
                Title.Caption = 'Pessoa'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'Nome'
                Width = 300
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'Emiss'#227'o'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'Vencimento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'Pagamento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORATUAL'
                Title.Caption = 'Valor Atual'
                Width = 100
                Font.Name = 'Calibri'
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
          Width = 975
          Height = 580
          Hint = ''
          ParentColor = False
          Align = alClient
          AutoScroll = True
          TabOrder = 0
          ScrollHeight = 580
          ScrollWidth = 975
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 11
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              150
              48)
            object edCodigo: TUniDBEdit
              Left = 1
              Top = 19
              Width = 121
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
          object rcBlock20: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 11
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              150
              48)
            object rcDBComboBox50: TUniDBComboBox
              Tag = 1
              Left = 3
              Top = 19
              Width = 139
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'SERIE'
              DataSource = dscrud
              Style = csDropDownList
              Items.Strings = (
                'NFE'
                'PED'
                'NOC'
                'CAR'
                'DUP'
                'CHE')
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel7: TUniLabel
              Left = 3
              Top = 1
              Width = 27
              Height = 15
              Hint = ''
              Caption = 'S'#233'rie'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 372
            Top = 11
            Width = 253
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              253
              48)
            object UniDBEditnumero: TUniDBEdit
              Tag = 1
              Left = 2
              Top = 19
              Width = 151
              Height = 29
              Hint = ''
              DataField = 'NUMERO'
              DataSource = dscrud
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              Color = clSkyBlue
            end
            object UniLabel6: TUniLabel
              Left = 0
              Top = 0
              Width = 70
              Height = 15
              Hint = ''
              Caption = 'Numero Doc.'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniDBEditsequencia: TUniDBEdit
              Tag = 1
              Left = 159
              Top = 19
              Width = 93
              Height = 29
              Hint = ''
              DataField = 'SEQUENCIA'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 3
              Color = clSkyBlue
            end
            object UniLabel27: TUniLabel
              Left = 159
              Top = 0
              Width = 56
              Height = 15
              Hint = ''
              Caption = 'Sequ'#234'ncia'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 108
            Width = 202
            Height = 48
            Hint = '[[cols:xs-12 sm-6 md-3]]'
            ParentColor = False
            TabOrder = 4
            object UniLabel8: TUniLabel
              Left = 0
              Top = 0
              Width = 39
              Height = 15
              Hint = ''
              Caption = 'Pessoa'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniButtonDbEdit1: TUniButtonDbEdit
              Tag = 1
              Left = 1
              Top = 18
              Width = 198
              Height = 29
              Hint = ''
              DataField = 'PESSOA'
              DataSource = dscrud
              TabOrder = 2
              Color = clInfoBk
              OnExit = UniButtonDbEdit1Exit
              OnButtonClick = UniButtonDbEdit1ButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 211
            Top = 108
            Width = 310
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              310
              48)
            object edSearchCRUD2: TUniEdit
              AlignWithMargins = True
              Left = 1
              Top = 18
              Width = 305
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
            object UniLabel9: TUniLabel
              Left = 0
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
          object rcBlock60: TUniContainerPanel
            Tag = 1
            Left = 539
            Top = 108
            Width = 170
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              170
              48)
            object UniEdit1: TUniEdit
              AlignWithMargins = True
              Left = 2
              Top = 18
              Width = 163
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
              Left = 0
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
            Left = 770
            Top = 107
            Width = 135
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              135
              48)
            object UniEdit2: TUniEdit
              AlignWithMargins = True
              Left = 2
              Top = 19
              Width = 128
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
            object UniLabel11: TUniLabel
              Left = 0
              Top = 0
              Width = 37
              Height = 15
              Hint = ''
              Caption = 'Tel/Cel'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock230: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 193
            Width = 200
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              200
              48)
            object UniLabel18: TUniLabel
              Left = 0
              Top = 0
              Width = 40
              Height = 15
              Hint = ''
              Caption = 'Bancos'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 0
            end
            object UniLabel40: TUniLabel
              Left = 67
              Top = 0
              Width = 55
              Height = 15
              Hint = ''
              Caption = 'Descri'#231#227'o'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniEditportadordescricao: TUniEdit
              AlignWithMargins = True
              Left = 65
              Top = 19
              Width = 130
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              ReadOnly = True
            end
            object UniButtonDbEdit2: TUniButtonDbEdit
              Tag = 1
              Left = 0
              Top = 19
              Width = 57
              Height = 29
              Hint = ''
              DataField = 'PORTADOR'
              DataSource = dscrud
              TabOrder = 4
              Color = clInfoBk
              OnExit = UniButtonDbEdit2Exit
              OnButtonClick = UniButtonDbEdit2ButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock240: TUniContainerPanel
            Tag = 1
            Left = 212
            Top = 193
            Width = 200
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              200
              48)
            object UniLabel19: TUniLabel
              Left = 0
              Top = 0
              Width = 32
              Height = 15
              Hint = ''
              Caption = 'Plano'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 0
            end
            object UniLabel17: TUniLabel
              Left = 62
              Top = 0
              Width = 55
              Height = 15
              Hint = ''
              Caption = 'Descri'#231#227'o'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniEditplanodescricao: TUniEdit
              AlignWithMargins = True
              Left = 106
              Top = 19
              Width = 89
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              ReadOnly = True
            end
            object UniButtonDbEdit3: TUniButtonDbEdit
              Tag = 1
              Left = 0
              Top = 19
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'PLANOCONTAS'
              DataSource = dscrud
              TabOrder = 4
              Color = clInfoBk
              OnExit = UniButtonDbEdit3Exit
              OnButtonClick = UniButtonDbEdit3ButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock250: TUniContainerPanel
            Tag = 1
            Left = 418
            Top = 193
            Width = 200
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              200
              48)
            object UniLabel20: TUniLabel
              Left = 0
              Top = 0
              Width = 51
              Height = 15
              Hint = ''
              Caption = 'Vendedor'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 0
            end
            object UniLabel49: TUniLabel
              Left = 61
              Top = 0
              Width = 85
              Height = 15
              Hint = ''
              Caption = 'Nome Vendedor'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniEditnomevendedor: TUniEdit
              AlignWithMargins = True
              Left = 61
              Top = 19
              Width = 130
              Height = 29
              Hint = ''
              Margins.Right = 5
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              ReadOnly = True
            end
            object UniButtonDbEdit4: TUniButtonDbEdit
              Tag = 1
              Left = 0
              Top = 19
              Width = 57
              Height = 29
              Hint = ''
              DataField = 'FUNCIONARIO'
              DataSource = dscrud
              TabOrder = 4
              Color = clInfoBk
              OnExit = UniButtonDbEdit4Exit
              OnButtonClick = UniButtonDbEdit4ButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock260: TUniContainerPanel
            Tag = 1
            Left = 626
            Top = 192
            Width = 200
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              200
              48)
            object UniLabel50: TUniLabel
              Left = 0
              Top = 0
              Width = 66
              Height = 15
              Hint = ''
              Caption = '% Comiss'#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
              Left = 0
              Top = 19
              Width = 97
              Height = 29
              Hint = ''
              DataField = 'PERCCOMISSAO'
              DataSource = dscrud
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniDBEdit6: TUniDBEdit
              Left = 101
              Top = 19
              Width = 92
              Height = 29
              Hint = ''
              DataField = 'PEDIDO'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object UniLabel12: TUniLabel
              Left = 104
              Top = 0
              Width = 38
              Height = 15
              Hint = ''
              Caption = 'Pedido'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
          end
          object rcBlock270: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 268
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 12
            object UniDBDateTimePicker1: TUniDBDateTimePicker
              Tag = 1
              Left = 3
              Top = 18
              Width = 120
              Height = 29
              Hint = ''
              DataField = 'EMISSAO'
              DataSource = dscrud
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel13: TUniLabel
              Left = 2
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
          object rcBlock280: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 268
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 13
            object UniDBDateTimePicker2: TUniDBDateTimePicker
              Left = 5
              Top = 18
              Width = 120
              Height = 29
              Hint = ''
              DataField = 'VENCIMENTO'
              DataSource = dscrud
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel14: TUniLabel
              Left = 5
              Top = 0
              Width = 63
              Height = 15
              Hint = ''
              Caption = 'Vencimento'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock290: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = 268
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 14
            object UniDBDateTimePicker3: TUniDBDateTimePicker
              Left = 2
              Top = 18
              Width = 120
              Height = 29
              Hint = ''
              DataField = 'PAGAMENTO'
              DataSource = dscrud
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              ReadOnly = True
              TabOrder = 1
              Color = clGray
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel15: TUniLabel
              Left = 2
              Top = 0
              Width = 61
              Height = 15
              Hint = ''
              Caption = 'Pagamento'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock300: TUniContainerPanel
            Tag = 1
            Left = 558
            Top = 267
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 15
            object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
              Left = 2
              Top = 19
              Width = 139
              Height = 29
              Hint = ''
              DataField = 'VALORPAGO'
              DataSource = dscrud
              TabOrder = 1
              Color = clGray
              ReadOnly = True
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel16: TUniLabel
              Left = 2
              Top = 1
              Width = 62
              Height = 15
              Hint = ''
              Caption = 'Valor PAGO'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock310: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 332
            Width = 166
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 16
            object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
              Left = 3
              Top = 18
              Width = 74
              Height = 29
              Hint = ''
              DataField = 'VALORDESCONTOS'
              DataSource = dscrud
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
              Left = 90
              Top = 18
              Width = 74
              Height = 29
              Hint = ''
              DataField = 'VALORJUROS'
              DataSource = dscrud
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel21: TUniLabel
              Left = 2
              Top = 0
              Width = 57
              Height = 15
              Hint = ''
              Caption = 'Descontos'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object UniLabel22: TUniLabel
              Left = 90
              Top = 0
              Width = 29
              Height = 15
              Hint = ''
              Caption = 'Juros'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
          end
          object rcBlock320: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 332
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 17
            object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
              Left = 4
              Top = 18
              Width = 121
              Height = 29
              Hint = ''
              DataField = 'VALORTAXAS'
              DataSource = dscrud
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel23: TUniLabel
              Left = 6
              Top = 0
              Width = 31
              Height = 15
              Hint = ''
              Caption = 'Taxas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock330: TUniContainerPanel
            Tag = 1
            Left = 382
            Top = 332
            Width = 193
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 18
            object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
              Left = 2
              Top = 18
              Width = 83
              Height = 29
              Hint = ''
              DataField = 'VALORORIGINAL'
              DataSource = dscrud
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
              Left = 108
              Top = 18
              Width = 83
              Height = 29
              Hint = ''
              DataField = 'VALORATUAL'
              DataSource = dscrud
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel24: TUniLabel
              Left = 2
              Top = 0
              Width = 78
              Height = 15
              Hint = ''
              Caption = 'Valor Original'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object UniLabel25: TUniLabel
              Left = 108
              Top = 0
              Width = 61
              Height = 15
              Hint = ''
              Caption = 'Valor Atual'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
          end
          object rcBlock340: TUniContainerPanel
            Tag = 1
            Left = 581
            Top = 331
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 19
            DesignSize = (
              150
              48)
            object UniDBEdit2: TUniDBEdit
              Left = 26
              Top = 19
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'SITUACAO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              Color = clGray
              ReadOnly = True
            end
            object UniLabel26: TUniLabel
              Left = 27
              Top = 1
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
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 139
    Top = 7
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    Left = 169
    Top = 7
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      Size = 3
    end
    object FDQryFiltroSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object FDQryFiltroPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object FDQryFiltroNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQryFiltroVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object FDQryFiltroPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object FDQryFiltroVALORATUAL: TFMTBCDField
      FieldName = 'VALORATUAL'
      Origin = 'VALORATUAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQryFiltroSITUACAO: TStringField
      Alignment = taCenter
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = FDQryFiltroSITUACAOGetText
      Size = 10
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 203
    Top = 7
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM RECEBER')
    Left = 233
    Top = 7
  end
  object popMenuOptions: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 306
    Top = 10
    object G1: TUniMenuItem
      Caption = 'Gerar Parcelas'
      ImageIndex = 121
      OnClick = G1Click
    end
  end
end
