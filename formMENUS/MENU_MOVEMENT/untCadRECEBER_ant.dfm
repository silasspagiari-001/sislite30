inherited frmcadRECEBER: TfrmcadRECEBER
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
                end
              end
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            Columns = <
              item
                FieldName = 'KEY'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
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
              Width = 146
              ExplicitWidth = 146
            end
          end
          inherited rcBlock20: TUniContainerPanel
            inherited rcDBComboBox50: TUniDBComboBox
              AlignWithMargins = True
              Width = 133
              ExplicitWidth = 133
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
          inherited rcBlock250: TUniContainerPanel
            inherited UniEditnomevendedor: TUniEdit
              Width = 134
              ExplicitWidth = 134
            end
          end
          inherited rcBlock260: TUniContainerPanel
            inherited UniDBEdit6: TUniDBEdit
              AlignWithMargins = True
              Width = 96
              ExplicitWidth = 96
            end
          end
          inherited rcBlock270: TUniContainerPanel
            Width = 200
            ExplicitWidth = 200
            inherited UniDBDateTimePicker1: TUniDBDateTimePicker
              AlignWithMargins = True
              Width = 194
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 194
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
            Left = 418
            Width = 200
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
            Top = 268
            Width = 200
            ExplicitLeft = 626
            ExplicitTop = 268
            ExplicitWidth = 200
            inherited UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 3
              Width = 194
              Anchors = [akLeft, akTop, akRight]
              ExplicitLeft = 3
              ExplicitWidth = 194
            end
          end
          inherited rcBlock310: TUniContainerPanel
            Width = 200
            ExplicitWidth = 200
            inherited UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
              Width = 108
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 108
            end
          end
          inherited rcBlock320: TUniContainerPanel
            Left = 212
            Width = 200
            ExplicitLeft = 212
            ExplicitWidth = 200
            inherited UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Width = 193
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 193
            end
          end
          inherited rcBlock330: TUniContainerPanel
            Left = 418
            Width = 200
            ExplicitLeft = 418
            ExplicitWidth = 200
            inherited UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
              Width = 100
              ExplicitWidth = 100
            end
            inherited UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
              Width = 90
              Anchors = [akLeft, akTop, akRight]
              ExplicitWidth = 90
            end
          end
          inherited rcBlock340: TUniContainerPanel
            Left = 626
            Top = 332
            Width = 200
            ExplicitLeft = 626
            ExplicitTop = 332
            ExplicitWidth = 200
            inherited UniDBEdit2: TUniDBEdit
              AlignWithMargins = True
              Left = 3
              Width = 194
              ExplicitLeft = 3
              ExplicitWidth = 194
            end
            inherited UniLabel26: TUniLabel
              Left = 4
              ExplicitLeft = 4
            end
          end
          object rcBlock350: TUniContainerPanel
            Left = 3
            Top = 385
            Width = 918
            Height = 26
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 20
          end
          object rcBlock360: TUniContainerPanel
            Left = 3
            Top = 415
            Width = 918
            Height = 98
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 21
            object UniDBMemoobs: TUniDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 912
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
      'select * from receber')
    object FDQryFiltroKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      OnGetText = FDQryFiltroKEYGetText
      Size = 38
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
    end
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
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'RECEBER'
    SQL.Strings = (
      'SELECT * FROM RECEBER WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 879
    Top = 6
    object H1: TUniMenuItem
      Caption = 'Duplicata Mercantil '
      ImageIndex = 10
      OnClick = H1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object D1: TUniMenuItem
      Caption = 'Detalhes do Documento Emissor'
      ImageIndex = 68
      OnClick = D1Click
    end
  end
end
