inherited frmORCAMENTO: TfrmORCAMENTO
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabSearch
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
        end
      end
    end
  end
end
