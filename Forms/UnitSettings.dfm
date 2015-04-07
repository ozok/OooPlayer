object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 325
  ClientWidth = 560
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
    560
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TsPageControl
    Left = 8
    Top = 8
    Width = 544
    Height = 278
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = 'General'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
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
        Left = 162
        Top = 13
        Width = 75
        Height = 25
        Caption = 'Check now'
        TabOrder = 1
        OnClick = Button2Click
        SkinData.SkinSection = 'BUTTON'
      end
      object PlaylistItemTextList: TsComboBox
        Left = 162
        Top = 86
        Width = 145
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'Playlist item text:'
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
        TabOrder = 2
        Text = 'Song - Album - Artist'
        OnChange = PlaylistItemTextListChange
        Items.Strings = (
          'Song - Album - Artist'
          'Album - Song - Artist'
          'Artist - Album - Song'
          'Song - Artist - Album'
          'Album - Artist - Song'
          'Artist - Song - Album')
      end
      object WindowTitleList: TsComboBox
        Left = 162
        Top = 59
        Width = 145
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'Window title layout:'
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
        TabOrder = 3
        Text = 'Song - Album - Artist'
        Items.Strings = (
          'Song - Album - Artist'
          'Album - Song - Artist'
          'Artist - Album - Song'
          'Song - Artist - Album'
          'Album - Artist - Song'
          'Artist - Song - Album')
      end
    end
    object TabSheet2: TsTabSheet
      Caption = 'Playback'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
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
      object BufferEdit: TsSpinEdit
        Left = 180
        Top = 64
        Width = 75
        Height = 21
        Alignment = taCenter
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Buffer length in ms:'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        MaxValue = 5000
        MinValue = 500
        Value = 1000
      end
    end
    object TabSheet3: TsTabSheet
      Caption = 'Cover'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
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
      object LyricBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 132
        Height = 19
        Caption = 'Download/Show lyrics'
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
      Caption = 'Look'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object SkinsList: TsComboBox
        Left = 46
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
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnChange = SkinsListChange
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'Last.fm'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object LastFMUserEdit: TsEdit
        Left = 80
        Top = 41
        Width = 121
        Height = 21
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'User name:'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object LastFMPassEdit: TsEdit
        Left = 80
        Top = 68
        Width = 121
        Height = 21
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Password:'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object LastFMSaveBtn: TsButton
        Left = 207
        Top = 41
        Width = 75
        Height = 48
        Caption = 'Save'
        TabOrder = 2
        OnClick = LastFMSaveBtnClick
        SkinData.SkinSection = 'BUTTON'
      end
      object LastFMEnableBtn: TsCheckBox
        Left = 16
        Top = 16
        Width = 147
        Height = 19
        Caption = 'Enable last.fm scrobbling'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object Button1: TsButton
    Left = 477
    Top = 292
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
    Left = 52
    Top = 190
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 132
    Top = 198
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 224
    Top = 200
  end
end
