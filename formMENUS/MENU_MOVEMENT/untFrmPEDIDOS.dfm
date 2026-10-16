inherited frmPEDIDOS: TfrmPEDIDOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        Top = 357
        ExplicitTop = 357
      end
      inherited paGC: TUniContainerPanel
        Height = 148
        ExplicitHeight = 148
      end
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
          ScrollHeight = 618
          ScrollWidth = 946
          inherited rcBlock580: TUniContainerPanel
            inherited rcBlock600: TUniContainerPanel
              Left = 3
              ExplicitLeft = 3
            end
            inherited rcBlock620: TUniContainerPanel
              Left = 379
              ExplicitLeft = 379
            end
          end
        end
      end
    end
  end
  inherited UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    object E1: TUniMenuItem
      Caption = 'Entrega do(s) Itens(s)'
      ImageIndex = 94
    end
  end
end
