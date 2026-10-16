inherited frmCADRECEBER: TfrmCADRECEBER
  inherited paBaseBackGround: TUniContainerPanel
    inherited dbgSearchCRUD: TUniDBGrid
      Columns = <
        item
          FieldName = 'CODIGO'
          Title.Caption = ' '
          Width = 30
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'EMPRESA'
          Title.Caption = 'EMP'
          Width = 50
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SITUACAO'
          Title.Caption = ' '
          Width = 74
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
          Width = 50
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SEQUENCIA'
          Title.Caption = 'Seq.'
          Width = 50
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
  inherited FDQryFiltro: TFDQuery
    UpdateOptions.UpdateTableName = 'RECEBER'
  end
end
