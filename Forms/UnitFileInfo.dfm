object InfoForm: TInfoForm
  Left = 0
  Top = 0
  Caption = 'File Info'
  ClientHeight = 562
  ClientWidth = 784
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    784
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TsPageControl
    Left = 8
    Top = 8
    Width = 766
    Height = 517
    ActivePage = sTabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object sTabSheet1: TsTabSheet
      Caption = 'Tags'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object TagsList: TsListView
        Left = 0
        Top = 0
        Width = 758
        Height = 489
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
        Align = alClient
        Color = 2038810
        Columns = <
          item
            Caption = 'Tag Field'
          end
          item
            Caption = 'Value'
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        OnResize = TagsListResize
      end
    end
    object TabSheet2: TsTabSheet
      Caption = 'Details'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object InfoList: TsTreeView
        Left = 0
        Top = 0
        Width = 758
        Height = 489
        Align = alClient
        BorderStyle = bsNone
        Color = 2038810
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13417908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        Indent = 19
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
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
      end
    end
  end
  object Button1: TsButton
    Left = 699
    Top = 531
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 384
    Top = 288
  end
end
