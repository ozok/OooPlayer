object InfoForm: TInfoForm
  Left = 0
  Top = 0
  Caption = 'File Info'
  ClientHeight = 562
  ClientWidth = 784
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
    784
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 766
    Height = 517
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 506
    ExplicitHeight = 370
    object TabSheet2: TTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 498
      ExplicitHeight = 342
      object InfoList: TTreeView
        Left = 0
        Top = 0
        Width = 758
        Height = 489
        Align = alClient
        BorderStyle = bsNone
        HideSelection = False
        Indent = 19
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ExplicitWidth = 498
        ExplicitHeight = 342
      end
    end
  end
  object Button1: TButton
    Left = 699
    Top = 531
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 439
    ExplicitTop = 384
  end
end
