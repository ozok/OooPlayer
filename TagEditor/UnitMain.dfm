object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OooTagEditor'
  ClientHeight = 562
  ClientWidth = 1224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 289
    Height = 501
    ActivePage = sTabSheet1
    Align = alLeft
    TabOrder = 0
    object sTabSheet1: TTabSheet
      Caption = 'Tags'
      object sPanel1: TPanel
        Left = 0
        Top = 436
        Width = 281
        Height = 37
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          281
          37)
        object ApplyBtn: TButton
          Left = 196
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Save'
          Enabled = False
          TabOrder = 0
          OnClick = ApplyBtnClick
        end
        object ReloadBtn: TButton
          Left = 8
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Reload'
          TabOrder = 1
        end
      end
      object TitleEdit: TEdit
        Left = 3
        Top = 24
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = TitleEditChange
      end
      object ArtistEdit: TEdit
        Left = 3
        Top = 64
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = TitleEditChange
      end
      object AlbumArtistEdit: TEdit
        Left = 3
        Top = 104
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = TitleEditChange
      end
      object AlbumEdit: TEdit
        Left = 3
        Top = 144
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = TitleEditChange
      end
      object DateEdit: TEdit
        Left = 3
        Top = 184
        Width = 70
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = TitleEditChange
      end
      object TrackEdit: TEdit
        Left = 79
        Top = 184
        Width = 70
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = TitleEditChange
      end
      object ComposerEdit: TEdit
        Left = 3
        Top = 224
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = TitleEditChange
      end
      object CommentEdit: TEdit
        Left = 3
        Top = 267
        Width = 275
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnChange = TitleEditChange
      end
      object GenreList: TComboBox
        Left = 155
        Top = 184
        Width = 123
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Text = 'GenreList'
        OnChange = TitleEditChange
      end
    end
  end
  object FileList: TListView
    Left = 289
    Top = 40
    Width = 935
    Height = 501
    Align = alClient
    Columns = <
      item
        Caption = 'File Name'
        Width = 150
      end
      item
        Caption = 'Tag Type'
        Width = 100
      end
      item
        Caption = 'Title'
        Width = 150
      end
      item
        Caption = 'Artist'
        Width = 150
      end
      item
        Caption = 'Album'
        Width = 150
      end
      item
        Caption = 'Album Artist'
        Width = 150
      end
      item
        Caption = 'Genre'
        Width = 150
      end
      item
        Caption = 'Track'
        Width = 150
      end
      item
        Caption = 'Comment'
        Width = 150
      end>
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
    StateImages = ImageList1
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = FileListClick
    OnData = FileListData
  end
  object sStatusBar1: TStatusBar
    Left = 0
    Top = 541
    Width = 1224
    Height = 21
    Panels = <
      item
        Text = 'OooTagEditor 1.0 Beta'
        Width = 50
      end>
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 1224
    Height = 40
    Align = alTop
    TabOrder = 3
    object AddFileBtn: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 32
      Align = alLeft
      Caption = 'Add Files'
      TabOrder = 0
    end
    object RemoveSelectedBtn: TBitBtn
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 32
      Align = alLeft
      Caption = 'Remove'
      TabOrder = 1
    end
    object RemoveAllBtn: TBitBtn
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 32
      Align = alLeft
      Caption = 'Remove All'
      TabOrder = 2
    end
    object AboutBtn: TBitBtn
      AlignWithMargins = True
      Left = 1145
      Top = 4
      Width = 75
      Height = 32
      Align = alRight
      Caption = 'About...'
      TabOrder = 3
    end
  end
  object JvDragDrop1: TJvDragDrop
    DropTarget = Owner
    OnDrop = JvDragDrop1Drop
    Left = 328
    Top = 200
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 192
    object F1: TMenuItem
      Caption = 'File'
      object A1: TMenuItem
        Caption = 'Add'
      end
      object R1: TMenuItem
        Caption = 'Remove'
        ShortCut = 46
      end
      object R2: TMenuItem
        Caption = 'Remove All'
        ShortCut = 8238
      end
    end
    object T1: TMenuItem
      Caption = 'Tags'
      object S1: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
      end
      object R3: TMenuItem
        Caption = 'Reload'
        ShortCut = 16466
      end
    end
    object A2: TMenuItem
      Caption = 'About'
    end
  end
  object ImageList1: TImageList
    Height = 22
    Width = 22
    Left = 608
    Top = 296
  end
end
