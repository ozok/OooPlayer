unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sSkinProvider,
  sSkinManager, Vcl.ComCtrls, sListView, Vcl.StdCtrls, Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sToolEdit, MediaInfoDll, Pipes, JvComponentBase, JvDragDrop,
  sButton, sDialogs;

type
  TMainForm = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    FilePathEdit: TsFilenameEdit;
    InfoList: TsListView;
    PipeClient1: TPipeClient;
    JvDragDrop1: TJvDragDrop;
    sButton1: TsButton;
    ExportBtn: TsButton;
    ExportDialog: TsSaveDialog;
    procedure PipeClient1PipeMessage(Sender: TObject; Pipe: HPIPE; Stream: TStream);
    procedure FilePathEditAfterDialog(Sender: TObject; var Name: string; var Action: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure InfoListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure FormResize(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure sButton1Click(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
  private
    { Private declarations }

    procedure GetFileInfo(const FilePath: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
{ TMainForm }

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
  GetFileInfo(Name);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not PipeClient1.Connect(2000, True) then
  begin
    ShowMessage('not ocnn');
  end;
  if not MediaInfoDLL_Load('mediainfo.dll') then
  begin
    Application.MessageBox('Unable to load mediainfo.dll!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  sSkinManager1.SkinDirectory := ExtractFileDir(Application.ExeName) + '\skins';
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  InfoList.Columns[0].Width := 150;
  InfoList.Columns[1].Width := InfoList.ClientWidth - InfoList.Columns[0].Width - 20;
end;

procedure TMainForm.GetFileInfo(const FilePath: string);
var
  MediaInfoHandle: Cardinal;
  i: Integer;
  DotPos: Integer;
  Line: string;
  LItem: TListItem;
  LInfoLines: TStringList;
begin
  if (FileExists(FilePath)) then
  begin
    LInfoLines := TStringList.Create;
    try
      // New handle for mediainfo
      MediaInfoHandle := MediaInfo_New();
      if MediaInfoHandle <> 0 then
      begin
        try
          // Open a file in complete mode
          MediaInfo_Open(MediaInfoHandle, PwideChar(FilePath));
          MediaInfo_Option(0, 'Complete', '');
          LInfoLines.Text := string(MediaInfo_Inform(MediaInfoHandle, 0));
          if LInfoLines.Count > 0 then
          begin
            for I := 0 to LInfoLines.Count - 1 do
            begin
              Application.ProcessMessages;
              Line := LInfoLines[i];
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
          MediaInfo_Close(MediaInfoHandle);
        end;
      end;
    finally
      LInfoLines.Free;
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
  GetFileInfo(Value[0]);
end;

procedure TMainForm.PipeClient1PipeMessage(Sender: TObject; Pipe: HPIPE; Stream: TStream);
var
  Msg: string;
  LSkinName: string;
  I: Integer;
begin
  SetLength(Msg, Stream.Size div SizeOf(WideChar));
  Stream.Position := 0;
  Stream.Read(Msg[1], Stream.Size);
  if Msg.StartsWith('Skin') then
  begin
    LSkinName := Msg.Replace('Skin:', '', []);
    if LSkinName = 'none' then
    begin
      sSkinManager1.Active := False;
    end
    else
    begin
      sSkinManager1.Active := True;
      sSkinManager1.SkinName := LSkinName;
    end;
  end
  else if Msg.StartsWith('Hue') then
  begin
    sSkinManager1.HueOffset := Msg.Replace('Hue:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Brig') then
  begin
    sSkinManager1.Brightness := Msg.Replace('Brig:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Sat') then
  begin
    sSkinManager1.Saturation := Msg.Replace('Sat:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Active') then
  begin
    Self.BringToFront;
  end
  else if Msg.StartsWith('FileInfo') then
  begin
    GetFileInfo(Msg.Replace('FileInfo:', '', []));
    FilePathEdit.Text := Msg.Replace('FileInfo:', '', []);
  end;
end;

procedure TMainForm.sButton1Click(Sender: TObject);
begin
  Self.Close;
end;

end.

