object frmTELAAVISOMSG: TfrmTELAAVISOMSG
  Left = 0
  Top = 0
  ClientHeight = 580
  ClientWidth = 740
  Caption = 'Comunicado Oficial'
  BorderStyle = bsDialog
  Position = poScreenCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnShow = UniFormShow
  OnResize = UniFormResize
  PixelsPerInch = 96
  TextHeight = 13
  object paContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 580
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object paHeader: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 740
      Height = 72
      Align = alTop
      Color = 16316664
      ParentColor = False
      TabOrder = 0
      object labBadge: TUniLabel
        Left = 20
        Top = 12
        Width = 140
        Height = 20
        Caption = ' COMUNICADO '
        ParentFont = False
        Font.Color = 2781440
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentColor = False
        Color = 14483164
        TabOrder = 1
      end
      object UniLabeltitulo: TUniLabel
        Left = 20
        Top = 36
        Width = 700
        Height = 26
        AutoSize = False
        Caption = 'TITULO DO COMUNICADO'
        ParentFont = False
        Font.Color = 1052688
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object paBody: TUniContainerPanel
      Left = 0
      Top = 72
      Width = 740
      Height = 448
      Align = alClient
      Color = clWhite
      ParentColor = False
      TabOrder = 1
      object htmlCorpo: TUniHTMLFrame
        Left = 0
        Top = 0
        Width = 740
        Height = 448
        Align = alClient
        TabOrder = 1
      end
    end
    object paFooter: TUniContainerPanel
      Left = 0
      Top = 520
      Width = 740
      Height = 60
      Align = alBottom
      Color = 16579836
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        740
        60)
      object btnConfirmar: TUniBitBtn
        Left = 380
        Top = 12
        Width = 240
        Height = 36
        Anchors = [akTop, akRight]
        Caption = 'Confirmar Leitura'
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Color = 2781440
        OnClick = btnConfirmarClick
      end
      object btnFechar: TUniBitBtn
        Left = 630
        Top = 12
        Width = 90
        Height = 36
        Anchors = [akTop, akRight]
        Caption = 'Fechar'
        Font.Color = 4605510
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Color = 15921906
        OnClick = btnFecharClick
      end
    end
  end
end
