object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'TFileInfo'
  ClientHeight = 628
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    756
    628)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 38
    Width = 65
    Height = 13
    Caption = 'Display Type:'
  end
  object sButton1: TButton
    Left = 673
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = sButton1Click
  end
  object ExportBtn: TButton
    Left = 8
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Export'
    TabOrder = 0
    OnClick = ExportBtnClick
  end
  object FilePathEdit: TJvFilenameEdit
    Left = 8
    Top = 8
    Width = 740
    Height = 21
    OnAfterDialog = FilePathEditAfterDialog
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Text = ''
  end
  object DisplayModeList: TComboBox
    Left = 79
    Top = 35
    Width = 186
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Field - Value List (Default)'
    OnChange = DisplayModeListChange
    Items.Strings = (
      'Field - Value List (Default)'
      'Plain Text List'
      'Tree View')
  end
  object FullInfoModeBtn: TCheckBox
    Left = 651
    Top = 39
    Width = 97
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Full info mode'
    TabOrder = 4
    OnClick = FullInfoModeBtnClick
  end
  object DisplayPages: TPageControl
    Left = 8
    Top = 57
    Width = 740
    Height = 532
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsFlatButtons
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object InfoList: TListView
        Left = 0
        Top = 0
        Width = 732
        Height = 501
        Align = alClient
        Columns = <
          item
            Caption = 'Field'
          end
          item
            Caption = 'Value'
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawItem = InfoListAdvancedCustomDrawItem
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object InfoMemo: TMemo
        Left = 0
        Top = 0
        Width = 732
        Height = 501
        Align = alClient
        ReadOnly = True
        ScrollBars = ssHorizontal
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object InfoTree: TTreeView
        Left = 0
        Top = 0
        Width = 732
        Height = 501
        Align = alClient
        Indent = 19
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 89
    Top = 595
    Width = 160
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Register to right click menu'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 255
    Top = 595
    Width = 160
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Unregister from right click menu'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 421
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'About'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 502
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Home'
    TabOrder = 9
    OnClick = Button4Click
  end
  object JvDragDrop1: TJvDragDrop
    DropTarget = Owner
    OnDrop = JvDragDrop1Drop
    Left = 128
    Top = 136
  end
  object ExportDialog: TSaveDialog
    Filter = 'Text Files|*.txt|CSV Files|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 48
    Top = 136
  end
  object Info: TJvComputerInfoEx
    Left = 228
    Top = 132
  end
  object UpdateChecker: TJvHttpUrlGrabber
    FileName = 'output.txt'
    OutputMode = omStream
    Agent = 'JEDI-VCL'
    Port = 0
    ProxyAddresses = 'proxyserver'
    ProxyIgnoreList = '<local>'
    OnDoneStream = UpdateCheckerDoneStream
    Left = 387
    Top = 138
  end
  object UpdateThread: TJvThread
    Exclusive = True
    MaxCount = 0
    RunOnCreate = True
    FreeOnTerminate = True
    OnExecute = UpdateThreadExecute
    Left = 304
    Top = 136
  end
end
