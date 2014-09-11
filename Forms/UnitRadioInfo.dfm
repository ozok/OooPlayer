object RadioInfoForm: TRadioInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radio Station'
  ClientHeight = 99
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
    99)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Station name:'
  end
  object Label2: TLabel
    Left = 29
    Top = 27
    Width = 46
    Height = 13
    Caption = 'Web site:'
  end
  object Label3: TLabel
    Left = 19
    Top = 46
    Width = 56
    Height = 13
    Caption = 'Stream link:'
  end
  object NameLabel: TLabel
    Left = 81
    Top = 8
    Width = 52
    Height = 13
    Caption = 'NameLabel'
  end
  object WebLabel: TLabel
    Left = 81
    Top = 27
    Width = 47
    Height = 13
    Cursor = crHandPoint
    Caption = 'WebLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = WebLabelClick
  end
  object StreamLabel: TLabel
    Left = 81
    Top = 46
    Width = 59
    Height = 13
    Cursor = crHandPoint
    Caption = 'StreamLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = StreamLabelClick
  end
  object Button1: TButton
    Left = 511
    Top = 66
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 562
    ExplicitTop = 281
  end
end
