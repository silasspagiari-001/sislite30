inherited frmBAIXAPAGAR: TfrmBAIXAPAGAR
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      AlignWithMargins = False
      Left = 0
      Top = 40
      Height = 610
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      AlignWithMargins = False
      Left = 37
      Top = 40
      Width = 983
      Height = 610
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegSearch: TUniContainerPanel
          Width = 975
          Height = 582
          ExplicitHeight = 572
          inherited paSearchFilters: TUniPanel
            Height = 582
            ExplicitHeight = 572
            inherited UniScrollBox1: TUniScrollBox
              Height = 582
              ExplicitHeight = 572
              ScrollHeight = 446
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Width = 709
            Height = 582
          end
        end
      end
    end
  end
  inherited FDQryFiltro: TFDQuery
    UpdateOptions.UpdateTableName = 'PAGAR'
  end
end
