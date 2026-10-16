object frmBLOQUEIOSISTEMA: TfrmBLOQUEIOSISTEMA
  Left = 0
  Top = 0
  ClientHeight = 720
  ClientWidth = 860
  Caption = ''
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  PixelsPerInch = 96
  TextHeight = 13
  object htmlBloqueio: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 860
    Height = 720
    Hint = ''
    Align = alClient
  end
end