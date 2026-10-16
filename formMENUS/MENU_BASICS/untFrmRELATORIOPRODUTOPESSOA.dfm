object FrmRELATORIOPRODUTOPESSOA: TFrmRELATORIOPRODUTOPESSOA
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Relat'#243'rio de produto por pessoa'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 346
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 605
    ExplicitHeight = 318
    object rcBlock10: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        48)
      object edSearchpessoasINI: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 20
        Width = 146
        Height = 26
        Hint = ''
        Text = '00001'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchpessoasINIButtonClick
        IconCls = 'search'
      end
      object UniLabelDtIni: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 80
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Pessoas Inicio'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 196
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object edSearchpessoasFIN: TUniButtonEdit
        AlignWithMargins = True
        Left = 3
        Top = 20
        Width = 145
        Height = 26
        Hint = ''
        Text = '99999'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = edSearchpessoasFINButtonClick
        IconCls = 'search'
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 17
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'at'#233
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 0
      Top = 287
      Width = 613
      Height = 59
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 259
      ExplicitWidth = 605
      object UniContainerPanel3: TUniContainerPanel
        Left = 3
        Top = 5
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          150
          48)
        object btnimpressao: TUniBitBtn
          Left = 11
          Top = 13
          Width = 119
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-file-pdf"> Impress'#227'o</i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnimpressaoClick
        end
      end
      object UniContainerPanel4: TUniContainerPanel
        Left = 196
        Top = 5
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          150
          48)
        object UniBitBtn1: TUniBitBtn
          Left = 17
          Top = 13
          Width = 119
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'Sair'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn1Click
        end
      end
    end
    object paSearchFilterDtIni: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 56
      Width = 150
      Height = 60
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 4
      object UniLabel5: TUniLabel
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
        Width = 148
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
      Left = 196
      Top = 56
      Width = 150
      Height = 60
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 5
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
        Width = 145
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
    object UniContainerPanel1: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 119
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        48)
      object cbxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = 'Pedidos'
        Items.Strings = (
          'Notas'
          'Pedidos')
        ItemIndex = 1
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 3
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
        TabOrder = 2
      end
    end
  end
end
