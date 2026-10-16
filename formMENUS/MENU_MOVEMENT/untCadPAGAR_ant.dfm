inherited frmcadPAGAR: TfrmcadPAGAR
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
              ScrollHeight = 446
              ScrollWidth = 262
              inherited paSearchFilter1: TUniContainerPanel
                inherited UniContainerPanel1: TUniContainerPanel
                  inherited UniContainerPanel5: TUniContainerPanel
                    inherited UniButtonEditpnumero: TUniButtonEdit
                      ExplicitWidth = 115
                    end
                  end
                  inherited UniContainerPanel6: TUniContainerPanel
                    inherited UniComboBoxserie: TUniComboBox
                      Text = 'TT'
                      ItemIndex = 6
                    end
                  end
                end
              end
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
            Columns = <
              item
                FieldName = 'SITUACAO'
                Title.Caption = 'Situa'#231#227'o'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Visible = False
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'Numero'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'Ser.'
                Width = 25
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'Seq.'
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PESSOA'
                Title.Caption = 'Pessoa'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'Nome'
                Width = 300
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'Emiss'#227'o'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'Vencimento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'Pagamento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORATUAL'
                Title.Caption = 'Valor Atual'
                Width = 100
                Font.Name = 'Calibri'
              end>
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
          ScrollWidth = 975
          inherited rcBlock10: TUniContainerPanel
            inherited edCodigo: TUniDBEdit
              AlignWithMargins = True
              Width = 140
              ExplicitWidth = 140
            end
          end
          inherited rcBlock20: TUniContainerPanel
            inherited rcDBComboBox50: TUniDBComboBox
              AlignWithMargins = True
              Width = 144
              ExplicitWidth = 144
            end
          end
          inherited rcBlock30: TUniContainerPanel
            inherited UniDBEditsequencia: TUniDBEdit
              AlignWithMargins = True
              Width = 87
              ExplicitWidth = 87
            end
          end
          inherited rcBlock40: TUniContainerPanel
            inherited UniButtonDbEdit1: TUniButtonDbEdit
              AlignWithMargins = True
              Anchors = [akLeft, akTop, akRight]
            end
          end
          inherited rcBlock230: TUniContainerPanel
            Width = 500
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ExplicitWidth = 500
            inherited UniEditportadordescricao: TUniEdit
              Width = 430
              ExplicitWidth = 430
            end
          end
          inherited rcBlock240: TUniContainerPanel
            Left = 509
            Width = 396
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ExplicitLeft = 509
            ExplicitWidth = 396
            inherited UniLabel17: TUniLabel
              Left = 106
              ExplicitLeft = 106
            end
            inherited UniEditplanodescricao: TUniEdit
              Width = 285
              ExplicitWidth = 285
            end
          end
          inherited rcBlock250: TUniContainerPanel
            Left = 635
            Top = 12
            Visible = False
            ExplicitLeft = 635
            ExplicitTop = 12
          end
          inherited rcBlock260: TUniContainerPanel
            Left = 843
            Top = 11
            Visible = False
            ExplicitLeft = 843
            ExplicitTop = 11
            inherited UniDBEdit6: TUniDBEdit
              AlignWithMargins = True
              Width = 96
              ExplicitWidth = 96
            end
          end
          inherited rcBlock270: TUniContainerPanel
            Width = 199
            ExplicitWidth = 199
            inherited UniDBDateTimePicker1: TUniDBDateTimePicker
              AlignWithMargins = True
              Width = 193
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 193
            end
          end
          inherited rcBlock280: TUniContainerPanel
            Left = 212
            Width = 200
            ExplicitLeft = 212
            ExplicitWidth = 200
            inherited UniDBDateTimePicker2: TUniDBDateTimePicker
              AlignWithMargins = True
              Width = 192
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 192
            end
          end
          inherited rcBlock290: TUniContainerPanel
            AlignWithMargins = True
            Left = 418
            Width = 200
            Anchors = [akLeft, akTop, akRight]
            ExplicitLeft = 418
            ExplicitWidth = 200
            inherited UniDBDateTimePicker3: TUniDBDateTimePicker
              AlignWithMargins = True
              Width = 195
              ReadOnly = False
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 195
            end
          end
          inherited rcBlock300: TUniContainerPanel
            Left = 626
            Width = 200
            ExplicitLeft = 626
            ExplicitWidth = 200
            inherited UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Width = 195
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 195
            end
          end
          inherited rcBlock310: TUniContainerPanel
            Width = 199
            ExplicitWidth = 199
            inherited UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Width = 106
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 106
            end
          end
          inherited rcBlock320: TUniContainerPanel
            Left = 212
            Width = 198
            ExplicitLeft = 212
            ExplicitWidth = 198
            inherited UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Width = 191
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 191
            end
          end
          inherited rcBlock330: TUniContainerPanel
            Left = 416
            Width = 202
            ExplicitLeft = 416
            ExplicitWidth = 202
            inherited UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
              AlignWithMargins = True
            end
            inherited UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Width = 86
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 86
            end
          end
          inherited rcBlock340: TUniContainerPanel
            Left = 626
            Width = 200
            ExplicitLeft = 626
            ExplicitWidth = 200
            inherited UniDBEdit2: TUniDBEdit
              AlignWithMargins = True
              Left = 2
              Width = 195
              ExplicitLeft = 2
              ExplicitWidth = 195
            end
            inherited UniLabel26: TUniLabel
              Left = 2
              ExplicitLeft = 2
            end
          end
          object rcBlock350: TUniContainerPanel
            Left = 3
            Top = 386
            Width = 910
            Height = 25
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 20
            DesignSize = (
              910
              25)
            object UniLabel39: TUniLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'OBSERVA'#199#195'O'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock360: TUniContainerPanel
            Left = 3
            Top = 423
            Width = 910
            Height = 98
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 21
            object UniDBMemoobs: TUniDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 904
              Height = 92
              Hint = ''
              DataField = 'OBSERVACOES'
              DataSource = dscrud
              Align = alClient
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'select * from PAGAR')
    object FDQryFiltroVALORORIGINAL: TFMTBCDField
      FieldName = 'VALORORIGINAL'
      Origin = 'VALORORIGINAL'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PAGAR'
    SQL.Strings = (
      'SELECT * FROM PAGAR WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
