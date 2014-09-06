object InfoForm: TInfoForm
  Left = 0
  Top = 0
  Caption = 'File Info'
  ClientHeight = 415
  ClientWidth = 524
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    524
    415)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 506
    Height = 370
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object InfoList: TTreeView
        Left = 0
        Top = 0
        Width = 498
        Height = 342
        Align = alClient
        BorderStyle = bsNone
        HideSelection = False
        Indent = 19
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 439
    Top = 384
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
end
