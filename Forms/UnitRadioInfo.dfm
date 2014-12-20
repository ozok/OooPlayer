object RadioInfoForm: TRadioInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radio Station'
  ClientHeight = 99
  ClientWidth = 594
  Color = 3485741
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
  object Label1: TsLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Station name:'
  end
  object Label2: TsLabel
    Left = 29
    Top = 27
    Width = 46
    Height = 13
    Caption = 'Web site:'
  end
  object Label3: TsLabel
    Left = 19
    Top = 46
    Width = 56
    Height = 13
    Caption = 'Stream link:'
  end
  object NameLabel: TsLabel
    Left = 81
    Top = 8
    Width = 52
    Height = 13
    Caption = 'NameLabel'
  end
  object WebLabel: TsLabel
    Left = 81
    Top = 27
    Width = 47
    Height = 13
    Cursor = crHandPoint
    Caption = 'WebLabel'
    ParentFont = False
    OnClick = WebLabelClick
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
  end
  object StreamLabel: TsLabel
    Left = 81
    Top = 46
    Width = 59
    Height = 13
    Cursor = crHandPoint
    Caption = 'StreamLabel'
    ParentFont = False
    OnClick = StreamLabelClick
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
  end
  object Button1: TsButton
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
    SkinData.SkinSection = 'BUTTON'
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 288
    Top = 48
  end
end
