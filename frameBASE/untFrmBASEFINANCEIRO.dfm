inherited frmBASEFINANCEIRO: TfrmBASEFINANCEIRO
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      object UniLabelTOTALTITULOS: TUniLabel
        Left = 14
        Top = 10
        Width = 68
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'CONTAS'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 1
      end
    end
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 40
      Width = 1020
      Height = 135
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object rcBlock30: TUniContainerPanel
        Tag = 2
        Left = 298
        Top = 6
        Width = 170
        Height = 113
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 4k-3 8k-3 |'#13#10'cls:card-info-bo' +
          'x-white |'#13#10'round:no | '#13#10']]'#13#10#13#10
        CreateOrder = 1
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        DesignSize = (
          170
          113)
        object labIcoNewCustomers30: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[[ico:fa-wallet 2x | hide:mobile-v]]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'USer'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object labDashCustomers30: TUniLabel
          Left = 10
          Top = 92
          Width = 54
          Height = 15
          Hint = ''
          Caption = 'A receber'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object labNewCustomers30: TUniLabel
          Left = 10
          Top = 6
          Width = 11
          Height = 26
          Hint = ''
          Caption = '0'
          ParentFont = False
          Font.Color = clTeal
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object recUniLabel9EMP3: TUniLabel
          Left = 10
          Top = 67
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object recUniLabel9EMP2: TUniLabel
          Left = 10
          Top = 51
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object recUniLabel9EMP1: TUniLabel
          Left = 10
          Top = 35
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 6
        end
      end
      object rcBlock20: TUniContainerPanel
        Tag = 2
        Left = 114
        Top = 6
        Width = 170
        Height = 113
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 4k-3 8k-3 |'#13#10'cls:card-info-bo' +
          'x-white |'#13#10'round:no | '#13#10']]'#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          170
          113)
        object labIcoSales20: TUniLabel
          AlignWithMargins = True
          Left = 87
          Top = 25
          Width = 75
          Height = 48
          Hint = '[['#13#10'ico:fa-money-bill 2x |'#13#10'hide:mobile-v'#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Shop'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 12573632
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object labSales20: TUniLabel
          Left = 10
          Top = 6
          Width = 11
          Height = 26
          Hint = ''
          Caption = '0'
          ParentFont = False
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labDashSales20: TUniLabel
          Left = 3
          Top = 92
          Width = 49
          Height = 15
          Hint = '[[translate:]]'
          Caption = 'Recebida'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object recebidaUniLabel7EMP1: TUniLabel
          Left = 10
          Top = 35
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object recebidaUniLabel7EMP2: TUniLabel
          Left = 10
          Top = 51
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object recebidaUniLabel7EMP3: TUniLabel
          Left = 10
          Top = 67
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 6
        end
      end
      object rcBlock40: TUniContainerPanel
        Tag = 2
        Left = 483
        Top = 6
        Width = 170
        Height = 113
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 4k-3 8k-3 |'#13#10'cls:card-info-bo' +
          'x-white |'#13#10'round:no | '#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 3
        DesignSize = (
          170
          113)
        object labIcoInService40: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[[ico:fa-user-minus 2x | hide:mobile-v]]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Wrench'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 6727914
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          Color = 3640803
          TabOrder = 3
        end
        object labDashInService40: TUniLabel
          Left = 10
          Top = 92
          Width = 47
          Height = 15
          Hint = ''
          Caption = 'Vencidas'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object labInService40: TUniLabel
          Left = 10
          Top = 6
          Width = 11
          Height = 26
          Hint = ''
          Caption = '0'
          ParentFont = False
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object vencUniLabel9EMP3: TUniLabel
          Left = 10
          Top = 67
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object vencUniLabel9EMP2: TUniLabel
          Left = 10
          Top = 51
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object vencUniLabel9EMP1: TUniLabel
          Left = 10
          Top = 35
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 6
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 2
        Left = 669
        Top = 6
        Width = 172
        Height = 113
        Hint = 
          '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 4k-3 8k-3 |'#13#10'cls:card-info-bo' +
          'x-white |'#13#10'round:no | '#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 4
        DesignSize = (
          172
          113)
        object labIcoGiveUp50: TUniLabel
          AlignWithMargins = True
          Left = 85
          Top = 25
          Width = 75
          Height = 48
          Hint = '[[ico:fa-file-invoice-dollar 2x | hide:mobile-v]]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Times'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 8887535
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object labDashGiveUp50: TUniLabel
          Left = 10
          Top = 92
          Width = 26
          Height = 15
          Hint = ''
          Caption = 'Total'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object labGiveUp50: TUniLabel
          Left = 10
          Top = 6
          Width = 11
          Height = 26
          Hint = ''
          Caption = '0'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object totUniLabelEMP3: TUniLabel
          Left = 10
          Top = 67
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object totUniLabelEMP2: TUniLabel
          Left = 10
          Top = 51
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Visible = False
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object totUniLabelEMP1: TUniLabel
          Left = 10
          Top = 35
          Width = 30
          Height = 13
          Hint = '[[translate:]]'
          Caption = 'EMP 1 '
          ParentFont = False
          Font.Color = clGray
          Font.Name = 'Calibri'
          TabOrder = 6
        end
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 0
      Top = 175
      Width = 1020
      Height = 68
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object paSearchField1: TUniContainerPanel
        AlignWithMargins = True
        Left = 1
        Top = 3
        Width = 70
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          70
          50)
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
          Top = 18
          Width = 67
          Height = 26
          Hint = ''
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = UniButtonEditpbancosButtonClick
          IconCls = 'search'
        end
      end
      object UniContainerPanel1: TUniContainerPanel
        AlignWithMargins = True
        Left = 74
        Top = 4
        Width = 70
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          70
          50)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 1
          Width = 45
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Pessoas'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniButtonEditppessoas: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 17
          Width = 67
          Height = 26
          Hint = ''
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = UniButtonEditppessoasButtonClick
          IconCls = 'search'
        end
      end
      object UniContainerPanel2: TUniContainerPanel
        AlignWithMargins = True
        Left = 147
        Top = 4
        Width = 70
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          70
          50)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 1
          Width = 43
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Numero'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniButtonEditpnumero: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 17
          Width = 67
          Height = 26
          Hint = ''
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconCls = 'search'
        end
      end
      object UniContainerPanel6: TUniContainerPanel
        AlignWithMargins = True
        Left = 292
        Top = 4
        Width = 70
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          70
          50)
        object UniLabel29: TUniLabel
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 18
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'P.A.'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniEditpa: TUniEdit
          AlignWithMargins = True
          Left = 0
          Top = 17
          Width = 67
          Height = 26
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
      object paSearchFilterDtIni: TUniContainerPanel
        AlignWithMargins = True
        Left = 365
        Top = 4
        Width = 118
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          118
          50)
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
          Top = 16
          Width = 114
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
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
        Left = 486
        Top = 4
        Width = 118
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          118
          50)
        object UniLabel3: TUniLabel
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
        object edSearchCRUDDtEnd: TUniDateTimePicker
          AlignWithMargins = True
          Left = 0
          Top = 16
          Width = 114
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
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
      object UniContainerPanel4: TUniContainerPanel
        AlignWithMargins = True
        Left = 607
        Top = 4
        Width = 114
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          114
          50)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 1
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
          Top = 16
          Width = 106
          Height = 29
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = 'Vencimento'
          Items.Strings = (
            'Emiss'#227'o'
            'Vencimento'
            'Pagamento')
          ItemIndex = 1
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object UniContainerPanel5: TUniContainerPanel
        AlignWithMargins = True
        Left = 724
        Top = 4
        Width = 93
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          93
          50)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 1
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
          Top = 16
          Width = 89
          Height = 29
          Hint = ''
          Margins.Right = 5
          Style = csDropDownList
          Text = 'Aberto'
          Items.Strings = (
            'Aberto'
            'Pago'
            'Todos')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object UniContainerPanel7: TUniContainerPanel
        AlignWithMargins = True
        Left = 821
        Top = 4
        Width = 45
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 9
        object btnSearchCRUD: TUniBitBtn
          AlignWithMargins = True
          Left = 4
          Top = 11
          Width = 39
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
          TabOrder = 1
          OnClick = btnSearchCRUDClick
        end
      end
      object UniContainerPanel8: TUniContainerPanel
        AlignWithMargins = True
        Left = 219
        Top = 4
        Width = 70
        Height = 50
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          70
          50)
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 47
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Empresa'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniButtonEditempresa: TUniButtonEdit
          AlignWithMargins = True
          Left = 0
          Top = 17
          Width = 67
          Height = 26
          Hint = ''
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          IconCls = 'search'
        end
      end
      object UniContainerPanel9: TUniContainerPanel
        AlignWithMargins = True
        Left = 869
        Top = 4
        Width = 45
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 11
        object UniBitBtnprint: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 11
          Width = 40
          Height = 30
          Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-print |'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'P'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtnprintClick
        end
      end
      object UniContainerPanel10: TUniContainerPanel
        AlignWithMargins = True
        Left = 917
        Top = 4
        Width = 45
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 12
        object UniBitBtncadastro: TUniBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 11
          Width = 40
          Height = 30
          Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-scroll |'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'C'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtncadastroClick
        end
      end
      object UniContainerPanel11: TUniContainerPanel
        AlignWithMargins = True
        Left = 965
        Top = 4
        Width = 45
        Height = 50
        Hint = ''
        Margins.Left = 0
        Margins.Top = 8
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 13
        object UniBitBtn1: TUniBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 11
          Width = 40
          Height = 30
          Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-cogs |'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'A'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn1Click
        end
      end
    end
    object dbgSearchCRUD: TUniDBGrid
      Left = 0
      Top = 243
      Width = 1020
      Height = 407
      Hint = ''
      DataSource = dsconsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      Align = alClient
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 4
      Exporter.Enabled = True
      OnMouseDown = dbgSearchCRUDMouseDown
      OnCellClick = dbgSearchCRUDCellClick
      OnDblClick = dbgSearchCRUDDblClick
      OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
      Columns = <
        item
          FieldName = 'CODIGO'
          Title.Caption = ' '
          Width = 30
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'EMPRESA'
          Title.Caption = 'EMP'
          Width = 50
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SITUACAO'
          Title.Caption = ' '
          Width = 74
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NUMERO'
          Title.Caption = 'Numero'
          Width = 80
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SERIE'
          Title.Caption = 'Ser.'
          Width = 50
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SEQUENCIA'
          Title.Caption = 'Seq.'
          Width = 50
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
          Title.Caption = 'EMIS'
          Width = 75
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VENCIMENTO'
          Title.Caption = 'VCTO'
          Width = 75
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'PAGAMENTO'
          Title.Caption = 'PGTO'
          Width = 75
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALORATUAL'
          Title.Caption = 'ATUAL'
          Width = 100
          Font.Name = 'Calibri'
        end>
    end
  end
  inherited htmlFrame: TUniHTMLFrame
    Left = 988
    Top = 106
    ExplicitLeft = 988
    ExplicitTop = 106
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    Left = 928
    Top = 15
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      OnGetText = FDQryFiltroSERIEGetText
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
      OnGetText = FDQryFiltroCODIGOGetText
    end
    object FDQryFiltroREMESSA: TStringField
      FieldName = 'REMESSA'
      Size = 10
    end
    object FDQryFiltroEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object FDQryFiltroVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 899
    Top = 15
  end
  object UniPopupMenu: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 896
    Top = 56
    object V1: TUniMenuItem
      Caption = 'Visualizar Registro'
      ImageIndex = 44
      OnClick = V1Click
    end
    object B1: TUniMenuItem
      Caption = 'Boleto Banc'#225'rio'
      ImageIndex = 56
      OnClick = B1Click
    end
    object i1: TUniMenuItem
      Caption = 'Itens do Agrupamento'
      ImageIndex = 68
      OnClick = i1Click
    end
    object V2: TUniMenuItem
      Caption = 'Voltar em Aberto'
      ImageIndex = 57
      OnClick = V2Click
    end
  end
  object tbconsulta: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 864
    Top = 16
    object tbconsultaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object tbconsultaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      OnGetText = tbconsultaSERIEGetText
      Size = 3
    end
    object tbconsultaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object tbconsultaPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object tbconsultaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 150
    end
    object tbconsultaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object tbconsultaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object tbconsultaPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object tbconsultaVALORATUAL: TFMTBCDField
      FieldName = 'VALORATUAL'
      Origin = 'VALORATUAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object tbconsultaSITUACAO: TStringField
      Alignment = taCenter
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = tbconsultaSITUACAOGetText
      Size = 10
    end
    object tbconsultaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      OnGetText = tbconsultaCODIGOGetText
    end
    object tbconsultaREMESSA: TStringField
      FieldName = 'REMESSA'
      Size = 10
    end
    object tbconsultaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object tbconsultaDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object tbconsultaVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
    object tbconsultamarcar: TStringField
      FieldName = 'marcar'
      Size = 1
    end
  end
  object dsconsulta: TDataSource
    AutoEdit = False
    DataSet = tbconsulta
    Left = 835
    Top = 16
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 893
    Top = 102
    object A1: TUniMenuItem
      Caption = 'Agrupamento'
      ImageIndex = 68
      OnClick = A1Click
    end
    object G1: TUniMenuItem
      Caption = 'Gerar Parcelas'
      ImageIndex = 70
      Visible = False
      OnClick = g1Click
    end
  end
end
