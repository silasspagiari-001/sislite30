object frmRELATORIO_LOTE: TfrmRELATORIO_LOTE
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Relat'#243'rio de Lote/BAS'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
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
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 613
      Height = 346
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Relat'#243'rio Lote/BAS'
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 605
          Height = 318
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
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
            object edSearchprodutoINI: TUniButtonEdit
              AlignWithMargins = True
              Left = 2
              Top = 20
              Width = 146
              Height = 26
              Hint = ''
              Text = '00001'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnButtonClick = edSearchprodutoINIButtonClick
              IconCls = 'search'
            end
            object UniLabelDtIni: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 2
              Width = 79
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Produto Inicio'
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
            object edSearchprodutoFIN: TUniButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 20
              Width = 145
              Height = 26
              Hint = ''
              Text = '99999'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnButtonClick = edSearchprodutoFINButtonClick
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
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 3
            Top = 55
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              150
              48)
            object cbxsaldos: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = 'Todos'
              Items.Strings = (
                'Positivo'
                'Negativo'
                'Zerado'
                'Todos')
              ItemIndex = 3
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
              Top = 1
              Width = 37
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Saldos'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 196
            Top = 55
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              150
              48)
            object cbxopcoes: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = 'Todos'
              Items.Strings = (
                'Aguarde'
                'Entrada'
                'Saida'
                'Fiscal'
                'Todos')
              ItemIndex = 4
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
              Width = 41
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Op'#231#245'es'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 366
            Top = 55
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              150
              48)
            object cbxcategoria: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 143
              Height = 29
              Hint = ''
              Margins.Right = 5
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                'C1'
                'C2'
                'S1'
                'S2'
                'S1+S2'
                '')
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel4: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 53
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Categoria'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock60: TUniContainerPanel
            Left = 0
            Top = 259
            Width = 605
            Height = 59
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Align = alBottom
            TabOrder = 6
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
        end
      end
    end
  end
end
