object frmBaseReportDefault: TfrmBaseReportDefault
  Left = 0
  Top = 0
  ClientHeight = 1061
  ClientWidth = 1049
  Caption = 'frmBaseReportDefault'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Calibri'
  PixelsPerInch = 96
  TextHeight = 15
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'Select * from cargos')
    Left = 898
    Top = 401
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 898
    Top = 507
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 898
    Top = 455
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 898
    Top = 551
  end
end
