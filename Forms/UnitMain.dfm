object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OooPlayer'
  ClientHeight = 742
  ClientWidth = 1224
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 870
    Top = 78
    Width = 4
    Height = 602
    Align = alRight
    OnMoved = Splitter2Moved
    ExplicitLeft = 872
    ExplicitTop = 83
    ExplicitHeight = 599
  end
  object sSplitter2: TSplitter
    Left = 250
    Top = 78
    Width = 4
    Height = 602
    ExplicitLeft = 217
    ExplicitTop = 83
    ExplicitHeight = 599
  end
  object TopBarPnl: TPanel
    Left = 0
    Top = 0
    Width = 1224
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    OnMouseEnter = TopBarPnlMouseEnter
    object VolumePnl: TPanel
      AlignWithMargins = True
      Left = 1198
      Top = 0
      Width = 25
      Height = 78
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object VolumeBar: TJvTrackBar
        Left = 0
        Top = 0
        Width = 25
        Height = 78
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        DoubleBuffered = False
        Max = 100
        Orientation = trVertical
        ParentDoubleBuffered = False
        PageSize = 1
        ShowSelRange = False
        TabOrder = 0
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = VolumeBarChange
        OnMouseDown = VolumeBarMouseDown
      end
    end
    object PlaybackPanel: TPanel
      Left = 0
      Top = 0
      Width = 1198
      Height = 78
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      OnMouseEnter = PlaybackPanelMouseEnter
      object PositionPanel: TPanel
        Left = 0
        Top = 54
        Width = 1198
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        OnMouseLeave = FuncPagesMouseLeave
        object PositionLabel: TLabel
          AlignWithMargins = True
          Left = 1013
          Top = 0
          Width = 182
          Height = 24
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = '00:00:00/00:00:00/00:00:00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 14
        end
        object PositionBar: TJvTrackBar
          Left = 0
          Top = 0
          Width = 1013
          Height = 24
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          DoubleBuffered = False
          Max = 100
          ParentDoubleBuffered = False
          PageSize = 1
          ShowSelRange = False
          TabOrder = 0
          TickMarks = tmBoth
          TickStyle = tsNone
          OnChanged = PositionBarChanged
          OnMouseDown = PositionBarMouseDown
        end
      end
      object ControlsPanel: TPanel
        Left = 0
        Top = 0
        Width = 1198
        Height = 54
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object InfoPanel: TPanel
          Left = 250
          Top = 0
          Width = 630
          Height = 54
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseEnter = InfoPanelMouseEnter
          object TitleLabel: TLabel
            AlignWithMargins = True
            Left = 6
            Top = 3
            Width = 618
            Height = 32
            Hint = 'Title - Album - Artist'
            Margins.Left = 6
            Margins.Right = 6
            Margins.Bottom = 0
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
            Layout = tlCenter
            OnMouseEnter = TitleLabelMouseEnter
            ExplicitHeight = 14
          end
          object InfoLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 38
            Width = 624
            Height = 13
            Align = alBottom
            Alignment = taCenter
            ExplicitWidth = 3
          end
        end
        object PlayControlsPanel: TPanel
          Left = 0
          Top = 0
          Width = 250
          Height = 54
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object NextBtn: TButton
            AlignWithMargins = True
            Left = 200
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Next'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            ImageAlignment = iaCenter
            ImageIndex = 4
            Images = TopBtnImages
            TabOrder = 0
            OnClick = NextBtnClick
            OnMouseEnter = NextBtnMouseEnter
          end
          object PauseBtn: TButton
            AlignWithMargins = True
            Left = 100
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Pause'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            ImageAlignment = iaCenter
            ImageIndex = 2
            Images = TopBtnImages
            TabOrder = 1
            OnClick = PauseBtnClick
            OnMouseEnter = PauseBtnMouseEnter
          end
          object PlayBtn: TButton
            AlignWithMargins = True
            Left = 0
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Play'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            ImageAlignment = iaCenter
            ImageIndex = 0
            Images = TopBtnImages
            TabOrder = 2
            OnClick = PlayBtnClick
            OnMouseEnter = PlayBtnMouseEnter
          end
          object PrevBtn: TButton
            AlignWithMargins = True
            Left = 150
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Previous'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            ImageAlignment = iaCenter
            ImageIndex = 3
            Images = TopBtnImages
            TabOrder = 3
            OnClick = PrevBtnClick
            OnMouseEnter = PrevBtnMouseEnter
          end
          object StopBtn: TButton
            AlignWithMargins = True
            Left = 50
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Stop'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            ImageAlignment = iaCenter
            ImageIndex = 1
            Images = TopBtnImages
            TabOrder = 4
            OnClick = StopBtnClick
            OnMouseEnter = StopBtnMouseEnter
          end
        end
        object SettingsPanel: TPanel
          Left = 880
          Top = 0
          Width = 318
          Height = 54
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            318
            54)
          object LogsBtn: TButton
            AlignWithMargins = True
            Left = 268
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Logs'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alRight
            ImageAlignment = iaCenter
            ImageIndex = 8
            Images = TopBtnImages
            TabOrder = 0
            OnClick = L2Click
            OnMouseEnter = LogsBtnMouseEnter
          end
          object EQBtn: TButton
            AlignWithMargins = True
            Left = 118
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Equalizer Settings'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alRight
            ImageAlignment = iaCenter
            ImageIndex = 5
            Images = TopBtnImages
            TabOrder = 1
            OnClick = EQBtnClick
            OnMouseEnter = EQBtnMouseEnter
          end
          object SearchBtn: TButton
            AlignWithMargins = True
            Left = 168
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Search'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alRight
            ImageAlignment = iaCenter
            ImageIndex = 6
            Images = TopBtnImages
            TabOrder = 2
            OnClick = S2Click
            OnMouseEnter = SearchBtnMouseEnter
          end
          object SettingsBtn: TButton
            AlignWithMargins = True
            Left = 218
            Top = 2
            Width = 50
            Height = 50
            Hint = 'Settings'
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alRight
            ImageAlignment = iaCenter
            ImageIndex = 7
            Images = TopBtnImages
            TabOrder = 3
            OnClick = G1Click
            OnMouseEnter = SettingsBtnMouseEnter
          end
          object PlaybackOrderList: TComboBox
            AlignWithMargins = True
            Left = 14
            Top = 16
            Width = 101
            Height = 21
            Hint = 'Playback order'
            Style = csDropDownList
            Anchors = [akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = PlaybackOrderListChange
            Items.Strings = (
              'Normal'
              'Random'
              'Repeat Track'
              'Shuffle')
          end
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 721
    Width = 1224
    Height = 21
    Panels = <
      item
        Text = '0 files'
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 500
      end
      item
        Alignment = taCenter
        Text = '100%'
        Width = 100
      end>
  end
  object ProgressPanel: TPanel
    Left = 0
    Top = 680
    Width = 1224
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    OnMouseEnter = ProgressPanelMouseEnter
    object ProgressLabel: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1137
      Height = 35
      Align = alClient
      Caption = 'Progress info'
      Layout = tlCenter
      OnMouseEnter = ProgressLabelMouseEnter
      ExplicitWidth = 63
      ExplicitHeight = 13
    end
    object AbortBtn: TButton
      AlignWithMargins = True
      Left = 1146
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = 'Abort'
      TabOrder = 0
      OnClick = AbortBtnClick
    end
  end
  object FuncPages: TPageControl
    Left = 254
    Top = 78
    Width = 616
    Height = 602
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = FuncPagesChange
    OnMouseLeave = FuncPagesMouseLeave
    object TabSheet1: TTabSheet
      Caption = 'Music'
      object Splitter1: TSplitter
        Left = 0
        Top = 414
        Width = 608
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        MinSize = 1
        ExplicitTop = 405
        ExplicitWidth = 639
      end
      object PlayList: TListView
        Left = 0
        Top = 0
        Width = 608
        Height = 414
        Hint = 'Playlist'
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Artist'
          end
          item
            Caption = 'Album'
            Width = 30
          end
          item
            Caption = 'Title'
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = 'Duration'
          end
          item
            Alignment = taCenter
            Caption = 'Bitrate'
          end
          item
            Alignment = taCenter
            Caption = 'Sample Rate'
          end
          item
            Alignment = taCenter
            Caption = 'Channels'
          end
          item
            Alignment = taCenter
            Caption = 'Codec'
          end>
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        MultiSelect = True
        OwnerData = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = PlayListMenu
        StateImages = PlaybackImages
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawItem = PlayListAdvancedCustomDrawItem
        OnData = PlayListData
        OnDblClick = PlayListDblClick
        OnDragDrop = PlayListDragDrop
        OnDragOver = PlayListDragOver
        OnMouseEnter = PlayListMouseEnter
        OnStartDrag = PlayListStartDrag
      end
      object QueueList: TListView
        Left = 0
        Top = 418
        Width = 608
        Height = 121
        Align = alBottom
        Columns = <
          item
          end
          item
            Width = 100
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        MultiSelect = True
        OwnerData = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = QueuelistMenu
        ShowColumnHeaders = False
        TabOrder = 1
        ViewStyle = vsReport
        OnData = QueueListData
        OnDblClick = QueueListDblClick
        OnMouseEnter = QueueListMouseEnter
        OnMouseLeave = QueueListMouseLeave
      end
      object ShortcutPanel: TPanel
        Left = 0
        Top = 539
        Width = 608
        Height = 35
        Align = alBottom
        TabOrder = 2
        object AddMenuBtn: TButton
          Left = 1
          Top = 1
          Width = 33
          Height = 33
          Hint = 'Add files menu'
          Align = alLeft
          ImageAlignment = iaCenter
          ImageIndex = 2
          Images = BottomBtnImages
          TabOrder = 0
          OnClick = AddMenuBtnClick
          ExplicitLeft = 34
        end
        object RemoveMenuBtn: TButton
          Left = 34
          Top = 1
          Width = 33
          Height = 33
          Hint = 'Remove tracks menu'
          Align = alLeft
          ImageAlignment = iaCenter
          ImageIndex = 3
          Images = BottomBtnImages
          TabOrder = 1
          OnClick = RemoveMenuBtnClick
          ExplicitLeft = 67
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Radio'
      ImageIndex = 1
      object RadioList: TListView
        Left = 0
        Top = 52
        Width = 608
        Height = 502
        Align = alClient
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Station Name'
          end
          item
            Caption = 'Web Site'
          end
          item
            Caption = 'Stream Adress'
          end>
        ColumnClick = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        OwnerData = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = RadioListMenu
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawItem = RadioListAdvancedCustomDrawItem
        OnData = RadioListData
        OnDblClick = RadioListDblClick
        OnMouseEnter = RadioListMouseEnter
        OnMouseLeave = RadioListMouseLeave
      end
      object RadioRecordPanel: TPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 52
        Align = alTop
        TabOrder = 1
        DesignSize = (
          608
          52)
        object Label1: TLabel
          Left = 121
          Top = 6
          Width = 77
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Format to save:'
          ExplicitLeft = 176
        end
        object Label2: TLabel
          Left = 243
          Top = 6
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Save method:'
          ExplicitLeft = 298
        end
        object RecordRadioBtn: TButton
          Left = 6
          Top = 6
          Width = 50
          Height = 40
          Hint = 'Start recording the radio you are listening'
          Caption = 'Record'
          TabOrder = 0
          OnClick = RecordRadioBtnClick
        end
        object StopRadioRecordBtn: TButton
          Left = 62
          Top = 6
          Width = 50
          Height = 40
          Hint = 'Stop radio recording'
          Caption = 'Stop'
          Enabled = False
          TabOrder = 1
          OnClick = StopRadioRecordBtnClick
        end
        object RadioRecordFormatList: TComboBox
          Left = 121
          Top = 25
          Width = 114
          Height = 21
          Hint = 'Radio recording format'
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12102048
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Items.Strings = (
            'Mp3'
            'Ogg Vorbis'
            'Opus'
            'AAC'
            'Without encode')
        end
        object RadioRecordingOptionsBtn: TButton
          Left = 437
          Top = 6
          Width = 104
          Height = 40
          Hint = 'Recording options like bitrate and output location'
          Anchors = [akTop, akRight]
          Caption = 'Recording Options'
          TabOrder = 3
          OnClick = RadioRecordingOptionsBtnClick
        end
        object RadioRecordModeList: TComboBox
          Left = 241
          Top = 25
          Width = 190
          Height = 21
          Hint = 'File creation method'
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12102048
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Items.Strings = (
            'Try to save each song seperately'
            'Save recording as a single long file')
        end
        object RadioRecordOutputFolderBtn: TButton
          Left = 547
          Top = 6
          Width = 55
          Height = 40
          Hint = 'Open recording save location'
          Anchors = [akTop, akRight]
          Caption = 'Folder'
          TabOrder = 5
          OnClick = RadioRecordOutputFolderBtnClick
        end
      end
      object RadioConnectionBar: TProgressBar
        Left = 0
        Top = 554
        Width = 608
        Height = 20
        Align = alBottom
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 2
        Visible = False
      end
    end
  end
  object LyricPanel: TPanel
    Left = 874
    Top = 78
    Width = 350
    Height = 602
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnResize = LyricPanelResize
    object sSplitter1: TSplitter
      Left = 1
      Top = 380
      Width = 348
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 379
    end
    object LyricStatusLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 364
      Width = 342
      Height = 13
      Align = alBottom
      ExplicitWidth = 3
    end
    object CoverPanel: TPanel
      Left = 1
      Top = 384
      Width = 348
      Height = 217
      Align = alBottom
      TabOrder = 0
      object CoverImage: TJvImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 342
        Height = 181
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Center = True
        Proportional = True
        Transparent = True
        ExplicitLeft = 40
        ExplicitTop = 54
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object sPanel7: TPanel
        Left = 1
        Top = 186
        Width = 346
        Height = 30
        Align = alBottom
        TabOrder = 0
        object CoverArtInfoLabel: TLabel
          Left = 41
          Top = 1
          Width = 264
          Height = 28
          Align = alClient
          Alignment = taCenter
          Caption = 'Cover art'
          Layout = tlCenter
          ExplicitWidth = 46
          ExplicitHeight = 13
        end
        object NextArtworkBtn: TButton
          Left = 305
          Top = 1
          Width = 40
          Height = 28
          Align = alRight
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = BottomBtnImages
          TabOrder = 0
          OnClick = NextArtworkBtnClick
        end
        object PrevArtworkBtn: TButton
          Left = 1
          Top = 1
          Width = 40
          Height = 28
          Align = alLeft
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = BottomBtnImages
          TabOrder = 1
          OnClick = PrevArtworkBtnClick
        end
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 348
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        348
        112)
      object LyricTitleEdit: TLabeledEdit
        Left = 5
        Top = 43
        Width = 258
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Title:'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = LyricTitleEditKeyDown
      end
      object LyricArtistEdit: TLabeledEdit
        Left = 5
        Top = 81
        Width = 260
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Artist:'
        Enabled = False
        TabOrder = 1
        OnKeyDown = LyricTitleEditKeyDown
      end
      object LyricSearchBtn: TButton
        Left = 271
        Top = 81
        Width = 75
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = 'Search'
        Enabled = False
        TabOrder = 2
        OnClick = LyricSearchBtnClick
      end
      object LyricSourceList: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 342
        Height = 21
        Align = alTop
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'azlyrics.com'
          'batlyrics.net'
          'metrolyrics.com')
      end
      object ReloadLyricTitleBtn: TButton
        Left = 269
        Top = 43
        Width = 75
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = 'Reload'
        Enabled = False
        TabOrder = 4
        OnClick = ReloadLyricTitleBtnClick
      end
    end
    object LyricList: TListBox
      Left = 1
      Top = 113
      Width = 348
      Height = 248
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseEnter = LyricListMouseEnter
      OnMouseLeave = LyricListMouseLeave
    end
  end
  object CategoryPages: TPageControl
    Left = 0
    Top = 78
    Width = 250
    Height = 602
    ActivePage = sTabSheet2
    Align = alLeft
    Images = CategoryList
    TabOrder = 5
    OnResize = CategoryPagesResize
    object sTabSheet2: TTabSheet
      Caption = 'Music'
      object PlaylistListPanel: TPanel
        Left = 0
        Top = 0
        Width = 242
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object AddPlaylistBtn: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 50
          Height = 23
          Hint = 'Add a new playlist'
          Margins.Bottom = 4
          Align = alLeft
          Caption = 'New'
          TabOrder = 0
          OnClick = AddPlaylistBtnClick
        end
        object RemovePlaylistBtn: TButton
          AlignWithMargins = True
          Left = 59
          Top = 3
          Width = 50
          Height = 23
          Hint = 'Remove selected playlist'
          Margins.Bottom = 4
          Align = alLeft
          Caption = 'Remove'
          TabOrder = 1
          OnClick = RemovePlaylistBtnClick
        end
        object RenamePlaylistBtn: TButton
          AlignWithMargins = True
          Left = 115
          Top = 3
          Width = 50
          Height = 23
          Hint = 'Rename selected playlist'
          Margins.Bottom = 4
          Align = alLeft
          Caption = 'Rename'
          TabOrder = 2
          OnClick = RenamePlaylistBtnClick
        end
      end
      object PlaylistView: TListView
        Left = 0
        Top = 30
        Width = 242
        Height = 537
        Align = alClient
        Columns = <
          item
          end
          item
            Width = 150
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
        OnClick = PlaylistViewClick
        OnCustomDrawItem = PlaylistViewCustomDrawItem
        OnResize = PlaylistViewResize
      end
    end
    object sTabSheet4: TTabSheet
      Caption = 'Radio'
      ImageIndex = 1
      object RadiosView: TListView
        Left = 0
        Top = 0
        Width = 242
        Height = 567
        Align = alClient
        Columns = <
          item
          end
          item
            Width = 150
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = RadiosViewClick
        OnCustomDrawItem = RadiosViewCustomDrawItem
        OnResize = RadiosViewResize
      end
    end
  end
  object OpenFolder: TJvBrowseForFolderDialog
    Left = 96
    Top = 296
  end
  object MusicSearch: TJvSearchFiles
    DirParams.MinSize = 0
    DirParams.MaxSize = 0
    FileParams.SearchTypes = [stFileMask]
    FileParams.MinSize = 0
    FileParams.MaxSize = 0
    FileParams.FileMasks.Strings = (
      '*.mp3'
      '*.aac'
      '*.m4a'
      '*.m4b'
      '*.ogg'
      '*.opus'
      '*.flac'
      '*.alac'
      '*.ape'
      '*.mpc'
      '*.tta'
      '*.wv'
      '*.wma'
      '*.ac3'
      '*.spx'
      '*.ofr'
      '*.tak'
      '*.wav'
      '*.cue')
    OnFindFile = MusicSearchFindFile
    OnProgress = MusicSearchProgress
    Left = 24
    Top = 304
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 368
    object F1: TMenuItem
      Caption = 'File'
      object A3: TMenuItem
        Caption = 'Add Files'
        ShortCut = 24641
        OnClick = A3Click
      end
      object A4: TMenuItem
        Caption = 'Add Folder'
        ShortCut = 24646
        OnClick = A4Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object s3: TMenuItem
        Caption = 'Save playlist'
        OnClick = s3Click
      end
      object L1: TMenuItem
        Caption = 'Load playlist'
        OnClick = L1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object E2: TMenuItem
        Caption = 'Exit'
        OnClick = E2Click
      end
    end
    object E1: TMenuItem
      Caption = 'Edit'
      object G1: TMenuItem
        Caption = 'General Settings'
        OnClick = G1Click
      end
      object L2: TMenuItem
        Caption = 'Log'
        OnClick = L2Click
      end
    end
    object V5: TMenuItem
      Caption = 'View'
      object M1: TMenuItem
        Caption = 'Music'
        ShortCut = 16433
        OnClick = M1Click
      end
      object R3: TMenuItem
        Caption = 'Radio'
        ShortCut = 16434
        OnClick = R3Click
      end
      object H2: TMenuItem
        Caption = 'Hide queue list'
        OnClick = H2Click
      end
      object H3: TMenuItem
        Caption = 'Hide left panel'
        OnClick = H3Click
      end
      object H4: TMenuItem
        Caption = 'Hide right panel'
        OnClick = H4Click
      end
    end
    object P1: TMenuItem
      Caption = 'Playback'
      object P2: TMenuItem
        Caption = 'Play'
        ShortCut = 16464
        OnClick = PlayBtnClick
      end
      object P3: TMenuItem
        Caption = 'Pause'
        ShortCut = 16416
        OnClick = PauseBtnClick
      end
      object S1: TMenuItem
        Caption = 'Stop'
        ShortCut = 16467
        OnClick = StopBtnClick
      end
      object P4: TMenuItem
        Caption = 'Previous'
        ShortCut = 16421
        OnClick = PrevBtnClick
      end
      object N2: TMenuItem
        Caption = 'Next'
        ShortCut = 16423
        OnClick = NextBtnClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object V1: TMenuItem
        Caption = 'Volume Up'
        ShortCut = 16422
        OnClick = V1Click
      end
      object V2: TMenuItem
        Caption = 'Volume Down'
        ShortCut = 16424
        OnClick = V2Click
      end
    end
    object P5: TMenuItem
      Caption = 'Playlist'
      object J1: TMenuItem
        Caption = 'Jump to current song'
        ShortCut = 16458
        OnClick = J1Click
      end
      object S2: TMenuItem
        Caption = 'Search'
        ShortCut = 114
        OnClick = S2Click
      end
      object C1: TMenuItem
        Caption = 'Clear'
        ShortCut = 8238
        OnClick = C1Click
      end
      object R1: TMenuItem
        Caption = 'Re-scan'
        OnClick = R1Click
      end
      object S4: TMenuItem
        Caption = 'Select All'
        ShortCut = 16449
        OnClick = S4Click
      end
      object D1: TMenuItem
        Caption = 'Delete Selected'
        ShortCut = 46
        OnClick = D1Click
      end
      object R7: TMenuItem
        Caption = 'Remove files that don'#39't exist'
        OnClick = R7Click
      end
    end
    object H1: TMenuItem
      Caption = 'Help'
      object D2: TMenuItem
        Caption = 'Donate'
        OnClick = D2Click
      end
      object C2: TMenuItem
        Caption = 'Change log'
        OnClick = C2Click
      end
      object E3: TMenuItem
        Caption = 'Email to author'
        OnClick = E3Click
      end
      object A1: TMenuItem
        Caption = 'About'
        OnClick = A1Click
      end
    end
  end
  object PlayListMenu: TPopupMenu
    Left = 32
    Top = 376
    object A2: TMenuItem
      Caption = 'Add to queue'
      ShortCut = 16465
      OnClick = A2Click
    end
    object o1: TMenuItem
      Caption = 'Open Folder'
      OnClick = o1Click
    end
    object R2: TMenuItem
      Caption = 'Remove from the list'
      OnClick = R2Click
    end
    object S7: TMenuItem
      Caption = 'Search song in YouTube'
      OnClick = S7Click
    end
    object S8: TMenuItem
      Caption = 'Search song in Google'
      OnClick = S8Click
    end
    object F2: TMenuItem
      Caption = 'Tag Editor'
      Visible = False
      OnClick = F2Click
    end
    object F3: TMenuItem
      Caption = 'File Information'
      OnClick = F3Click
    end
  end
  object AppIniFileStorage: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Location = flCustom
    DefaultSection = 'General'
    SubStorages = <>
    Left = 32
    Top = 232
  end
  object FormStorage: TJvFormStorage
    AppStorage = AppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 128
    Top = 232
  end
  object SysInfo: TJvComputerInfoEx
    Left = 584
    Top = 296
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 176
    Top = 288
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 464
    Top = 216
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'All supported|*.mp3;*.aac;*.ogg;*.opus;*.flac;*.alac;*.ape;*.mpc' +
      ';*.tta;*.wv;*.wma;*.ac3;*.spx;*.tak;*.ofr;*.wav;*.cue'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 264
    Top = 216
  end
  object TrayMenu: TPopupMenu
    Left = 192
    Top = 376
    object P6: TMenuItem
      Caption = 'Play'
      OnClick = PlayBtnClick
    end
    object P7: TMenuItem
      Caption = 'Pause'
      OnClick = PauseBtnClick
    end
    object S5: TMenuItem
      Caption = 'Stop'
      OnClick = StopBtnClick
    end
    object v3: TMenuItem
      Caption = 'Volume Up'
      OnClick = V1Click
    end
    object V4: TMenuItem
      Caption = 'Volume Down'
      OnClick = V2Click
    end
    object E4: TMenuItem
      Caption = 'Exit'
      OnClick = E4Click
    end
  end
  object PositionTimer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = PositionTimerTimer
    Left = 312
    Top = 288
  end
  object RadioListMenu: TPopupMenu
    Left = 264
    Top = 376
    object S6: TMenuItem
      Caption = 'Station info'
      OnClick = S6Click
    end
    object A5: TMenuItem
      Caption = 'Add to favourites'
      OnClick = A5Click
    end
    object A6: TMenuItem
      Caption = 'Add a radio'
      OnClick = A6Click
    end
    object R4: TMenuItem
      Caption = 'Remove selected'
      OnClick = R4Click
    end
  end
  object QueuelistMenu: TPopupMenu
    Left = 336
    Top = 376
    object P8: TMenuItem
      Caption = 'Play'
      OnClick = P8Click
    end
    object R5: TMenuItem
      Caption = 'Remove Selected'
      OnClick = R5Click
    end
    object C3: TMenuItem
      Caption = 'Clear All'
      OnClick = C3Click
    end
  end
  object AppInstances: TJvAppInstances
    OnCmdLineReceived = AppInstancesCmdLineReceived
    Left = 232
    Top = 240
  end
  object ProgressTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = ProgressTimerTimer
    Left = 392
    Top = 288
  end
  object OverlayImgs: TImageList
    ColorDepth = cd32Bit
    Height = 22
    Width = 22
    Left = 456
    Top = 448
    Bitmap = {
      494C010105000800180016001600FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000580000002C0000000100200000000000803C
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000404040E171717492929297E3A3A3AB24B4B4BE54B4B
      4BE53A3A3AB22929297E171717490404040E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A1A1A504B4B4BE7505050FF4D4D4DFF4A4A4AFF474747FF4747
      47FF4A4A4AFF4D4D4DFF505050FF4B4B4BE71A1A1A5000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      0511363636A4525252FF4B4B4BFF545454FF747474FF989898FFBFBFBFFFC0C0
      C0FF9C9C9CFF787878FF565656FF4B4B4BFF525252FF363636A4050505110000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505114B4B
      4BE1515151FF484848FF818181FFD9D9D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEF
      EFFFEEEEEEFFEBEBEBFFE2E2E2FF8C8C8CFF484848FF515151FF4B4B4BE10505
      0511000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000373737A45151
      51FF545454FFB1B1B1FFE1E1E1FFECECECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFB
      FBFFFBFBFBFFF8F8F8FFF3F3F3FFECECECFFC2C2C2FF575757FF515151FF3737
      37A4000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B1B1B50545454FF4949
      49FFACACACFFCDCDCDFFEBEBEBFFF7F7F7FFFCFCFCFFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7F7FFEEEEEEFFC2C2C2FF494949FF5454
      54FF1B1B1B500000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000404040E4F4F4FE74E4E4EFF7B7B
      7BFFDCDCDCFFA8A8A8FF737373FFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFBFBFBFFECECECFFE6E6E6FFEEEEEEFFECECECFF8D8D8DFF4E4E
      4EFF4F4F4FE70404040E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000019191949575757FF585858FFC8C8
      C8FFE5E5E5FFA4A4A4FF454545FF3E3E3EFF9B9B9BFFFBFBFBFFFFFFFFFFFFFF
      FFFFFFFFFFFFDDDDDDFF555555FF3A3A3AFFA5A5A5FFF3F3F3FFE2E2E2FF5A5A
      5AFF575757FF1919194900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D7E555555FF707070FFD5D5
      D5FFEBEBEBFFA1A1A1FF373737FF282828FF232323FF515151FFDBDBDBFFFFFF
      FFFFFFFFFFFFDDDDDDFF494949FF272727FF9E9E9EFFF8F8F8FFEBEBEBFF7B7B
      7BFF555555FF2D2D2D7E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424242B2535353FF898989FFDCDC
      DCFFEEEEEEFF9F9F9FFF2D2D2DFF191919FF0F0F0FFF1B1B1BFF333333FFA3A3
      A3FFFCFCFCFFDCDCDCFF414141FF131313FF9A9A9AFFFBFBFBFFEEEEEEFF9E9E
      9EFF535353FF424242B200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656E5525252FFA4A4A4FFDDDD
      DDFFEFEFEFFF9E9E9EFF2A2A2AFF141414FF020202FF161616FF2C2C2CFF4343
      43FF777777FFC5C5C5FF3E3E3EFF050505FF989898FFFBFBFBFFEFEFEFFFC1C1
      C1FF525252FF565656E500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000585858E5545454FFA4A4A4FFDCDC
      DCFFEEEEEEFFA0A0A0FF434343FF414141FF3F3F3FFF4A4A4AFF595959FF6262
      62FF888888FFC9C9C9FF454545FF131313FF9A9A9AFFFBFBFBFFEEEEEEFFC0C0
      C0FF545454FF585858E500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646B2595959FF8A8A8AFFD5D5
      D5FFEEEEEEFFC1C1C1FF838383FF727272FF666666FF626262FF686868FFB6B6
      B6FFFCFCFCFFDDDDDDFF525252FF292929FF9E9E9EFFF8F8F8FFEBEBEBFF9B9B
      9BFF595959FF464646B200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003232327E5F5F5FFF747474FFDCDC
      DCFFF1F1F1FFCACACAFF8D8D8DFF7E7E7EFF747474FF8B8B8BFFE5E5E5FFFFFF
      FFFFFFFFFFFFDDDDDDFF5D5D5DFF3C3C3CFFA5A5A5FFF3F3F3FFE5E5E5FF7B7B
      7BFF5F5F5FFF3232327E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1E1E49666666FF626262FFC5C5
      C5FFECECECFFCCCCCCFF979797FF8D8D8DFFC1C1C1FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFDCDCDCFF6B6B6BFF4F4F4FFFAAAAAAFFECECECFFDADADAFF6262
      62FF666666FF1E1E1E4900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606060E646464E7626262FF8282
      82FFDCDCDCFFC8C8C8FFADADADFFE7E7E7FFFDFDFDFFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFAFAFAFFEDEDEDFFEBEBEBFFEAEAEAFFE1E1E1FF888888FF6262
      62FF646464E70606060E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000232323506E6E6EFF5D5D
      5DFFA9A9A9FFD3D3D3FFEBEBEBFFF2F2F2FFF6F6F6FFFAFAFAFFFCFCFCFFFCFC
      FCFFFCFCFCFFF9F9F9FFF4F4F4FFECECECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E
      6EFF232323500000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4AA46E6E
      6EFF676767FFAAAAAAFFD7D7D7FFE7E7E7FFECECECFFF0F0F0FFF1F1F1FFF2F2
      F2FFF0F0F0FFEDEDEDFFE6E6E6FFDCDCDCFFAFAFAFFF676767FF6E6E6EFF4A4A
      4AA4000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808116969
      69E1707070FF626262FF858585FFC2C2C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3
      E3FFE0E0E0FFD8D8D8FFCACACAFF858585FF626262FF707070FF696969E10808
      0811000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08114E4E4EA4787878FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8
      A8FF8F8F8FFF7B7B7BFF6D6D6DFF6D6D6DFF787878FF4E4E4EA4080808110000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000027272750727272E77A7A7AFF757575FF717171FF6D6D6DFF6D6D
      6DFF717171FF757575FF7A7A7AFF727272E72727275000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070E252525494040407E5C5C5CB2767676E57676
      76E55C5C5CB24040407E252525490707070E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000404040E171717492929297E3A3A3AB24B4B4BE54B4B
      4BE53A3A3AB22929297E171717490404040E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000404040E171717492929297E3A3A3AB24B4B4BE54B4B4BE53A3A3AB22929
      297E171717490404040E00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000404040E1717
      17492929297E3A3A3AB24B4B4BE54B4B4BE53A3A3AB22929297E171717490404
      040E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000404040E171717492929297E3A3A
      3AB24B4B4BE54B4B4BE53A3A3AB22929297E171717490404040E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A1A1A504B4B4BE7505050FF4D4D4DFF4A4A4AFF474747FF4747
      47FF4A4A4AFF4D4D4DFF505050FF4B4B4BE71A1A1A5000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001A1A
      1A504B4B4BE7505050FF4D4D4DFF4A4A4AFF474747FF474747FF4A4A4AFF4D4D
      4DFF505050FF4B4B4BE71A1A1A50000000000000000000000000000000000000
      000000000000000000000000000000000000000000001A1A1A504B4B4BE75050
      50FF4D4D4DFF4A4A4AFF474747FF474747FF4A4A4AFF4D4D4DFF505050FF4B4B
      4BE71A1A1A500000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A1A1A504B4B4BE7505050FF4D4D4DFF4A4A
      4AFF474747FF474747FF4A4A4AFF4D4D4DFF505050FF4B4B4BE71A1A1A500000
      0000000000000000000000000000000000000000000000000000000000000505
      0511363636A4525252FF4B4B4BFF545454FF747474FF989898FFBFBFBFFFC0C0
      C0FF9C9C9CFF787878FF565656FF4B4B4BFF525252FF363636A4050505110000
      0000000000000000000000000000000000000000000005050511363636A45252
      52FF4B4B4BFF545454FF747474FF989898FFBFBFBFFFC0C0C0FF9C9C9CFF7878
      78FF565656FF4B4B4BFF525252FF363636A40505051100000000000000000000
      000000000000000000000000000005050511363636A4525252FF4B4B4BFF5454
      54FF747474FF989898FFBFBFBFFFC0C0C0FF9C9C9CFF787878FF565656FF4B4B
      4BFF525252FF363636A405050511000000000000000000000000000000000000
      00000000000005050511363636A4525252FF4B4B4BFF545454FF747474FF9898
      98FFBFBFBFFFC0C0C0FF9C9C9CFF787878FF565656FF4B4B4BFF525252FF3636
      36A4050505110000000000000000000000000000000000000000050505114B4B
      4BE1515151FF484848FF818181FFD9D9D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEF
      EFFFEEEEEEFFEBEBEBFFE2E2E2FF8C8C8CFF484848FF515151FF4B4B4BE10505
      051100000000000000000000000000000000050505114B4B4BE1515151FF4848
      48FF818181FFD9D9D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEFEFFFEEEEEEFFEBEB
      EBFFE2E2E2FF8C8C8CFF484848FF515151FF4B4B4BE105050511000000000000
      00000000000000000000050505114B4B4BE1515151FF484848FF818181FFD9D9
      D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEFEFFFEEEEEEFFEBEBEBFFE2E2E2FF8C8C
      8CFF484848FF515151FF4B4B4BE1050505110000000000000000000000000000
      0000050505114B4B4BE1515151FF484848FF818181FFD9D9D9FFE5E5E5FFEBEB
      EBFFEEEEEEFFEFEFEFFFEEEEEEFFEBEBEBFFE2E2E2FF8C8C8CFF484848FF5151
      51FF4B4B4BE10505051100000000000000000000000000000000373737A45151
      51FF545454FFB1B1B1FFE1E1E1FFECECECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFB
      FBFFFBFBFBFFF8F8F8FFF3F3F3FFECECECFFC2C2C2FF575757FF515151FF3737
      37A400000000000000000000000000000000373737A4515151FF545454FFB1B1
      B1FFE1E1E1FFECECECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFBFBFFFBFBFBFFF8F8
      F8FFF3F3F3FFECECECFFC2C2C2FF575757FF515151FF373737A4000000000000
      00000000000000000000373737A4515151FF545454FFB1B1B1FFE1E1E1FFECEC
      ECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFBFBFFFBFBFBFFF8F8F8FFF3F3F3FFECEC
      ECFFC2C2C2FF575757FF515151FF373737A40000000000000000000000000000
      0000373737A4515151FF545454FFB1B1B1FFE1E1E1FFECECECFFF3F3F3FFF8F8
      F8FFFBFBFBFFFBFBFBFFFBFBFBFFF8F8F8FFF3F3F3FFECECECFFC2C2C2FF5757
      57FF515151FF373737A40000000000000000000000001B1B1B50545454FF4949
      49FFACACACFFE1E1E1FFEEEEEEFFF7F7F7FFE0E0E0FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7F7FFEEEEEEFFC2C2C2FF494949FF5454
      54FF1B1B1B5000000000000000001B1B1B50545454FF494949FFACACACFFE1E1
      E1FFEEEEEEFFF7F7F7FFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFCFCFCFFF7F7F7FFEEEEEEFFC2C2C2FF494949FF545454FF1B1B1B500000
      0000000000001B1B1B50545454FF494949FFACACACFFE1E1E1FFEEEEEEFFF7F7
      F7FFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7
      F7FFEEEEEEFFC2C2C2FF494949FF545454FF1B1B1B5000000000000000001B1B
      1B50545454FF494949FFACACACFFE1E1E1FFEEEEEEFFF7F7F7FFFCFCFCFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFF4F4F4FFD8D8D8FFC2C2
      C2FF494949FF545454FF1B1B1B50000000000404040E4F4F4FE74E4E4EFF7B7B
      7BFFDCDCDCFFECECECFFF7F7F7FFFCFCFCFF878787FF8D8D8DFFF0F0F0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF7F7F7FFECECECFF8D8D8DFF4E4E
      4EFF4F4F4FE70404040E0404040E4F4F4FE74E4E4EFF7B7B7BFFDCDCDCFFECEC
      ECFFF5F5F5FFE9E9E9FFE9E9E9FFF2F2F2FFFFFFFFFFFFFFFFFFF4F4F4FFEAEA
      EAFFE9E9E9FFFAFAFAFFF7F7F7FFECECECFF8D8D8DFF4E4E4EFF4F4F4FE70404
      040E0404040E4F4F4FE74E4E4EFF7B7B7BFFDCDCDCFFECECECFFF6F6F6FFE9E9
      E9FFEBEBEBFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFEBEBEBFFFAFA
      FAFFF7F7F7FFECECECFF8D8D8DFF4E4E4EFF4F4F4FE70404040E0404040E4F4F
      4FE74E4E4EFF7B7B7BFFDCDCDCFFE3E3E3FFE4E4E4FFE6E6E6FFFBFBFBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDFF6D6D6DFFA6A6A6FFECEC
      ECFF8D8D8DFF4E4E4EFF4F4F4FE70404040E19191949575757FF585858FFC8C8
      C8FFE5E5E5FFF3F3F3FFFCFCFCFFFFFFFFFF7B7B7BFF424242FF484848FFBDBD
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF3F3F3FFE2E2E2FF5A5A
      5AFF575757FF1919194919191949575757FF585858FFC8C8C8FFE5E5E5FFF3F3
      F3FFEEEEEEFF5B5B5BFF3B3B3BFF8C8C8CFFFFFFFFFFFFFFFFFFA3A3A3FF4747
      47FF3B3B3BFFEBEBEBFFFCFCFCFFF3F3F3FFE2E2E2FF5A5A5AFF575757FF1919
      194919191949575757FF585858FFC8C8C8FFE5E5E5FFF3F3F3FFF2F2F2FF5E5E
      5EFF505050FF454545FF3D3D3DFF3A3A3AFF3D3D3DFF454545FF505050FFEBEB
      EBFFFCFCFCFFF3F3F3FFE2E2E2FF5A5A5AFF575757FF19191949191919495757
      57FF585858FFC8C8C8FFE5E5E5FFACACACFF4C4C4CFF3A3A3AFFDADADAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFBFBFF9D9D9DFF3A3A3AFF3A3A3AFFA1A1A1FFF3F3
      F3FFE2E2E2FF5A5A5AFF575757FF191919492D2D2D7E555555FF707070FFD5D5
      D5FFEBEBEBFFF8F8F8FFFDFDFDFFFFFFFFFF727272FF333333FF262626FF2323
      23FF737373FFEFEFEFFFFFFFFFFFFFFFFFFFFDFDFDFFF8F8F8FFEBEBEBFF7B7B
      7BFF555555FF2D2D2D7E2D2D2D7E555555FF707070FFD5D5D5FFEBEBEBFFF8F8
      F8FFEEEEEEFF4F4F4FFF282828FF838383FFFFFFFFFFFFFFFFFFA3A3A3FF3838
      38FF282828FFE9E9E9FFFDFDFDFFF8F8F8FFEBEBEBFF7B7B7BFF555555FF2D2D
      2D7E2D2D2D7E555555FF707070FFD5D5D5FFEBEBEBFFF8F8F8FFF2F2F2FF5353
      53FF434343FF353535FF2A2A2AFF262626FF2A2A2AFF353535FF434343FFEAEA
      EAFFFDFDFDFFF8F8F8FFEBEBEBFF7B7B7BFF555555FF2D2D2D7E2D2D2D7E5555
      55FF707070FFD5D5D5FFEBEBEBFFAFAFAFFF3E3E3EFF272727FFD7D7D7FFFFFF
      FFFFFFFFFFFFDDDDDDFF5D5D5DFF2A2A2AFF232323FF282828FF9A9A9AFFF8F8
      F8FFEBEBEBFF7B7B7BFF555555FF2D2D2D7E424242B2535353FF898989FFDCDC
      DCFFEEEEEEFFFBFBFBFFFFFFFFFFFFFFFFFF6D6D6DFF282828FF151515FF1010
      10FF202020FF464646FFC3C3C3FFFFFFFFFFFFFFFFFFFBFBFBFFEEEEEEFF9E9E
      9EFF535353FF424242B2424242B2535353FF898989FFDCDCDCFFEEEEEEFFFBFB
      FBFFEFEFEFFF484848FF171717FF7B7B7BFFFFFFFFFFFFFFFFFFA1A1A1FF2D2D
      2DFF171717FFE8E8E8FFFFFFFFFFFBFBFBFFEEEEEEFF9E9E9EFF535353FF4242
      42B2424242B2535353FF898989FFDCDCDCFFEEEEEEFFFBFBFBFFF2F2F2FF4C4C
      4CFF3A3A3AFF292929FF1A1A1AFF121212FF1A1A1AFF292929FF3A3A3AFFE9E9
      E9FFFFFFFFFFFBFBFBFFEEEEEEFF9E9E9EFF535353FF424242B2424242B25353
      53FF898989FFDCDCDCFFEEEEEEFFB0B0B0FF343434FF131313FFD4D4D4FFFCFC
      FCFFADADADFF494949FF2F2F2FFF1B1B1BFF0F0F0FFF191919FF969696FFFBFB
      FBFFEEEEEEFF9E9E9EFF535353FF424242B2565656E5525252FFA4A4A4FFDDDD
      DDFFEFEFEFFFFBFBFBFFFFFFFFFFFFFFFFFF6A6A6AFF242424FF0E0E0EFF0606
      06FF1C1C1CFF323232FF484848FF949494FFF2F2F2FFFBFBFBFFEFEFEFFFC1C1
      C1FF525252FF565656E5565656E5525252FFA4A4A4FFDDDDDDFFEFEFEFFFFBFB
      FBFFEFEFEFFF454545FF0D0D0DFF787878FFFFFFFFFFFFFFFFFFA0A0A0FF2929
      29FF0D0D0DFFE8E8E8FFFFFFFFFFFBFBFBFFEFEFEFFFC1C1C1FF525252FF5656
      56E5565656E5525252FFA4A4A4FFDDDDDDFFEFEFEFFFFBFBFBFFF0F0F0FF4A4A
      4AFF373737FF242424FF111111FF000000FF111111FF242424FF373737FFE8E8
      E8FFFFFFFFFFFBFBFBFFEFEFEFFFC1C1C1FF525252FF565656E5565656E55252
      52FFA4A4A4FFDDDDDDFFEFEFEFFFB0B0B0FF303030FF050505FFBDBDBDFF8181
      81FF595959FF434343FF2C2C2CFF161616FF020202FF141414FF959595FFFBFB
      FBFFEFEFEFFFC1C1C1FF525252FF565656E5585858E5545454FFA4A4A4FFDCDC
      DCFFEEEEEEFFFBFBFBFFFFFFFFFFFFFFFFFF888888FF535353FF464646FF3939
      39FF383838FF424242FF505050FF969696FFF2F2F2FFFBFBFBFFEEEEEEFFC0C0
      C0FF545454FF585858E5585858E5545454FFA4A4A4FFDCDCDCFFEEEEEEFFFBFB
      FBFFF0F0F0FF656565FF414141FF959595FFFFFFFFFFFFFFFFFFA9A9A9FF3838
      38FF1C1C1CFFE8E8E8FFFFFFFFFFFBFBFBFFEEEEEEFFC0C0C0FF545454FF5858
      58E5585858E5545454FFA4A4A4FFDCDCDCFFEEEEEEFFFBFBFBFFF1F1F1FF6969
      69FF5D5D5DFF525252FF464646FF363636FF303030FF353535FF3F3F3FFFE9E9
      E9FFFFFFFFFFFBFBFBFFEEEEEEFFC0C0C0FF545454FF585858E5585858E55454
      54FFA4A4A4FFDCDCDCFFEEEEEEFFB0B0B0FF484848FF393939FFC9C9C9FF9999
      99FF7B7B7BFF626262FF464646FF2B2B2BFF1A1A1AFF1D1D1DFF979797FFFBFB
      FBFFEEEEEEFFC0C0C0FF545454FF585858E5464646B2595959FF8A8A8AFFD5D5
      D5FFEEEEEEFFFAFAFAFFFEFEFEFFFFFFFFFF9D9D9DFF686868FF565656FF4C4C
      4CFF4C4C4CFF606060FFC9C9C9FFFFFFFFFFFDFDFDFFF8F8F8FFEBEBEBFF9B9B
      9BFF595959FF464646B2464646B2595959FF8A8A8AFFD5D5D5FFEEEEEEFFFAFA
      FAFFF2F2F2FF898989FF656565FFA2A2A2FFFFFFFFFFFFFFFFFFACACACFF4949
      49FF323232FFE9E9E9FFFDFDFDFFF8F8F8FFEBEBEBFF9B9B9BFF595959FF4646
      46B2464646B2595959FF8A8A8AFFD5D5D5FFEEEEEEFFFAFAFAFFF4F4F4FF8C8C
      8CFF797979FF676767FF555555FF4A4A4AFF454545FF464646FF4C4C4CFFEAEA
      EAFFFDFDFDFFF8F8F8FFEBEBEBFF9B9B9BFF595959FF464646B2464646B25959
      59FF8A8A8AFFD5D5D5FFEEEEEEFFC9C9C9FF858585FF6D6D6DFFE0E0E0FFFDFD
      FDFFC1C1C1FF6E6E6EFF555555FF414141FF333333FF303030FF9C9C9CFFF8F8
      F8FFEBEBEBFF9B9B9BFF595959FF464646B23232327E5F5F5FFF747474FFDCDC
      DCFFF1F1F1FFF8F8F8FFFDFDFDFFFFFFFFFFA4A4A4FF747474FF656565FF5D5D
      5DFF929292FFF2F2F2FFFFFFFFFFFFFFFFFFFCFCFCFFF3F3F3FFE5E5E5FF7B7B
      7BFF5F5F5FFF3232327E3232327E5F5F5FFF747474FFDCDCDCFFF1F1F1FFF8F8
      F8FFF2F2F2FF919191FF737373FFA8A8A8FFFFFFFFFFFFFFFFFFACACACFF5757
      57FF444444FFEBEBEBFFFCFCFCFFF3F3F3FFE5E5E5FF7B7B7BFF5F5F5FFF3232
      327E3232327E5F5F5FFF747474FFDCDCDCFFF1F1F1FFF8F8F8FFF2F2F2FF9393
      93FF838383FF737373FF646464FF5A5A5AFF555555FF555555FF585858FFEBEB
      EBFFFCFCFCFFF3F3F3FFE5E5E5FF7B7B7BFF5F5F5FFF3232327E3232327E5F5F
      5FFF747474FFDCDCDCFFF1F1F1FFCECECEFF8E8E8EFF7A7A7AFFE2E2E2FFFFFF
      FFFFFFFFFFFFE5E5E5FF7E7E7EFF515151FF454545FF414141FFA4A4A4FFF3F3
      F3FFE5E5E5FF7B7B7BFF5F5F5FFF3232327E1E1E1E49666666FF626262FFC5C5
      C5FFECECECFFF4F4F4FFFAFAFAFFFDFDFDFFABABABFF828282FF808080FFCFCF
      CFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF7F7F7FFECECECFFDADADAFF6262
      62FF666666FF1E1E1E491E1E1E49666666FF626262FFC5C5C5FFECECECFFF4F4
      F4FFEEEEEEFF979797FF828282FFB1B1B1FFFFFFFFFFFFFFFFFFABABABFF6666
      66FF575757FFE9E9E9FFF7F7F7FFECECECFFDADADAFF626262FF666666FF1E1E
      1E491E1E1E49666666FF626262FFC5C5C5FFECECECFFF4F4F4FFEFEFEFFF9797
      97FF8E8E8EFF818181FF737373FF6A6A6AFF666666FF646464FF676767FFE9E9
      E9FFF7F7F7FFECECECFFDADADAFF626262FF666666FF1E1E1E491E1E1E496666
      66FF626262FFC5C5C5FFECECECFFCCCCCCFF989898FF888888FFE4E4E4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFB0B0B0FF5B5B5BFF535353FFA9A9A9FFECEC
      ECFFDADADAFF626262FF666666FF1E1E1E490606060E646464E7626262FF8282
      82FFDCDCDCFFEDEDEDFFF4F4F4FFFAFAFAFFABABABFFB1B1B1FFF5F5F5FFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7F7FFEEEEEEFFE1E1E1FF888888FF6262
      62FF646464E70606060E0606060E646464E7626262FF828282FFDCDCDCFFEDED
      EDFFF3F3F3FFEFEFEFFFF4F4F4FFF8F8F8FFFFFFFFFFFFFFFFFFF5F5F5FFEFEF
      EFFFF1F1F1FFF6F6F6FFEEEEEEFFE1E1E1FF888888FF626262FF646464E70606
      060E0606060E646464E7626262FF828282FFDCDCDCFFEDEDEDFFF3F3F3FFEEEE
      EEFFF1F1F1FFF1F1F1FFF3F3F3FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF6F6
      F6FFEEEEEEFFE1E1E1FF888888FF626262FF646464E70606060E0606060E6464
      64E7626262FF828282FFDCDCDCFFEBEBEBFFEDEDEDFFEFEFEFFFFAFAFAFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFE1E1E1FF818181FFAAAAAAFFE1E1
      E1FF888888FF626262FF646464E70606060E00000000232323506E6E6EFF5D5D
      5DFFA9A9A9FFDEDEDEFFECECECFFF2F2F2FFE3E3E3FFFAFAFAFFFCFCFCFFFCFC
      FCFFFCFCFCFFF9F9F9FFF4F4F4FFECECECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E
      6EFF232323500000000000000000232323506E6E6EFF5D5D5DFFA9A9A9FFDEDE
      DEFFECECECFFF2F2F2FFF6F6F6FFFAFAFAFFFCFCFCFFFCFCFCFFFCFCFCFFF9F9
      F9FFF4F4F4FFECECECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E6EFF232323500000
      000000000000232323506E6E6EFF5D5D5DFFA9A9A9FFDEDEDEFFECECECFFF2F2
      F2FFF6F6F6FFFAFAFAFFFCFCFCFFFCFCFCFFFCFCFCFFF9F9F9FFF4F4F4FFECEC
      ECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E6EFF2323235000000000000000002323
      23506E6E6EFF5D5D5DFFA9A9A9FFDEDEDEFFECECECFFF2F2F2FFF6F6F6FFFAFA
      FAFFFCFCFCFFFCFCFCFFFCFCFCFFF9F9F9FFF4F4F4FFE9E9E9FFCDCDCDFFB3B3
      B3FF5D5D5DFF6E6E6EFF232323500000000000000000000000004A4A4AA46E6E
      6EFF676767FFAAAAAAFFD7D7D7FFE7E7E7FFECECECFFF0F0F0FFF1F1F1FFF2F2
      F2FFF0F0F0FFEDEDEDFFE6E6E6FFDCDCDCFFAFAFAFFF676767FF6E6E6EFF4A4A
      4AA4000000000000000000000000000000004A4A4AA46E6E6EFF676767FFAAAA
      AAFFD7D7D7FFE7E7E7FFECECECFFF0F0F0FFF1F1F1FFF2F2F2FFF0F0F0FFEDED
      EDFFE6E6E6FFDCDCDCFFAFAFAFFF676767FF6E6E6EFF4A4A4AA4000000000000
      000000000000000000004A4A4AA46E6E6EFF676767FFAAAAAAFFD7D7D7FFE7E7
      E7FFECECECFFF0F0F0FFF1F1F1FFF2F2F2FFF0F0F0FFEDEDEDFFE6E6E6FFDCDC
      DCFFAFAFAFFF676767FF6E6E6EFF4A4A4AA40000000000000000000000000000
      00004A4A4AA46E6E6EFF676767FFAAAAAAFFD7D7D7FFE7E7E7FFECECECFFF0F0
      F0FFF1F1F1FFF2F2F2FFF0F0F0FFEDEDEDFFE6E6E6FFDCDCDCFFAFAFAFFF6767
      67FF6E6E6EFF4A4A4AA400000000000000000000000000000000080808116969
      69E1707070FF626262FF858585FFC2C2C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3
      E3FFE0E0E0FFD8D8D8FFCACACAFF858585FF626262FF707070FF696969E10808
      08110000000000000000000000000000000008080811696969E1707070FF6262
      62FF858585FFC2C2C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3E3FFE0E0E0FFD8D8
      D8FFCACACAFF858585FF626262FF707070FF696969E108080811000000000000
      0000000000000000000008080811696969E1707070FF626262FF858585FFC2C2
      C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3E3FFE0E0E0FFD8D8D8FFCACACAFF8585
      85FF626262FF707070FF696969E1080808110000000000000000000000000000
      000008080811696969E1707070FF626262FF858585FFC2C2C2FFD6D6D6FFDFDF
      DFFFE3E3E3FFE3E3E3FFE0E0E0FFD8D8D8FFCACACAFF858585FF626262FF7070
      70FF696969E10808081100000000000000000000000000000000000000000808
      08114E4E4EA4787878FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8
      A8FF8F8F8FFF7B7B7BFF6D6D6DFF6D6D6DFF787878FF4E4E4EA4080808110000
      00000000000000000000000000000000000000000000080808114E4E4EA47878
      78FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8A8FF8F8F8FFF7B7B
      7BFF6D6D6DFF6D6D6DFF787878FF4E4E4EA40808081100000000000000000000
      0000000000000000000000000000080808114E4E4EA4787878FF6D6D6DFF6D6D
      6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8A8FF8F8F8FFF7B7B7BFF6D6D6DFF6D6D
      6DFF787878FF4E4E4EA408080811000000000000000000000000000000000000
      000000000000080808114E4E4EA4787878FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F
      8FFFA9A9A9FFA8A8A8FF8F8F8FFF7B7B7BFF6D6D6DFF6D6D6DFF787878FF4E4E
      4EA4080808110000000000000000000000000000000000000000000000000000
      00000000000027272750727272E77A7A7AFF757575FF717171FF6D6D6DFF6D6D
      6DFF717171FF757575FF7A7A7AFF727272E72727275000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002727
      2750727272E77A7A7AFF757575FF717171FF6D6D6DFF6D6D6DFF717171FF7575
      75FF7A7A7AFF727272E727272750000000000000000000000000000000000000
      0000000000000000000000000000000000000000000027272750727272E77A7A
      7AFF757575FF717171FF6D6D6DFF6D6D6DFF717171FF757575FF7A7A7AFF7272
      72E7272727500000000000000000000000000000000000000000000000000000
      000000000000000000000000000027272750727272E77A7A7AFF757575FF7171
      71FF6D6D6DFF6D6D6DFF717171FF757575FF7A7A7AFF727272E7272727500000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070E252525494040407E5C5C5CB2767676E57676
      76E55C5C5CB24040407E252525490707070E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000707070E252525494040407E5C5C5CB2767676E5767676E55C5C5CB24040
      407E252525490707070E00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000707070E2525
      25494040407E5C5C5CB2767676E5767676E55C5C5CB24040407E252525490707
      070E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000707070E252525494040407E5C5C
      5CB2767676E5767676E55C5C5CB24040407E252525490707070E000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000580000002C0000000100010000000000100200000000000000000000
      000000000000000000000000FFFFFF00FF87FC000000000000000000FC00FC00
      0000000000000000F0003C000000000000000000E0001C000000000000000000
      C0000C000000000000000000C0000C0000000000000000008000040000000000
      0000000080000400000000000000000080000400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000040000000000000000008000040000000000
      00000000800004000000000000000000C0000C000000000000000000C0000C00
      0000000000000000E0001C000000000000000000F0003C000000000000000000
      FC00FC000000000000000000FF87FC000000000000000000FF87FFFE1FFFF87F
      FFE1FF00FC00FFF003FFC00FFF003F00F0003FC000FF0003FC000F00E0001F80
      007E0001F8000700C0000F00003C0000F0000300C0000F00003C0000F0000300
      8000060000180000600001008000060000180000600001008000060000180000
      6000010000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800006000018000060000100
      800006000018000060000100800006000018000060000100C0000F00003C0000
      F0000300C0000F00003C0000F0000300E0001F80007E0001F8000700F0003FC0
      00FF0003FC000F00FC00FFF003FFC00FFF003F00FF87FFFE1FFFF87FFFE1FF00
      00000000000000000000000000000000000000000000}
  end
  object LabelScrollTimer: TJvThreadTimer
    Enabled = True
    Interval = 200
    KeepAlive = True
    OnTimer = LabelScrollTimerTimer
    Priority = tpLowest
    Left = 496
    Top = 288
  end
  object AddMenu: TPopupMenu
    Left = 408
    Top = 376
    object A7: TMenuItem
      Caption = 'Add Files'
      OnClick = A3Click
    end
    object A8: TMenuItem
      Caption = 'Add Folder'
      OnClick = A4Click
    end
  end
  object RemoveMenu: TPopupMenu
    Left = 480
    Top = 376
    object D3: TMenuItem
      Caption = 'Delete All'
      OnClick = C1Click
    end
    object D4: TMenuItem
      Caption = 'Delete Selected'
      OnClick = D1Click
    end
  end
  object Playlist2Menu: TPopupMenu
    Left = 592
    Top = 376
    object S10: TMenuItem
      Caption = 'Save Playlist'
      OnClick = s3Click
    end
    object L3: TMenuItem
      Caption = 'Load Playlist'
      OnClick = L1Click
    end
  end
  object FuncListMenu: TPopupMenu
    Left = 688
    Top = 392
    object N5: TMenuItem
      Caption = 'New playlist'
    end
    object D5: TMenuItem
      Caption = 'Delete selected playlist'
    end
    object R6: TMenuItem
      Caption = 'Rename selected list'
    end
  end
  object LastFMLaunchTimer: TTimer
    Enabled = False
    OnTimer = LastFMLaunchTimerTimer
    Left = 392
    Top = 224
  end
  object PipeServer: TPipeServer
    Active = False
    OnPipeConnect = PipeServerPipeConnect
    PipeName = 'OooPlayerPipe'
    Left = 787
    Top = 394
  end
  object TrayIcon: TJvTrayIcon
    Active = True
    IconIndex = 0
    PopupMenu = TrayMenu
    Visibility = [tvVisibleTaskBar, tvVisibleTaskList, tvRestoreClick, tvRestoreDbClick, tvMinimizeClick, tvMinimizeDbClick]
    Left = 595
    Top = 226
  end
  object UpdateChecker: TJvHttpUrlGrabber
    FileName = 'output.txt'
    OutputMode = omStream
    Agent = 'JEDI-VCL'
    Port = 0
    ProxyAddresses = 'proxyserver'
    ProxyIgnoreList = '<local>'
    OnDoneStream = UpdateCheckerDoneStream
    Left = 699
    Top = 210
  end
  object Taskbar2: TTaskbar
    TaskBarButtons = <
      item
        Hint = 'Play'
        Icon.Data = {
          0000010001001010000000000000680400001600000028000000100000002000
          000001002000000000000004000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF005555552654545481525252B5515151E75151
          51E7525252B55454548155555526FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560154545471525252F64F4F4FFF5D5D5DFF767676FF7878
          78FF5F5F5FFF4F4F4FFF525252F65454547156565601FFFFFF00FFFFFF00FFFF
          FF0057575701565656B64F4F4FFF686868FFD0D0D0FFE9E9E9FFEFEFEFFFF1F1
          F1FFEFEFEFFFDBDBDBFF727272FF4F4F4FFF565656B657575701FFFFFF00FFFF
          FF0056565671505050FF868686FFE2E2E2FFF1F1F1FFFAFAFAFFFCFCFCFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FF9A9A9AFF505050FF56565671FFFFFF005959
          5926555555F6676767FFDDDDDDFFF1F1F1FFFCFCFCFF949494FFF1F1F1FFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFFF1F1F1FF737373FF555555F6595959265B5B
          5B81545454FFB8B8B8FFE9E9E9FFFAFAFAFFFFFFFFFF4A4A4AFF484848FFBBBB
          BBFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFDBDBDBFF545454FF5B5B5B805B5B
          5BB5606060FFD0D0D0FFEFEFEFFFFCFCFCFFFFFFFFFF3B3B3BFF212121FF1818
          18FF727272FFF0F0F0FFFFFFFFFFFCFCFCFFEFEFEFFF646464FF5B5B5BB55D5D
          5DE7727272FFD5D5D5FFF1F1F1FFFDFDFDFFFFFFFFFF363636FF171717FF0707
          07FF252525FF535353FFCBCBCBFFFDFDFDFFF1F1F1FF7C7C7CFF5D5D5DE76060
          60E7737373FFD0D0D0FFEFEFEFFFFCFCFCFFFFFFFFFF666666FF515151FF4040
          40FF404040FF5E5E5EFFCCCCCCFFFCFCFCFFEFEFEFFF7B7B7BFF606060E76565
          65B5666666FFCECECEFFF1F1F1FFFCFCFCFFFFFFFFFF7D7D7DFF666666FF5858
          58FF8F8F8FFFF2F2F2FFFFFFFFFFFAFAFAFFE9E9E9FF686868FF656565B56A6A
          6A81616161FFBEBEBEFFECECECFFF6F6F6FFFDFDFDFF8D8D8DFF868686FFCFCF
          CFFFFFFFFFFFFFFFFFFFFCFCFCFFF1F1F1FFD0D0D0FF616161FF6A6A6A807171
          71266C6C6CF6737373FFD5D5D5FFEDEDEDFFF6F6F6FFB2B2B2FFF2F2F2FFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FFE2E2E2FF747474FF6C6C6CF671717126FFFF
          FF00737373716B6B6BFF8E8E8EFFD3D3D3FFE8E8E8FFEFEFEFFFF2F2F2FFF3F3
          F3FFF1F1F1FFEAEAEAFFDDDDDDFF8D8D8DFF6B6B6BFF73737371FFFFFF00FFFF
          FF007A7A7A01797979B66F6F6FFF777777FFBABABAFFD0D0D0FFD9D9D9FFDBDB
          DBFFD4D4D4FFBABABAFF767676FF6F6F6FFF797979B67A7A7A01FFFFFF00FFFF
          FF00FFFFFF007F7F7F017D7D7D71797979F6727272FF747474FF7F7F7FFF7F7F
          7FFF747474FF727272FF797979F67D7D7D717F7F7F01FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008585852683838381818181B57F7F7FE77F7F
          7FE7818181B58383838185858526FFFFFF00FFFFFF00FFFFFF00FFFFFF00F81F
          0000F00F0000C0030000C0030000800100000000000000000000000000000000
          0000000000000000000080010000C0030000C0030000F00F0000F81F0000}
      end
      item
        Hint = 'Pause'
        Icon.Data = {
          0000010001001010000000000000680400001600000028000000100000002000
          000001002000000000000004000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF005555552654545481525252B5515151E75151
          51E7525252B55454548155555526FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560154545471525252F64F4F4FFF5D5D5DFF767676FF7878
          78FF5F5F5FFF4F4F4FFF525252F65454547156565601FFFFFF00FFFFFF00FFFF
          FF0057575701565656B64F4F4FFF686868FFD0D0D0FFE9E9E9FFEFEFEFFFF1F1
          F1FFEFEFEFFFDBDBDBFF727272FF4F4F4FFF565656B657575701FFFFFF00FFFF
          FF0056565671505050FF868686FFE2E2E2FFF1F1F1FFFAFAFAFFFCFCFCFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FF9A9A9AFF505050FF56565671FFFFFF005959
          5926555555F6676767FFDDDDDDFFF1F1F1FFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFFF1F1F1FF737373FF555555F6595959265B5B
          5B81545454FFB8B8B8FFE9E9E9FFFAFAFAFF5E5E5EFF363636FFFFFFFFFFFFFF
          FFFF5E5E5EFF363636FFFFFFFFFFFAFAFAFFDBDBDBFF545454FF5B5B5B805B5B
          5BB5606060FFD0D0D0FFEFEFEFFFFCFCFCFF525252FF1B1B1BFFFFFFFFFFFFFF
          FFFF525252FF1B1B1BFFFFFFFFFFFCFCFCFFEFEFEFFF646464FF5B5B5BB55D5D
          5DE7727272FFD5D5D5FFF1F1F1FFFDFDFDFF4D4D4DFF000000FFFFFFFFFFFFFF
          FFFF4D4D4DFF000000FFFFFFFFFFFDFDFDFFF1F1F1FF7C7C7CFF5D5D5DE76060
          60E7737373FFD0D0D0FFEFEFEFFFFCFCFCFF777777FF4B4B4BFFFFFFFFFFFFFF
          FFFF606060FF222222FFFFFFFFFFFCFCFCFFEFEFEFFF7B7B7BFF606060E76565
          65B5666666FFCECECEFFF1F1F1FFFCFCFCFF929292FF6C6C6CFFFFFFFFFFFFFF
          FFFF6F6F6FFF404040FFFFFFFFFFFAFAFAFFE9E9E9FF686868FF656565B56A6A
          6A81616161FFBEBEBEFFECECECFFF6F6F6FF989898FF858585FFFFFFFFFFFFFF
          FFFF777777FF616161FFFCFCFCFFF1F1F1FFD0D0D0FF616161FF6A6A6A807171
          71266C6C6CF6737373FFD5D5D5FFEDEDEDFFF6F6F6FFFBFBFBFFFDFDFDFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FFE2E2E2FF747474FF6C6C6CF671717126FFFF
          FF00737373716B6B6BFF8E8E8EFFD3D3D3FFE8E8E8FFEFEFEFFFF2F2F2FFF3F3
          F3FFF1F1F1FFEAEAEAFFDDDDDDFF8D8D8DFF6B6B6BFF73737371FFFFFF00FFFF
          FF007A7A7A01797979B66F6F6FFF777777FFBABABAFFD0D0D0FFD9D9D9FFDBDB
          DBFFD4D4D4FFBABABAFF767676FF6F6F6FFF797979B67A7A7A01FFFFFF00FFFF
          FF00FFFFFF007F7F7F017D7D7D71797979F6727272FF747474FF7F7F7FFF7F7F
          7FFF747474FF727272FF797979F67D7D7D717F7F7F01FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008585852683838381818181B57F7F7FE77F7F
          7FE7818181B58383838185858526FFFFFF00FFFFFF00FFFFFF00FFFFFF00F81F
          0000F00F0000C0030000C0030000800100000000000000000000000000000000
          0000000000000000000080010000C0030000C0030000F00F0000F81F0000}
      end
      item
        Hint = 'Stop'
        Icon.Data = {
          0000010001001010000000000000680400001600000028000000100000002000
          000001002000000000000004000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF005555552654545481525252B5515151E75151
          51E7525252B55454548155555526FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560154545471525252F64F4F4FFF5D5D5DFF767676FF7878
          78FF5F5F5FFF4F4F4FFF525252F65454547156565601FFFFFF00FFFFFF00FFFF
          FF0057575701565656B64F4F4FFF686868FFD0D0D0FFE9E9E9FFEFEFEFFFF1F1
          F1FFEFEFEFFFDBDBDBFF727272FF4F4F4FFF565656B657575701FFFFFF00FFFF
          FF0056565671505050FF868686FFE2E2E2FFF1F1F1FFFAFAFAFFFCFCFCFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FF9A9A9AFF505050FF56565671FFFFFF005959
          5926555555F6676767FFDDDDDDFFF1F1F1FFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFFF1F1F1FF737373FF555555F6595959265B5B
          5B81545454FFB8B8B8FFE9E9E9FFFAFAFAFF626262FF4A4A4AFF3C3C3CFF3636
          36FF3C3C3CFF4A4A4AFFFFFFFFFFFAFAFAFFDBDBDBFF545454FF5B5B5B805B5B
          5BB5606060FFD0D0D0FFEFEFEFFFFCFCFCFF565656FF3A3A3AFF252525FF1B1B
          1BFF252525FF3A3A3AFFFFFFFFFFFCFCFCFFEFEFEFFF646464FF5B5B5BB55D5D
          5DE7727272FFD5D5D5FFF1F1F1FFFDFDFDFF505050FF333333FF191919FF0000
          00FF191919FF333333FFFFFFFFFFFDFDFDFFF1F1F1FF7C7C7CFF5D5D5DE76060
          60E7737373FFD0D0D0FFEFEFEFFFFCFCFCFF787878FF646464FF515151FF3D3D
          3DFF373737FF404040FFFFFFFFFFFCFCFCFFEFEFEFFF7B7B7BFF606060E76565
          65B5666666FFCECECEFFF1F1F1FFFCFCFCFF929292FF7A7A7AFF656565FF5656
          56FF515151FF535353FFFFFFFFFFFAFAFAFFE9E9E9FF686868FF656565B56A6A
          6A81616161FFBEBEBEFFECECECFFF6F6F6FF979797FF8C8C8CFF7C7C7CFF7171
          71FF6E6E6EFF717171FFFCFCFCFFF1F1F1FFD0D0D0FF616161FF6A6A6A807171
          71266C6C6CF6737373FFD5D5D5FFEDEDEDFFF6F6F6FFFBFBFBFFFDFDFDFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FFE2E2E2FF747474FF6C6C6CF671717126FFFF
          FF00737373716B6B6BFF8E8E8EFFD3D3D3FFE8E8E8FFEFEFEFFFF2F2F2FFF3F3
          F3FFF1F1F1FFEAEAEAFFDDDDDDFF8D8D8DFF6B6B6BFF73737371FFFFFF00FFFF
          FF007A7A7A01797979B66F6F6FFF777777FFBABABAFFD0D0D0FFD9D9D9FFDBDB
          DBFFD4D4D4FFBABABAFF767676FF6F6F6FFF797979B67A7A7A01FFFFFF00FFFF
          FF00FFFFFF007F7F7F017D7D7D71797979F6727272FF747474FF7F7F7FFF7F7F
          7FFF747474FF727272FF797979F67D7D7D717F7F7F01FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008585852683838381818181B57F7F7FE77F7F
          7FE7818181B58383838185858526FFFFFF00FFFFFF00FFFFFF00FFFFFF00F81F
          0000F00F0000C0030000C0030000800100000000000000000000000000000000
          0000000000000000000080010000C0030000C0030000F00F0000F81F0000}
      end
      item
        Hint = 'Previous'
        Icon.Data = {
          0000010001001010000000000000680400001600000028000000100000002000
          000001002000000000000004000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF005555552654545481525252B5515151E75151
          51E7525252B55454548155555526FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560154545471525252F64F4F4FFF5D5D5DFF767676FF7878
          78FF5F5F5FFF4F4F4FFF525252F65454547156565601FFFFFF00FFFFFF00FFFF
          FF0057575701565656B64F4F4FFF686868FFD0D0D0FFE9E9E9FFEFEFEFFFF1F1
          F1FFEFEFEFFFDBDBDBFF727272FF4F4F4FFF565656B657575701FFFFFF00FFFF
          FF0056565671505050FF868686FFE2E2E2FFF1F1F1FFFAFAFAFFFCFCFCFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FF9A9A9AFF505050FF56565671FFFFFF005959
          5926555555F6676767FFDDDDDDFFF1F1F1FFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF0F0F0FF8A8A8AFFF1F1F1FF737373FF555555F6595959265B5B
          5B81545454FFB8B8B8FFE9E9E9FF5E5E5EFF363636FFFFFFFFFFFFFFFFFFFFFF
          FFFFBFBFBFFF444444FF383838FFFAFAFAFFDBDBDBFF545454FF5B5B5B805B5B
          5BB5606060FFD0D0D0FFEFEFEFFF525252FF1B1B1BFFFFFFFFFFF2F2F2FF8585
          85FF2C2C2CFF181818FF212121FFFCFCFCFFEFEFEFFF646464FF5B5B5BB55D5D
          5DE7727272FFD5D5D5FFF1F1F1FF4D4D4DFF000000FFCCCCCCFF6F6F6FFF4444
          44FF252525FF070707FF171717FFFDFDFDFFF1F1F1FF7C7C7CFF5D5D5DE76060
          60E7737373FFD0D0D0FFEFEFEFFF6B6B6BFF4B4B4BFFD7D7D7FF8E8E8EFF6565
          65FF404040FF252525FF262626FFFCFCFCFFEFEFEFFF7B7B7BFF606060E76565
          65B5666666FFCECECEFFF1F1F1FF9B9B9BFF777777FFFFFFFFFFF5F5F5FFA1A1
          A1FF585858FF434343FF3D3D3DFFFAFAFAFFE9E9E9FF686868FF656565B56A6A
          6A81616161FFBEBEBEFFECECECFFA3A3A3FF8A8A8AFFFFFFFFFFFFFFFFFFFFFF
          FFFFCECECEFF6A6A6AFF575757FFF1F1F1FFD0D0D0FF616161FF6A6A6A807171
          71266C6C6CF6737373FFD5D5D5FFEDEDEDFFF6F6F6FFFBFBFBFFFDFDFDFFFDFD
          FDFFFCFCFCFFEEEEEEFF939393FFE2E2E2FF747474FF6C6C6CF671717126FFFF
          FF00737373716B6B6BFF8E8E8EFFD3D3D3FFE8E8E8FFEFEFEFFFF2F2F2FFF3F3
          F3FFF1F1F1FFEAEAEAFFDDDDDDFF8D8D8DFF6B6B6BFF73737371FFFFFF00FFFF
          FF007A7A7A01797979B66F6F6FFF777777FFBABABAFFD0D0D0FFD9D9D9FFDBDB
          DBFFD4D4D4FFBABABAFF767676FF6F6F6FFF797979B67A7A7A01FFFFFF00FFFF
          FF00FFFFFF007F7F7F017D7D7D71797979F6727272FF747474FF7F7F7FFF7F7F
          7FFF747474FF727272FF797979F67D7D7D717F7F7F01FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008585852683838381818181B57F7F7FE77F7F
          7FE7818181B58383838185858526FFFFFF00FFFFFF00FFFFFF00FFFFFF00F81F
          0000F00F0000C0030000C0030000800100000000000000000000000000000000
          0000000000000000000080010000C0030000C0030000F00F0000F81F0000}
      end
      item
        Hint = 'Next'
        Icon.Data = {
          0000010001001010000000000000680400001600000028000000100000002000
          000001002000000000000004000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF005555552654545481525252B5515151E75151
          51E7525252B55454548155555526FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005656560154545471525252F64F4F4FFF5D5D5DFF767676FF7878
          78FF5F5F5FFF4F4F4FFF525252F65454547156565601FFFFFF00FFFFFF00FFFF
          FF0057575701565656B64F4F4FFF686868FFD0D0D0FFE9E9E9FFEFEFEFFFF1F1
          F1FFEFEFEFFFDBDBDBFF727272FF4F4F4FFF565656B657575701FFFFFF00FFFF
          FF0056565671505050FF868686FFE2E2E2FFF1F1F1FFFAFAFAFFFCFCFCFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FF9A9A9AFF505050FF56565671FFFFFF005959
          5926555555F6676767FFDDDDDDFF8F8F8FFFEEEEEEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFFF1F1F1FF737373FF555555F6595959265B5B
          5B81545454FFB8B8B8FFE9E9E9FF4A4A4AFF484848FFBBBBBBFFFFFFFFFFFFFF
          FFFFFFFFFFFF5E5E5EFF363636FFFAFAFAFFDBDBDBFF545454FF5B5B5B805B5B
          5BB5606060FFD0D0D0FFEFEFEFFF3B3B3BFF212121FF181818FF727272FFF0F0
          F0FFFFFFFFFF525252FF1B1B1BFFFCFCFCFFEFEFEFFF646464FF5B5B5BB55D5D
          5DE7727272FFD5D5D5FFF1F1F1FF363636FF171717FF070707FF252525FF5353
          53FFCBCBCBFF4D4D4DFF000000FFFDFDFDFFF1F1F1FF7C7C7CFF5D5D5DE76060
          60E7737373FFD0D0D0FFEFEFEFFF595959FF545454FF4E4E4EFF595959FF7272
          72FFD0D0D0FF575757FF1B1B1BFFFCFCFCFFEFEFEFFF7B7B7BFF606060E76565
          65B5666666FFCECECEFFF1F1F1FF919191FF7B7B7BFF6E6E6EFF9C9C9CFFF3F3
          F3FFFFFFFFFF666666FF363636FFFAFAFAFFE9E9E9FF686868FF656565B56A6A
          6A81616161FFBEBEBEFFECECECFF9E9E9EFF979797FFD5D5D5FFFFFFFFFFFFFF
          FFFFFFFFFFFF6F6F6FFF595959FFF1F1F1FFD0D0D0FF616161FF6A6A6A807171
          71266C6C6CF6737373FFD5D5D5FFB9B9B9FFEDEDEDFFFBFBFBFFFDFDFDFFFDFD
          FDFFFCFCFCFFFAFAFAFFF1F1F1FFE2E2E2FF747474FF6C6C6CF671717126FFFF
          FF00737373716B6B6BFF8E8E8EFFD3D3D3FFE8E8E8FFEFEFEFFFF2F2F2FFF3F3
          F3FFF1F1F1FFEAEAEAFFDDDDDDFF8D8D8DFF6B6B6BFF73737371FFFFFF00FFFF
          FF007A7A7A01797979B66F6F6FFF777777FFBABABAFFD0D0D0FFD9D9D9FFDBDB
          DBFFD4D4D4FFBABABAFF767676FF6F6F6FFF797979B67A7A7A01FFFFFF00FFFF
          FF00FFFFFF007F7F7F017D7D7D71797979F6727272FF747474FF7F7F7FFF7F7F
          7FFF747474FF727272FF797979F67D7D7D717F7F7F01FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008585852683838381818181B57F7F7FE77F7F
          7FE7818181B58383838185858526FFFFFF00FFFFFF00FFFFFF00FFFFFF00F81F
          0000F00F0000C0030000C0030000800100000000000000000000000000000000
          0000000000000000000080010000C0030000C0030000F00F0000F81F0000}
      end>
    TabProperties = [AppThumbWhenActive, AppPeekWhenActive]
    OnThumbButtonClick = TaskBar2ThumbButtonClick
    Left = 329
    Top = 199
  end
  object RadioThread: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = RadioThreadRun
    Left = 673
    Top = 287
  end
  object CategoryList: TImageList
    ColorDepth = cd32Bit
    Height = 22
    Width = 22
    Left = 634
    Top = 453
    Bitmap = {
      494C0101020008002C0016001600FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000058000000160000000100200000000000401E
      0000000000000000000000000000000000000000000000000000000000020000
      0004000000090000000E0000000E0000000B0000000800000008000000090000
      00090000000A0000000C00000012000000190000001C0000001B000000180000
      00120000000E0000000800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000070000
      001B000000360000004A0000004700000037000000240000001E0000001E0000
      001F000000220000002C000000430000005900000060000000530000003D0000
      002A0000001D0000001200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000010000000A042C
      197D0D5A35D10E6A3DEB0E683DE8083F23AF031A0E610000001C000000190000
      00190107032C074427A70F7040F10F7040F30E6B3FEE094728C4021E107F0001
      012D0000001B0000001100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000005361E731279
      47F542B187FF4CBC94FF48B88FFF309C6FFA137A49F30A532FAF0003010F0000
      00060C6238CD319468F662C5A3FF64C7A5FF5EC29EFF43A87FFD1C8151F30E67
      3BD801140A360000000700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C7542F94FC0
      98FF61CEAAFF6DD2B1FF67D0AEFF5ECDA9FF58C9A4FF299163F60D683DD90006
      030F127946FC71D1B0FF68D0AEFF65CEACFF62CEABFF64CFACFF69D1AFFF45AE
      86FE0E7441F60108051400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E6D3EE3339F
      72FC82D5B9FFBAE9DAFFB2E7D6FFA0E1CBFF72D1B2FF64CFACFF107746F60109
      06160C5832B734956AF999D6C0FFC3EBDDFFB9E7D7FFA2DEC9FF74D0B1FF6CD1
      B0FF167B4AF3010E092100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010D071E0D5A
      35BA0E7441F60E7643F8197D4BF70E7743FC137947F966CEABFF147949F60108
      05140007030E06381F780F683DD60C7542F90F7542F40E7342EE127947FA6BD1
      B0FF197E4DF2020F09230D0D0DFF0D0D0DFF090909A800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000008041300080413000000010D7441F769CDABFF147947F70007
      04120000000000000000000000000000000000000000000000000B7641FF6ED2
      B1FF1C7E4EF202100925141616FF141616FF141616FF818A8EEC000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F76CCEADFF147947F80107
      04100000000000000000000000000000000000000000000000000B7641FF72D3
      B3FF1C7E4FF301110927171B1DFF171B1DFF171B1DFF9DA8AFFF5F6970FF5E68
      6FFF5C676DFF5C666DFF5C666DFF5C666DFF131313FF5C666DFF5C676DFF5D68
      6EFF131313FF758084F10000000000000000707B82FF60696FD8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F76FCFAFFF137947F80007
      030E0000000000000000000000000000000000000000000000000B7641FF76D4
      B5FF1D7F4FF201120A291A2024FF1A2024FF1A2024FF404F58FF869299FF8692
      99FF869299FF869299FF869299FF869299FF171B1DFF869299FF869299FF8692
      99FF171B1DFF5E6C74FF6E777DFF6E787CFF68757EFF5F6B72FF556168FD1E22
      244A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F771D0B0FF117846F90006
      030C0000000000000000000000000000000000000000000000000B7641FF79D5
      B7FF1C7E50F102130A2B1C2327FF1C2327FF1C2327FF404F58FF404F58FF404F
      58FF404F58FF404F58FF404F58FF404F58FF1C2327FF404F58FF404F58FF404F
      58FF1C2327FF404F58FF4A5861FF4A5861FF404F58FF404F58FF404F58FF4552
      59FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F772D0B1FF107845FA0005
      030A0000000000000000000000000000000000000000000000000B7641FF7CD6
      B9FF1B7D4DF002140B2C272D31FF272D31FF272D31FF818B91FF818B91FF818B
      91FF818B91FF818B91FF818B91FF818B91FF34383BFF818B91FF818B91FF818B
      91FF34383BFFFFFFFFFFB7BCC0FFB7BCC0FFFFFFFFFF8A9399FFB3B9BCFFD7DA
      DCFC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F773D1B1FF0F7844FB0006
      030F0001010200000000000000000000000000000000000000000B7641FF80D7
      BAFF197D4DF001140C2E4A4C4EFF4A4C4EFF4A4C4EFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF636363FFFFFFFFFFFFFFFFFFFFFF
      FFFF636363FFDFE1E2FF999FA2FF999FA2FFE2E4E5FFF1F1F2FF3E474CD60E11
      133D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F773D1B1FF187F4FF50C76
      42FD0B7641FE0B7641FF0B7642FD0C7541FB0C7541FA0D7541F7107946F881D8
      BBFF167C4BF002150C30636363FF636363FF636363FFDFE1E2FF687176FF6871
      76FF687176FF687176FF687176FF687176FF4B4E50FF687176FF687176FF6871
      76FF4B4E50FF283034A800000000000000003D494EFB1B202372000101040000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F772D0B1FF7ED7BAFF87D9
      BEFF91DCC4FF9AE0C9FFA0E1CBFFA0E1CBFF9CDFC8FF93DBC3FF8BD9C0FF85D9
      BEFF157C4BF001160C32636363FF636363FF636363FF283034A8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F798DCC5FFA3E2CDFFB6E8
      D7FFC9EEE2FFDBF4EBFFECF9F5FFF7FDFBFFEAF8F4FFD7F3EAFFC6EDE0FFC0EC
      DDFF1E8052F002170D343E4346FF3E4346FF292C2EA800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7441F787D3B8FFA5DFCBFFB9E7
      D6FFC8ECE0FFD6F1E7FFDEF4EDFFE1F5EEFFDCF4ECFFD2F0E6FFC4ECDFFFB2E6
      D5FF1F8252F102180D3600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C5C36BF0E7141ED0E7241EF0E73
      41F10E7341F30E7441F40E7441F60C7541F80C7542F90C7541FB0C7641FC0B76
      42FD0C7442F9010E092100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000058000000160000000100010000000000080100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFF0000000000000FFFFFFFF
      FFF0000000000000F0F83FFFFFF0000000000000E0300FFFFFF0000000000000
      C01007FFFFF0000000000000C01007FFFFF0000000000000E01C047FFFF00000
      00000000FF1FC43FFFF0000000000000FF1FC4000330000000000000FF1FC400
      0010000000000000FF1FC4000000000000000000FF1FC4000000000000000000
      FF1FC4000010000000000000FF0004000370000000000000FF00043FFFF00000
      00000000FF00047FFFF0000000000000FF0007FFFFF0000000000000FF0007FF
      FFF0000000000000FFFFFFFFFFF0000000000000FFFFFFFFFFF0000000000000
      FFFFFFFFFFF0000000000000FFFFFFFFFFF00000000000000000000000000000
      0000000000000000000000000000}
  end
  object PlaybackImages: TImageList
    ColorDepth = cd32Bit
    Height = 22
    Width = 22
    Left = 536
    Top = 456
    Bitmap = {
      494C010103003400440016001600FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000058000000160000000100200000000000401E
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000404040E171717492929297E3A3A3AB24B4B4BE54B4B
      4BE53A3A3AB22929297E171717490404040E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000404040E171717492929297E3A3A3AB24B4B4BE54B4B4BE53A3A3AB22929
      297E171717490404040E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A1A1A504B4B4BE7505050FF4D4D4DFF4A4A4AFF474747FF4747
      47FF4A4A4AFF4D4D4DFF505050FF4B4B4BE71A1A1A5000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001A1A
      1A504B4B4BE7505050FF4D4D4DFF4A4A4AFF474747FF474747FF4A4A4AFF4D4D
      4DFF505050FF4B4B4BE71A1A1A50000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      00030000000600000008000000090000000A000000080000000501050113081C
      0B43091E0D47091E0D47020B031F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      0511363636A4525252FF4B4B4BFF545454FF747474FF989898FFBFBFBFFFC0C0
      C0FF9C9C9CFF787878FF565656FF4B4B4BFF525252FF363636A4050505110000
      0000000000000000000000000000000000000000000005050511363636A45252
      52FF4B4B4BFF545454FF747474FF989898FFBFBFBFFFC0C0C0FF9C9C9CFF7878
      78FF565656FF4B4B4BFF525252FF363636A40505051100000000000000000000
      00000000000000000000000000000000000100000008000000120000001D0000
      00270000002F000000380000003E0000003E000000390000002D071B0B602088
      46F1169249F81E904CFA10361974000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505114B4B
      4BE1515151FF484848FF818181FFD9D9D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEF
      EFFFEEEEEEFFEBEBEBFFE2E2E2FF8C8C8CFF484848FF515151FF4B4B4BE10505
      051100000000000000000000000000000000050505114B4B4BE1515151FF4848
      48FF818181FFD9D9D9FFE5E5E5FFEBEBEBFFEEEEEEFFEFEFEFFFEEEEEEFFEBEB
      EBFFE2E2E2FF8C8C8CFF484848FF515151FF4B4B4BE105050511000000000000
      0000000000000000000000000004000000120000002500000036000000470000
      0068040404930C0C0CB7111111C7111111C70E0C0DB7050103910A210F9B179D
      4FFA05A84EFF11A451FF113E1E82000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000373737A45151
      51FF545454FFB1B1B1FFE1E1E1FFECECECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFB
      FBFFFBFBFBFFF8F8F8FFF3F3F3FFECECECFFC2C2C2FF575757FF515151FF3737
      37A400000000000000000000000000000000373737A4515151FF545454FFB1B1
      B1FFE1E1E1FFECECECFFF3F3F3FFF8F8F8FFFBFBFBFFFBFBFBFFFBFBFBFFF8F8
      F8FFF3F3F3FFECECECFFC2C2C2FF575757FF515151FF373737A4000000000000
      000000000000000000000000000E000000220000003500000059080808A71F1F
      1FE53D3D3DFB5E5E5EFF717071FF6C6E6CFF38563EFF245031FB1F5E32F318B0
      59FE07BA56FF12B459FF1C6A36C3103B1C810E31166D01070115000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B1B1B50545454FF4949
      49FFACACACFFE1E1E1FFEEEEEEFFF7F7F7FFE0E0E0FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7F7FFEEEEEEFFC2C2C2FF494949FF5454
      54FF1B1B1B5000000000000000001B1B1B50545454FF494949FFACACACFFE1E1
      E1FFEEEEEEFFF7F7F7FFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFCFCFCFFF7F7F7FFEEEEEEFFC2C2C2FF494949FF545454FF1B1B1B500000
      000000000000000000000000000B0000001C00000050121212C6404040FC8989
      89FFC3C3C3FFDCDCDCFFDDDDDDFFCFD3CFFF61A979FF37B46CFF21BA63FF10C6
      60FF09CA5EFF0AC15BFE12B157FE11A150FF1E8143E60512062F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000404040E4F4F4FE74E4E4EFF7B7B
      7BFFDCDCDCFFECECECFFF7F7F7FFFCFCFCFF878787FF8D8D8DFFF0F0F0FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF7F7F7FFECECECFF8D8D8DFF4E4E
      4EFF4F4F4FE70404040E0404040E4F4F4FE74E4E4EFF7B7B7BFFDCDCDCFFECEC
      ECFFF5F5F5FFE9E9E9FFE9E9E9FFF2F2F2FFFFFFFFFFFFFFFFFFF4F4F4FFEAEA
      EAFFE9E9E9FFFAFAFAFFF7F7F7FFECECECFF8D8D8DFF4E4E4EFF4F4F4FE70404
      040E00000000000000000000000000000023141414BD525252FFB6B6B6FFE5E5
      E5FFE9E9E9FFE8E8E8FFDADADAFFCDD0CCFF67AF81FF49C07EFF40C97DFF32D2
      79FF26D674FF1BCA69FF14B95DFF10A854FF1E8446E60512072F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000019191949575757FF585858FFC8C8
      C8FFE5E5E5FFF3F3F3FFFCFCFCFFFFFFFFFF7B7B7BFF424242FF484848FFBDBD
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF3F3F3FFE2E2E2FF5A5A
      5AFF575757FF1919194919191949575757FF585858FFC8C8C8FFE5E5E5FFF3F3
      F3FFEEEEEEFF5B5B5BFF3B3B3BFF8C8C8CFFFFFFFFFFFFFFFFFFA3A3A3FF4747
      47FF3B3B3BFFEBEBEBFFFCFCFCFFF3F3F3FFE2E2E2FF5A5A5AFF575757FF1919
      19490000000000000000000000030B0B0B89474747FDBABABAFFE9E9E9FFE7E7
      E7FFE6E6E6FFE7E7E7FFE0E0E0FFD2D6D2FF67A87BFF4FB478FF4CBE7BFF45CE
      82FF3BD07DFF36C977FF34B46AFE2CA25DFB298048E20511062E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D7E555555FF707070FFD5D5
      D5FFEBEBEBFFF8F8F8FFFDFDFDFFFFFFFFFF727272FF333333FF262626FF2323
      23FF737373FFEFEFEFFFFFFFFFFFFFFFFFFFFDFDFDFFF8F8F8FFEBEBEBFF7B7B
      7BFF555555FF2D2D2D7E2D2D2D7E555555FF707070FFD5D5D5FFEBEBEBFFF8F8
      F8FFEEEEEEFF4F4F4FFF282828FF838383FFFFFFFFFFFFFFFFFFA3A3A3FF3838
      38FF282828FFE9E9E9FFFDFDFDFFF8F8F8FFEBEBEBFF7B7B7BFF555555FF2D2D
      2D7E000000000000000001010133272727E3969696FFE7E7E7FFE7E7E7FFE6E6
      E6FFE7E7E7FFE6E6E6FFE7E7E7FFE3E4E3FFB9CABCFFB0C7B5FF89B494FF4ABC
      79FF3FC47AFF3EBE75FF2A653CF40D24117B091D0C420004010D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424242B2535353FF898989FFDCDC
      DCFFEEEEEEFFFBFBFBFFFFFFFFFFFFFFFFFF6D6D6DFF282828FF151515FF1010
      10FF202020FF464646FFC3C3C3FFFFFFFFFFFFFFFFFFFBFBFBFFEEEEEEFF9E9E
      9EFF535353FF424242B2424242B2535353FF898989FFDCDCDCFFEEEEEEFFFBFB
      FBFFEFEFEFFF484848FF171717FF7B7B7BFFFFFFFFFFFFFFFFFFA1A1A1FF2D2D
      2DFF171717FFE8E8E8FFFFFFFFFFFBFBFBFFEEEEEEFF9E9E9EFF535353FF4242
      42B200000000000000000909097B4F4F4FFED1D1D1FFE8E8E8FFE6E6E6FFE7E7
      E7FFE7E7E7FFE7E7E7FFE6E6E6FFE7E7E7FFE9E8E9FFECEAECFFB3C8B7FF4DB1
      75FF43B978FF41B372FF2E5639FD090708780000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656E5525252FFA4A4A4FFDDDD
      DDFFEFEFEFFFFBFBFBFFFFFFFFFFFFFFFFFF6A6A6AFF242424FF0E0E0EFF0606
      06FF1C1C1CFF323232FF484848FF949494FFF2F2F2FFFBFBFBFFEFEFEFFFC1C1
      C1FF525252FF565656E5565656E5525252FFA4A4A4FFDDDDDDFFEFEFEFFFFBFB
      FBFFEFEFEFFF454545FF0D0D0DFF787878FFFFFFFFFFFFFFFFFFA0A0A0FF2929
      29FF0D0D0DFFE8E8E8FFFFFFFFFFFBFBFBFFEFEFEFFFC1C1C1FF525252FF5656
      56E50000000000000008151515B4777777FFE4E4E4FFE7E7E7FFE7E7E7FFE6E6
      E6FFE6E6E6FFE6E6E6FFE8E8E8FFE9E9E8FFE7E7E7FFE9E8E9FFB9CABBFF58A2
      71FF55A874FF52A36FFF3F5E45FF171516B40000000800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000585858E5545454FFA4A4A4FFDCDC
      DCFFEEEEEEFFFBFBFBFFFFFFFFFFFFFFFFFF888888FF535353FF464646FF3939
      39FF383838FF424242FF505050FF969696FFF2F2F2FFFBFBFBFFEEEEEEFFC0C0
      C0FF545454FF585858E5585858E5545454FFA4A4A4FFDCDCDCFFEEEEEEFFFBFB
      FBFFF0F0F0FF656565FF414141FF959595FFFFFFFFFFFFFFFFFFA9A9A9FF3838
      38FF1C1C1CFFE8E8E8FFFFFFFFFFFBFBFBFFEEEEEEFFC0C0C0FF545454FF5858
      58E500000000000000141D1D1DCD919191FFE4E4E4FFDFDFDFFFE4E4E4FFE7E7
      E7FFE9E9E9FFEDEDEDFFDEDEE1FFD9D9DFFFEEEEEFFFEEEEEEFFE4E6E4FFC9D2
      CAFFC2CCC3FFC6CFC6FF848985FF1E1E1ECD0000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646B2595959FF8A8A8AFFD5D5
      D5FFEEEEEEFFFAFAFAFFFEFEFEFFFFFFFFFF9D9D9DFF686868FF565656FF4C4C
      4CFF4C4C4CFF606060FFC9C9C9FFFFFFFFFFFDFDFDFFF8F8F8FFEBEBEBFF9B9B
      9BFF595959FF464646B2464646B2595959FF8A8A8AFFD5D5D5FFEEEEEEFFFAFA
      FAFFF2F2F2FF898989FF656565FFA2A2A2FFFFFFFFFFFFFFFFFFACACACFF4949
      49FF323232FFE9E9E9FFFDFDFDFFF8F8F8FFEBEBEBFF9B9B9BFF595959FF4646
      46B200000000000000171F1F1FD1979797FFE1E1E1FFD9D9D9FFE4E4E4FFEFEF
      EFFFF3F3F3FFEBEBEAFFCACACEFFADADC2FFCACADFFFDDDDEBFFE7E7EDFFE8E7
      EAFFDCDBDCFFE1E1E1FF989798FF1F1F1FD10000001700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003232327E5F5F5FFF747474FFDCDC
      DCFFF1F1F1FFF8F8F8FFFDFDFDFFFFFFFFFFA4A4A4FF747474FF656565FF5D5D
      5DFF929292FFF2F2F2FFFFFFFFFFFFFFFFFFFCFCFCFFF3F3F3FFE5E5E5FF7B7B
      7BFF5F5F5FFF3232327E3232327E5F5F5FFF747474FFDCDCDCFFF1F1F1FFF8F8
      F8FFF2F2F2FF919191FF737373FFA8A8A8FFFFFFFFFFFFFFFFFFACACACFF5757
      57FF444444FFEBEBEBFFFCFCFCFFF3F3F3FFE5E5E5FF7B7B7BFF5F5F5FFF3232
      327E000000000000000F1A1A1AC38A8A8AFFF0F0F0FFF3F3F3FFF6F6F6FFF6F6
      F6FFEAEAEAFFDEDEDEFFF1F1F1FFEDEDEDFFD0D0D2FFE0E0E6FFE6E6EFFFE3E3
      EBFFE6E6ECFFEFEFF0FF8A8A8AFF1A1A1AC30000000F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1E1E49666666FF626262FFC5C5
      C5FFECECECFFF4F4F4FFFAFAFAFFFDFDFDFFABABABFF828282FF808080FFCFCF
      CFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF7F7F7FFECECECFFDADADAFF6262
      62FF666666FF1E1E1E491E1E1E49666666FF626262FFC5C5C5FFECECECFFF4F4
      F4FFEEEEEEFF979797FF828282FFB1B1B1FFFFFFFFFFFFFFFFFFABABABFF6666
      66FF575757FFE9E9E9FFF7F7F7FFECECECFFDADADAFF626262FF666666FF1E1E
      1E4900000000000000010F0F0F97696969FFEDEDEDFFFAFAFAFFF9F9F9FFEFEF
      EFFFE9E9E9FFF7F7F7FFF9F9F9FFFAFAFAFFF2F2F2FFDCDCDBFFEDEDECFFF9F9
      F9FFF7F7F8FFECECEDFF686868FF0E0E0E980000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606060E646464E7626262FF8282
      82FFDCDCDCFFEDEDEDFFF4F4F4FFFAFAFAFFABABABFFB1B1B1FFF5F5F5FFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFF7F7F7FFEEEEEEFFE1E1E1FF888888FF6262
      62FF646464E70606060E0606060E646464E7626262FF828282FFDCDCDCFFEDED
      EDFFF3F3F3FFEFEFEFFFF4F4F4FFF8F8F8FFFFFFFFFFFFFFFFFFF5F5F5FFEFEF
      EFFFF1F1F1FFF6F6F6FFEEEEEEFFE1E1E1FF888888FF626262FF646464E70606
      060E000000000000000005050553464646F5CBCBCBFFFDFDFDFFFBFBFBFFF8F8
      F8FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFF7F7F7FFE3E3E3FFEEEE
      EEFFFDFDFDFFCACACAFF444444F5050505530000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000232323506E6E6EFF5D5D
      5DFFA9A9A9FFDEDEDEFFECECECFFF2F2F2FFE3E3E3FFFAFAFAFFFCFCFCFFFCFC
      FCFFFCFCFCFFF9F9F9FFF4F4F4FFECECECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E
      6EFF232323500000000000000000232323506E6E6EFF5D5D5DFFA9A9A9FFDEDE
      DEFFECECECFFF2F2F2FFF6F6F6FFFAFAFAFFFCFCFCFFFCFCFCFFFCFCFCFFF9F9
      F9FFF4F4F4FFECECECFFE1E1E1FFB3B3B3FF5D5D5DFF6E6E6EFF232323500000
      0000000000000000000000000011222222B78A8A8AFFF0F0F0FFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFF9F9F9FFF9F9F9FFFDFDFDFFFDFDFDFFFBFBFBFFEBEB
      EBFFE6E6E6FF898989FF202020B7000000110000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4AA46E6E
      6EFF676767FFAAAAAAFFD7D7D7FFE7E7E7FFECECECFFF0F0F0FFF1F1F1FFF2F2
      F2FFF0F0F0FFEDEDEDFFE6E6E6FFDCDCDCFFAFAFAFFF676767FF6E6E6EFF4A4A
      4AA4000000000000000000000000000000004A4A4AA46E6E6EFF676767FFAAAA
      AAFFD7D7D7FFE7E7E7FFECECECFFF0F0F0FFF1F1F1FFF2F2F2FFF0F0F0FFEDED
      EDFFE6E6E6FFDCDCDCFFAFAFAFFF676767FF6E6E6EFF4A4A4AA4000000000000
      000000000000000000000000000005050542454545E1AFAFAFFFF5F5F5FFFEFE
      FEFFFEFEFEFFFFFFFFFFF0F0F0FFF1F1F1FFFEFEFEFFFEFEFEFFFFFFFFFFF4F4
      F4FFAAAAAAFF434343E105050542000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808116969
      69E1707070FF626262FF858585FFC2C2C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3
      E3FFE0E0E0FFD8D8D8FFCACACAFF858585FF626262FF707070FF696969E10808
      08110000000000000000000000000000000008080811696969E1707070FF6262
      62FF858585FFC2C2C2FFD6D6D6FFDFDFDFFFE3E3E3FFE3E3E3FFE0E0E0FFD8D8
      D8FFCACACAFF858585FF626262FF707070FF696969E108080811000000000000
      0000000000000000000000000000000000010C0C0C5B535353E3AFAFAFFFEAEA
      EAFFFCFCFCFFFFFFFFFFF2F2F2FFF3F3F3FFFFFFFFFFFCFCFCFFEAEAEAFFAEAE
      AEFF515151E30B0B0B5C00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08114E4E4EA4787878FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8
      A8FF8F8F8FFF7B7B7BFF6D6D6DFF6D6D6DFF787878FF4E4E4EA4080808110000
      00000000000000000000000000000000000000000000080808114E4E4EA47878
      78FF6D6D6DFF6D6D6DFF7B7B7BFF8F8F8FFFA9A9A9FFA8A8A8FF8F8F8FFF7B7B
      7BFF6D6D6DFF6D6D6DFF787878FF4E4E4EA40808081100000000000000000000
      00000000000000000000000000000000000000000002080808483E3E3EC28989
      89F8BFBFBFFFDDDDDDFFE6E6E6FFE6E6E6FFDCDCDCFFBEBEBEFF888888F83E3E
      3EC2080808480000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000027272750727272E77A7A7AFF757575FF717171FF6D6D6DFF6D6D
      6DFF717171FF757575FF7A7A7AFF727272E72727275000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002727
      2750727272E77A7A7AFF757575FF717171FF6D6D6DFF6D6D6DFF717171FF7575
      75FF7A7A7AFF727272E727272750000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000171313
      1364383838AA606060D5757575E4757575E45F5F5FD5373737AA121212640000
      0017000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070E252525494040407E5C5C5CB2767676E57676
      76E55C5C5CB24040407E252525490707070E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000707070E252525494040407E5C5C5CB2767676E5767676E55C5C5CB24040
      407E252525490707070E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000080101012204040434040404340101012300000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000058000000160000000100010000000000080100000000000000000000
      000000000000000000000000FFFFFF00FF87FFFE1FFFFFFFC0000000FC00FFF0
      03FFFFFFC0000000F0003FC000FFFFE3C0000000E0001F80007FF001C0000000
      C0000F00003FC000C0000000C0000F00003F80004000000080000600001F0000
      4000000080000600001E00004000000080000600001E0001C000000000000000
      000E0001C000000000000000000C0000C000000000000000000C0000C0000000
      00000000000C0000C000000080000600001C0000C000000080000600001C0000
      C000000080000600001E0001C0000000C0000F00003E0001C0000000C0000F00
      003F0003C0000000E0001F80007F8007C0000000F0003FC000FFC00FC0000000
      FC00FFF003FFF03FC0000000FF87FFFE1FFFFFFFC00000000000000000000000
      0000000000000000000000000000}
  end
  object TopBtnImages: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 722
    Top = 469
    Bitmap = {
      494C010109002800300020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000004000000040000000400000004000000040000
      0004000000040000000400000004000000040000000400000004000000040000
      0004000000040000000400000004000000040000000400000004000000040000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001A1B1B494040408B4041418C4041418C4041418C4041418C4041418C4041
      418C4041418C4041418C4041418C4041418C4041418C4041418C4041418C4041
      418C4041418C4041418C4041418C4041418C4041418C4041418C4041418C1D1D
      1D4F000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000B777878B8C8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9
      CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9
      CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8C9CAFFC8CACAFF797A
      7ABA0101000C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E858686C2CDCECFFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCD
      CEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCD
      CEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCCCDCEFFCDCECFFF8586
      86C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E868686C2D0D0D1FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCF
      D0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCF
      D0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFD0D0D1FF8686
      86C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E878788C2D2D2D3FFD1D1D2FFD0D1D2FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0
      D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0
      D1FFD0D0D1FFD1D1D2FFD1D2D3FFD1D2D3FFD1D1D2FFD1D1D2FFD2D2D3FF8787
      88C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E888989C2D4D4D5FFD3D3D4FFCDCDCEFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9
      CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9
      CAFFC9C9CAFFCDCECEFFD0D0D1FFD2D2D3FFD4D4D5FFD3D4D5FFD4D4D5FF8889
      89C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E898989C2D6D6D7FFD5D5D6FFCECECFFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9
      CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9CAFFC9C9
      CAFFC9C9CAFFC9C9CAFFC9C9CAFFCCCCCCFFD2D2D3FFD5D5D6FFD6D6D7FF8989
      89C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8A8A8BC2D8D8D9FFD7D7D8FFD6D6D7FFD4D4D5FFD5D5D5FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD4D4D5FFD5D5D6FFD7D7D8FFD8D8D9FF8A8A
      8BC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8B8C8CC2DADADBFFD9D9DAFFD5D5D6FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3
      D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3
      D4FFD3D3D4FFD3D3D4FFD3D3D4FFD6D6D6FFDADADBFFD9D9DAFFDADADBFF8B8C
      8CC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8C8C8CC2DCDCDDFFDBDBDCFFD3D3D4FFCDCDCEFFCDCDCEFFCDCDCEFFCDCD
      CEFFCDCDCEFFCDCDCEFFCDCDCEFFCDCDCEFFCDCDCEFFCDCDCEFFCDCDCEFFCDCD
      CEFFCECECEFFCFCFCFFFCFCFCFFFD0D0D1FFD6D6D7FFDBDBDCFFDCDCDDFF8C8C
      8CC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8D8D8EC2DEDEDFFFDDDDDEFFD5D5D5FFCFCFCFFFCFCFD0FFCFCFD0FFCFCF
      D0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCFD0FFCFCF
      CFFFD3D3D3FFD8D8D9FFD8D8D9FFDADADBFFDDDDDEFFDDDDDEFFDEDEDFFF8D8D
      8EC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8E8F8FC2E0E0E1FFDFDFE0FFD6D6D7FFD0D0D0FFD0D0D1FFD0D0D1FFD0D0
      D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0D1FFD0D0
      D1FFD0D0D1FFD0D0D1FFD0D0D1FFD3D3D4FFDBDBDCFFDFDFE0FFE0E0E1FF8E8F
      8FC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E8F8F8FC2E2E2E3FFE1E1E2FFD9D9D9FFD3D3D3FFD3D3D4FFD3D3D4FFD3D3
      D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3D4FFD3D3
      D4FFD3D3D4FFD3D3D4FFD3D3D4FFD5D5D6FFDEDEDFFFE2E2E3FFE2E2E3FF8F8F
      8FC20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E909091C2E4E4E5FFE3E3E4FFE3E3E4FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2
      E3FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2E3FFE2E2
      E3FFE2E2E3FFE2E2E3FFE2E2E3FFE3E3E3FFE4E4E5FFE4E4E5FFE4E4E5FF9090
      91C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E919292C2E6E6E7FFE5E5E6FFDEDEDFFFD9D9D9FFD9D9DAFFD9D9DAFFD9D9
      DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9DAFFD9D9
      DAFFD9D9DAFFE0E0E1FFE4E4E5FFE5E5E6FFE6E6E7FFE5E5E6FFE6E6E7FF9192
      92C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E939393C2E8E8E9FFE7E7E8FFDCDCDDFFD5D5D6FFD5D5D6FFD5D5D6FFD5D5
      D6FFD5D5D6FFD5D5D6FFD5D5D6FFD5D5D6FFD5D5D6FFD5D5D6FFD5D5D6FFD5D5
      D6FFD5D5D6FFD6D6D7FFD6D6D7FFDBDBDCFFE4E4E5FFE7E7E8FFE8E8E9FF9393
      93C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E939393C2EAEAEBFFE9E9EAFFDEDEDFFFD6D6D7FFD7D7D7FFD7D7D7FFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
      D7FFD6D6D7FFD7D7D8FFDEDEDFFFE0E0E1FFE3E3E4FFE9E9EAFFEAEAEBFF9393
      93C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      020E949495C2ECECEDFFEBEBECFFE8E8E9FFE6E6E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE6E6E7FFE7E7E8FFEBEBECFFECECEDFFEBEBECFFEBEBECFFECECEDFF9494
      95C20202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000102
      010E959596C2EEEEEFFFEDEDEEFFE7E7E8FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3
      E4FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3E4FFE3E3
      E4FFE3E3E4FFE3E3E4FFE7E7E8FFEDEDEEFFEDEDEEFFEDEDEEFFEEEEEFFF9595
      96C20102010E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E969696C2F0F0F1FFEFEFF0FFE2E2E3FFDADADAFFDADADBFFDADADBFFDADA
      DBFFDADADBFFDADADBFFDADADBFFDADADBFFDADADBFFDADADBFFDADADBFFDADA
      DBFFDADADBFFDADADAFFDCDCDCFFDEDEDEFFE1E1E1FFE9E9E9FFEEEEEEFF9696
      96C10102010E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E979798C2F2F2F3FFF1F1F2FFE4E4E5FFDBDBDCFFDBDBDCFFDBDBDCFFDBDB
      DCFFDBDBDCFFDBDBDCFFDBDBDCFFDBDBDCFFDBDBDCFFDBDBDCFFDBDBDCFFDBDB
      DCFFDBDBDCFFDADADAFFD6D6D6FFCCCCCCFFC9C8C8FFCFCFCFFFDCDCDCFF9191
      92C30202020E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E989899C2F3F3F4FFF2F2F3FFECECEDFFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
      E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
      E9FFE8E8E8FFE2E2E2FFD0D0D0FFB9B9B9FFAAAAAAFFABABABFFBCBCBCFF6363
      63A4000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E999999C2F4F4F5FFF4F4F4FFF3F3F4FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2
      F3FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2F3FFF2F2
      F3FFDFDFDFFFCECECDFFBCBCBCFFACABABFFA8A7A7FFBCBBBBFFA0A0A0E01818
      1838000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E999999C2F6F6F6FFF5F5F6FFE9E9E9FFE0E0E1FFE1E1E1FFE1E1E1FFE1E1
      E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE0E0E1FFDFDF
      DFFFCACACAFFE2E2E2FFE6E6E6FFE8E8E7FFECECECFFC9C9C9EF353535600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E9A9A9AC2F7F7F8FFF6F6F7FFE8E8E9FFDFDFDFFFDFDFE0FFDFDFE0FFDFDF
      E0FFDFDFE0FFDFDFE0FFDFDFE0FFDFDFE0FFDFDFE0FFDFDFDFFFE1E1E2FFE8E8
      E8FFD3D3D3FFEEEEEDFFF0F0F0FFF1F1F0FFD8D8D8F749494978000000040000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E9B9B9BC2F8F8F9FFF8F8F8FFE9E9E9FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE1E1E1FFEAEA
      EBFFDADADAFFF0F0F0FFF3F3F3FFE3E3E3FB6060608E0101010A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E9C9C9CC2FAFAFAFFF9F9F9FFEFEFEFFFE7E7E8FFE8E8E8FFE8E8E8FFE8E8
      E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE5E5
      E5FFD8D8D8FFF5F5F4FFE6E6E6FB6A6A6A970404041000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E9C9C9CC2FBFBFBFFFAFAFBFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFBFBFBFFF3F3
      F3FFE4E4E4FFE7E7E6F96A6A6A94050505110000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010E9C9C9CC0FDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFDFFF1F1
      F1FFD4D4D4F3636362850404040D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00035959597DB6B6B6CFB6B6B6CEB6B6B6CEB6B6B6CEB6B6B6CEB6B6B6CEB6B6
      B6CEB6B6B6CEB6B6B6CEB6B6B6CEB6B6B6CEB6B6B6CEB6B6B6CEB3B3B3D19090
      90C13B3B3B5A0202020700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101080707071607070716070707160707071607070716070707160707
      0716070707160707071607070716070707160707071607070716070707180303
      0311000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202071818
      184A31313198404040C1474747DA4F4F4FF34F4F4FF3474747DA404040C13131
      31981818184A0202020700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000030000
      00070000000D00000011000000160000001B00000021000000270000002E0000
      00340000003B00000041000000480000004D0000004E0000004B000000460000
      004000000039000000320000002C00000026000000200000001A000000150000
      00100000000A00000005000000020000000000000000000000020000000B0000
      000E000000030000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000040000001D0000001B0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008080819313131974F4F4FF25252
      52FF515151FF505050FF505050FF4F4F4FFF4F4F4FFF505050FF505050FF5151
      51FF525252FF4F4F4FF231313197080808190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0003000000080000000D0000001100000016000000190000001D000000210000
      002400000026000000280000002A0000002B0000002B0000002B0000002A0000
      00280000002600000024000000210000001D0000001900000016000000110000
      000D0000000800000003000000000000000000000006030303210D0D0D5E1111
      116D060606380000000D00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000010000000F0000
      0012000000040201011C291F1D8A251D1A80010100140000000D000000100000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000000000000020202082B2B2B84515151F5535353FF505050FF4D4D
      4DFF484848FF444444FF424242FF414141FF414141FF424242FF444444FF4848
      48FF4D4D4DFF505050FF535353FF515151F52B2B2B8402020208000000000000
      0000000000000000000000000000000000000000000003030212070505200705
      0520070505200705052007050520070505200705052007050520070505200705
      0520070505200705052007050520070505200705052007050520070505200705
      0520070505200705052007050520070505200705052007050520070505200705
      0520070505200705052004030314000000000404043119191994434343E15151
      51E9262626BD0A0A0A500000000F000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000101010C211A196D2A20
      1F8C110D0C5E251C1B866F5751E6654F4ADA1711106D1D16157B231A187D0403
      031A000000000000000000000000000000000000000000000000000000000000
      00000000000008080818434343C8545454FF525252FF4C4C4CFF444444FF4F4F
      4FFF777777FFA3A3A3FFB9B9B9FFCCCCCCFFCDCDCDFFBCBCBCFFA7A7A7FF7B7B
      7BFF505050FF444444FF4C4C4CFF525252FF545454FF434343C8080808180000
      0000000000000000000000000000000000001A151377372E28FC372E28FF372E
      28FF382F29FF3B322CFF3F3630FF433A35FF463D38FF4B433DFF504842FF544D
      47FF57504BFF5B534EFF5E5752FF605A55FF625B56FF645D58FF655E59FF655E
      59FF655E59FF645E59FF635D58FF635D57FF625C56FF615955FF605955FF5F57
      52FF5D5651FF5F5853FF59524DFD26211E901D1D1D98545454EA858585FD8484
      84FE585858F7262626C609090955000000110000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000020302021752413FAE8569
      64F57B6763E4988581F1B09B97FDA99490FB806B67E779615CEF604B46CE0D09
      0931000000020000000100000000000000000000000000000000000000000000
      00000F0F0F2D4C4C4CE3545454FF505050FF494949FF474747FF969696FFD3D3
      D3FFDDDDDDFFE0E0E0FFE3E3E3FFE5E5E5FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0
      E0FFDDDDDDFF9E9E9EFF484848FF494949FF505050FF545454FF4C4C4CE30F0F
      0F2D00000000000000000000000000000000352E29E1605954FF9F9B98FFA09B
      99FFA19C99FFA29E9BFFA29E9BFFA39F9CFFA4A09EFFA6A29FFFA8A3A1FFA9A5
      A2FFABA7A5FFACA8A5FFADA9A6FFAFABA8FFB0ACA9FFB0ADAAFFB1AEABFFB2AF
      ACFFB2AFADFFB3B0ADFFB4B0AEFFB5B1AFFFB5B1AFFFB5B2AFFFB6B2B0FFB6B3
      B0FFB6B3B1FFB7B4B1FF8D8884FF514945F9404040D58F8F8FFCA3A3A3FF9696
      96FF808080FF545454F7262626CA0B0B0B5D0000001300000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003020216120E0E521C16156D705B59D0B69E
      9AFFC5B1ADFFC3AEABFFBEA9A5FFC0ABA6FFC2AEAAFFB8A29EFF826B67E5241C
      1B7E0F0C0B560504042500000001000000000000000000000000000000000808
      08184C4C4CE3545454FF4E4E4EFF444444FF636363FFC1C1C1FFDDDDDDFFE3E3
      E3FFE9E9E9FFEDEDEDFFEFEFEFFFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFEDED
      EDFFE9E9E9FFE3E3E3FFCECECEFF686868FF444444FF4E4E4EFF545454FF4C4C
      4CE308080818000000000000000000000000443D38EAB3AFADFFDEDDDCFFE0DE
      DDFFE1E0DFFFD7D6D5FFE4E3E2FFE5E4E3FFE7E6E5FFE9E8E7FFEAE9E8FFEBEB
      EAFFECECEBFFEDEDECFFEEEEEDFFE1E1E0FFEFEFEEFFF0EFEEFFF0EFEFFFEFEF
      EEFFEFEFEEFFEFEEEEFFEEEDEDFFEDEDECFFEDECECFFDFDEDEFFEBEAE9FFEBEA
      E9FFEAE9E8FFE9E8E7FFD0CDCCFF564F4AFF2F2F2FB4787878F7A3A3A3FF9D9D
      9DFF8D8D8DFF767676FF515151F9262626CE0A0A0A6100000014000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001915153C6D5A58CF836B68EAAE9793FABDA6
      A2FFB29792FFAB8E8AFFA98D88FFA88B87FFAB8E8AFFB49B97FFB09894FD8169
      64EC65504CDB251C1B6200000002000000000000000000000000020202084343
      43C8545454FF4E4E4EFF494949FF909090FFD4D4D4FFE0E0E0FFE8E8E8FFEEEE
      EEFFF2F2F2FFF5F5F5FFF8F8F8FFF9F9F9FFFAFAFAFFF9F9F9FFF8F8F8FFF5F5
      F5FFF2F2F2FFEEEEEEFFE8E8E8FFE0E0E0FF9C9C9CFF494949FF4E4E4EFF5454
      54FF434343C8020202080000000000000000443D38EAB5B2AFFFE0DEDDFFE1E0
      DFFFE2E1E0FF717472FFB2B2B0FFC6C5C4FFD9D9D9FFEBEAEAFFEDECEBFFEFEE
      EDFFEFEFEEFFF0F0EFFFF1F1F0FF8E9190FFD4D4D4FFF3F3F2FFF3F2F2FFF3F2
      F2FFF2F2F1FFF2F1F1FFF1F1F0FFF0EFEFFFEFEEEEFF8D8F8EFFD1D0D0FFEDEC
      EBFFEBEAEAFFEAE9E8FFD2D0CEFF574F4AFF0B0B0B4B313131B36F6F6FF69696
      96FF939393FF848484FF6E6E6EFF4D4D4DFA262626CF0C0C0C68000000150000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000110F0F2170605EB5B39793FFBBA19CFFB498
      94FFB59A96FFC0A6A3FFC7B0ADFFC2AAA6FFB39894FFAC8F8BFFB0948FFFAC8F
      8AFF79605DD51B151440000000000000000000000000000000002C2C2C845656
      56FF515151FF454545FF8F8F8FFFD4D4D4FFE2E2E2FFEBEBEBFFF1F1F1FFF6F6
      F6FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FF9C9C9CFF454545FF5151
      51FF565656FF2C2C2C840000000000000000443D38EAB6B2B0FFE1DFDEFFB0AF
      AEFF5D5D5DFF4C4C4CFF4B4B4BFF424242FF787877FFEDEDECFFEFEEEEFFF1F0
      F0FFF2F2F1FFF3F3F2FFF5F4F4FF8C8E8EFFD3D3D3FFF6F6F5FFF6F6F5FFF6F5
      F5FFF5F4F4FFF4F4F4FFF3F3F2FFF2F2F1FFF1F0F0FF8A8B8BFFCDCECEFFEEED
      EDFFEDECEBFFEBEAEAFFD2D0CFFF57504BFF0000000E07070742292929A65F5F
      5FF2898989FF8A8A8AFF797979FF666666FF474747FA252525D30B0B0B6B0000
      0018000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000A0A0808385C4E4CABB69995FCBDA09CFFBFA3
      9FFFC8AFACFEC2B2B1E09E9595B0B7A9A9D0C7B1AFFCB79B98FFB0948FFFAD90
      8BFF6C5855C60E0B0A430000000B000000000000000008080819535353F55353
      53FF4A4A4AFF626262FFCFCFCFFFE0E0E0FF919191FFE6E6E6FFF8F8F8FFFBFB
      FBFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FF686868FF4A4A
      4AFF535353FF535353F50808081900000000443D38EAADAAA8FF5C5B5BFF1B1B
      1BFF1B1B1BFF212121FF292929FF2D2D2DFF7A7A7AFFEFEEEEFFF1F0F0FFF3F3
      F2FFF5F4F4FFF6F6F6FFF7F7F6FF8D8F8FFFD5D6D6FFF9F9F9FFFAF9F9FFF9F9
      F8FFF8F7F7FFF6F6F6FFF5F5F4FFF4F4F3FFF3F2F2FF8A8C8CFFCECECEFFEEEE
      EDFFEDEDECFFEDECEBFFD3D1D0FF58504BFF0000000100000009060606372020
      2095535353EC7B7B7BFE808080FF717171FF5D5D5DFF424242FB222222D50C0C
      0C73020202190000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001210102C685958B5A7908CF2C1A5A1FFC8AEABFFCBB3
      AFFFBCA8A5EE5751506E1010101237343448AC9A98DEBFA6A2FFB89D9AFFB396
      92FF997F7BF45B4B48C013100F39000000000000000034343497575757FF5050
      50FF4A4A4AFFBBBBBBFFDDDDDDFFE8E8E8FF5D5D5DFF626262FFC3C3C3FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFCFCFCFFF4B4B
      4BFF505050FF575757FF3434349700000000443D38EAB3B0AEFF80807EFF4949
      49FF3A3A3AFF272727FF303030FF545454FF888888FFF0EFEFFFF1F1F0FFF4F3
      F3FFF5F5F5FFF8F7F7FFF9F9F9FF8E908FFFD8D9D9FFFDFDFDFFFCFCFCFFFBFB
      FBFFFAF9F9FFF8F7F7FFF7F6F6FFF5F4F4FFEBEAEAFF686868FF929292FFA4A4
      A4FFC2C1C1FFEDECEBFFD3D1D0FF58504BFF0000000000000000000000060404
      042D1C1C1C8A464646E36F6F6FFE757575FF676767FF555555FF333333FC1414
      14D90B0B0B760202021B00000002000000000000000000000000000000000000
      0003000000030000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000015131323786A69A2B8A4A1ECC8B0ADFFD5BFBDFFD7C1
      BFFFAA9592E92D2726620000001014111141907D7AD7C5ADAAFFC2A9A6FFB99E
      9AFFAD9390F6806E6BC41E1919380000000002020207555555F2555555FF4949
      49FF8F8F8FFFD3D3D3FFE3E3E3FFEEEEEEFF535353FF4A4A4AFF434343FF8080
      80FFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF686868FF4D4D4DFF424242FF4D4D4DFFF6F6F6FFEEEEEEFFE3E3E3FF9F9F
      9FFF494949FF555555FF555555F202020207443D38EAB6B2B0FFE1E0DFFFCDCC
      CBFF7B7B7BFF585858FF4B4B4BFF616161FF939392FFF0EFEFFFF2F1F0FFF4F3
      F3FFF5F5F5FFF7F7F6FFF9F9F9FF8E908FFFD8D9D9FFFDFDFDFFFCFCFCFFFBFB
      FBFFF9F9F9FFF8F7F7FFF6F6F5FFA1A0A0FF505050FF444444FF434343FF3B3B
      3BFF737272FFECEBEBFFD3D1D0FF58514CFF0000000000000000000000000000
      000403030327151515783D3D3DD9616161FD6B6B6BFF5E5E5EFF313131FF0A0A
      0AFD0D0D0DD90B0B0B7C0303031D000000060101010D030303240606063D0707
      074F080808550707074904040431030303180000000800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000080000
      000F000000060000000001010102100F0F1B7066659CC5B0ADFCDCCBC9FFE4D4
      D2FFC3ADAAFB6D5B57C931282690564745B6AF9895F7D7C3C1FFD2BDBBFFC1A8
      A5FF837270C1201C1B3802020205000000001A1A1A49595959FF525252FF5252
      52FFC4C4C4FFDDDDDDFFE9E9E9FFF2F2F2FF494949FF3F3F3FFF373737FF3232
      32FF434343FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF616161FF414141FF353535FF414141FFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF535353FF525252FF595959FF1A1A1A49443D38EAB5B2AFFFE1DFDEFFE2E1
      E0FFE4E3E2FF808382FFCECECEFFEAE9E9FFECEBEAFFEEEEEDFFF0EFEFFFF2F1
      F1FFF4F4F3FFF6F5F5FFF7F7F7FF8D8F8EFFD5D6D6FFF9F9F8FFF9F9F8FFF8F8
      F8FFF7F7F6FFECEBEBFF494949FF131313FF171717FF1B1B1BFF272727FF3131
      31FF737373FFECEBEAFFD3D1D0FF58514CFF0000000000000000000000000000
      0000000000030202021D1111116D323232CE565656FC565656FF202020FF0202
      02FF040404FD0D0D0DDD0E0E0E880A0A0A5B0C0C0C7F0C0C0CAA0C0C0CC30B0B
      0BCF0B0B0BD30B0B0BCB0D0D0DB90D0D0D980A0A0A6303030329000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040E0A0A4A1F17
      15830907063900000001000000000606061A706767A6CAB7B4FDD6C5C3FFEEE1
      E1FFE8DAD9FFCFBEBDFDBCACAAF7CABAB8FCDFD0CEFFE7D9D8FFE1D2D0FFD0BC
      B9FF82716FCA1411113B0000000000000000373737985A5A5AFF4F4F4FFF7676
      76FFCBCBCBFFE0E0E0FFEDEDEDFFF5F5F5FF404040FF343434FF2B2B2BFF2525
      25FF242424FF2A2A2AFF777777FFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5A5A5AFF373737FF272727FF373737FFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FF7E7E7EFF4F4F4FFF5A5A5AFF37373798443D38EAB4B1AEFFDFDEDDFFE1DF
      DEFFE3E2E1FF808281FFCCCCCCFFE8E7E6FFEAE9E9FFECEBEBFFEEEDEDFFF0EF
      EEFFF1F1F0FFF2F1F1FFF4F3F3FF8B8D8DFFD2D2D2FFF5F5F5FFF5F4F4FFF4F4
      F3FFF4F3F3FFF3F3F2FFB1B1B0FF5D5C5CFF454545FF2D2D2DFF2F2F2FFF5858
      58FF828282FFEAEAE9FFD2D0CFFF59514CFF0000000000000000000000000000
      00000000000000000002010101170D0D0D5E2B2B2BC2323232F90C0C0CFF0000
      00FF000000FF040404FE0C0C0CE70F0F0FD20A0A0AE7060606FA040404FF0404
      04FF040404FF040404FF050505FF080808F40C0C0CD60D0D0DA10808084D0000
      000F000000000000000000000000000000000000000000000000000000000000
      00000000000203020222090606400101011B0000000B0201012640312EA97459
      53F52F242189000000120100001923201F65A9A09FD9CEC3C2ECC8B7B5FBDED0
      CFFFF3E9E8FFF5EBEBFFF5EBEBFFF5EBEBFFF3E9E9FFEEE2E1FFE7DBDAFDD1C3
      C2F0A99996E03C3635600000000100000000464646C15A5A5AFF4C4C4CFF9898
      98FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FF3A3A3AFF2C2C2CFF202020FF1818
      18FF171717FF1F1F1FFF2B2B2BFF484848FFC2C2C2FFFFFFFFFFFFFFFFFFFFFF
      FFFF545454FF2E2E2EFF1A1A1AFF2E2E2EFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFA8A8A8FF4C4C4CFF5A5A5AFF464646C1443D38EAB3AFADFFDDDBDAFFDFDE
      DDFFE1DFDEFF7E8280FFCBCBCAFFE6E4E4FFE7E6E6FFE9E8E7FFEBEAE9FFECEB
      EAFFEDEDECFFEEEEEDFFEFEFEEFF8A8C8BFFCFCFCFFFF1F1F0FFF1F0F0FFF1F0
      F0FFF1F0EFFFF0EFEFFFEFEEEEFFEDEDECFF989897FF5F6060FF585858FF6968
      68FF969594FFE9E8E7FFD1CFCDFF59524DFF0000000000000000000000000000
      00000000000000000000000000000000001109090955151515B60B0B0BF60101
      01FF000000FF000000FF020202FF040404FF030303FF040404F9040404D30202
      02B2010101A6020202B2020202D2010101F3030303FF090909F40F0F0FC00909
      0960010101110000000000000000000000000000000000000000000000000000
      00000202020E2E24238255423ECE281F1D8E1C151479342826A5705853E79172
      6AFF5A4541D01A13127C231A198B54423FD3625654B3524F4F69A39998C8CCBB
      B8FFD5C6C4FFE6DAD9FFEDE2E1FFEDE3E3FFEBE0DFFFEADFDDFFC5BCBCE05E59
      5974423E3E54181616200000000000000000515151DA5B5B5BFF4B4B4BFFA8A8
      A8FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FF363636FF272727FF181818FF0C0C
      0CFF0B0B0BFF171717FF252525FF343434FF434343FF8D8D8DFFF2F2F2FFFFFF
      FFFF505050FF282828FF0C0C0CFF282828FFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFBDBDBDFF4B4B4BFF5B5B5BFF515151DA443D38EAB1ADABFFDAD9D8FFDCDA
      D9FFDDDCDBFF7D817EFFC8C8C7FFE3E1E0FFE4E3E2FFE6E5E4FFE7E6E5FFE9E8
      E7FFEAE9E8FFEBEAE9FFECEBEAFF888A8AFFCCCCCCFFEDECECFFEDEDECFFEDEC
      ECFFEDECEBFFEDECEBFFECEBEAFFEBEAEAFFEBEAEAFF888989FFC9C9C8FFE8E7
      E6FFE7E6E6FFE6E5E5FFCFCDCCFF59524DFF0000000000000000000000000000
      0000000000000000000000000000000000010000000D060606480D0D0DA90B0B
      0BF0020202FE000000FF000000FF040404FF060606C2040404780202024C0202
      0233060606320D0D0D471212126D1111119C080808CD010101F8060606FB0E0E
      0EC9090909540000000B00000000000000000000000000000000000000000000
      0000030202104B3D3A9E93746EFF856A65F58F7874F4AB9692FCBCA9A5FFBEAA
      A7FFAD9994FD8A7370F37E645EF4886A63FD3A2C299505040419817C7C9EE3DA
      DAF8BEB3B1E4C3B5B3F1D5C8C6FFD4C8C6F8CBC2C0E5E1DADAF3ACA5A5CA1817
      1729000000000000000000000000000000005C5C5CF35C5C5CFF4A4A4AFFB4B4
      B4FFD5D5D5FFE6E6E6FFF1F1F1FFFAFAFAFF353535FF262626FF161616FF0707
      07FF060606FF151515FF242424FF333333FF434343FF525252FF6E6E6EFFCCCC
      CCFF4F4F4FFF252525FF000000FF252525FFFDFDFDFFFAFAFAFFF1F1F1FFE6E6
      E6FFCDCDCDFF4A4A4AFF5C5C5CFF5C5C5CF3443D38EAAFACA9FFD8D6D5FFDAD8
      D7FFDAD9D8FF7C807DFFC6C5C4FFE0DEDDFFE1DFDEFFE3E1E0FFE4E2E2FFE5E3
      E3FFE6E5E4FFE7E6E5FFE8E7E6FF878989FFC9C9C8FFE9E8E8FFE9E8E8FFE9E8
      E7FFE9E8E8FFE9E8E7FFE9E8E7FFE8E7E7FFE8E7E6FF878888FFC7C7C7FFE6E5
      E4FFE5E4E3FFE4E3E2FFCECCCAFF59524DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000009060606491212
      12CA060606FC000000FF060606FC070707A60303034200000007020202020808
      080D141414201F1F1F342B2B2B49303030622A2A2A8C161616C8090909F60D0D
      0DFA101010B505050535000000050000000000000000000000020201011B0302
      022B0706063A50413EB1A48984FEC3AFABFFDFD2CFFFEBE0DFFFEDE2E1FFEDE2
      E1FFEBDFDEFFDFD2D0FFC2AEABFF9E827DFE463633AF0806063D575555888785
      85A44342424C726F6F84E0DADBF2A6A2A2B94342424E706E6E7B7A7777881212
      1219000000000000000000000000000000005D5D5DF35D5D5DFF4B4B4BFFB4B4
      B4FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FF373737FF2C2C2CFF2A2A2AFF2A2A
      2AFF313131FF3F3F3FFF4D4D4DFF5B5B5BFF636363FF676767FF7B7B7BFFCECE
      CEFF535353FF2A2A2AFF0C0C0CFF282828FFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFCCCCCCFF4B4B4BFF5D5D5DFF5D5D5DF3443D38EAADA9A7FFD5D3D2FFD6D4
      D3FFD7D5D4FF7B7E7CFFC3C3C2FFDCDAD9FFDDDBDAFFDFDDDCFFE0DFDEFFE1E0
      DFFFE2E1E0FFE3E2E1FFE3E2E1FF868787FFC6C6C5FFE5E4E3FFE6E4E4FFE6E5
      E4FFE5E4E4FFE6E5E4FFE7E6E6FFE7E6E5FFE6E5E4FF868888FFC7C7C7FFE5E4
      E4FFE5E4E3FFE4E3E2FFCECCCBFF5A524DFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000030505053B1111
      11CA050505FC040404FC090909B10202022A00000000030303060C0C0C161717
      17292525253F313131523F3F3F654B4B4B7554545485484848A02F2F2FD82525
      25FB232323F01212128002020214000000010000000002020210332928845443
      41C2564544C498807CF1CEBBB7FFE4D5D4FFEADADAFFEAD9D8FFE9D7D7FFE9D7
      D7FFEAD8D8FFEBDBDBFFE6D7D7FFCEBBB8FF8E7672F0483835BF4B3B39C33027
      26840000000A1B1B1B21807E7E894646464F00000001060606080A0A0A0C0000
      000100000000000000000000000000000000555555DA5F5F5FFF4E4E4EFFA8A8
      A8FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FF636363FF757575FF6D6D6DFF6363
      63FF5D5D5DFF5C5C5CFF5D5D5DFF626262FF686868FFA0A0A0FFF4F4F4FFFFFF
      FFFF5D5D5DFF353535FF1C1C1CFF2E2E2EFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFBABABAFF4E4E4EFF5F5F5FFF555555DA443D38EAABA7A4FFD1CFCDFFD3D1
      CFFFD4D2D1FF7A7C7BFFC0BFBEFFD8D6D5FFD9D8D6FFDBDAD8FFDCDBDAFFDDDC
      DBFFDEDCDBFFDFDDDDFFDBDAD9FF636464FF898989FF9B9B9AFFBAB9B8FFE2E1
      E0FFE2E0DFFFE2E1E0FFE5E3E2FFE6E4E3FFE5E4E3FF868888FFC7C7C7FFE6E5
      E4FFE6E5E4FFE5E4E3FFD0CECDFF5A534EFF0000000000000000000000000000
      000000000000000000000000000000000000000000010000000E0A0A0A700C0C
      0CEC020202FD0A0A0ADF0303033B010101030606060B0F0F0F1C1C1C1C312929
      2945363636594242426A4F4F4F7C5D5D5D8D6969699B727272A7656565C24E4E
      4EF0434343FB252525C805050532000000040000000008070717675552B0A386
      82FEA88C88FFC4ADAAFFD9C6C4FFE0CDCCFFE7D4D4FFE8D6D6FFE8D6D6FFE8D6
      D6FFE8D6D6FFE7D5D5FFE2CFCEFFDBC8C7FFC3ACA9FF9B7F7AFE90716BFD4D3C
      39A30403020F010101020A0A0A0C050505060000000000000000000000000000
      0000000000000000000000000000000000004C4C4CC1626262FF525252FF9A9A
      9AFFCBCBCBFFE2E2E2FFF2F2F2FFF9F9F9FF8D8D8DFF818181FF757575FF6C6C
      6CFF666666FF646464FF656565FF747474FFCFCFCFFFFFFFFFFFFFFFFFFFFFFF
      FFFF616161FF3E3E3EFF292929FF373737FFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FFA6A6A6FF525252FF626262FF4C4C4CC1443D38EAA8A4A1FFCECCCAFFCFCC
      CBFFD0CECDFF797B7AFFBDBCBBFFD5D3D2FFD8D6D5FFDAD8D7FFD9D7D6FFD9D7
      D6FFDAD9D8FF999897FF515151FF464646FF464646FF3D3D3DFF6D6C6BFFDEDC
      DCFFDEDDDCFFDEDDDCFFDEDDDCFFE3E3E2FFE4E3E2FF868888FFC9C8C7FFE7E6
      E6FFE6E5E5FFE6E5E4FFD3D1D0FF5B534EFF0000000000000000000000000000
      000000000000000000000000000000000000000000010101011F0F0F0FAA0707
      07FA050505F90A0A0A980202020B0808080F13131323202020372C2C2C4B3A3A
      3A5F4747477153535381616161926E6E6EA17B7B7BAF878787BA8C8C8CC87373
      73E55E5E5EFB3C3C3CEB0C0C0C5C0000000A0000000001010103312B2A51927E
      7ADCBB9F9BFFCBB3B0FFD4BDBBFFDEC9C8FFE6D4D3FFE8D6D6FFE8D6D6FFE8D6
      D6FFE8D6D6FFE7D4D4FFDFCCCBFFD5BFBDFFCCB5B2FFB39793FF7D6460DC221B
      1A4F000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D3D3D98656565FF595959FF7979
      79FFCCCCCCFFEDEDEDFFF3F3F3FFF7F7F7FF939393FF878787FF7D7D7DFF7575
      75FF707070FF6D6D6DFF9E9E9EFFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF686868FF484848FF373737FF414141FFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF7D7D7DFF595959FF656565FF3D3D3D98443D38EABAB6B4FFD8D7D6FFD8D6
      D5FFD6D5D3FF7B7D7CFFC2C2C1FFDBDAD8FFDDDBDAFFDEDCDBFFDEDDDBFFD0CE
      CDFF484848FF151515FF171717FF1C1C1CFF282828FF323232FF6C6B6BFFDAD9
      D7FFDBD9D8FFDBD9D8FFDBD9D8FFDDDBDAFFE3E2E1FF878888FFC8C9C9FFE9E7
      E7FFE8E7E6FFE7E6E5FFD5D4D3FF5B534EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000204040431101010CF0303
      03FD090909F2090909520B0B0B17171717282424243E313131523E3E3E654B4B
      4B765858588764646496727272A57F7F7FB38B8B8BBF989898CAA4A4A4D59696
      96E6737373FC505050F6161616850101011400000003000000101713134A8873
      6FD5BFA29DFFC8ADA9FFD1B9B6FFDBC4C2FFE1CDCCFFDCCCCCF3B9ADADCAB7AC
      ACC9DACAC9F2E0CCCBFFDAC5C4FFD1BAB8FFC7AEABFFB89C97FF755F5CD00F0C
      0C3E000000080000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1E1E49686868FF606060FF5C5C
      5CFFBCBCBCFFE6E6E6FFEFEFEFFFF5F5F5FF999999FF8F8F8FFF868686FF7E7E
      7EFF858585FFD2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF6E6E6EFF535353FF434343FF4D4D4DFFF6F6F6FFEEEEEEFFE3E3E3FFD3D3
      D3FF5C5C5CFF606060FF686868FF1E1E1E49443D38EABEBBB9FFDDDBDBFFDFDE
      DDFFE0DFDEFF7D8180FFC6C6C4FFDDDBDAFFDCDAD9FFDDDCDAFFDEDDDCFFE0DE
      DDFF999797FF535252FF434343FF2B2B2BFF2F2F2FFF575757FF797878FFD6D4
      D3FFD7D5D4FFD7D6D4FFD7D5D4FFD7D5D4FFDDDCDBFF868888FFCACACAFFEAE9
      E8FFE9E8E8FFE8E7E6FFD8D6D6FF5B544FFF0000000000000000000000000000
      00000000000000000000000000000000000000000003050505430E0E0EDF0202
      02FD0F0F0FEF1010103F1C1C1C3128282844353535584242426A4F4F4F7C5B5B
      5B8C6969699B767676AA838383B78F8F8FC29C9C9CCEA9A9A9D7B6B6B6E0B4B4
      B4EC8A8A8AFC606060F91D1D1DA10202021D0706061B342D2C7C6D5D5AC7AD93
      8FF6BEA09CFFC5AAA6FFCEB5B2FFD3BCB9FFCAB7B5F377706F8B201F1F24201F
      1F2477706F8EC9B4B3F5D0B9B7FFCBB3B1FFC1A7A4FFB89B97FF977D78F24A3C
      3AB31A1514600201010E00000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020207666666F2666666FF5757
      57FF939393FFD4D4D4FFECECECFFF2F2F2FFA0A0A0FF979797FF8F8F8FFFB0B0
      B0FFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF707070FF646464FF5B5B5BFF656565FFF1F1F1FFE8E8E8FFDDDDDDFF9B9B
      9BFF575757FF666666FF666666F202020207443D38EAC2BFBDFFDFDEDDFFE1E0
      DFFFE2E1E0FF808281FFCBCCCCFFE7E6E5FFE7E6E5FFE4E3E2FFE1E0DFFFDFDE
      DCFFE0DFDEFFDAD9D8FF838282FF5D5E5EFF525151FF626262FF8B8988FFD3D1
      CFFFD3D1D0FFD4D2D0FFD4D2D0FFD4D2D1FFD4D2D1FF838484FFCACAC9FFEBEA
      EAFFEAE9E9FFEAE8E8FFDBD9D8FF5B544FFF0000000000000000000000000000
      00000000000000000000000000000000000000000004050505480E0E0EE30202
      02FE161616F01F1F1F4C2D2D2D4B3939395E4646467053535381606060916C6C
      6CA07A7A7AAE868686BA949494C6A0A0A0D1ADADADDABBBBBBE3C7C7C7EAC9C9
      C9F29C9C9CFD696969F9202020A90404041F1815142F887674C7C2A9A6FFC4AA
      A6FFBDA29DFFC4ABA7FFCDB5B2FFCBB4B0FFA3908ED92522223B000000000000
      000029262643A69491E1C5ADAAFFC4ABA8FFBAA09DFFB49793FFAF938EFFA085
      81FD61504DB50A08081D00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000414141976C6C6CFF6464
      64FF585858FFB2B2B2FFE3E3E3FFEDEDEDFFA1A1A1FFA4A4A4FFD9D9D9FFFCFC
      FCFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FFC2C2C2FF5858
      58FF646464FF6C6C6CFF4141419700000000443D38EAC6C3C1FFE1E0DFFFE3E2
      E1FFE5E4E3FF808382FFCECECDFFE9E8E7FFEAE9E9FFEBEAEAFFECEBEAFFEBEB
      EAFFE7E6E5FFE2E2E1FFE1E0DFFF818282FFB3B2B1FFCECCCBFFCFCDCBFFCFCD
      CCFFCFCDCCFFD0CECDFFD0CECCFFD1CECDFFD1CFCDFF7E8080FFBEBDBCFFECEB
      EBFFECEBEAFFECEBEAFFDDDCDBFF5C544FFF0000000000000000000000000000
      00000000000000000000000000000000000000000003050505410F0F0FDF0303
      03FE191919F42F2F2F6B3E3E3E644B4B4B765858588764646496717171A57E7E
      7EB28B8B8BBF989898CAA5A5A5D4B1B1B1DDBFBFBFE5CBCBCBECD9D9D9F2D8D8
      D8F8A6A6A6FE6F6F6FF91F1F1FA00303031C0C0A0A134E47466B928482BDC1AC
      A8F6BDA39EFFC4ACA8FFCCB5B1FFC7AFABFF9C8682E5282221600000000F0000
      00112D27266A9F8885EBC3AAA7FFC2AAA7FFB39894FFB0938EFFAD9490F68877
      74C6483E3D710605050E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0B0B196C6C6CF56C6C
      6CFF606060FF6D6D6DFFC7C7C7FFE5E5E5FFBABABAFFEBEBEBFFF6F6F6FFF9F9
      F9FFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FFD4D4D4FF6E6E6EFF6060
      60FF6C6C6CFF6C6C6CF50B0B0B1900000000443D38EAC9C7C5FFE4E3E2FFE5E5
      E3FFE7E6E5FF818483FFD1D1D0FFEBEBEAFFECECEBFFEEEDECFFEEEDEDFFEFEE
      EEFFEFEFEEFFF0EFEFFFEDEBEBFF878A88FFC1C0BFFFCFCDCCFFCBC9C7FFCCC9
      C8FFCCC9C8FFCCCAC8FFCDCBC9FFCDCBC9FFCECCCAFF7D807DFFB4B3B0FFD8D6
      D5FFECEAEAFFEDEDECFFE0DEDDFF5C5550FF0000000000000000000000000000
      0000000000000000000000000000000000000000000205050534101010CF0404
      04FD171717F93C3C3C9A4F4F4F7D5B5B5B8C6868689B757575A9828282B78F8F
      8FC29C9C9CCDA9A9A9D7B6B6B6E0C2C2C2E7D0D0D0EEDDDDDDF4E9E9E9F8DCDC
      DCFCA7A7A7FE6A6A6AF5181818850101011400000000030202052A27263EA697
      95D5BDA4A0FFC3ABA7FFCBB5B2FFCAB3AFFFB09692FC6B5855CB261F1D832920
      1F86705D5AD0AF9591FDC8B2AFFFC9B3AFFFB69B97FFB0948FFF927E7BD22622
      22400505050A0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003B3B3B847272
      72FF6B6B6BFF5B5B5BFF929292FFC9C9C9FFE4E4E4FFEBEBEBFFF0F0F0FFF3F3
      F3FFF6F6F6FFF8F8F8FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFF9F9F9FFF6F6
      F6FFF3F3F3FFEFEFEFFFE8E8E8FFE0E0E0FFD4D4D4FF969696FF5B5B5BFF6B6B
      6BFF727272FF3B3B3B840000000000000000443D38EACCCAC9FFE6E5E4FFE7E7
      E6FFE9E8E7FFC7C7C6FFE9E8E8FFEEEDECFFEFEEEEFFEFEFEEFFF1F0EFFFF1F0
      F0FFF1F1F1FFF2F2F1FFF3F2F2FFCFCFCEFFECECECFFECEBEAFFD9D8D7FFC8C6
      C4FFC7C5C3FFC7C5C4FFC7C5C4FFC8C6C5FFC8C6C4FFAEADAAFFC5C4C2FFC9C7
      C5FFCCCAC8FFE4E2E2FFE2E0E0FF5C5550FF0000000000000000000000000000
      00000000000000000000000000000000000000000001020202200E0E0EAB0606
      06F90D0D0DFC3F3F3FCE5F5F5F966C6C6C9F797979AD878787BB939393C6A0A0
      A0D0ADADADDABABABAE2C8C8C8EAD3D3D3F0E0E0E0F5EDEDEDF9F2F2F2FCD2D2
      D2FEA1A1A1FD555555EA0F0F0F5D0000000900000000000000021715153C9A8F
      8DCEC3AEAAFFBDA6A1FFCBB7B2FFCEBAB6FFC8B3AFFFBBA5A1FEA5918DF6A793
      8FF7BDA8A4FEC8B3AFFFCEBAB7FFCCB7B3FFC5AEAAFFC0A7A4FF837271CC1210
      103B000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303085B5B
      5BC8727272FF6A6A6AFF5F5F5FFF929292FFC7C7C7FFDFDFDFFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF1F1F1FFEFEF
      EFFFEAEAEAFFE4E4E4FFDDDDDDFFCFCFCFFF959595FF5F5F5FFF6A6A6AFF7272
      72FF5B5B5BC80303030800000000000000003C332FE9908E8BFFD0D0CFFFD3D3
      D3FFD5D5D5FFD7D7D6FFD9D9D9FFDBDBDAFFDCDCDCFFDEDDDDFFDFDFDEFFE0E0
      DFFFE1E1E1FFE2E1E1FFE2E2E2FFE3E3E2FFE3E3E3FFE3E3E3FFE2E2E1FFD3D3
      D3FFA4A3A3FF939291FF919090FF919090FF919090FF929190FF91908FFF9190
      8FFF919090FF91908FFF888686FF5D5651FF0000000000000000000000000000
      000000000000000000000000000000000000000000010000000F0B0B0B720B0B
      0BEC040404FE2C2C2CF3646464B57D7D7DB28A8A8ABE979797C9A4A4A4D4B1B1
      B1DCBEBEBEE5CBCBCBECD8D8D8F2E5E5E5F7F1F1F1FBF7F7F7FCE9E9E9FEC0C0
      C0FF8E8E8EF9383838C80606063400000003000000000404040D5E58578ED1C4
      C3F6D8C8C5FFB8A29DFFC4B0ACFFD0BDB9FFD2BFBCFFD3C2BFFFD6C6C3FFD7C8
      C4FFD4C4C1FFD2BFBCFFCFBCB9FFCDBAB6FFD5C3C0FFD7C5C3FFB29C9AF75449
      4896050404100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0B186A6A6AE3757575FF6D6D6DFF5F5F5FFF717171FFB2B2B2FFD0D0D0FFE0E0
      E0FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFE9E9E9FFE6E6E6FFE3E3
      E3FFDFDFDFFFD4D4D4FFBCBCBCFF717171FF5F5F5FFF6D6D6DFF757575FF6A6A
      6AE30B0B0B18000000000000000000000000322A25E8352C26FF302823FF3028
      23FF322A25FF342C27FF362E29FF37302BFF39322DFF3B342FFF3D3630FF3F37
      33FF413A35FF433C36FF443D39FF46403BFF48423DFF4A433FFF4C4541FF4E47
      43FF504944FF504A46FF423B36FF302923FF302823FF302823FF302823FF3028
      23FF302823FF302823FF332A25FF3D342EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000002040404340F0F
      0FC1060606FB0E0E0EFE484848E6808080C99B9B9BCDA9A9A9D7B6B6B6E0C3C3
      C3E8D0D0D0EEDCDCDCF3EAEAEAF9F3F3F3FBF8F8F8FDF0F0F0FECECECEFEAAAA
      AAFE656565EF1919198301010115000000010000000005050509716B6B86C9C0
      BFDEC0B7B7D6C4B5B2F6B6A19CFFC6B2AEFFD1C0BCFFD3C3BFFFD4C4C1FFD4C4
      C0FFD3C3BFFFD2C1BEFFD0BFBBFFD7C8C4FFDBCFCDF5BBB2B0D7B4A4A2DF695F
      5E900706060D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001515152D6C6C6CE3777777FF717171FF676767FF5F5F5FFF959595FFBCBC
      BCFFCBCBCBFFD3D3D3FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD3D3D3FFCDCD
      CDFFC4C4C4FF959595FF5F5F5FFF676767FF717171FF777777FF6C6C6CE31515
      152D00000000000000000000000000000000322A25E8372E28FF372E28FF382F
      29FF3A312BFF3C342EFF3E3630FF413832FF423A34FF453C37FF473F39FF4941
      3BFF4B433EFF4E4640FF4F4842FF524A45FF544C47FF564E49FF58514CFF5A53
      4EFF5C5550FF5E5752FF615A55FF5A534EFF3F3630FF372E28FF372E28FF2E27
      22FF362D27FF2E2722FF352D27FF372E28FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000010000000F0B0B
      0B6C0E0E0EE2030303FD151515FE525252EA929292DDB3B3B3E1C5C5C5E9D2D2
      D2F0DFDFDFF5ECECECF9F4F4F4FCF5F5F5FDE9E9E9FDCFCFCFFEB3B3B3FF8585
      85F8323232BA06060634000000050000000000000000000000001919181F3432
      323D3230303D958E8EAFCBBBB9FDB8A39EFFBDA9A5FFC9B7B3FFCFBFBBFFD0C0
      BCFFCFBFBBFFCFBFBBFFD8C9C6FFE2D7D5FD908B8AAD2E2B2B3C322F2F3F1918
      1822000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0B18616161C87B7B7BFF787878FF707070FF656565FF6767
      67FF818181FF9D9D9DFFAAAAAAFFB5B5B5FFB5B5B5FFAAAAAAFF9D9D9DFF8181
      81FF676767FF656565FF707070FF787878FF7B7B7BFF616161C80B0B0B180000
      000000000000000000000000000000000000322A25E8372E28FF372E28FF3930
      2AFF3A322CFF3D342EFF3F3630FF413833FF433B35FF453D37FF473F3AFF4A42
      3CFF4C443EFF4E4641FF504843FF524A45FF544D48FF564F4AFF59514CFF5B53
      4EFF5D5651FF5F5853FF615A55FF635C58FF645D58FF4A423DFF2D2722FF4C4C
      4CFF28221FFF313131FF24211FFF372E28FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020303
      03200D0D0D8F0C0C0CE9030303FD0F0F0FFE505050F6979797EDBABABAF0CFCF
      CFF5DDDDDDF9E3E3E3FBDFDFDFFCD1D1D1FCC0C0C0FEAEAEAEFE868686F83F3F
      3FCF0C0C0C540000000C00000000000000000000000000000000000000000000
      000000000005605C5C7FEAE1E1FBDDD3D2FBC4B5B2F9C2B0ADFFC2B1ADFFC7B7
      B3FFD0C2BFFFD6CCCAF9E9E0DFFBE8E0DFFC615E5D8800000008000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000004040408424242847B7B7BF57D7D7DFF797979FF7474
      74FF6D6D6DFF676767FF646464FF626262FF626262FF646464FF676767FF6D6D
      6DFF747474FF797979FF7D7D7DFF7B7B7BF54242428404040408000000000000
      000000000000000000000000000000000000403A36C4473F39FF413832FF433A
      34FF453C37FF473F3AFF4C443FFF514A44FF564F4AFF5A534EFF5E5752FF625B
      56FF655F5AFF68615DFF6C6561FF6D6663FF706964FF716B66FF736D68FF736D
      69FF736D69FF746E6AFF736E6AFF746E69FF736D6AFF736E6AFF5F5854FF2621
      1EFF3C332EFF2A2420FF3A342FFF423C37D90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00050303032C0D0D0D910D0D0DE4070707FA212121FE666666FE8A8A8AFB9C9C
      9CFAAAAAAAFBAFAFAFFCAEAEAEFEABABABFFA0A0A0FC767676F4373737C90D0D
      0D5E000000130000000100000000000000000000000000000000000000000000
      00000202020665636377DED9D9E99F9C9CAB726F6F7FA09A9AB6DFD8D7F7E8E0
      DFFCADA8A7C1726F6F7F9B9797A9DDD7D7EC736F6F8A0505050B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C194D4D4D977B7B7BF28080
      80FF7E7E7EFF7C7C7CFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7C7C7CFF7E7E
      7EFF808080FF7B7B7BF24D4D4D970C0C0C190000000000000000000000000000
      0000000000000000000000000000000000000A090827585452AB696563BE6A66
      63BE6A6764BF6B6764BF6B6765BF6C6966C06D6966C06D6967C06D6967C06E6A
      67C06F6B69C06F6B69C0706B69C1706C6AC1706D6AC2716D6BC2726D6BC2726E
      6CC2726F6CC2736F6DC2736F6DC274706EC375716EC375716FC375726FC4716D
      6BC2696563BE696563BE5C5854AF0A09082E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000003010101220A0A0A70101010C5171717ED464646F96B6B6BFC7979
      79FE818181FE868686FD818181FC717171F54E4E4EE2232323A4090909450000
      0010000000010000000000000000000000000000000000000000000000000000
      0000000000001919191D4846464F1E1D1D230303030429282834C4C0C0D2DAD7
      D7E5403F3F4D030203041B1B1B214C4A4B56201F1F2600000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303072626
      264A4F4F4F98656565C1727272DA7F7F7FF37F7F7FF3727272DA656565C14F4F
      4F982626264A0303030700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000002000000130606063C0E0E0E831E1E1EC2323232E43C3C
      3CF13E3E3EF33B3B3BEC303030D9222222AB0E0E0E6204040426000000080000
      0001000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000909090D6261616A7271
      717A131313180000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202071818
      184A31313198404040C1474747DA4F4F4FF34F4F4FF3474747DA404040C13131
      31981818184A0202020700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606073B3B
      3B4A5A5A5A985E5E5EC15B5B5BDA565656F3565656F35B5B5BDA5E5E5EC15A5A
      5A983B3B3B4A0606060700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606073B3B
      3B4A5A5A5A985E5E5EC15B5B5BDA565656F3565656F35B5B5BDA5E5E5EC15A5A
      5A983B3B3B4A0606060700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202071818
      184A31313198404040C1474747DA4F4F4FF34F4F4FF3474747DA404040C13131
      31981818184A0202020700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008080819313131974F4F4FF25252
      52FF515151FF505050FF505050FF4F4F4FFF4F4F4FFF505050FF505050FF5151
      51FF525252FF4F4F4FF231313197080808190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000171717195A5A5A97565656F25151
      51FF505050FF4F4F4FFF4F4F4FFF4E4E4EFF4E4E4EFF4F4F4FFF4F4F4FFF5050
      50FF515151FF565656F25A5A5A97171717190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000171717195A5A5A97565656F25151
      51FF505050FF4F4F4FFF4F4F4FFF4E4E4EFF4E4E4EFF4F4F4FFF4F4F4FFF5050
      50FF515151FF565656F25A5A5A97171717190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008080819313131974F4F4FF25252
      52FF515151FF505050FF505050FF4F4F4FFF4F4F4FFF505050FF505050FF5151
      51FF525252FF4F4F4FF231313197080808190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000020202082B2B2B84515151F5535353FF505050FF4D4D
      4DFF484848FF444444FF424242FF414141FF414141FF424242FF444444FF4848
      48FF4D4D4DFF505050FF535353FF515151F52B2B2B8402020208000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070856565684575757F5525252FF4F4F4FFF4C4C
      4CFF474747FF434343FF414141FF404040FF404040FF414141FF434343FF4747
      47FF4C4C4CFF4F4F4FFF525252FF575757F55656568407070708000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070856565684575757F5525252FF4F4F4FFF4C4C
      4CFF474747FF434343FF414141FF404040FF404040FF414141FF434343FF4747
      47FF4C4C4CFF4F4F4FFF525252FF575757F55656568407070708000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000020202082B2B2B84515151F5535353FF505050FF4D4D
      4DFF484848FF444444FF424242FF414141FF414141FF424242FF444444FF4848
      48FF4D4D4DFF505050FF535353FF515151F52B2B2B8402020208000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008080818434343C8545454FF525252FF4C4C4CFF444444FF4F4F
      4FFF777777FFA3A3A3FFB9B9B9FFCCCCCCFFCDCDCDFFBCBCBCFFA7A7A7FF7B7B
      7BFF505050FF444444FF4C4C4CFF525252FF545454FF434343C8080808180000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000161616185F5F5FC8535353FF515151FF4B4B4BFF434343FF4E4E
      4EFF767676FFA3A3A3FFB9B9B9FFCCCCCCFFCDCDCDFFBCBCBCFFA7A7A7FF7A7A
      7AFF4F4F4FFF434343FF4B4B4BFF515151FF535353FF5F5F5FC8161616180000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000161616185F5F5FC8535353FF515151FF4B4B4BFF434343FF4E4E
      4EFF767676FFA3A3A3FFB9B9B9FFCCCCCCFFCDCDCDFFBCBCBCFFA7A7A7FF7A7A
      7AFF4F4F4FFF434343FF4B4B4BFF515151FF535353FF5F5F5FC8161616180000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008080818434343C8545454FF525252FF4C4C4CFF444444FF4F4F
      4FFF777777FFA3A3A3FFB9B9B9FFCCCCCCFFCDCDCDFFBCBCBCFFA7A7A7FF7B7B
      7BFF505050FF444444FF4C4C4CFF525252FF545454FF434343C8080808180000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F0F2D4C4C4CE3545454FF505050FF494949FF474747FF969696FFD3D3
      D3FFDDDDDDFFE0E0E0FFE3E3E3FFE5E5E5FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0
      E0FFDDDDDDFF9E9E9EFF484848FF494949FF505050FF545454FF4C4C4CE30F0F
      0F2D000000000000000000000000000000000000000000000000000000000000
      00002727272D5C5C5CE3535353FF4F4F4FFF484848FF464646FF969696FFD3D3
      D3FFDDDDDDFFE0E0E0FFE3E3E3FFE5E5E5FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0
      E0FFDDDDDDFF9E9E9EFF474747FF484848FF4F4F4FFF535353FF5C5C5CE32727
      272D000000000000000000000000000000000000000000000000000000000000
      00002727272D5C5C5CE3535353FF4F4F4FFF484848FF464646FF969696FFD3D3
      D3FFDDDDDDFFE0E0E0FFE3E3E3FFE5E5E5FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0
      E0FFDDDDDDFF9E9E9EFF474747FF484848FF4F4F4FFF535353FF5C5C5CE32727
      272D000000000000000000000000000000000000000000000000000000000000
      00000F0F0F2D4C4C4CE3545454FF505050FF494949FF474747FF969696FFD3D3
      D3FFDDDDDDFFE0E0E0FFE3E3E3FFE5E5E5FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0
      E0FFDDDDDDFF9E9E9EFF484848FF494949FF505050FF545454FF4C4C4CE30F0F
      0F2D000000000000000000000000000000000000000000000000000000000808
      08184C4C4CE3545454FF4E4E4EFF444444FF636363FFC1C1C1FFDDDDDDFFE3E3
      E3FFE9E9E9FFEDEDEDFFEFEFEFFFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFEDED
      EDFFE9E9E9FFE3E3E3FFCECECEFF686868FF444444FF4E4E4EFF545454FF4C4C
      4CE3080808180000000000000000000000000000000000000000000000001616
      16185C5C5CE3535353FF4D4D4DFF434343FF626262FFC1C1C1FFDDDDDDFFE3E3
      E3FFE9E9E9FFEDEDEDFFEFEFEFFFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFEDED
      EDFFE9E9E9FFE3E3E3FFCECECEFF676767FF434343FF4D4D4DFF535353FF5C5C
      5CE3161616180000000000000000000000000000000000000000000000001616
      16185C5C5CE3535353FF4D4D4DFF434343FF626262FFC1C1C1FFDDDDDDFFE3E3
      E3FFE9E9E9FFEDEDEDFFEFEFEFFFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFEDED
      EDFFE9E9E9FFE3E3E3FFCECECEFF676767FF434343FF4D4D4DFF535353FF5C5C
      5CE3161616180000000000000000000000000000000000000000000000000808
      08184C4C4CE3545454FF4E4E4EFF444444FF636363FFC1C1C1FFDDDDDDFFE3E3
      E3FFE9E9E9FFEDEDEDFFEFEFEFFFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFEDED
      EDFFE9E9E9FFE3E3E3FFCECECEFF686868FF444444FF4E4E4EFF545454FF4C4C
      4CE3080808180000000000000000000000000000000000000000020202084343
      43C8545454FF4E4E4EFF494949FF909090FFD4D4D4FFE0E0E0FFE8E8E8FFEEEE
      EEFFF2F2F2FFF5F5F5FFF8F8F8FFF9F9F9FFFAFAFAFFF9F9F9FFF8F8F8FFF5F5
      F5FFF2F2F2FFEEEEEEFFE8E8E8FFE0E0E0FF9C9C9CFF494949FF4E4E4EFF5454
      54FF434343C80202020800000000000000000000000000000000070707085F5F
      5FC8535353FF4D4D4DFF484848FF909090FFD4D4D4FFE0E0E0FFE8E8E8FFEEEE
      EEFFF2F2F2FFF5F5F5FFF8F8F8FFF9F9F9FFFAFAFAFFF9F9F9FFF8F8F8FFF5F5
      F5FFF2F2F2FFEEEEEEFFE8E8E8FFE0E0E0FF9C9C9CFF484848FF4D4D4DFF5353
      53FF5F5F5FC80707070800000000000000000000000000000000070707085F5F
      5FC8535353FF4D4D4DFF484848FF909090FFD4D4D4FFE0E0E0FFE8E8E8FFEEEE
      EEFFF2F2F2FFF5F5F5FFF8F8F8FFF9F9F9FFFAFAFAFFF9F9F9FFF8F8F8FFF5F5
      F5FFF2F2F2FFEEEEEEFFE8E8E8FFE0E0E0FF9C9C9CFF484848FF4D4D4DFF5353
      53FF5F5F5FC80707070800000000000000000000000000000000020202084343
      43C8545454FF4E4E4EFF494949FF909090FFD4D4D4FFE0E0E0FFE8E8E8FFEEEE
      EEFFF2F2F2FFF5F5F5FFF8F8F8FFF9F9F9FFFAFAFAFFF9F9F9FFF8F8F8FFF5F5
      F5FFF2F2F2FFEEEEEEFFE8E8E8FFE0E0E0FF9C9C9CFF494949FF4E4E4EFF5454
      54FF434343C802020208000000000000000000000000000000002C2C2C845656
      56FF515151FF454545FF8F8F8FFFD4D4D4FFE2E2E2FFEBEBEBFFF1F1F1FFF6F6
      F6FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FF9C9C9CFF454545FF5151
      51FF565656FF2C2C2C8400000000000000000000000000000000565656845555
      55FF505050FF444444FF8F8F8FFFD4D4D4FFE2E2E2FFEBEBEBFFF1F1F1FFF6F6
      F6FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FF9C9C9CFF444444FF5050
      50FF555555FF5656568400000000000000000000000000000000565656845555
      55FF505050FF444444FF8F8F8FFFD4D4D4FFE2E2E2FFEBEBEBFFF1F1F1FFF6F6
      F6FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FF9C9C9CFF444444FF5050
      50FF555555FF56565684000000000000000000000000000000002C2C2C845656
      56FF515151FF454545FF8F8F8FFFD4D4D4FFE2E2E2FFEBEBEBFFF1F1F1FFF6F6
      F6FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FF9C9C9CFF454545FF5151
      51FF565656FF2C2C2C8400000000000000000000000008080819535353F55353
      53FF4A4A4AFF626262FFCFCFCFFFE0E0E0FFEBEBEBFFF2F2F2FFF8F8F8FFFBFB
      FBFF979797FFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FF686868FF4A4A
      4AFF535353FF535353F508080819000000000000000017171719595959F55252
      52FF494949FF616161FFCFCFCFFFE0E0E0FFEBEBEBFFF2F2F2FFF8F8F8FFFBFB
      FBFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FF676767FF4949
      49FF525252FF595959F517171719000000000000000017171719595959F55252
      52FF494949FF616161FFCFCFCFFFE0E0E0FFEBEBEBFFF2F2F2FFF8F8F8FFFBFB
      FBFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FF676767FF4949
      49FF525252FF595959F517171719000000000000000008080819535353F55353
      53FF4A4A4AFF626262FFCFCFCFFFE0E0E0FFEBEBEBFFF2F2F2FFF8F8F8FFFBFB
      FBFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFECECECFF939393FFEBEBEBFFE0E0E0FF686868FF4A4A
      4AFF535353FF535353F508080819000000000000000034343497575757FF5050
      50FF4A4A4AFFBBBBBBFFDDDDDDFFE8E8E8FFF1F1F1FFF8F8F8FFFCFCFCFFFEFE
      FEFF5D5D5DFF636363FFC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFCFCFCFFF4B4B
      4BFF505050FF575757FF3434349700000000000000005C5C5C97565656FF4F4F
      4FFF494949FFBBBBBBFFDDDDDDFFE8E8E8FFF1F1F1FFF8F8F8FFFCFCFCFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFCFCFCFFF4A4A
      4AFF4F4F4FFF565656FF5C5C5C9700000000000000005C5C5C97565656FF4F4F
      4FFF494949FFBBBBBBFFDDDDDDFFE8E8E8FFF1F1F1FFF8F8F8FFFCFCFCFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFCFCFCFFF4A4A
      4AFF4F4F4FFF565656FF5C5C5C97000000000000000034343497575757FF5050
      50FF4A4A4AFFBBBBBBFFDDDDDDFFE8E8E8FFF1F1F1FFF8F8F8FFFCFCFCFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC3C3C3FF5E5E5EFF555555FFF1F1F1FFE8E8E8FFCFCFCFFF4B4B
      4BFF505050FF575757FF343434970000000002020207555555F2555555FF4949
      49FF8F8F8FFFD3D3D3FFE3E3E3FFEEEEEEFFF6F6F6FFFBFBFBFFFEFEFEFFFFFF
      FFFF535353FF4A4A4AFF434343FF808080FFEFEFEFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FF9F9F
      9FFF494949FF555555FF555555F202020207060606075C5C5CF2545454FF4848
      48FF8F8F8FFFD3D3D3FFE3E3E3FFEEEEEEFFF6F6F6FFFBFBFBFF6C6C6CFF5B5B
      5BFF535353FF4C4C4CFF464646FF424242FF414141FF424242FF464646FF4C4C
      4CFF535353FF5B5B5BFFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FF9F9F
      9FFF484848FF545454FF5C5C5CF206060607060606075C5C5CF2545454FF4848
      48FF8F8F8FFFD3D3D3FFE3E3E3FFEEEEEEFFF6F6F6FFFBFBFBFF676767FF4C4C
      4CFF414141FF4C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF4C4C
      4CFF414141FF4C4C4CFFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FF9F9F
      9FFF484848FF545454FF5C5C5CF20606060702020207555555F2555555FF4949
      49FF8F8F8FFFD3D3D3FFE3E3E3FFEEEEEEFF646464FF4D4D4DFF424242FF5252
      52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0
      F0FF808080FF3F3F3FFF434343FF4A4A4AFFF6F6F6FFEEEEEEFFE3E3E3FF9F9F
      9FFF494949FF555555FF555555F2020202071A1A1A49595959FF525252FF5252
      52FFC4C4C4FFDDDDDDFFE9E9E9FFF2F2F2FFFAFAFAFFFDFDFDFFFFFFFFFFFFFF
      FFFF494949FF3F3F3FFF373737FF323232FF434343FFBCBCBCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF535353FF525252FF595959FF1A1A1A493B3B3B49585858FF515151FF5151
      51FFC4C4C4FFDDDDDDFFE9E9E9FFF2F2F2FFFAFAFAFFFDFDFDFF646464FF5252
      52FF484848FF404040FF3A3A3AFF353535FF343434FF353535FF3A3A3AFF4040
      40FF484848FF525252FFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF525252FF515151FF585858FF3B3B3B493B3B3B49585858FF515151FF5151
      51FFC4C4C4FFDDDDDDFFE9E9E9FFF2F2F2FFFAFAFAFFFDFDFDFF606060FF4040
      40FF343434FF404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060FF4040
      40FF343434FF404040FFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF525252FF515151FF585858FF3B3B3B491A1A1A49595959FF525252FF5252
      52FFC4C4C4FFDDDDDDFFE9E9E9FFF2F2F2FF5D5D5DFF414141FF353535FF4545
      45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFF4646
      46FF323232FF323232FF373737FF3F3F3FFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF535353FF525252FF595959FF1A1A1A49373737985A5A5AFF4F4F4FFF7676
      76FFCBCBCBFFE0E0E0FFEDEDEDFFF5F5F5FFFBFBFBFFFEFEFEFFFFFFFFFFFFFF
      FFFF404040FF343434FF2B2B2BFF252525FF242424FF2A2A2AFF777777FFEFEF
      EFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FF7E7E7EFF4F4F4FFF5A5A5AFF373737985E5E5E98595959FF4E4E4EFF7575
      75FFCBCBCBFFE0E0E0FFEDEDEDFFF5F5F5FFFBFBFBFFFEFEFEFF5D5D5DFF4A4A
      4AFF3F3F3FFF363636FF2E2E2EFF282828FF262626FF282828FF2E2E2EFF3636
      36FF3F3F3FFF4A4A4AFFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FF7D7D7DFF4E4E4EFF595959FF5E5E5E985E5E5E98595959FF4E4E4EFF7575
      75FFCBCBCBFFE0E0E0FFEDEDEDFFF5F5F5FFFBFBFBFFFEFEFEFF595959FF3636
      36FF262626FF363636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595959FF3636
      36FF262626FF363636FFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FF7D7D7DFF4E4E4EFF595959FF5E5E5E98373737985A5A5AFF4F4F4FFF7676
      76FFCBCBCBFFE0E0E0FFEDEDEDFFF5F5F5FF565656FF373737FF272727FF3C3C
      3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0FF808080FF333333FF2A2A
      2AFF242424FF252525FF2B2B2BFF343434FFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FF7E7E7EFF4F4F4FFF5A5A5AFF37373798464646C15A5A5AFF4C4C4CFF9898
      98FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
      FFFF3A3A3AFF2C2C2CFF202020FF181818FF171717FF1F1F1FFF2B2B2BFF4848
      48FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFA8A8A8FF4C4C4CFF5A5A5AFF464646C1646464C1595959FF4B4B4BFF9898
      98FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFCFCFCFFFFFFFFFF575757FF4343
      43FF383838FF2D2D2DFF232323FF1C1C1CFF191919FF1C1C1CFF232323FF2D2D
      2DFF383838FF434343FFFFFFFFFFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFA8A8A8FF4B4B4BFF595959FF646464C1646464C1595959FF4B4B4BFF9898
      98FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFCFCFCFFFFFFFFFF535353FF2D2D
      2DFF191919FF2D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF535353FF2D2D
      2DFF191919FF2D2D2DFFFFFFFFFFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFA8A8A8FF4B4B4BFF595959FF646464C1464646C15A5A5AFF4C4C4CFF9898
      98FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FF515151FF2E2E2EFF1A1A1AFF3232
      32FFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF565656FF383838FF2B2B2BFF1F1F
      1FFF171717FF181818FF202020FF2C2C2CFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFA8A8A8FF4C4C4CFF5A5A5AFF464646C1515151DA5B5B5BFF4B4B4BFFA8A8
      A8FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFF363636FF272727FF181818FF0C0C0CFF0B0B0BFF171717FF252525FF3434
      34FF434343FF8D8D8DFFF2F2F2FFFFFFFFFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFBDBDBDFF4B4B4BFF5B5B5BFF515151DA646464DA5A5A5AFF4A4A4AFFA8A8
      A8FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFF525252FF4040
      40FF333333FF272727FF1B1B1BFF101010FF0B0B0BFF101010FF1B1B1BFF2727
      27FF333333FF404040FFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFBDBDBDFF4A4A4AFF5A5A5AFF646464DA646464DA5A5A5AFF4A4A4AFFA8A8
      A8FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFF4F4F4FFF2727
      27FF0B0B0BFF272727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFF2727
      27FF0B0B0BFF272727FFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFBDBDBDFF4A4A4AFF5A5A5AFF646464DA515151DA5B5B5BFF4B4B4BFFA8A8
      A8FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FF4D4D4DFF282828FF0C0C0CFF2B2B
      2BFFFFFFFFFFF2F2F2FF979797FF535353FF434343FF343434FF252525FF1717
      17FF0B0B0BFF0C0C0CFF181818FF272727FFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFBDBDBDFF4B4B4BFF5B5B5BFF515151DA5C5C5CF35C5C5CFF4A4A4AFFB4B4
      B4FFD5D5D5FFE6E6E6FFF1F1F1FFFAFAFAFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFF353535FF262626FF161616FF070707FF060606FF151515FF242424FF3333
      33FF434343FF525252FF6E6E6EFFCCCCCCFFFDFDFDFFFAFAFAFFF1F1F1FFE6E6
      E6FFCDCDCDFF4A4A4AFF5C5C5CFF5C5C5CF3626262F35B5B5BFF494949FFB4B4
      B4FFD5D5D5FFE6E6E6FFF1F1F1FFFAFAFAFFFDFDFDFFFFFFFFFF515151FF3E3E
      3EFF313131FF242424FF171717FF0A0A0AFF000000FF0A0A0AFF171717FF2424
      24FF313131FF3E3E3EFFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF1F1F1FFE6E6
      E6FFCDCDCDFF494949FF5B5B5BFF626262F3626262F35B5B5BFF494949FFB4B4
      B4FFD5D5D5FFE6E6E6FFF1F1F1FFFAFAFAFFFDFDFDFFFFFFFFFF4E4E4EFF2424
      24FF000000FF242424FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4EFF2424
      24FF000000FF242424FFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF1F1F1FFE6E6
      E6FFCDCDCDFF494949FF5B5B5BFF626262F35C5C5CF35C5C5CFF4A4A4AFFB4B4
      B4FFD5D5D5FFE6E6E6FFF1F1F1FFFAFAFAFF4C4C4CFF252525FF000000FF2828
      28FFCCCCCCFF717171FF616161FF525252FF434343FF333333FF242424FF1515
      15FF060606FF070707FF161616FF262626FFFDFDFDFFFAFAFAFFF1F1F1FFE6E6
      E6FFCDCDCDFF4A4A4AFF5C5C5CFF5C5C5CF35D5D5DF35D5D5DFF4B4B4BFFB4B4
      B4FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFF525252FF4B4B4BFF434343FF3D3D3DFF363636FF343434FF373737FF3F3F
      3FFF494949FF555555FF707070FFCCCCCCFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFCCCCCCFF4B4B4BFF5D5D5DFF5D5D5DF3636363F35C5C5CFF4A4A4AFFB4B4
      B4FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFF5C5C5CFF5454
      54FF4F4F4FFF494949FF434343FF3C3C3CFF323232FF2B2B2BFF2C2C2CFF3030
      30FF383838FF414141FFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFCCCCCCFF4A4A4AFF5C5C5CFF636363F3636363F35C5C5CFF4A4A4AFFB4B4
      B4FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FFFDFDFDFFFFFFFFFF5A5A5AFF3E3E
      3EFF2C2C2CFF494949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFF3030
      30FF111111FF292929FFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFCCCCCCFF4A4A4AFF5C5C5CFF636363F35D5D5DF35D5D5DFF4B4B4BFFB4B4
      B4FFD4D4D4FFE5E5E5FFF1F1F1FFF9F9F9FF4D4D4DFF2B2B2BFF1C1C1CFF4141
      41FFD3D3D3FF898989FF7E7E7EFF737373FF636363FF4D4D4DFF373737FF2424
      24FF161616FF131313FF1B1B1BFF292929FFFDFDFDFFF9F9F9FFF1F1F1FFE5E5
      E5FFCCCCCCFF4B4B4BFF5D5D5DFF5D5D5DF3555555DA5F5F5FFF4E4E4EFFA8A8
      A8FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFF737373FF656565FF565656FF4B4B4BFF444444FF444444FF464646FF4D4D
      4DFF545454FF949494FFF2F2F2FFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFBABABAFF4E4E4EFF5F5F5FFF555555DA676767DA5E5E5EFF4D4D4DFFA8A8
      A8FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFDFDFDFFFFFFFFFF8E8E8EFF7D7D
      7DFF707070FF626262FF555555FF494949FF404040FF3D3D3DFF3D3D3DFF4040
      40FF444444FF4A4A4AFFFFFFFFFFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFBABABAFF4D4D4DFF5E5E5EFF676767DA676767DA5E5E5EFF4D4D4DFFA8A8
      A8FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FFFDFDFDFFFFFFFFFF8D8D8DFF6D6D
      6DFF595959FF626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF4040
      40FF272727FF343434FFFFFFFFFFFFFFFFFFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFBABABAFF4D4D4DFF5E5E5EFF676767DA555555DA5F5F5FFF4E4E4EFFA8A8
      A8FFD0D0D0FFE3E3E3FFEFEFEFFFF8F8F8FF747474FF747474FF666666FF7070
      70FFFFFFFFFFF5F5F5FFAFAFAFFF787878FF686868FF575757FF464646FF3838
      38FF2B2B2BFF262626FF272727FF303030FFFCFCFCFFF8F8F8FFEFEFEFFFE3E3
      E3FFBABABAFF4E4E4EFF5F5F5FFF555555DA4C4C4CC1626262FF525252FF9A9A
      9AFFCBCBCBFFE2E2E2FFF2F2F2FFF9F9F9FFFDFDFDFFFEFEFEFFFFFFFFFFFFFF
      FFFF797979FF6B6B6BFF5F5F5FFF555555FF4F4F4FFF4D4D4DFF4F4F4FFF6262
      62FFC9C9C9FFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FFA6A6A6FF525252FF626262FF4C4C4CC1686868C1616161FF515151FF9A9A
      9AFFCBCBCBFFE2E2E2FFF2F2F2FFF9F9F9FFFDFDFDFFFEFEFEFF919191FF8383
      83FF757575FF696969FF5D5D5DFF535353FF4B4B4BFF474747FF464646FF4848
      48FF4B4B4BFF505050FFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FFA6A6A6FF515151FF616161FF686868C1686868C1616161FF515151FF9A9A
      9AFFCBCBCBFFE2E2E2FFF2F2F2FFF9F9F9FFFDFDFDFFFEFEFEFF909090FF7474
      74FF636363FF696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6AFF4848
      48FF333333FF3D3D3DFFFFFFFFFFFEFEFEFFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FFA6A6A6FF515151FF616161FF686868C14C4C4CC1626262FF525252FF9A9A
      9AFFCBCBCBFFE2E2E2FFF2F2F2FFF9F9F9FF989898FF808080FF6F6F6FFF7676
      76FFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4FF797979FF5E5E5EFF4F4F4FFF4242
      42FF373737FF323232FF323232FF393939FFFBFBFBFFF5F5F5FFEDEDEDFFE0E0
      E0FFA6A6A6FF525252FF626262FF4C4C4CC13D3D3D98656565FF595959FF7979
      79FFCCCCCCFFEDEDEDFFF3F3F3FFF7F7F7FFFCFCFCFFFEFEFEFFFFFFFFFFFFFF
      FFFF808080FF737373FF686868FF606060FF5A5A5AFF585858FF919191FFF1F1
      F1FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF7D7D7DFF595959FF656565FF3D3D3D9861616198646464FF585858FF7878
      78FFCCCCCCFFEDEDEDFFF3F3F3FFF7F7F7FFFCFCFCFFFEFEFEFF959595FF8989
      89FF7B7B7BFF707070FF666666FF5D5D5DFF575757FF525252FF515151FF5151
      51FF535353FF585858FFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF7C7C7CFF585858FF646464FF6161619861616198646464FF585858FF7878
      78FFCCCCCCFFEDEDEDFFF3F3F3FFF7F7F7FFFCFCFCFFFEFEFEFF949494FF7B7B
      7BFF6D6D6DFF707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF707070FF5151
      51FF414141FF474747FFFFFFFFFFFDFDFDFFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF7C7C7CFF585858FF646464FF616161983D3D3D98656565FF595959FF7979
      79FFCCCCCCFFEDEDEDFFF3F3F3FFF7F7F7FF9D9D9DFF868686FF787878FF7C7C
      7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FF999999FF595959FF4D4D
      4DFF444444FF3F3F3FFF3E3E3EFF434343FFFAFAFAFFF2F2F2FFE9E9E9FFDDDD
      DDFF7D7D7DFF595959FF656565FF3D3D3D981E1E1E49686868FF606060FF5C5C
      5CFFBCBCBCFFE6E6E6FFEFEFEFFFF5F5F5FFF9F9F9FFFCFCFCFFFEFEFEFFFFFF
      FFFF878787FF7C7C7CFF727272FF6A6A6AFF717171FFCBCBCBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FFD3D3
      D3FF5C5C5CFF606060FF686868FF1E1E1E493C3C3C49676767FF5F5F5FFF5B5B
      5BFFBCBCBCFFE6E6E6FFEFEFEFFFF5F5F5FFF9F9F9FFFCFCFCFF999999FF8F8F
      8FFF858585FF797979FF707070FF676767FF616161FF5D5D5DFF5C5C5CFF5C5C
      5CFF5E5E5EFF616161FFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FFD3D3
      D3FF5B5B5BFF5F5F5FFF676767FF3C3C3C493C3C3C49676767FF5F5F5FFF5B5B
      5BFFBCBCBCFFE6E6E6FFEFEFEFFFF5F5F5FFF9F9F9FFFCFCFCFF999999FF8585
      85FF767676FF797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF757575FF5C5C
      5CFF4D4D4DFF525252FFFEFEFEFFFBFBFBFFF6F6F6FFEEEEEEFFE3E3E3FFD3D3
      D3FF5B5B5BFF5F5F5FFF676767FF3C3C3C491E1E1E49686868FF606060FF5C5C
      5CFFBCBCBCFFE6E6E6FFEFEFEFFFF5F5F5FFA1A1A1FF8E8E8EFF828282FF8585
      85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBFF6666
      66FF515151FF4C4C4CFF4A4A4AFF4F4F4FFFF6F6F6FFEEEEEEFFE3E3E3FFD3D3
      D3FF5C5C5CFF606060FF686868FF1E1E1E4902020207666666F2666666FF5757
      57FF939393FFD4D4D4FFECECECFFF2F2F2FFF6F6F6FFFBFBFBFFFDFDFDFFFEFE
      FEFF8F8F8FFF868686FF7C7C7CFFA4A4A4FFF3F3F3FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFDDDDDDFF9B9B
      9BFF575757FF666666FF666666F202020207060606076C6C6CF2656565FF5656
      56FF939393FFD4D4D4FFECECECFFF2F2F2FFF6F6F6FFFBFBFBFF999999FF9595
      95FF8E8E8EFF878787FF808080FF787878FF747474FF717171FF717171FF7272
      72FF737373FF757575FFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFDDDDDDFF9B9B
      9BFF565656FF656565FF6C6C6CF206060607060606076C6C6CF2656565FF5656
      56FF939393FFD4D4D4FFECECECFFF2F2F2FFF6F6F6FFFBFBFBFF9A9A9AFF9191
      91FF898989FF8E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777FF6B6B
      6BFF636363FF6A6A6AFFFCFCFCFFF8F8F8FFF1F1F1FFE8E8E8FFDDDDDDFF9B9B
      9BFF565656FF656565FF6C6C6CF20606060702020207666666F2666666FF5757
      57FF939393FFD4D4D4FFECECECFFF2F2F2FFA8A8A8FF9B9B9BFF8E8E8EFF8E8E
      8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2
      F2FF949494FF595959FF575757FF5B5B5BFFF1F1F1FFE8E8E8FFDDDDDDFF9B9B
      9BFF575757FF666666FF666666F20202020700000000414141976C6C6CFF6464
      64FF585858FFB2B2B2FFE3E3E3FFEDEDEDFFF3F3F3FFF7F7F7FFFAFAFAFFFCFC
      FCFF909090FF969696FFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FFC2C2C2FF5858
      58FF646464FF6C6C6CFF414141970000000000000000646464976B6B6BFF6363
      63FF575757FFB2B2B2FFE3E3E3FFEDEDEDFFF3F3F3FFF7F7F7FFFAFAFAFFFCFC
      FCFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FFC2C2C2FF5757
      57FF636363FF6B6B6BFF646464970000000000000000646464976B6B6BFF6363
      63FF575757FFB2B2B2FFE3E3E3FFEDEDEDFFF3F3F3FFF7F7F7FFFAFAFAFFFCFC
      FCFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFFBFBFBFFF8F8F8FFF2F2F2FFEBEBEBFFE0E0E0FFC2C2C2FF5757
      57FF636363FF6B6B6BFF646464970000000000000000414141976C6C6CFF6464
      64FF585858FFB2B2B2FFE3E3E3FFEDEDEDFFF3F3F3FFF7F7F7FFFAFAFAFFFCFC
      FCFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFC9C9C9FF707070FF646464FFEBEBEBFFE0E0E0FFC2C2C2FF5858
      58FF646464FF6C6C6CFF4141419700000000000000000B0B0B196C6C6CF56C6C
      6CFF606060FF6D6D6DFFC7C7C7FFE5E5E5FFEDEDEDFFF2F2F2FFF6F6F6FFF9F9
      F9FFB4B4B4FFF2F2F2FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FFD4D4D4FF6E6E6EFF6060
      60FF6C6C6CFF6C6C6CF50B0B0B19000000000000000017171719707070F56B6B
      6BFF5F5F5FFF6C6C6CFFC7C7C7FFE5E5E5FFEDEDEDFFF2F2F2FFF6F6F6FFF9F9
      F9FFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FFD4D4D4FF6D6D6DFF5F5F
      5FFF6B6B6BFF707070F517171719000000000000000017171719707070F56B6B
      6BFF5F5F5FFF6C6C6CFFC7C7C7FFE5E5E5FFEDEDEDFFF2F2F2FFF6F6F6FFF9F9
      F9FFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFF1F1F1FFEBEBEBFFE2E2E2FFD4D4D4FF6D6D6DFF5F5F
      5FFF6B6B6BFF707070F51717171900000000000000000B0B0B196C6C6CF56C6C
      6CFF606060FF6D6D6DFFC7C7C7FFE5E5E5FFEDEDEDFFF2F2F2FFF6F6F6FFF9F9
      F9FFFBFBFBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF6F6F6FFE5E5E5FF919191FFE2E2E2FFD4D4D4FF6E6E6EFF6060
      60FF6C6C6CFF6C6C6CF50B0B0B190000000000000000000000003B3B3B847272
      72FF6B6B6BFF5B5B5BFF929292FFC9C9C9FFE4E4E4FFEBEBEBFFF0F0F0FFF3F3
      F3FFF6F6F6FFF8F8F8FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFF9F9F9FFF6F6
      F6FFF3F3F3FFEFEFEFFFE8E8E8FFE0E0E0FFD4D4D4FF969696FF5B5B5BFF6B6B
      6BFF727272FF3B3B3B84000000000000000000000000000000005E5E5E847171
      71FF6A6A6AFF5A5A5AFF929292FFC9C9C9FFE4E4E4FFEBEBEBFFF0F0F0FFF3F3
      F3FFF6F6F6FFF8F8F8FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFF9F9F9FFF6F6
      F6FFF3F3F3FFEFEFEFFFE8E8E8FFE0E0E0FFD4D4D4FF969696FF5A5A5AFF6A6A
      6AFF717171FF5E5E5E84000000000000000000000000000000005E5E5E847171
      71FF6A6A6AFF5A5A5AFF929292FFC9C9C9FFE4E4E4FFEBEBEBFFF0F0F0FFF3F3
      F3FFF6F6F6FFF8F8F8FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFF9F9F9FFF6F6
      F6FFF3F3F3FFEFEFEFFFE8E8E8FFE0E0E0FFD4D4D4FF969696FF5A5A5AFF6A6A
      6AFF717171FF5E5E5E84000000000000000000000000000000003B3B3B847272
      72FF6B6B6BFF5B5B5BFF929292FFC9C9C9FFE4E4E4FFEBEBEBFFF0F0F0FFF3F3
      F3FFF6F6F6FFF8F8F8FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFF9F9F9FFF6F6
      F6FFF3F3F3FFEFEFEFFFE8E8E8FFE0E0E0FFD4D4D4FF969696FF5B5B5BFF6B6B
      6BFF727272FF3B3B3B8400000000000000000000000000000000030303085B5B
      5BC8727272FF6A6A6AFF5F5F5FFF929292FFC7C7C7FFDFDFDFFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF1F1F1FFEFEF
      EFFFEAEAEAFFE4E4E4FFDDDDDDFFCFCFCFFF959595FF5F5F5FFF6A6A6AFF7272
      72FF5B5B5BC80303030800000000000000000000000000000000070707087272
      72C8717171FF696969FF5E5E5EFF929292FFC7C7C7FFDFDFDFFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF1F1F1FFEFEF
      EFFFEAEAEAFFE4E4E4FFDDDDDDFFCFCFCFFF959595FF5E5E5EFF696969FF7171
      71FF727272C80707070800000000000000000000000000000000070707087272
      72C8717171FF696969FF5E5E5EFF929292FFC7C7C7FFDFDFDFFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF1F1F1FFEFEF
      EFFFEAEAEAFFE4E4E4FFDDDDDDFFCFCFCFFF959595FF5E5E5EFF696969FF7171
      71FF727272C80707070800000000000000000000000000000000030303085B5B
      5BC8727272FF6A6A6AFF5F5F5FFF929292FFC7C7C7FFDFDFDFFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF1F1F1FFEFEF
      EFFFEAEAEAFFE4E4E4FFDDDDDDFFCFCFCFFF959595FF5F5F5FFF6A6A6AFF7272
      72FF5B5B5BC80303030800000000000000000000000000000000000000000B0B
      0B186A6A6AE3757575FF6D6D6DFF5F5F5FFF717171FFB2B2B2FFD0D0D0FFE0E0
      E0FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFE9E9E9FFE6E6E6FFE3E3
      E3FFDFDFDFFFD4D4D4FFBCBCBCFF717171FF5F5F5FFF6D6D6DFF757575FF6A6A
      6AE30B0B0B180000000000000000000000000000000000000000000000001616
      1618777777E3747474FF6C6C6CFF5E5E5EFF707070FFB2B2B2FFD0D0D0FFE0E0
      E0FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFE9E9E9FFE6E6E6FFE3E3
      E3FFDFDFDFFFD4D4D4FFBCBCBCFF707070FF5E5E5EFF6C6C6CFF747474FF7777
      77E3161616180000000000000000000000000000000000000000000000001616
      1618777777E3747474FF6C6C6CFF5E5E5EFF707070FFB2B2B2FFD0D0D0FFE0E0
      E0FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFE9E9E9FFE6E6E6FFE3E3
      E3FFDFDFDFFFD4D4D4FFBCBCBCFF707070FF5E5E5EFF6C6C6CFF747474FF7777
      77E3161616180000000000000000000000000000000000000000000000000B0B
      0B186A6A6AE3757575FF6D6D6DFF5F5F5FFF717171FFB2B2B2FFD0D0D0FFE0E0
      E0FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFE9E9E9FFE6E6E6FFE3E3
      E3FFDFDFDFFFD4D4D4FFBCBCBCFF717171FF5F5F5FFF6D6D6DFF757575FF6A6A
      6AE30B0B0B180000000000000000000000000000000000000000000000000000
      00001515152D6C6C6CE3777777FF717171FF676767FF5F5F5FFF959595FFBCBC
      BCFFCBCBCBFFD3D3D3FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD3D3D3FFCDCD
      CDFFC4C4C4FF959595FF5F5F5FFF676767FF717171FF777777FF6C6C6CE31515
      152D000000000000000000000000000000000000000000000000000000000000
      00002828282D797979E3767676FF707070FF666666FF5E5E5EFF959595FFBCBC
      BCFFCBCBCBFFD3D3D3FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD3D3D3FFCDCD
      CDFFC4C4C4FF959595FF5E5E5EFF666666FF707070FF767676FF797979E32828
      282D000000000000000000000000000000000000000000000000000000000000
      00002828282D797979E3767676FF707070FF666666FF5E5E5EFF959595FFBCBC
      BCFFCBCBCBFFD3D3D3FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD3D3D3FFCDCD
      CDFFC4C4C4FF959595FF5E5E5EFF666666FF707070FF767676FF797979E32828
      282D000000000000000000000000000000000000000000000000000000000000
      00001515152D6C6C6CE3777777FF717171FF676767FF5F5F5FFF959595FFBCBC
      BCFFCBCBCBFFD3D3D3FFD8D8D8FFDCDCDCFFDCDCDCFFD9D9D9FFD3D3D3FFCDCD
      CDFFC4C4C4FF959595FF5F5F5FFF676767FF717171FF777777FF6C6C6CE31515
      152D000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0B18616161C87B7B7BFF787878FF707070FF656565FF6767
      67FF818181FF9D9D9DFFAAAAAAFFB5B5B5FFB5B5B5FFAAAAAAFF9D9D9DFF8181
      81FF676767FF656565FF707070FF787878FF7B7B7BFF616161C80B0B0B180000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000016161618777777C87A7A7AFF777777FF6F6F6FFF646464FF6666
      66FF818181FF9D9D9DFFAAAAAAFFB5B5B5FFB5B5B5FFAAAAAAFF9D9D9DFF8181
      81FF666666FF646464FF6F6F6FFF777777FF7A7A7AFF777777C8161616180000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000016161618777777C87A7A7AFF777777FF6F6F6FFF646464FF6666
      66FF818181FF9D9D9DFFAAAAAAFFB5B5B5FFB5B5B5FFAAAAAAFF9D9D9DFF8181
      81FF666666FF646464FF6F6F6FFF777777FF7A7A7AFF777777C8161616180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0B18616161C87B7B7BFF787878FF707070FF656565FF6767
      67FF818181FF9D9D9DFFAAAAAAFFB5B5B5FFB5B5B5FFAAAAAAFF9D9D9DFF8181
      81FF676767FF656565FF707070FF787878FF7B7B7BFF616161C80B0B0B180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000004040408424242847B7B7BF57D7D7DFF797979FF7474
      74FF6D6D6DFF676767FF646464FF626262FF626262FF646464FF676767FF6D6D
      6DFF747474FF797979FF7D7D7DFF7B7B7BF54242428404040408000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070861616184808080F57C7C7CFF787878FF7373
      73FF6C6C6CFF666666FF636363FF616161FF616161FF636363FF666666FF6C6C
      6CFF737373FF787878FF7C7C7CFF808080F56161618407070708000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707070861616184808080F57C7C7CFF787878FF7373
      73FF6C6C6CFF666666FF636363FF616161FF616161FF636363FF666666FF6C6C
      6CFF737373FF787878FF7C7C7CFF808080F56161618407070708000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000004040408424242847B7B7BF57D7D7DFF797979FF7474
      74FF6D6D6DFF676767FF646464FF626262FF626262FF646464FF676767FF6D6D
      6DFF747474FF797979FF7D7D7DFF7B7B7BF54242428404040408000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C194D4D4D977B7B7BF28080
      80FF7E7E7EFF7C7C7CFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7C7C7CFF7E7E
      7EFF808080FF7B7B7BF24D4D4D970C0C0C190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000171717196B6B6B97818181F28080
      80FF7D7D7DFF7B7B7BFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7B7B7BFF7D7D
      7DFF808080FF818181F26B6B6B97171717190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000171717196B6B6B97818181F28080
      80FF7D7D7DFF7B7B7BFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7B7B7BFF7D7D
      7DFF808080FF818181F26B6B6B97171717190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C194D4D4D977B7B7BF28080
      80FF7E7E7EFF7C7C7CFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7C7C7CFF7E7E
      7EFF808080FF7B7B7BF24D4D4D970C0C0C190000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303072626
      264A4F4F4F98656565C1727272DA7F7F7FF37F7F7FF3727272DA656565C14F4F
      4F982626264A0303030700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606073F3F
      3F4A6C6C6C987B7B7BC1818181DA848484F3848484F3818181DA7B7B7BC16C6C
      6C983F3F3F4A0606060700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606073F3F
      3F4A6C6C6C987B7B7BC1818181DA848484F3848484F3818181DA7B7B7BC16C6C
      6C983F3F3F4A0606060700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303072626
      264A4F4F4F98656565C1727272DA7F7F7FF37F7F7FF3727272DA656565C14F4F
      4F982626264A0303030700000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      F800001F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F000001F000000000000000000000000F000003F000000000000000000000000
      F000007F000000000000000000000000F000007F000000000000000000000000
      F00000FF000000000000000000000000F00001FF000000000000000000000000
      F00003FF000000000000000000000000F8000FFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFF00FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF8001FFFFFFFFFFFFFFFFFFFFFFFCFFFE00007FFFFFFFFF87FFFFFFFFFFE8FF
      FC00003F8000000003FFFFFFFFFFC01FF800001F0000000001FFFFFFFFFFC01F
      F000000F0000000000FFFFFFFFFF0007E000000700000000807FFFFFFFFF0007
      C000000300000000C03FFFFFFFFF0007C000000300000000E01FFFFFFFFE0703
      8000000100000000F00FFFFFFFFE07038000000100000000FC07FFFFFFFF0007
      8000000100000000FE0180FFFFEF00070000000000000000FF00003FFFC70007
      0000000000000000FF80001FF884401F0000000000000000FFC07E0FF800401F
      0000000000000000FFE0FF07F80048DF0000000000000000FFE1FF03C0000DFF
      0000000000000000FFE3FE03C0000FFF0000000000000000FFC3F803E0001FFF
      0000000000000000FFC7F001E0001FFF8000000100000000FFC7E001C0300FFF
      8000000100000000FFC78001807807FF8000000100000000FFC70001C0780FFF
      C000000300000000FFC20001E0001FFFC000000300000000FFC00003E0001FFF
      E000000700000000FFE00003C0000FFFF000000F00000000FFE00003C0000FFF
      F800001F00000000FFF00007F8007FFFFC00003F00000000FFF0000FFC007FFF
      FE00007F00000000FFF8001FFC847FFFFF8001FF80000001FFFE003FFFCFFFFF
      FFF00FFFFFFFFFFFFFFF00FFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF
      FF8001FFFF8001FFFF8001FFFF8001FFFE00007FFE00007FFE00007FFE00007F
      FC00003FFC00003FFC00003FFC00003FF800001FF800001FF800001FF800001F
      F000000FF000000FF000000FF000000FE0000007E0000007E0000007E0000007
      C0000003C0000003C0000003C0000003C0000003C0000003C0000003C0000003
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      C0000003C0000003C0000003C0000003C0000003C0000003C0000003C0000003
      E0000007E0000007E0000007E0000007F000000FF000000FF000000FF000000F
      F800001FF800001FF800001FF800001FFC00003FFC00003FFC00003FFC00003F
      FE00007FFE00007FFE00007FFE00007FFF8001FFFF8001FFFF8001FFFF8001FF
      FFF00FFFFFF00FFFFFF00FFFFFF00FFF00000000000000000000000000000000
      000000000000}
  end
  object BottomBtnImages: TImageList
    ColorDepth = cd32Bit
    Height = 22
    Width = 22
    Left = 336
    Top = 440
    Bitmap = {
      494C010106000800200016001600FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000580000002C0000000100200000000000803C
      0000000000000000000000000000000000000000000000000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000000000000000000010101010201010102010101020101
      0102010101020101010201010102010101020101010201010102010101020101
      0102010101020101010201010102010101020101010201010102000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D0D0D0E2525252D282828322828
      2832282828322828283228282832282828322828283228282832282828322828
      2832282828322828283228282832282828322828283228282832282828322828
      28322525252D0D0D0D0E060606072525252D27272730272727302626262F2727
      2730272727302727273027272730272727302727273027272730272727302727
      27302727273027272730272727302727273027272730272727302525252D0606
      0607000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002424242CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2424242C2525252DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2525
      252D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF282828322626262FFFFFFFFFFAFAFAFFD7D7D7FFD6D6D6FFF9F9
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5FFF3F3F3FFE1E1E1FFFFFFFFFF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFC6C6C6FFBBBBBBFFC7C7C7FFD3D3D3FFC3C3C3FFC1C1C1FFC1C1C1FFE6E6
      E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF282828322626262FFFFFFFFF41AC5BFF07D43AFF4CBE63FFF1F4
      F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0FFD9D9D9FFD3D3
      D3FFCBCBCBFFE6E6E6FFFFFFFFFFE5E5E5FFF7F7F7FFDADADAFFFFFFFFFF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF282828322626262FFFFFFFFF70CF88FF71F091FF018414FF84A3
      83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFF8F8F8FFFFFFFFFF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFF8F4
      F0FFF7F1ECFFF3EDE8FFF4EEE9FFF7F1ECFFF2ECE7FFF4EEE9FFF7F1EDFFF8F2
      EEFFF6F0EBFFF2ECE7FFF5EFEAFFF6F0ECFFF2ECE7FFF6F0EBFFF9F6F3FFFFFF
      FFFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFEDFBF0FFE8F0E9FF8AB6
      8BFFF7FBF7FFFCFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFCACACAFFCECECEFFBABA
      BAFFC5C5C5FFC9C9C9FFDCDCDCFFCCCCCCFFC6C6C6FFFDFDFDFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFC09B7CFF9861
      37FF9F6435FF8E5122FF945829FF9E6234FF8B4E1FFF995C2EFFA0673BFF965A
      2BFF9F6335FF8E5122FF935628FF9F6234FF8C4E1FFF995C2EFF9A5F30FFB893
      74FFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91BB
      95FFFFFFFFFF9FD49FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFE
      FEFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFBA8456FFD6BA
      A3FFE2C6B0FFB2774AFFDABAA2FFE5CCB8FFE1CAB9FFDCBCA2FFE7D2C0FFE1C8
      B4FFE0C4ACFFE0C7B3FFE3CCBBFFDCBAA0FFE1CAB8FFDEC2ABFFC8976EFFB178
      4CFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97BE
      9EFFFFFFFFFF78C478FFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1FFCCCCCCFFCDCD
      CDFFCFCFCFFFCCCCCCFFCCCCCCFFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFE8CCB6FFDCB4
      94FFEEC7A7FFE2BA9AFFE3BC9CFFEEC7A8FFDFB797FFE4BC9CFFEFC8A8FFEEC8
      A8FFECC4A4FFDEB696FFE7C0A0FFECC5A6FFDEB696FFEAC3A4FFE6BC9BFFE0C4
      AEFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96BE
      9DFFA2D3A2FF87CA87FFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBFFF4F4F4FFF0F0
      F0FFF5F5F5FFE3E3E3FFF4F4F4FFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF428E
      44FF4BA84BFFFDFEFDFFE7E7E7FFF1F1F1FFF4F4F4FFE7E7E7FFD2D2D2FFCECE
      CEFFE2E2E2FFDADADAFFDFDFDFFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5699
      5AFFF4FAF4FFFFFFFFFFD9D9D9FFF8F8F8FFD2D2D2FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFC5C5C5FFB0B0B0FFBCBCBCFFC9C9C9FFC3C3C3FFCACACAFFB8B8B8FFDEDE
      DEFFD6D6D6FFC4C4C4FFB8B8B8FFC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2828283227272730FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F8FFF8F8F8FFF1F1F1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2828283227272730DDDBDBFFD1CFCFFFD1CFCFFFD1CFCFFFD1CF
      CFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CF
      CFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFD1CFCFFFDDDBDBFF2727
      2730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832E1DFDFFFD6D4D4FFD6D4
      D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4
      D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4D4FFD6D4
      D4FFE1DFDFFF282828322626262FE1E0E0FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5
      D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5
      D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFD7D5D5FFE1E0E0FF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832E5E4E4FFCACACAFFCACA
      CAFFDCDADAFFDCDADAFFDCDADAFFDCDADAFFDCDADAFFDCDADAFFDCDADAFFDCDA
      DAFFCACACAFFCACACAFFDCDADAFFCACACAFFCACACAFFDCDADAFFCACACAFFCACA
      CAFFE5E4E4FF282828322626262FE6E4E4FFC9C8C8FFC9C8C8FFDDDBDBFFDDDB
      DBFFDDDBDBFFDDDBDBFFDDDBDBFFDDDBDBFFDDDBDBFFDDDBDBFFC9C8C8FFC9C8
      C8FFDDDBDBFFC9C8C8FFC9C8C8FFDDDBDBFFC9C8C8FFC9C8C8FFE6E4E4FF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028282832E9E8E8FFEDECECFFEDEC
      ECFFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0
      E0FFEDECECFFEDECECFFE2E0E0FFEDECECFFEDECECFFE2E0E0FFEDECECFFEDEC
      ECFFE9E8E8FF282828322626262FE9E8E8FFF2F1F1FFF2F1F1FFE2E0E0FFE2E0
      E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFE2E0E0FFF2F1F1FFF2F1
      F1FFE2E0E0FFF2F1F1FFF2F1F1FFE2E0E0FFF2F1F1FFF2F1F1FFE9E8E8FF2626
      262F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002424242CF3F3F3FCF5F4F4FFF5F4
      F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4
      F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4F4FFF5F4
      F4FFF3F3F3FC2424242C2525252DF4F4F4FCF6F5F5FFF6F5F5FFF6F5F5FFF6F5
      F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5
      F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF4F4F4FC2525
      252D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D0D0D0E2525252D282828322828
      2832282828322828283228282832282828322828283228282832282828322828
      2832282828322828283228282832282828322828283228282832282828322828
      28322525252D0D0D0D0E060606072525252D27272730272727302626262F2727
      2730272727302727273027272730272727302727273027272730272727302727
      27302727273027272730272727302727273027272730272727302525252D0606
      0607000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000000000000000000010101010201010102010101020101
      0102010101020101010201010102010101020101010201010102010101020101
      0102010101020101010201010102010101020101010201010102000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000A0E08
      024E38220FB14F3117D5533618DC523418DA482F15C922140786030100220000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002030100263723
      0EB09C6A38FCB57B43FFB88046FFB8834BFFB27F4BFE6D4A27E9110B03590000
      0008000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000201000D27190C892717089B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003323109B1C0E04890201000D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004070301384F31
      17D5B57A40FFC68845FFC88C4BFFCA9152FFC79155FF8F6033FA1B10057B0000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C06
      023A321B0BDD98784EFF50381DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000020201028D753EFF795B35FF331C0BDD0C06013A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040905013F5134
      17DBB4783BFFC4833DFFC68743FFC88C4AFFC68E51FF916232FB1D1105830000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010000051D0F05825636
      20FCC19270FFE2AF8CFF2E1606FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000543B17FFE6B689FFCCA26DFF593B21FC1D0E05830100
      0005000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004090501405134
      18DCB37638FFC28036FFC4833CFFC68843FFC58A4BFF926132FB1E1106860000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B050225361D0AC980563AFFCC98
      74FFD8A480FFDEAB88FF2B1506FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A3415FFDFAD88FFDAA782FFD6A776FF88613EFF351C
      0BCA0B0502260000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004090501405134
      18DCB27435FFC07A30FFC27E35FFC4833CFFC38746FF916032FB1E1106860000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000231207655B3318F3A26F4DFFC5906AFFCD98
      73FFD4A07BFFD8A581FF261305FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000422E15FFD9A682FFD5A17DFFCF9A75FFCB986EFFAD81
      56FF5A3419F42312076600000000000000000000000000000000000000000000
      000000000002000000040000000600000006000000060000000A090501435234
      17DDB17130FFBE7629FFBF792EFFC27E36FFC28440FF926030FC1F12078C0000
      0019000000060000000600000006000000060000000400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000804011544230DB0784827FFAC7550FFBB845EFFC38D67FFCA94
      6FFFCF9A75FFD29E79FF201005FF271306FF301707FF381C08FF411F09FF5433
      1BFF392312B0000000000000000000000000493423B146240BFF45230BFF3D1F
      0AFF351B09FF2C1708FF3A2915FFD39F7AFFD09B76FFCB9671FFC58F69FFBE88
      61FFB8875BFF7E502DFF44230DB1080401150000000000000000000000000000
      00000101001D070300380B0500470B0501490D07014D0D070151160D037A5A37
      18E7B16F2DFFBC7222FFBE7527FFC07A2FFFBF803AFF96612FFD2D1B08AF0F07
      015B0D07014D0D07014D0B07014B090501450503002D0000000C000000000000
      000E000000160000001800000018000000180000001800000018000000180000
      0018000000180000001800000018000000180000001800000018000000180000
      001800000018000000160000000F000000000000000000000000000000000000
      000021110749653717E786522FFFA16B46FFAE7751FFB8815BFFBF8963FFC58F
      69FFC9946EFFCB9771FFCC9771FFC9946FFFC48F69FFBC865FFFAD7651FF9560
      3DFF512E15FF000000000000000000000000755738FF9A6A43FFB07D54FFC08D
      62FFC8966CFFCD9C73FFD09E76FFCC9771FFCA956FFFC6916BFFC08B65FFBA84
      5DFFB17A54FFAA7750FF915F3BFF663817E82111074A00000000000000000000
      00002417098A513317D45F3B1AE5613C1BE8613F1DE8633E1DE966411CEE8053
      26FCAF702DFFBC6F1EFFBC7121FFBE7628FFBD7B35FF9E6934FF6D461EF5613F
      1EEA613F1DE8613F1EE8623F1DE75D3A1DE13D2710BC100A0255000000000000
      00150C0C9DEA0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0C
      ACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0CACFF0C0C
      ACFF0C0CACFF0C0C9DEA00000016000000000000000000000000040201094B27
      109479421DFE834F2DFF915D3AFF9E6844FFAA734EFFB47C56FFBA845DFFBF89
      63FFC38D67FFC48F69FFC48F69FFC28C66FFBD8761FFB67E58FFA7704CFF935E
      3BFF4C250BFF000000000000000000000000593517FF8E5A37FFA36C48FFB37B
      55FFBC865FFFC18C65FFC48E68FFC48F69FFC38E68FFC08A64FFBC865FFFB67E
      58FFAD7650FFA26B47FF97623FFF8E5D3AFF7C4620FE4B2810950502010A0000
      000069441FE7AE7335FFB67633FFB67532FFB57430FFB4722EFFB4712CFFB170
      2BFFB77126FFBC6F1DFFBC6F1DFFBC7122FFBD762BFFB87735FFB67939FFB97C
      3DFFBA7E42FFBB8347FFBC854AFFBE884FFF9F6E3DFC34210DAB000000000000
      00181010AFFF5959D5FF5A5AD5FF5A5AD5FF5A5AD6FF5A5AD6FF5A5AD6FF5A5A
      D7FF5A5AD7FF5959D6FF5858D6FF5757D6FF5555D5FF5353D5FF5353D3FF5050
      D3FF4E4ED2FF1010AFFF0000001800000000000000001008031C79401AD68956
      35FF8B6044FF986C50FFA4785AFFAE8364FFB78B6BFFBE9070FFC39574FFC597
      76FFC69775FFC59572FFC3916DFFBD8963FFB68059FFAD7651FFA06A45FF8E59
      37FF52290DFF0000000000000000000000005B3417FF926241FFA67553FFB484
      60FFBE8D69FFC2926DFFC4946FFFC4936EFFC2906BFFBE8B66FFB9855FFFB079
      54FFA7704CFF9D6743FF925D3AFF855230FF7C4C2BFF7B4420FF79401AD71008
      031C805328F7BD7C39FFC27D33FFC17B30FFC0792DFFBF7729FFBD7424FFBC71
      1FFFBC6E1DFFBC6F1DFFBC6F1DFFBC6F1EFFBD7222FFBF772AFFC17B31FFC381
      38FFC5853FFFC78A46FFC98E4EFFCB9254FFB27C45FF462C13CC000000000000
      00181414B1FF6565DAFF4B4BD4FF4C4CD5FF4E4ED6FF4F4FD7FF5050D8FF5050
      D8FF5151D8FF5151D8FF5151D8FF5151D8FF5050D8FF4F4FD7FF4E4ED7FF4D4D
      D6FF5A5AD9FF1414B1FF0000001800000000000000001109031C82441CD79562
      40FF9F7A62FFA88369FFAF8A70FFB69076FFBD967BFFC39B80FFC7A084FFCBA3
      87FFCDA589FFCDA58AFFCDA589FFCBA388FFC59C80FFB88D6EFFA47555FF8A57
      36FF582C0EFF0000000000000000000000005D3315FFAD8A6CFFB69170FFBE98
      77FFC49E7CFFC8A280FFCBA482FFCBA482FFCBA482FFC9A280FFC69F7CFFC29C
      7AFFB9906FFFAC815FFF9A6C4BFF845231FF744323FF804620FF81451CD81008
      031C815628F8BD7D3CFFC27E35FFC17C32FFC17A30FFC0792EFFBF772BFFBE74
      27FFBC7121FFBC6F1DFFBC6F1DFFBC6F1DFFBC6F1EFFBD7122FFBF7529FFC17A
      30FFC38037FFC5853FFFC78946FFC88D4DFFB27A42FF482D13D0000000000000
      00181818B4FF6F6FE0FF5353DAFF5555DBFF5757DCFF5858DDFF5959DEFF5A5A
      DEFF5B5BDFFF5B5BDFFF5B5BDFFF5A5ADFFF5A5ADEFF5959DDFF5757DCFF5555
      DBFF6666DEFF1818B4FF000000180000000000000000000000000603010B6234
      169DA06239FFAE8970FFB6947CFFBC9982FFC19E86FFC6A28AFFC9A58DFFCCA7
      8FFFCDA990FFCEAA91FFCDA990FFCBA78EFFC8A48BFFC39F87FFBC9982FFB390
      78FF5E3010FF000000000000000000000000603313FFB69779FFB99878FFC09E
      7DFFC5A382FFC8A685FFCBA787FFCBA888FFCBA887FFC9A686FFC7A484FFC4A1
      81FFBF9D7CFFBB9978FFB59473FFB29173FF9C5E34FF6335169F0704010C0000
      00007A5026F2D0A87BFFD3A878FFD3A776FFD3A675FFD2A574FFD1A472FFD1A3
      71FFBD762BFFBC7122FFBC6F1DFFBC6F1DFFBB6F1EFFBA7123FFCFA06DFFD1A3
      71FFD2A675FFD4A979FFD5AC7DFFD6AE84FFAD7640FE402710C2000000000000
      00181C1CB6FF7878E4FF7A7AE5FF7B7BE6FF7C7CE6FF7E7EE6FF7E7EE7FF8080
      E7FF8181E7FF8080E7FF7E7EE6FF7D7DE6FF7A7AE6FF7878E5FF7575E5FF7272
      E4FF6F6FE3FF1C1CB6FF00000018000000000000000000000000000000000000
      0000371D0C5898562BF0B58A6DFFC3A38EFFC7A791FFCAAA94FFCDAC96FFCFAE
      98FFD0AF99FFD0AF99FFCFAE98FFCEAD97FFCBAA94FFC7A791FFC2A28DFFBB9C
      87FF6D4021FF0000000000000000000000006D4021FFC6AE96FFC4A98DFFC7AC
      8FFFCAAD8FFFCCAD8FFFCCAD8EFFCDAE8EFFCCAD8DFFCCAC8CFFCAAB8BFFC7A8
      89FFC4A586FFC0A182FFB8916FFF9B5A2FF1381E0C5A00000000000000000000
      00004A2E15C88E5D2DF99D6632FD9C6631FD9D6731FE9D6630FE9C662EFEA068
      30FFB57533FFBE7529FFBC7121FFBC6F1CFFB97023FFA86C2FFF9C652CFE9C65
      2EFE9C6531FD9C6731FD9D6734FD9A6835FC774F27EE21130886000000000000
      00151F1FA9EA2020B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020
      B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020B9FF2020
      B9FF2020B9FF1F1FA9EA00000016000000000000000000000000000000000000
      000000000000150B04227F441DC9B27C59FFCCAD99FFD0B29EFFD2B39FFFD3B5
      A0FFD4B5A1FFD4B5A1FF3D200DFF45240EFF502A10FF5D3012FF6A3715FF7846
      25FF705A4AB30000000000000000000000006F5949B2784725FF6D3915FF6133
      13FF542C11FF48260FFF40230EFFD2B697FFD0B495FFD0B494FFCEB293FFCDB0
      91FFCBAF91FFB6855FFF7F451DCA160B05230000000000000000000000000000
      00000B0501481C1205822716079A271706A0281908A1291908A22F1B0AB9633F
      1BF2B17333FFBF782BFFBD7426FFBC701EFFB97126FF925E29FE41270ED42919
      09A7271909A0271909A02616089E23150792160C036B03010024000000000000
      000E000000160000001800000018000000180000001800000018000000180000
      0018000000180000001800000018000000180000001800000018000000180000
      001800000018000000160000000F000000000000000000000000000000000000
      0000000000000000000003010005572E1389A8683FFDCEAD96FFD9BDAAFFDABE
      AAFFDABEABFFDABEABFF4D2911FF010000030100000300000002000000020000
      0002000000000000000000000000000000000000000000000002000000020000
      00020000000201000003522D14FFD8C0A3FFD6BD9EFFD6BC9DFFD5BC9CFFCDB1
      93FFAA6E43FE582F148B03020006000000000000000000000000000000000000
      0000000000060000000E0000001400000019010000190100001D0B0501525234
      17DFB37535FFBF792DFFBE772AFFBD7222FFBA7226FF8F5B29FC201406930100
      002B010000190100001901000018000000120000000C00000004000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C180A468F5026E8C1997EFFE2C7
      B6FFE2C7B6FFE2C7B6FF603415FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000673B1DFFE1CCB0FFDEC7A8FFDEC8A9FFC3A182FF8C50
      28E82D180A470000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004090501405134
      17DCB37537FFC07A30FFBF782CFFBE7426FFBA7327FF905C29FB1E1106860000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E0703176C3917B9AD7A
      59FFE6CBB9FFECD2C1FF743F1BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007D4925FFEAD9BDFFE4D0B2FFAF825FFF6A3818BB0E07
      0318000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040705013B5134
      17DBB47638FFC17B32FFC0792EFFBF7629FFBA7429FF8E5C28FB1D1205840000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010000024625
      0F769D5F37FAC7A187FF9F6F4FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A633FFFC5A184FF9D643CFA45250F78010000020000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040703013B5033
      16DAB37739FFC17D33FFC17A2FFFBF782BFFBB752AFF8E5B28FB1D1005830000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002112073686583BC27D6C6098000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006060606B3A8A0C5824F2DC52212073700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004070301384D31
      16D5B4783AFFC27E37FFC17C33FFC07A2FFFBA752BFF8A5927FA1B10057B0000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000003030303010101010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002030100263622
      0FB2A06D39FCB87D42FFB77C40FFB5793BFFAD7133FE6B441EE8110903590000
      0008000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000C120C
      025B513821CA735233EA725331ED644627E6482F14CD21140684030100220000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000580000002C0000000100010000000000100200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFF0000000000000FFFFFFFF
      FFF0000000000000800006000010000000000000800006000010000000000000
      8000060000100000000000008000060000100000000000008000060000100000
      0000000080000600001000000000000080000600001000000000000080000600
      0010000000000000800006000010000000000000800006000010000000000000
      8000060000100000000000008000060000100000000000008000060000100000
      0000000080000600001000000000000080000600001000000000000080000600
      0010000000000000FFFFFFFFFFF0000000000000FFFFFFFFFFF0000000000000
      FFFFFFFFFFF0000000000000FFFFFFFFFFF0000000000000FFFFFFFFFFFFF03F
      FFFFFF00FFFFFFFFFFFFE03FFFFFFF00FFF9FFFCFFFFE03FFFFFFF00FFF1FFFC
      7FFFE01FFFFFFF00FFC1FFFC1FFFE01FFFFFFF00FF81FFFC0FFFE01FFFFFFF00
      FF01FFFC07FFE01FFFFFFF00FC00070001FFE01FFFFFFF00F800070000F00000
      70000300E00007000030000030000300C00007000010000030000300C0000700
      0010000030000300E00007000030000030000300F800070000F0000030000300
      FC00070001F80000FFFFFF00FE01FFFC03FFE01FFFFFFF00FF81FFFC0FFFE01F
      FFFFFF00FFC1FFFC1FFFE01FFFFFFF00FFF1FFFC7FFFE01FFFFFFF00FFF9FFFC
      FFFFE03FFFFFFF00FFFFFFFFFFFFE03FFFFFFF00FFFFFFFFFFFFF03FFFFFFF00
      00000000000000000000000000000000000000000000}
  end
end
