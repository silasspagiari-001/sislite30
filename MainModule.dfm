object mm: Tmm
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  BackButtonAction = bbaWarnUser
  Theme = 'triton.modified'
  TouchTheme = 'material'
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyEnableAll = True
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  ConstrainForms = True
  OnSessionTimeout = UniGUIMainModuleSessionTimeout
  OnBeforeLogin = UniGUIMainModuleBeforeLogin
  OnBrowserClose = UniGUIMainModuleBrowserClose
  Height = 577
  Width = 941
  object SQLConn: TFDConnection
    Params.Strings = (
      'Port=3060'
      'CharacterSet=win1252'
      'Protocol=TCPIP'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 25
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvSE2Null, fvStrsTrim, fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayTime, fvFmtDisplayNumeric, fvFmtEditNumeric, fvStrsTrim2Len]
    FormatOptions.StrsTrim = False
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    OnRecover = SQLConnRecover
    Left = 73
    Top = 39
  end
  object FDTransaction: TFDTransaction
    Connection = SQLConn
    Left = 104
    Top = 40
  end
end
