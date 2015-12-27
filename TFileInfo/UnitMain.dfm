object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'TFileInfo'
  ClientHeight = 628
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    635
    628)
  PixelsPerInch = 96
  TextHeight = 13
  object InfoList: TListView
    Left = 8
    Top = 35
    Width = 619
    Height = 554
    Anchors = [akLeft, akTop, akRight, akBottom]
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
  object sButton1: TButton
    Left = 552
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = sButton1Click
  end
  object ExportBtn: TButton
    Left = 8
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Export'
    TabOrder = 1
    OnClick = ExportBtnClick
  end
  object FilePathEdit: TJvFilenameEdit
    Left = 8
    Top = 8
    Width = 619
    Height = 21
    OnAfterDialog = FilePathEditAfterDialog
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = ''
  end
  object PipeClient1: TPipeClient
    MemoryThrottle = 10240000
    PipeName = 'OooPlayerPipe'
    OnPipeMessage = PipeClient1PipeMessage
    Left = 320
    Top = 264
  end
  object JvDragDrop1: TJvDragDrop
    AcceptDrag = False
    DropTarget = Owner
    OnDrop = JvDragDrop1Drop
    Left = 368
    Top = 384
  end
  object ExportDialog: TSaveDialog
    Filter = 'Text Files|*.txt|CSV Files|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 128
    Top = 224
  end
end
