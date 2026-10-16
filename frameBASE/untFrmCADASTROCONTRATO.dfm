object frmCADASTROCONTRATO: TfrmCADASTROCONTRATO
  Left = 0
  Top = 0
  ClientHeight = 630
  ClientWidth = 580
  Caption = ''
  OnShow = UniFormShow
  OnKeyDown = UniFormKeyDown
  OnCloseQuery = UniFormCloseQuery
  KeyPreview = True
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object htmlCadastroContrato: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 580
    Height = 630
    Hint = ''
    Align = alClient
    OnAjaxEvent = htmlCadastroContratoAjaxEvent
  end
end
