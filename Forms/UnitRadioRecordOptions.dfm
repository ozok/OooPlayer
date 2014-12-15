object RadioRecordOptionsForm: TRadioRecordOptionsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radio Recording Options'
  ClientHeight = 92
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
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    645
    92)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 8
    Top = 11
    Width = 118
    Height = 13
    Caption = 'Recording save location:'
  end
  object Label2: TsLabel
    Left = 57
    Top = 38
    Width = 69
    Height = 13
    Caption = 'Bitrate (kbps):'
  end
  object Label3: TsLabel
    Left = 8
    Top = 71
    Width = 291
    Height = 13
    Caption = 'Changes will be effective the next time you start a recording'
  end
  object RecordSaveEdit: TJvDirectoryEdit
    Left = 132
    Top = 8
    Width = 424
    Height = 21
    DialogKind = dkWin32
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = ''
  end
  object Button1: TsButton
    Left = 562
    Top = 8
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Button2: TsButton
    Left = 562
    Top = 59
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object BitrateList: TsComboBox
    Left = 132
    Top = 35
    Width = 75
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    VerticalAlignment = taAlignTop
    Color = 2038810
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 13417908
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 4
    ParentFont = False
    TabOrder = 3
    Text = '128'
    Items.Strings = (
      '320'
      '256'
      '192'
      '160'
      '128'
      '112'
      '96'
      '80'
      '65'
      '56'
      '48'
      '32')
  end
  object Info: TJvComputerInfoEx
    Left = 384
    Top = 32
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 312
    Top = 48
  end
end
