object SearchForm: TSearchForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Search'
  ClientHeight = 304
  ClientWidth = 635
  Color = clBtnFace
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
    635
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object ResultsLbl: TLabel
    Left = 0
    Top = 291
    Width = 635
    Height = 13
    Align = alBottom
    ExplicitWidth = 3
  end
  object QueryEdit: TLabeledEdit
    Left = 48
    Top = 10
    Width = 498
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Query:'
    EditLabel.Layout = tlBottom
    LabelPosition = lpLeft
    TabOrder = 0
    OnKeyDown = QueryEditKeyDown
  end
  object SearchBtn: TButton
    Left = 552
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Search'
    TabOrder = 1
    OnClick = SearchBtnClick
  end
  object ResultsList: TListView
    Left = 8
    Top = 39
    Width = 619
    Height = 246
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Title'
      end
      item
        Alignment = taCenter
        Caption = 'Duration'
        Width = 80
      end>
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = ResultsListClick
    OnDblClick = ResultsListDblClick
  end
end
