object frmAVISOFINANCEIRO: TfrmAVISOFINANCEIRO
  Left = 0
  Top = 0
  ClientHeight = 630
  ClientWidth = 560
  Caption = ''
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object htmlAvisoFinanceiro: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 560
    Height = 630
    Hint = ''
    Align = alClient
    OnAjaxEvent = htmlAvisoFinanceiroAjaxEvent
  end
end
