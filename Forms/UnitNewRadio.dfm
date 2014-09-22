object NewRadioForm: TNewRadioForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New radio station'
  ClientHeight = 127
  ClientWidth = 594
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
    594
    127)
  PixelsPerInch = 96
  TextHeight = 13
  object NameEdit: TLabeledEdit
    Left = 80
    Top = 8
    Width = 506
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Station Name:'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object WebEdit: TLabeledEdit
    Left = 80
    Top = 35
    Width = 506
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Web page:'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object StreamEdit: TLabeledEdit
    Left = 80
    Top = 62
    Width = 506
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Stream link:'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object Button1: TButton
    Left = 511
    Top = 94
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Add'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 430
    Top = 94
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button2Click
  end
end
