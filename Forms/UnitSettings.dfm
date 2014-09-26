object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 186
  ClientWidth = 288
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
    288
    186)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 272
    Height = 139
    ActivePage = TabSheet5
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CheckUpdateBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 129
        Height = 17
        Caption = 'Check updates on start'
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Playback'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PlayCursorBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 137
        Height = 17
        Caption = 'Playback follows cursor'
        TabOrder = 0
      end
      object PlayJumpBtn: TCheckBox
        Left = 16
        Top = 39
        Width = 137
        Height = 17
        Caption = 'Jump to played file'
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Cover'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LoadArtBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 201
        Height = 17
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
        ItemIndex = 0
        TabOrder = 1
        Text = 'External cover art first'
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LyricBtn: TCheckBox
        Left = 16
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Show lyrics'
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
        Left = 16
        Top = 39
        Width = 169
        Height = 17
        Caption = 'Log if lyric downloader fails'
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 205
    Top = 153
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
