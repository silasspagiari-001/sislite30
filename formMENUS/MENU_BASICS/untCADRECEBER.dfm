inherited frmcadRECEBER: TfrmcadRECEBER
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
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
              ScrollHeight = 457
              ScrollWidth = 245
              inherited paSearchContent1: TUniContainerPanel
                inherited rcBlock160: TUniContainerPanel
                  inherited edLkpCIDADES: TUniDBEdit
                    OnClick = nil
                  end
                end
              end
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 965
        end
      end
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'RECEBER'
    SQL.Strings = (
      'SELECT * FROM RECEBER')
  end
end
