object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 325
  ClientWidth = 560
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
  OnShow = FormShow
  DesignSize = (
    560
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 544
    Height = 278
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label2: TLabel
        Left = 54
        Top = 62
        Width = 102
        Height = 13
        Caption = 'Window title pattern:'
      end
      object Label3: TLabel
        Left = 57
        Top = 89
        Width = 99
        Height = 13
        Caption = 'Playlist item pattern:'
      end
      object CheckUpdateBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 140
        Height = 19
        Caption = 'Check updates on start'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 162
        Top = 13
        Width = 75
        Height = 25
        Caption = 'Check now'
        TabOrder = 1
        OnClick = Button2Click
      end
      object PlaylistItemTextList: TComboBox
        Left = 162
        Top = 86
        Width = 145
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12102048
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = PlaylistItemTextListChange
        Items.Strings = (
          'Song - Album - Artist'
          'Album - Song - Artist'
          'Artist - Album - Song'
          'Song - Artist - Album'
          'Album - Artist - Song'
          'Artist - Song - Album')
      end
      object WindowTitleList: TComboBox
        Left = 162
        Top = 59
        Width = 145
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12102048
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'Song - Album - Artist'
          'Album - Song - Artist'
          'Artist - Album - Song'
          'Song - Artist - Album'
          'Album - Artist - Song'
          'Artist - Song - Album')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Playback'
      ImageIndex = 1
      object Label1: TLabel
        Left = 17
        Top = 69
        Width = 106
        Height = 13
        Caption = 'Playback buffer in ms:'
      end
      object PlayCursorBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 139
        Height = 19
        Caption = 'Playback follows cursor'
        TabOrder = 0
      end
      object PlayJumpBtn: TCheckBox
        Left = 16
        Top = 39
        Width = 121
        Height = 19
        Caption = 'Jump to current file'
        TabOrder = 1
      end
      object BufferEdit: TSpinEdit
        Left = 129
        Top = 66
        Width = 75
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 5000
        MinValue = 500
        ParentFont = False
        TabOrder = 2
        Value = 1000
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Cover'
      ImageIndex = 2
      object LoadArtBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 203
        Height = 19
        Caption = 'Load cover art when playback starts'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = LoadArtBtnClick
      end
      object CoverArtList: TComboBox
        Left = 16
        Top = 39
        Width = 201
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'External cover art first'
          'Internal cover art first')
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Lyric'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      object LyricBtn: TCheckBox
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
      end
      object LogLyricFailBtn: TCheckBox
        Left = 17
        Top = 64
        Width = 157
        Height = 19
        Caption = 'Log if lyric downloader fails'
        TabOrder = 1
      end
      object ShowDownloadedLyrics: TCheckBox
        Left = 16
        Top = 41
        Width = 142
        Height = 19
        Caption = 'Show downloaded lyrics'
        TabOrder = 2
      end
    end
    object sTabSheet2: TTabSheet
      Caption = 'Last.fm'
      object sLabel4: TLabel
        Left = 3
        Top = 95
        Width = 475
        Height = 13
        Caption = 
          'Once you'#39've entered your password, it won'#39't be shown here. You c' +
          'an enter a new password here.'
      end
      object Label4: TLabel
        Left = 48
        Top = 44
        Width = 26
        Height = 13
        Caption = 'User:'
      end
      object Label5: TLabel
        Left = 24
        Top = 72
        Width = 50
        Height = 13
        Caption = 'Password:'
      end
      object LastFMUserEdit: TEdit
        Left = 80
        Top = 41
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object LastFMPassEdit: TEdit
        Left = 80
        Top = 68
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
      end
      object LastFMSaveBtn: TButton
        Left = 207
        Top = 41
        Width = 75
        Height = 48
        Caption = 'Save'
        TabOrder = 2
        OnClick = LastFMSaveBtnClick
      end
      object LastFMEnableBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 147
        Height = 19
        Caption = 'Enable last.fm scrobbling'
        TabOrder = 3
      end
    end
  end
  object Button1: TButton
    Left = 477
    Top = 292
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object UpdateChecker: TJvHttpUrlGrabber
    FileName = 'output.txt'
    OutputMode = omStream
    Agent = 'JEDI-VCL'
    Port = 0
    ProxyAddresses = 'proxyserver'
    ProxyIgnoreList = '<local>'
    OnDoneStream = UpdateCheckerDoneStream
    Left = 84
    Top = 262
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 220
    Top = 262
  end
end
