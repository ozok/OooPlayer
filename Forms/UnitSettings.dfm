object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 186
  ClientWidth = 288
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
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    288
    186)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TsPageControl
    Left = 8
    Top = 8
    Width = 272
    Height = 139
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = 'General'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CheckUpdateBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 140
        Height = 19
        Caption = 'Check updates on start'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object Button2: TsButton
        Left = 151
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Check now'
        TabOrder = 1
        OnClick = Button2Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object TabSheet2: TsTabSheet
      Caption = 'Playback'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TsLabel
        Left = 16
        Top = 65
        Width = 102
        Height = 13
        Caption = 'Buffer length (in ms):'
      end
      object PlayCursorBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 139
        Height = 19
        Caption = 'Playback follows cursor'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object PlayJumpBtn: TsCheckBox
        Left = 16
        Top = 39
        Width = 121
        Height = 19
        Caption = 'Jump to current file'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object BufferEdit: TJvSpinEdit
        Left = 124
        Top = 62
        Width = 75
        Height = 21
        CheckOptions = [coCheckOnExit, coCropBeyondLimit]
        Alignment = taCenter
        ButtonKind = bkClassic
        MaxValue = 5000.000000000000000000
        MinValue = 500.000000000000000000
        Value = 500.000000000000000000
        TabOrder = 2
        OnChange = BufferEditChange
      end
    end
    object TabSheet3: TsTabSheet
      Caption = 'Cover'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LoadArtBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 203
        Height = 19
        Caption = 'Load cover art when playback starts'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = LoadArtBtnClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object CoverArtList: TsComboBox
        Left = 16
        Top = 39
        Width = 201
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
        Style = csDropDownList
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'External cover art first'
        Items.Strings = (
          'External cover art first'
          'Internal cover art first')
      end
    end
    object TabSheet5: TsTabSheet
      Caption = 'Lyric'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LyricBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 102
        Height = 19
        Caption = 'Download lyrics'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object LogLyricFailBtn: TsCheckBox
        Left = 16
        Top = 39
        Width = 157
        Height = 19
        Caption = 'Log if lyric downloader fails'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Skin'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SkinsList: TsComboBox
        Left = 16
        Top = 16
        Width = 200
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'Skins:'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        VerticalAlignment = taAlignTop
        Style = csDropDownList
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnChange = SkinsListChange
      end
    end
  end
  object Button1: TsButton
    Left = 205
    Top = 153
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object UpdateChecker: TJvHttpUrlGrabber
    FileName = 'output.txt'
    OutputMode = omStream
    Agent = 'JEDI-VCL'
    Port = 0
    ProxyAddresses = 'proxyserver'
    ProxyIgnoreList = '<local>'
    OnDoneStream = UpdateCheckerDoneStream
    Left = 212
    Top = 46
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 164
    Top = 86
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 136
    Top = 88
  end
end
