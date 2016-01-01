unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, MediaInfoDll, JvComponentBase, JvDragDrop, JvExMask, JvToolEdit,
  System.IniFiles, Registry;

type
  TMainForm = class(TForm)
    JvDragDrop1: TJvDragDrop;
    sButton1: TButton;
    ExportBtn: TButton;
    ExportDialog: TSaveDialog;
    FilePathEdit: TJvFilenameEdit;
    DisplayModeList: TComboBox;
    Label1: TLabel;
    FullInfoModeBtn: TCheckBox;
    DisplayPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    InfoList: TListView;
    InfoMemo: TMemo;
    InfoTree: TTreeView;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FilePathEditAfterDialog(Sender: TObject; var Name: string; var Action: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure InfoListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure FormResize(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure sButton1Click(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DisplayModeListChange(Sender: TObject);
    procedure FullInfoModeBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FFileInfoText: TStringList;
    FFilePath: string;

    // read file as a string
    // this will be used by all others
    function ReadFileInfo(const FilePath: string): string;
    // loads full file according to selected display mode
    procedure LoadFile;
    // parses file info text so it can be displayed on a tlistview
    procedure GetFileInfoForListView(const FilePath: string);
    // writes file info text to memo
    procedure GetFileInfoForMemo(const FilePath: string);
    // parses file info text so it can be displayed on a ttreeview
    procedure GetFileInfoForTreeView(const FilePath: string);

    // setting routines
    procedure LoadSettings;
    procedure SaveSettings;
    // shell extension
    procedure ShellExtensionRegister();
    procedure ShellExtensionUnRegister();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
{ TMainForm }

procedure TMainForm.Button1Click(Sender: TObject);
begin
  ShellExtensionRegister;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  ShellExtensionUnRegister;
end;

procedure TMainForm.DisplayModeListChange(Sender: TObject);
begin
  DisplayPages.ActivePageIndex := DisplayModeList.ItemIndex;
  LoadFile;
end;

procedure TMainForm.ExportBtnClick(Sender: TObject);
var
  LSaveFileName: string;
  LFile: TStringList;
  I: Integer;
begin
  if InfoList.Items.Count > 0 then
  begin
    if ExportDialog.Execute then
    begin
      LSaveFileName := ExportDialog.FileName;
      case ExportDialog.FilterIndex of
        1:
          begin
            LSaveFileName := ChangeFileExt(LSaveFileName, '.txt');
            LFile := TStringList.Create;
            try
              for I := 0 to InfoList.Items.Count - 1 do
              begin
                LFile.Add(InfoList.Items[i].Caption.Trim + ':' + InfoList.Items[i].SubItems[0].Trim);
              end;
              LFile.SaveToFile(LSaveFileName, TEncoding.UTF8);
            finally
              LFile.Free;
            end;
          end;
        2:
          begin
            LSaveFileName := ChangeFileExt(LSaveFileName, '.csv');
            LFile := TStringList.Create;
            try
              LFile.Add('Field;Value');
              for I := 0 to InfoList.Items.Count - 1 do
              begin
                LFile.Add(InfoList.Items[i].Caption.Trim + ';' + InfoList.Items[i].SubItems[0].Trim);
              end;
              LFile.SaveToFile(LSaveFileName, TEncoding.UTF8);
            finally
              LFile.Free;
            end;
          end;
      end;
    end;
  end;
end;

procedure TMainForm.FilePathEditAfterDialog(Sender: TObject; var Name: string; var Action: Boolean);
begin
  FFilePath := Name;
  FFileInfoText.Text := ReadFileInfo(Name);
  LoadFile;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  FFileInfoText := TStringList.Create;
  if not MediaInfoDLL_Load('mediainfo.dll') then
  begin
    Application.MessageBox('Unable to load mediainfo.dll!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  for I := 0 to DisplayPages.PageCount - 1 do
  begin
    DisplayPages.Pages[i].TabVisible := False;
  end;
  DisplayPages.ActivePageIndex := 0;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FFileInfoText.Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  InfoList.Columns[0].Width := 150;
  InfoList.Columns[1].Width := InfoList.ClientWidth - InfoList.Columns[0].Width - 20;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  LoadSettings;
  if ParamCount > 0 then
  begin
    FFileInfoText.Text := ReadFileInfo(ParamStr(1));
    LoadFile;
  end;
end;

procedure TMainForm.FullInfoModeBtnClick(Sender: TObject);
begin
  FFileInfoText.Text := ReadFileInfo(FilePathEdit.Text);
  LoadFile;
end;

procedure TMainForm.GetFileInfoForListView(const FilePath: string);
var
  i: Integer;
  DotPos: Integer;
  Line: string;
  LItem: TListItem;
begin
  FilePathEdit.Text := FilePath;
  if (FileExists(FilePath)) then
  begin
    InfoList.Items.Clear;
    try
      if FFileInfoText.Count > 0 then
      begin
        for I := 0 to FFileInfoText.Count - 1 do
        begin
          Application.ProcessMessages;
          Line := FFileInfoText[i];
          DotPos := Pos(':', Line);
          if DotPos > 0 then
          begin
            LItem := InfoList.Items.Add;
            LItem.Caption := Trim(Copy(Line, 1, DotPos - 1));
            LItem.SubItems.Add(Copy(Line, DotPos + 1, Length(Line)));
          end
          else
          begin
            if Length(Line) > 0 then
            begin
              LItem := InfoList.Items.Add;
              LItem.Caption := Line;
              LItem.SubItems.Add('');
            end;
          end;
        end;
      end;
    finally
      Self.Caption := ExtractFileName(FilePath) + ' - TFileInfo';
    end;
  end;
end;

procedure TMainForm.GetFileInfoForMemo;
var
  i: Integer;
  DotPos: Integer;
  Line: string;
  LItem: TListItem;
begin
  FilePathEdit.Text := FilePath;
  if (FileExists(FilePath)) then
  begin
    InfoMemo.Lines.Clear;
    try
      if FFileInfoText.Count > 0 then
      begin
        InfoMemo.Lines.Text := FFileInfoText.Text;
      end;
    finally
      Self.Caption := ExtractFileName(FilePath) + ' - TFileInfo';
    end;
  end;
end;

procedure TMainForm.GetFileInfoForTreeView(const FilePath: string);
var
  i: Integer;
  DotPos: Integer;
  Line: string;
  LItem: TListItem;
  LNewNode: TTreeNode;
begin
  FilePathEdit.Text := FilePath;
  if (FileExists(FilePath)) then
  begin
    InfoTree.Items.Clear;
    try
      if FFileInfoText.Count > 0 then
      begin
        for I := 0 to FFileInfoText.Count - 1 do
        begin
          Application.ProcessMessages;
          Line := FFileInfoText[i];
          DotPos := Pos(':', Line);
          if DotPos > 0 then
          begin
            InfoTree.Items.AddChild(LNewNode, Trim(Copy(Line, 1, DotPos - 1)) + ':' + Copy(Line, DotPos + 1, Length(Line)));
          end
          else
          begin
            if Length(Line) > 0 then
            begin
              LNewNode := InfoTree.Items.AddChild(nil, Line);
            end;
          end;
        end;
      end;
    finally
      InfoTree.FullExpand;
      Self.Caption := ExtractFileName(FilePath) + ' - TFileInfo';
    end;
  end;
end;

procedure TMainForm.InfoListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if Item.SubItems[0].Length = 0 then
  begin
    Sender.Canvas.Font.Style := [fsBold, fsUnderline];
  end
  else
  begin
    Sender.Canvas.Font.Style := [];
  end;
end;

procedure TMainForm.JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
begin
  FilePathEdit.Text := Value[0];
  GetFileInfoForListView(Value[0]);
end;

procedure TMainForm.LoadFile;
begin
  case DisplayModeList.ItemIndex of
    0: // field-value list
      begin
        GetFileInfoForListView(FFilePath);
      end;
    1: // normal text list
      begin
        GetFileInfoForMemo(FFilePath);
      end;
    2: // treeview
      begin
        GetFileInfoForTreeView(FFilePath);
      end;
  end;
end;

procedure TMainForm.LoadSettings;
var
  LSetFile: TIniFile;
begin
  // todo: portable
  LSetFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\tfileinfo.settings.ini');
  try
    with LSetFile do
    begin
      DisplayModeList.ItemIndex := ReadInteger('general', 'display', 0);
      DisplayPages.ActivePageIndex := DisplayModeList.ItemIndex;
      FullInfoModeBtn.Checked := ReadBool('general', 'full', false);
    end;
  finally
    LSetFile.Free;
  end;
end;

function TMainForm.ReadFileInfo(const FilePath: string): string;
var
  LMediaInfoHandle: Cardinal;
begin
  if (FileExists(FilePath)) then
  begin
    FFilePath := FilePath;
      // New handle for mediainfo
    LMediaInfoHandle := MediaInfo_New();
    if LMediaInfoHandle <> 0 then
    begin
      try
          // Open a file in complete mode
        MediaInfo_Open(LMediaInfoHandle, PwideChar(FilePath));
        if FullInfoModeBtn.Checked then
        begin
          MediaInfo_Option(LMediaInfoHandle, 'Complete', '1');
        end
        else
        begin
          MediaInfo_Option(LMediaInfoHandle, 'Complete', '0');
        end;
        Result := string(MediaInfo_Inform(LMediaInfoHandle, 0));
      finally
        MediaInfo_Close(LMediaInfoHandle);
      end;
    end;
  end;
end;

procedure TMainForm.SaveSettings;
var
  LSetFile: TIniFile;
begin
  // todo: portable
  LSetFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\tfileinfo.settings.ini');
  try
    with LSetFile do
    begin
      WriteInteger('general', 'display', DisplayModeList.ItemIndex);
      WriteBool('general', 'full', FullInfoModeBtn.Checked);
    end;
  finally
    LSetFile.Free;
  end;

end;

procedure TMainForm.sButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TMainForm.ShellExtensionRegister;
var
  LAppPath: string;
begin
  with TRegistry.Create do
  begin
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('*', True) then
      begin
        try
          if OpenKey('shell', True) then
          begin
            if OpenKey('TFileInfo', True) then
            begin
              WriteString('', 'Inspect with TFileInfo');
              WriteString('Icon', '"' + Application.ExeName + '"');
              if OpenKey('command', True) then
              begin
                WriteString('', '"' + Application.ExeName + '" "%1"');
                Application.MessageBox('Register successful.', 'Info', MB_ICONINFORMATION);
              end
              else
              begin
                Application.MessageBox('Cannot register. Error:3', 'Error', MB_ICONERROR);
              end;
            end
            else
            begin
              Application.MessageBox('Cannot register. Error:2', 'Error', MB_ICONERROR);
            end;
          end
          else
          begin
            Application.MessageBox('Cannot register. Error:1', 'Error', MB_ICONERROR);
          end;
        finally
          CloseKey;
        end;
      end
      else
      begin
        Application.MessageBox('Cannot register. Error:0', 'Error', MB_ICONERROR);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TMainForm.ShellExtensionUnRegister;
begin
  with TRegistry.Create do
  begin
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('*', True) then
      begin
        try
          if OpenKey('shell', True) then
          begin
            if DeleteKey('TFileInfo') then
            begin
              Application.MessageBox('Unregister succesfull.', 'Unregister', MB_ICONINFORMATION);
            end
            else
            begin
              Application.MessageBox('Cannot unregister. Error:2', 'Error', MB_ICONERROR);
            end;
          end
          else
          begin
            Application.MessageBox('Cannot unregister. Error:1', 'Error', MB_ICONERROR);
          end;
        finally
          CloseKey;
        end;
      end
      else
      begin
        Application.MessageBox('Cannot unregister. Error:0', 'Error', MB_ICONERROR);
      end;
    finally
      Free;
    end;
  end;
end;

end.

