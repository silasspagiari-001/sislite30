inherited frmPEDIDOCOMPRA: TfrmPEDIDOCOMPRA
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
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited UniScrollBox2: TUniScrollBox
          Height = 576
          ExplicitHeight = 576
          ScrollHeight = 553
          ScrollWidth = 946
        end
      end
    end
  end
end
