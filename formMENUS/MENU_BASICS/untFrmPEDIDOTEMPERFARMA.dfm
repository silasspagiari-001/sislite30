inherited frmPEDIDOTEMPERFARMA: TfrmPEDIDOTEMPERFARMA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            Height = 582
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              Height = 582
              ExplicitHeight = 582
              ScrollHeight = 389
              ScrollWidth = 254
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
          end
        end
      end
      inherited paBaseRegData1: TUniTabSheet
        inherited UniScrollBox2: TUniScrollBox
          Height = 576
          ScrollHeight = 1474
          ScrollWidth = 868
          ScrollY = 558
          inherited rcBlock10: TUniContainerPanel
            Top = -555
            ExplicitTop = -555
          end
          inherited rcBlock20: TUniContainerPanel
            Top = -555
            ExplicitTop = -555
          end
          inherited rcBlock30: TUniContainerPanel
            Top = -555
            ExplicitTop = -555
          end
          inherited rcBlock40: TUniContainerPanel
            Top = -555
            ExplicitTop = -555
          end
          inherited rcBlock50: TUniContainerPanel
            Top = -555
            ExplicitTop = -555
          end
          inherited rcBlock60: TUniContainerPanel
            Top = -499
            ExplicitTop = -499
          end
          inherited rcBlock70: TUniContainerPanel
            Top = -469
            ExplicitTop = -469
          end
          inherited rcBlock80: TUniContainerPanel
            Top = -469
            ExplicitTop = -469
          end
          inherited rcBlock90: TUniContainerPanel
            Top = -469
            ExplicitTop = -469
          end
          inherited rcBlock100: TUniContainerPanel
            Top = -470
            ExplicitTop = -470
          end
          inherited rcBlock110: TUniContainerPanel
            Top = -419
            ExplicitTop = -419
          end
          inherited rcBlock120: TUniContainerPanel
            Top = -419
            ExplicitTop = -419
          end
          inherited rcBlock130: TUniContainerPanel
            Top = -419
            ExplicitTop = -419
          end
          inherited rcBlock140: TUniContainerPanel
            Top = -419
            ExplicitTop = -419
          end
          inherited rcBlock150: TUniContainerPanel
            Top = -419
            ExplicitTop = -419
          end
          inherited rcBlock160: TUniContainerPanel
            Top = -369
            ExplicitTop = -369
          end
          inherited rcBlock170: TUniContainerPanel
            Top = -369
            ExplicitTop = -369
          end
          inherited rcBlock180: TUniContainerPanel
            Top = -369
            ExplicitTop = -369
          end
          inherited rcBlock190: TUniContainerPanel
            Top = -370
            ExplicitTop = -370
          end
          inherited rcBlock200: TUniContainerPanel
            Top = -317
            ExplicitTop = -317
          end
          inherited rcBlock210: TUniContainerPanel
            Top = -292
            ExplicitTop = -292
            inherited UniButtonDbEditvendedor: TUniButtonDbEdit
              Left = 3
              Top = 15
              Width = 144
              ExplicitLeft = 3
              ExplicitTop = 15
              ExplicitWidth = 144
            end
            inherited UniLabel24: TUniLabel
              Left = 3
              Top = -3
              ExplicitLeft = 3
              ExplicitTop = -3
            end
          end
          inherited rcBlock220: TUniContainerPanel
            Left = 340
            Top = -292
            ExplicitLeft = 340
            ExplicitTop = -292
          end
          inherited rcBlock230: TUniContainerPanel
            Left = 516
            Top = -292
            ExplicitLeft = 516
            ExplicitTop = -292
          end
          inherited rcBlock240: TUniContainerPanel
            Top = -242
            ExplicitTop = -242
          end
          inherited rcBlock250: TUniContainerPanel
            Top = -214
            ExplicitTop = -214
          end
          inherited rcBlock260: TUniContainerPanel
            Top = -214
            ExplicitTop = -214
          end
          inherited rcBlock270: TUniContainerPanel
            Top = -164
            ExplicitTop = -164
          end
          inherited rcBlock280: TUniContainerPanel
            Top = -164
            ExplicitTop = -164
          end
          inherited rcBlock290: TUniContainerPanel
            Top = -112
            ExplicitTop = -112
          end
          inherited rcBlock300: TUniContainerPanel
            Top = 11
            ExplicitTop = 11
          end
          inherited rcBlock310: TUniContainerPanel
            Top = 39
            ExplicitTop = 39
          end
          inherited rcBlock320: TUniContainerPanel
            Top = 245
            ExplicitTop = 245
          end
          inherited rcBlock330: TUniContainerPanel
            Top = 245
            ExplicitTop = 245
          end
          inherited rcBlock340: TUniContainerPanel
            Top = 245
            ExplicitTop = 245
          end
          inherited rcBlock350: TUniContainerPanel
            Top = 295
            ExplicitTop = 295
          end
          inherited rcBlock360: TUniContainerPanel
            Top = 295
            ExplicitTop = 295
          end
          inherited rcBlock370: TUniContainerPanel
            Top = 295
            ExplicitTop = 295
          end
          inherited rcBlock380: TUniContainerPanel
            Top = 345
            ExplicitTop = 345
          end
          object rcBlock390: TUniContainerPanel
            Left = 2
            Top = 852
            Width = 150
            Height = 64
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 38
            DesignSize = (
              150
              64)
            object UniDBEdit1: TUniDBEdit
              Left = 1
              Top = 18
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'PEDIDO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel40: TUniLabel
              Left = 3
              Top = 1
              Width = 92
              Height = 15
              Hint = ''
              Caption = 'Numero Original'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock400: TUniContainerPanel
            Left = 195
            Top = 852
            Width = 150
            Height = 64
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 39
            DesignSize = (
              150
              64)
            object UniDBEdit2: TUniDBEdit
              Left = 3
              Top = 18
              Width = 146
              Height = 29
              Hint = ''
              DataField = 'PEDIDO_SERIE'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel41: TUniLabel
              Left = 3
              Top = 1
              Width = 27
              Height = 15
              Hint = ''
              Caption = 'Serie'
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
  inherited UniPopupMenudetalhes: TUniPopupMenu
    inherited N3: TUniMenuItem
      Visible = False
    end
    inherited O1: TUniMenuItem
      Visible = False
    end
    inherited P1: TUniMenuItem
      Visible = True
      inherited o2: TUniMenuItem
        Visible = True
        OnClick = o2Click
      end
      inherited O3: TUniMenuItem
        OnClick = O3Click
      end
    end
  end
end
