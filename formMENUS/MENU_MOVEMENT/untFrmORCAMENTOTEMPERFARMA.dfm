inherited frmORCAMENTOTEMPERFARMA: TfrmORCAMENTOTEMPERFARMA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        inherited btnOptions: TUniBitBtn
          OnClick = nil
        end
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = paBaseRegData1
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 582
              ScrollHeight = 389
              ScrollWidth = 254
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Columns = <
              item
                FieldName = 'opcoes'
                Title.Caption = ' '
                Width = 50
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'STATUS'
                Title.Caption = ' '
                Width = 100
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
      inherited paBaseRegData1: TUniTabSheet
        inherited UniScrollBox2: TUniScrollBox
          ScrollHeight = 1842
          ScrollWidth = 868
          ScrollY = 1268
          inherited rcBlock10: TUniContainerPanel
            Top = -826
            ExplicitTop = -826
          end
          inherited rcBlock20: TUniContainerPanel
            Top = -826
            ExplicitTop = -826
          end
          inherited rcBlock30: TUniContainerPanel
            Top = -826
            ExplicitTop = -826
          end
          inherited rcBlock40: TUniContainerPanel
            Top = -826
            ExplicitTop = -826
          end
          inherited rcBlock50: TUniContainerPanel
            Top = -826
            ExplicitTop = -826
          end
          inherited rcBlock60: TUniContainerPanel
            Top = -770
            ExplicitTop = -770
          end
          inherited rcBlock70: TUniContainerPanel
            Top = -740
            ExplicitTop = -740
          end
          inherited rcBlock80: TUniContainerPanel
            Top = -740
            ExplicitTop = -740
          end
          inherited rcBlock90: TUniContainerPanel
            Top = -740
            ExplicitTop = -740
          end
          inherited rcBlock100: TUniContainerPanel
            Top = -741
            ExplicitTop = -741
          end
          inherited rcBlock110: TUniContainerPanel
            Top = -690
            ExplicitTop = -690
          end
          inherited rcBlock120: TUniContainerPanel
            Top = -690
            ExplicitTop = -690
          end
          inherited rcBlock130: TUniContainerPanel
            Top = -690
            ExplicitTop = -690
          end
          inherited rcBlock140: TUniContainerPanel
            Top = -690
            ExplicitTop = -690
          end
          inherited rcBlock150: TUniContainerPanel
            Top = -690
            ExplicitTop = -690
          end
          inherited rcBlock160: TUniContainerPanel
            Top = -640
            ExplicitTop = -640
          end
          inherited rcBlock170: TUniContainerPanel
            Top = -640
            ExplicitTop = -640
          end
          inherited rcBlock180: TUniContainerPanel
            Top = -640
            ExplicitTop = -640
          end
          inherited rcBlock190: TUniContainerPanel
            Top = -641
            ExplicitTop = -641
          end
          inherited rcBlock200: TUniContainerPanel
            Top = -588
            ExplicitTop = -588
          end
          inherited rcBlock210: TUniContainerPanel
            Top = -563
            Width = 340
            ExplicitTop = -563
            ExplicitWidth = 340
            inherited UniButtonDbEditvendedor: TUniButtonDbEdit
              Left = 152
              Width = 185
              ExplicitLeft = 152
              ExplicitWidth = 185
            end
            inherited UniLabel24: TUniLabel
              Left = 155
              ExplicitLeft = 155
            end
            object UniDBComboBox1: TUniDBComboBox
              Left = 3
              Top = 18
              Width = 125
              Height = 29
              Hint = ''
              DataField = 'STATUS'
              DataSource = dscrud
              Style = csDropDownList
              Items.Strings = (
                'Andamento'
                'Perdido'
                'Produ'#231#227'o'
                'Vendido')
              TabOrder = 3
              IconItems = <>
            end
            object UniLabel42: TUniLabel
              Left = 4
              Top = 0
              Width = 34
              Height = 15
              Hint = ''
              Caption = 'Status'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 4
            end
          end
          inherited rcBlock220: TUniContainerPanel
            Left = 356
            Top = -563
            ExplicitLeft = 356
            ExplicitTop = -563
          end
          inherited rcBlock230: TUniContainerPanel
            Left = 532
            Top = -563
            ExplicitLeft = 532
            ExplicitTop = -563
          end
          inherited rcBlock240: TUniContainerPanel
            Top = -513
            ExplicitTop = -513
          end
          inherited rcBlock250: TUniContainerPanel
            Top = -485
            ExplicitTop = -485
          end
          inherited rcBlock260: TUniContainerPanel
            Top = -485
            ExplicitTop = -485
          end
          inherited rcBlock270: TUniContainerPanel
            Top = -435
            ExplicitTop = -435
          end
          inherited rcBlock280: TUniContainerPanel
            Top = -435
            ExplicitTop = -435
          end
          inherited rcBlock290: TUniContainerPanel
            Top = -383
            ExplicitTop = -383
          end
          inherited rcBlock300: TUniContainerPanel
            Top = -260
            ExplicitTop = -260
          end
          inherited rcBlock310: TUniContainerPanel
            Top = -232
            ExplicitTop = -232
          end
          inherited rcBlock320: TUniContainerPanel
            Top = -26
            ExplicitTop = -26
          end
          inherited rcBlock330: TUniContainerPanel
            Top = -26
            ExplicitTop = -26
          end
          inherited rcBlock340: TUniContainerPanel
            Top = -26
            ExplicitTop = -26
          end
          inherited rcBlock350: TUniContainerPanel
            Top = 24
            ExplicitTop = 24
          end
          inherited rcBlock360: TUniContainerPanel
            Top = 24
            ExplicitTop = 24
          end
          inherited rcBlock370: TUniContainerPanel
            Top = 24
            ExplicitTop = 24
          end
          inherited rcBlock380: TUniContainerPanel
            Top = 74
            ExplicitTop = 74
          end
        end
      end
    end
  end
  inherited FDQryFiltro: TFDQuery
    inherited FDQryFiltroSTATUS: TStringField
      OnGetText = FDQryFiltrostatusGetText
    end
  end
  inherited memprodutos: TFDMemTable
    BeforePost = nil
    AfterPost = nil
    BeforeDelete = nil
    AfterDelete = nil
  end
  inherited UniPopupMenudetalhes: TUniPopupMenu
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
    object N7: TUniMenuItem
      Caption = '-'
    end
    object E1: TUniMenuItem
      Caption = 'Indicativo da Venda'
      ImageIndex = 118
      OnClick = E1Click
    end
  end
end
