object frmCRUDFINANCEIRO: TfrmCRUDFINANCEIRO
  Left = 0
  Top = 0
  ClientHeight = 489
  ClientWidth = 870
  Caption = 'Financeiro '
  OnShow = UniFormShow
  BorderStyle = bsSingle
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 489
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object paBaseButtons: TUniContainerPanel
      Left = 0
      Top = 40
      Width = 37
      Height = 449
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
      TabOrder = 1
      ScrollHeight = 449
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 243
        Width = 37
        Height = 142
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
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
        end
        object btnsair: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 110
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-window-close rc-mirror-h | '#13#10'cls' +
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
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnsairClick
        end
      end
      object paNAE: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 37
        Height = 110
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 1
        object btnNewReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black|'#13#10'hin' +
            't:Inclui Novo Registro t:Inclui w:200 d:10000 c:rc-bg-info'#13#10']]'
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
            '|'#13#10'hint:Altera Registro t:Altera w:200 d:10000 c:rc-bg-info'#13#10']]'
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
            '|'#13#10'hint:Exclui Registro t:Exclui w:200 d:10000 c:rc-bg-info'#13#10']]'
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
        Top = 150
        Width = 37
        Height = 73
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object btnSaveReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-save | '#13#10'cls-ico:font-black|'#13#10'hin' +
            't:Salva Registro t:Salva w:200 d:10000 c:rc-bg-info'#13#10']]'
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
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black|'#13#10'h' +
            'int:Cancela Altera'#231#245'es Realizadas t:Cancela w:200 d:10000 c:rc-b' +
            'g-info'#13#10']]'
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
    object paBaseTop: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 870
      Height = 40
      Hint = ''
      ParentColor = False
      Color = clWhite
      Align = alTop
      TabOrder = 2
      object UniMemolog: TUniMemo
        Left = 766
        Top = 15
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 1
      end
      object UniLabelTOTALTITULOS: TUniLabel
        Left = 6
        Top = 8
        Width = 85
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'CONTAS A'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 2
      end
      object UniBitBtn12: TUniBitBtn
        AlignWithMargins = True
        Left = 828
        Top = 2
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-hand-holding-usd | '#13#10'cls-ico:font' +
          '-black |'#13#10'hint:Centro de Custo t:Centro w:200 d:10000 c:rc-bg-in' +
          'fo'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-hand-holding-usd"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = UniBitBtn12Click
      end
      object ubtnBOLETO: TUniBitBtn
        AlignWithMargins = True
        Left = 791
        Top = 2
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-barcode | '#13#10'cls-ico:font-black |'#13 +
          #10'hint:Boleto Banc'#225'rio t:Boleto w:200 d:10000 c:rc-bg-info'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-barcode"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 4
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = ubtnBOLETOClick
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 60
      Width = 187
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        187
        48)
      object UniLabel3: TUniLabel
        Left = 1
        Top = 2
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
        AlignWithMargins = True
        Left = 1
        Top = 19
        Width = 183
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
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 233
      Top = 60
      Width = 181
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        181
        48)
      object UniLabel7: TUniLabel
        Left = 3
        Top = 2
        Width = 27
        Height = 15
        Hint = ''
        Caption = 'S'#233'rie'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcDBComboBox50: TUniDBComboBox
        Tag = 1
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 173
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SERIE'
        DataSource = dscrud
        Items.Strings = (
          'AGP'
          'NFE'
          'PED'
          'NOC'
          'CAR'
          'DUP'
          'CHE'
          'LAS'
          'NFS'
          'LAN')
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 419
      Top = 60
      Width = 293
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 5
      object UniLabel6: TUniLabel
        Left = 0
        Top = 2
        Width = 70
        Height = 15
        Hint = ''
        Caption = 'Numero Doc.'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEditnumero: TUniDBEdit
        Tag = 1
        Left = 1
        Top = 19
        Width = 289
        Height = 29
        Hint = ''
        DataField = 'NUMERO'
        DataSource = dscrud
        ParentFont = False
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 2
        Color = clSkyBlue
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 715
      Top = 60
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        48)
      object UniLabel27: TUniLabel
        Left = 2
        Top = 2
        Width = 56
        Height = 15
        Hint = ''
        Caption = 'Sequ'#234'ncia'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEditsequencia: TUniDBEdit
        Tag = 1
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 144
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
        TabOrder = 2
        Color = clSkyBlue
      end
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 119
      Width = 118
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        118
        48)
      object UniLabel8: TUniLabel
        Left = 0
        Top = 1
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
        AlignWithMargins = True
        Left = 0
        Top = 16
        Width = 114
        Height = 29
        Hint = ''
        DataField = 'PESSOA'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        OnExit = UniButtonDbEdit1Exit
        OnButtonClick = UniButtonDbEdit1ButtonClick
        IconCls = 'search'
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 161
      Top = 119
      Width = 336
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        336
        48)
      object UniLabel9: TUniLabel
        Left = 3
        Top = 1
        Width = 90
        Height = 15
        Hint = ''
        Caption = 'Nome da Pessoa'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchCRUD2: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 328
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
        ReadOnly = True
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 506
      Top = 119
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        150
        48)
      object UniLabel10: TUniLabel
        Left = 2
        Top = 1
        Width = 48
        Height = 15
        Hint = ''
        Caption = 'Cpf/Cnpj'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 147
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
        ReadOnly = True
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 659
      Top = 119
      Width = 120
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        120
        48)
      object UniEdit2: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 114
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
        Left = 2
        Top = 1
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
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 177
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        227
        48)
      object UniLabel18: TUniLabel
        Left = 0
        Top = 2
        Width = 40
        Height = 15
        Hint = ''
        Caption = 'Bancos'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
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
        TabOrder = 2
        Color = clInfoBk
        OnExit = UniButtonDbEdit2Exit
        OnButtonClick = UniButtonDbEdit2ButtonClick
        IconCls = 'search'
      end
      object UniLabel40: TUniLabel
        Left = 63
        Top = 2
        Width = 55
        Height = 15
        Hint = ''
        Caption = 'Descri'#231#227'o'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniEditportadordescricao: TUniEdit
        AlignWithMargins = True
        Left = 63
        Top = 19
        Width = 162
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ReadOnly = True
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 270
      Top = 177
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        227
        48)
      object UniLabel19: TUniLabel
        Left = 3
        Top = 2
        Width = 32
        Height = 15
        Hint = ''
        Caption = 'Plano'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonDbEdit3: TUniButtonDbEdit
        Left = 3
        Top = 19
        Width = 57
        Height = 29
        Hint = ''
        DataField = 'PLANOCONTAS'
        DataSource = dscrud
        TabOrder = 2
        Color = clInfoBk
        OnExit = UniButtonDbEdit3Exit
        OnButtonClick = UniButtonDbEdit3ButtonClick
        IconCls = 'search'
      end
      object UniLabel17: TUniLabel
        Left = 64
        Top = 2
        Width = 55
        Height = 15
        Hint = ''
        Caption = 'Descri'#231#227'o'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniEditplanodescricao: TUniEdit
        AlignWithMargins = True
        Left = 64
        Top = 19
        Width = 162
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ReadOnly = True
      end
    end
    object rcBlock120: TUniContainerPanel
      Tag = 1
      Left = 499
      Top = 177
      Width = 213
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 13
      DesignSize = (
        213
        48)
      object UniLabel20: TUniLabel
        Left = 4
        Top = 2
        Width = 51
        Height = 15
        Hint = ''
        Caption = 'Vendedor'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonDbEdit4: TUniButtonDbEdit
        Tag = 1
        Left = 2
        Top = 19
        Width = 57
        Height = 29
        Hint = ''
        DataField = 'FUNCIONARIO'
        DataSource = dscrud
        TabOrder = 2
        Color = clInfoBk
        OnExit = UniButtonDbEdit4Exit
        OnButtonClick = UniButtonDbEdit4ButtonClick
        IconCls = 'search'
      end
      object UniLabel49: TUniLabel
        Left = 61
        Top = 2
        Width = 85
        Height = 15
        Hint = ''
        Caption = 'Nome Vendedor'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniEditnomevendedor: TUniEdit
        AlignWithMargins = True
        Left = 61
        Top = 19
        Width = 148
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ReadOnly = True
      end
    end
    object rcBlock130: TUniContainerPanel
      Tag = 1
      Left = 715
      Top = 177
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 14
      DesignSize = (
        150
        48)
      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
        Left = 2
        Top = 19
        Width = 78
        Height = 29
        Hint = ''
        DataField = 'PERCCOMISSAO'
        DataSource = dscrud
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel50: TUniLabel
        Left = 2
        Top = 2
        Width = 66
        Height = 15
        Hint = ''
        Caption = '% Comiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniLabel12: TUniLabel
        Left = 83
        Top = 2
        Width = 38
        Height = 15
        Hint = ''
        Caption = 'Pedido'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniDBEdit6: TUniDBEdit
        AlignWithMargins = True
        Left = 83
        Top = 19
        Width = 66
        Height = 29
        Hint = ''
        DataField = 'PEDIDO'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
    end
    object rcBlock140: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 234
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 15
      DesignSize = (
        227
        48)
      object UniLabel13: TUniLabel
        Left = 0
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
      object UniDBDateTimePicker1: TUniDBDateTimePicker
        Tag = 1
        AlignWithMargins = True
        Left = 0
        Top = 18
        Width = 223
        Height = 29
        Hint = ''
        DataField = 'EMISSAO'
        DataSource = dscrud
        DateTime = 44554.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
    end
    object rcBlock150: TUniContainerPanel
      Tag = 1
      Left = 270
      Top = 234
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 16
      DesignSize = (
        227
        48)
      object UniLabel14: TUniLabel
        Left = 3
        Top = 0
        Width = 63
        Height = 15
        Hint = ''
        Caption = 'Vencimento'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBDateTimePicker2: TUniDBDateTimePicker
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 223
        Height = 29
        Hint = ''
        DataField = 'VENCIMENTO'
        DataSource = dscrud
        DateTime = 44554.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
    end
    object rcBlock160: TUniContainerPanel
      Tag = 1
      Left = 499
      Top = 234
      Width = 213
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 17
      DesignSize = (
        213
        48)
      object UniLabel15: TUniLabel
        Left = 4
        Top = 0
        Width = 61
        Height = 15
        Hint = ''
        Caption = 'Pagamento'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBDateTimePicker3: TUniDBDateTimePicker
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 209
        Height = 29
        Hint = ''
        DataField = 'PAGAMENTO'
        DataSource = dscrud
        DateTime = 44554.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clGray
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
    end
    object rcBlock170: TUniContainerPanel
      Tag = 1
      Left = 715
      Top = 233
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 18
      DesignSize = (
        150
        48)
      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 146
        Height = 29
        Hint = ''
        DataField = 'VALORPAGO'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel16: TUniLabel
        Left = 2
        Top = 0
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
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 293
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 19
      DesignSize = (
        227
        48)
      object UniLabel21: TUniLabel
        Left = 0
        Top = 2
        Width = 57
        Height = 15
        Hint = ''
        Caption = 'Descontos'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
        Left = 0
        Top = 18
        Width = 74
        Height = 29
        Hint = ''
        DataField = 'VALORDESCONTOS'
        DataSource = dscrud
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
        Left = 79
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'VALORJUROS'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel1: TUniLabel
        Left = 80
        Top = 2
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
    object rcBlock190: TUniContainerPanel
      Tag = 1
      Left = 270
      Top = 293
      Width = 227
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 20
      DesignSize = (
        227
        48)
      object UniLabel23: TUniLabel
        Left = 3
        Top = 2
        Width = 31
        Height = 15
        Hint = ''
        Caption = 'Taxas'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 115
        Height = 29
        Hint = ''
        DataField = 'VALORTAXAS'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
        AlignWithMargins = True
        Left = 121
        Top = 18
        Width = 102
        Height = 29
        Hint = ''
        DataField = 'VLRCARTACREDITO'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel26: TUniLabel
        Left = 121
        Top = 2
        Width = 73
        Height = 15
        Hint = ''
        Caption = 'Carta Cr'#233'dito'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
    end
    object rcBlock200: TUniContainerPanel
      Tag = 1
      Left = 499
      Top = 293
      Width = 213
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 21
      DesignSize = (
        213
        48)
      object UniLabel24: TUniLabel
        Left = 2
        Top = 2
        Width = 46
        Height = 15
        Hint = ''
        Caption = 'Original'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
        Left = 2
        Top = 18
        Width = 79
        Height = 29
        Hint = ''
        DataField = 'VALORORIGINAL'
        DataSource = dscrud
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel25: TUniLabel
        Left = 84
        Top = 2
        Width = 61
        Height = 15
        Hint = ''
        Caption = 'Valor Atual'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
        Left = 84
        Top = 18
        Width = 129
        Height = 29
        Hint = ''
        DataField = 'VALORATUAL'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock210: TUniContainerPanel
      Tag = 1
      Left = 715
      Top = 292
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 22
      DesignSize = (
        150
        48)
      object UniDBEdit2: TUniDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 146
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
      object UniLabel2: TUniLabel
        Left = 3
        Top = 2
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
    object rcBlock220: TUniContainerPanel
      Left = 40
      Top = 347
      Width = 825
      Height = 25
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Color = 15714247
      TabOrder = 23
      object UniLabel4: TUniLabel
        Left = 6
        Top = 347
        Width = 54
        Height = 23
        Hint = ''
        Caption = 'Pessoa'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 1
        Top = 1
        Width = 821
        Height = 23
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'OBSERVA'#199#195'O'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock230: TUniContainerPanel
      Left = 40
      Top = 378
      Width = 825
      Height = 108
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 24
      object UniDBMemo1: TUniDBMemo
        Left = 0
        Top = 0
        Width = 825
        Height = 108
        Hint = ''
        DataField = 'OBSERVACOES'
        DataSource = dscrud
        Align = alClient
        TabOrder = 1
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Tag = 1
      Left = 782
      Top = 119
      Width = 83
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 25
      DesignSize = (
        83
        48)
      object UniLabel22: TUniLabel
        Left = 0
        Top = 1
        Width = 47
        Height = 15
        Hint = ''
        Caption = 'Empresa'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonDbEdit5: TUniButtonDbEdit
        Tag = 1
        AlignWithMargins = True
        Left = 0
        Top = 16
        Width = 79
        Height = 29
        Hint = ''
        DataField = 'EMPRESA'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        OnButtonClick = UniButtonDbEdit5ButtonClick
        IconCls = 'search'
      end
    end
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM RECEBER')
    Left = 651
    Top = 17
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 621
    Top = 17
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnSaveReg
    Enabled = True
    Left = 592
    Top = 16
  end
end
