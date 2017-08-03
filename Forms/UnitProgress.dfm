object ProgressForm: TProgressForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Progress'
  ClientHeight = 58
  ClientWidth = 645
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    645
    58)
  PixelsPerInch = 96
  TextHeight = 13
  object StateLabel: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = 'StateLabel'
  end
  object MsgLabel: TLabel
    Left = 8
    Top = 29
    Width = 548
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = 'MsgLabel'
  end
  object AbortBtn: TButton
    Left = 562
    Top = 17
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Abort'
    TabOrder = 0
    OnClick = AbortBtnClick
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 48
    Width = 645
    Height = 10
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 41
  end
end
