object ShuffleListForm: TShuffleListForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Shuffle List'
  ClientHeight = 539
  ClientWidth = 967
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    967
    539)
  PixelsPerInch = 96
  TextHeight = 13
  object ShuffleCountLabel: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 523
    Width = 961
    Height = 13
    Align = alBottom
    ExplicitWidth = 3
  end
  object ShuffleList: TListView
    Left = 8
    Top = 8
    Width = 951
    Height = 505
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Title'
      end
      item
        Alignment = taCenter
        Caption = 'Duration'
        Width = 120
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    ShowColumnHeaders = False
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawItem = ShuffleListAdvancedCustomDrawItem
    OnData = ShuffleListData
    OnDblClick = ShuffleListDblClick
  end
end
