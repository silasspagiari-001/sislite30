inherited frmLaboratorioRAM: TfrmLaboratorioRAM
  inherited paBaseBackGround: TUniContainerPanel
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
              ScrollHeight = 209
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
                Top = 173
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
                Height = 119
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
                  Height = 119
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
                    DesignSize = (
                      118
                      60)
                    object UniLabelDtIni: TUniLabel
                      AlignWithMargins = True
                      Left = 0
                      Top = 1
                      Width = 23
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'M'#234's'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniComboBoxmes: TUniComboBox
                      Left = 1
                      Top = 20
                      Width = 112
                      Height = 29
                      Hint = ''
                      Style = csDropDownList
                      Text = '00'
                      Items.Strings = (
                        '00'
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
                      ItemIndex = 0
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      IconItems = <>
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
                    DesignSize = (
                      118
                      60)
                    object UniLabelDtEnd: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 1
                      Width = 21
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Ano'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniEditano: TUniEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 20
                      Width = 107
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
                      InputMask.Mask = '9999'
                    end
                  end
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 1
                  Top = 59
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
                    IconCls = 'search'
                  end
                end
              end
            end
          end
          object UniDBGrid1: TUniDBGrid
            Left = 266
            Top = 0
            Width = 688
            Height = 570
            Hint = ''
            DataSource = dsatividades
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
          end
        end
      end
    end
  end
  object TB_ATIVIDADES: TFDMemTable
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
    Left = 797
    Top = 8
    object TB_ATIVIDADESMES: TStringField
      FieldName = 'MES'
    end
    object TB_ATIVIDADESFEV_REC: TFloatField
      FieldName = 'FEV_REC'
    end
    object TB_ATIVIDADESJAN_REC: TFloatField
      FieldName = 'JAN_REC'
    end
    object TB_ATIVIDADESMAR_REC: TFloatField
      FieldName = 'MAR_REC'
    end
    object TB_ATIVIDADESABR_REC: TFloatField
      FieldName = 'ABR_REC'
    end
    object TB_ATIVIDADESMAI_REC: TFloatField
      FieldName = 'MAI_REC'
    end
    object TB_ATIVIDADESJUN_REC: TFloatField
      FieldName = 'JUN_REC'
    end
    object TB_ATIVIDADESJUL_REC: TFloatField
      FieldName = 'JUL_REC'
    end
    object TB_ATIVIDADESAGO_REC: TFloatField
      FieldName = 'AGO_REC'
    end
    object TB_ATIVIDADESSET_REC: TFloatField
      FieldName = 'SET_REC'
    end
    object TB_ATIVIDADESNOV_REC: TFloatField
      FieldName = 'NOV_REC'
    end
    object TB_ATIVIDADESDEZ_REC: TFloatField
      FieldName = 'DEZ_REC'
    end
    object TB_ATIVIDADESOUT_REC: TFloatField
      FieldName = 'OUT_REC'
    end
    object TB_ATIVIDADESJAN_PRO: TFloatField
      FieldName = 'JAN_PRO'
    end
    object TB_ATIVIDADESFEV_PRO: TFloatField
      FieldName = 'FEV_PRO'
    end
    object TB_ATIVIDADESMAR_PRO: TFloatField
      FieldName = 'MAR_PRO'
    end
    object TB_ATIVIDADESABR_PRO: TFloatField
      FieldName = 'ABR_PRO'
    end
    object TB_ATIVIDADESMAI_PRO: TFloatField
      FieldName = 'MAI_PRO'
    end
    object TB_ATIVIDADESJUN_PRO: TFloatField
      FieldName = 'JUN_PRO'
    end
    object TB_ATIVIDADESJUL_PRO: TFloatField
      FieldName = 'JUL_PRO'
    end
    object TB_ATIVIDADESAGO_PRO: TFloatField
      FieldName = 'AGO_PRO'
    end
    object TB_ATIVIDADESSET_PRO: TFloatField
      FieldName = 'SET_PRO'
    end
    object TB_ATIVIDADESOUT_PRO: TFloatField
      FieldName = 'OUT_PRO'
    end
    object TB_ATIVIDADESNOV_PRO: TFloatField
      FieldName = 'NOV_PRO'
    end
    object TB_ATIVIDADESDEZ_PRO: TFloatField
      FieldName = 'DEZ_PRO'
    end
  end
  object dsatividades: TDataSource
    DataSet = TB_ATIVIDADES
    Left = 827
    Top = 8
  end
end
