object frmRELATORIOS: TfrmRELATORIOS
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Relat'#243'rio do Sistema'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  ActiveControl = btnimpressao
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 346
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 287
      Width = 613
      Height = 59
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      object rcBlock20: TUniContainerPanel
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
      object rcBlock30: TUniContainerPanel
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
    object UniPageControl: TUniPageControl
      Left = 0
      Top = 0
      Width = 613
      Height = 287
      Hint = ''
      ActivePage = UniTabSheetvendas
      Align = alClient
      TabOrder = 2
      object UniTabSheetvendas: TUniTabSheet
        Hint = ''
        Caption = 'Relat'#243'rio Vendas'
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 605
          Height = 259
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object rcBlock40: TUniContainerPanel
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
            object UniLabelDtIni: TUniLabel
              AlignWithMargins = True
              Left = 1
              Top = 0
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
            object edSearchDATAINIVEN: TUniDateTimePicker
              AlignWithMargins = True
              Left = 1
              Top = 18
              Width = 149
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
              OnExit = edSearchDATAINIVENExit
            end
          end
          object rcBlock50: TUniContainerPanel
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
            object UniLabel1: TUniLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 17
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'at'#233
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchDATAFINVEN: TUniDateTimePicker
              AlignWithMargins = True
              Left = 2
              Top = 18
              Width = 148
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
          object rcBlock60: TUniContainerPanel
            Left = 3
            Top = 57
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              150
              48)
            object UniLabel2: TUniLabel
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 84
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Pessoas Inicial'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchPESSOAINIVEN: TUniButtonEdit
              AlignWithMargins = True
              Left = 1
              Top = 21
              Width = 149
              Height = 26
              Hint = ''
              Text = '00001'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnButtonClick = edSearchPESSOAINIVENButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock70: TUniContainerPanel
            Left = 196
            Top = 57
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              150
              48)
            object UniLabel3: TUniLabel
              AlignWithMargins = True
              Left = 2
              Top = 1
              Width = 17
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'at'#233
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchPESSOAFINVEN: TUniButtonEdit
              AlignWithMargins = True
              Left = 2
              Top = 21
              Width = 148
              Height = 26
              Hint = ''
              Text = '9999999'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnButtonClick = edSearchPESSOAFINVENButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock80: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 110
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              150
              48)
            object cbxtipo: TUniComboBox
              AlignWithMargins = True
              Left = 0
              Top = 18
              Width = 150
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = 'Nota'
              Items.Strings = (
                'Nota')
              ItemIndex = 0
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              IconItems = <>
            end
            object UniLabelFd1: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
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
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 110
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              150
              48)
            object cbxordem: TUniComboBox
              AlignWithMargins = True
              Left = 1
              Top = 18
              Width = 149
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = 'Numero'
              Items.Strings = (
                'Numero'
                'Emiss'#227'o'
                'Pessoa')
              ItemIndex = 0
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel4: TUniLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 37
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Ordem'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 366
            Top = 110
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              150
              48)
            object cbxstatus: TUniComboBox
              AlignWithMargins = True
              Left = 1
              Top = 18
              Width = 149
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = 'Autorizada'
              Items.Strings = (
                'Autorizada'
                'Cancelada')
              ItemIndex = 0
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel5: TUniLabel
              AlignWithMargins = True
              Left = 2
              Top = 0
              Width = 34
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Status'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock110: TUniContainerPanel
            Left = 3
            Top = 164
            Width = 513
            Height = 92
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 8
            object UniCheckBoxVENDAS: TUniCheckBox
              Left = 0
              Top = 3
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Vendas '
              TabOrder = 1
            end
            object UniCheckBoxDEVOLUCAO: TUniCheckBox
              Left = 111
              Top = 3
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Devolu'#231#227'o'
              TabOrder = 2
            end
            object UniCheckBoxVENDASEF: TUniCheckBox
              Left = 214
              Top = 3
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Venda E.F.'
              TabOrder = 3
            end
            object UniCheckBoxBONIFICACAO: TUniCheckBox
              Left = 1
              Top = 37
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Bonifica'#231#227'o'
              TabOrder = 4
            end
            object UniCheckBoxTROCA: TUniCheckBox
              Left = 112
              Top = 37
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Troca'
              TabOrder = 5
            end
            object UniCheckBoxOUTROS: TUniCheckBox
              Left = 215
              Top = 37
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Outros'
              TabOrder = 6
            end
          end
        end
      end
    end
  end
end
