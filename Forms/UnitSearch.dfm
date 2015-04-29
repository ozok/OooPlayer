object SearchForm: TSearchForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Search'
  ClientHeight = 478
  ClientWidth = 787
  Color = 3485741
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    787
    478)
  PixelsPerInch = 96
  TextHeight = 13
  object ResultsLbl: TsLabel
    Left = 0
    Top = 465
    Width = 787
    Height = 13
    Align = alBottom
    ExplicitWidth = 3
  end
  object QueryEdit: TLabeledEdit
    Left = 48
    Top = 10
    Width = 650
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Query:'
    EditLabel.Layout = tlBottom
    LabelPosition = lpLeft
    TabOrder = 0
    OnKeyDown = QueryEditKeyDown
    OnMouseEnter = QueryEditMouseEnter
    ExplicitWidth = 498
  end
  object SearchBtn: TsButton
    Left = 704
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Search'
    TabOrder = 1
    OnClick = SearchBtnClick
    SkinData.SkinSection = 'BUTTON'
    ExplicitLeft = 552
  end
  object ResultsList: TsListView
    Left = 8
    Top = 39
    Width = 771
    Height = 397
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 722950
    Columns = <
      item
        Caption = 'Title'
      end
      item
        Alignment = taCenter
        Caption = 'Duration'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12102048
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = ListMenu
    ShowColumnHeaders = False
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = ResultsListClick
    OnDblClick = ResultsListDblClick
    ExplicitWidth = 619
    ExplicitHeight = 223
  end
  object chkCloseOnPlayBtn: TsCheckBox
    Left = 8
    Top = 451
    Width = 250
    Height = 19
    Caption = 'Close this window if a result is selected to play'
    Anchors = [akLeft, akBottom]
    Checked = True
    State = cbChecked
    TabOrder = 3
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object ListMenu: TPopupMenu
    Left = 312
    Top = 152
    object A1: TMenuItem
      Caption = 'Add to queue'
      OnClick = A1Click
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 456
    Top = 144
  end
end
