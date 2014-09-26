unit UnitLyricDownloader;

interface

uses System.Classes, IdBaseComponent, IdThreadComponent, StrUtils, SysUtils, IdThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes;

type
  TLyricDownloaderStatus = (lsDownloading = 0, lsDone = 1, lsError = 2, lsIdle = 3);

type
  TItemInfo = class
    Title, Artist, Album: string;
  end;

type
  TLyricDownloader = class
  private
    FThread: TIdThreadComponent;
    FPageDownloader: TJvHttpUrlGrabber;
    FSongName: string;
    FArtist: string;
    FAlbum: string;
    FStatus: TLyricDownloaderStatus;
    FLyricFile: TStringList;
    FLyricFolder: string;
    FLyricStatusMsg: string;
    FLogLine: string;
    FItemInfo: TItemInfo;
    FDef: TJvCustomUrlGrabberDefaultProperties;

    // thread events
    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);

    procedure DoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; Url: string);
    procedure Error(Sender: TObject; ErrorMsg: string);

    function FixStrings(const Str: string): string;
    function FixLine(const Str: string): string;
    procedure UpdateMainUI;
    procedure UpdateLyricStatus;
    procedure AddToLog;
    procedure EnableUIControls;
  public
    property SongTitle: string read FSongName write FSongName;
    property Artist: string read FArtist write FArtist;
    property Album: string read FAlbum write FAlbum;
    property Status: TLyricDownloaderStatus read FStatus;
    property Lyrics: TStringList read FLyricFile;
    property ItemInfo: TItemInfo read FItemInfo write FItemInfo;

    procedure Start;
    procedure Stop;

    constructor Create(const LyricFolder: string);
    destructor Destroy; override;
  end;

implementation

{ TLyricDownloader }

uses UnitMain, UnitLog, UnitSettings;

procedure TLyricDownloader.AddToLog;
begin
  LogForm.LogList.Lines.Add(FLogLine);
end;

constructor TLyricDownloader.Create(const LyricFolder: string);
begin
  FStatus := lsIdle;

  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;

  FDef := TJvCustomUrlGrabberDefaultProperties.Create(nil);
  FPageDownloader := TJvHttpUrlGrabber.Create(nil, '', FDef);
  with FPageDownloader do
  begin
    OnDoneStream := DoneStream;
    OnError := Error;
    OutputMode := omStream;
    Agent := '';
  end;

  FLyricFolder := LyricFolder;
  FLyricFile := TStringList.Create;
  FItemInfo := TItemInfo.Create;
end;

destructor TLyricDownloader.Destroy;
begin
  FThread.Free;
  FPageDownloader.Free;
  FLyricFile.Free;
  FItemInfo.Free;
  FDef.Free;
end;

procedure TLyricDownloader.DoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; Url: string);
const
  START_STR = '<!-- start of lyrics -->';
  END_STR = '<!-- end of lyrics -->';
var
  LSR: TStreamReader;
  LLine: string;
  LAddToLyricFile: Boolean;
begin
  if Stream.Size = 0 then
  begin
    FLyricStatusMsg := 'Downloaded file is empty';
    FThread.Synchronize(UpdateLyricStatus);
    if SettingsForm.LogLyricFailBtn.Checked then
    begin
      FLogLine := 'Failed to download lyric from ' + 'http://www.azlyrics.com/lyrics/' + FixStrings(FArtist) + '/' + FixStrings(FSongName) + '.html';
      FThread.Synchronize(AddToLog);
    end;
    FStatus := lsError;
  end
  else
  begin
    LAddToLyricFile := False;
    LSR := TStreamReader.Create(Stream);
    try
      while not LSR.EndOfStream do
      begin
        LLine := Trim(LSR.ReadLine);
        if LLine = START_STR then
        begin
          LAddToLyricFile := True;
        end
        else if LLine = END_STR then
        begin
          Break;
        end;
        if LAddToLyricFile then
        begin
          FLyricFile.Add(Trim(FixLine(LLine)));
        end;
      end;
    finally
      LSR.Close;
      LSR.Free;
    end;
    FThread.Synchronize(UpdateMainUI);
    if FLyricFile.Count > 1 then
    begin
      with FItemInfo do
      begin
        FLyricFile.SaveToFile(FLyricFolder + MainForm.CreateLyricFileName(Title, Artist, Album), TEncoding.UTF8);
      end;
    end
    else
    begin
      FLyricStatusMsg := 'Could not found any lyrics';
      FThread.Synchronize(UpdateLyricStatus);
      if SettingsForm.LogLyricFailBtn.Checked then
      begin
        FLogLine := 'Failed to download lyric from ' + 'http://www.azlyrics.com/lyrics/' + FixStrings(FArtist) + '/' + FixStrings(FSongName) + '.html';
        FThread.Synchronize(AddToLog);
      end;
    end;
    FThread.Synchronize(EnableUIControls);
    FStatus := lsDone;
  end;
end;

procedure TLyricDownloader.EnableUIControls;
begin
  with MainForm do
  begin
    LyricTitleEdit.Text := FSongName;
    LyricArtistEdit.Text := FArtist;
    FLyricAlbumStr := FAlbum;
    LyricSearchBtn.Enabled := True;
    LyricArtistEdit.Enabled := True;
    LyricTitleEdit.Enabled := True;
  end;
end;

procedure TLyricDownloader.Error(Sender: TObject; ErrorMsg: string);
begin
  FStatus := lsError;
  FLyricStatusMsg := 'Lyric downloader error msg: ' + ErrorMsg;
  FThread.Synchronize(UpdateLyricStatus);
end;

function TLyricDownloader.FixLine(const Str: string): string;
begin
  Result := Trim(StringReplace(Str, '<br />', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<!-- start of lyrics -->', '', [rfReplaceAll]));

  Result := Trim(Result)
end;

function TLyricDownloader.FixStrings(const Str: string): string;
begin
  Result := LowerCase(StringReplace(Str, ' ', '', [rfReplaceAll]));
  Result := LowerCase(StringReplace(Result, '&', '', [rfReplaceAll]));
  Result := LowerCase(StringReplace(Result, 'Ö', 'o', [rfReplaceAll]));
  Result := LowerCase(StringReplace(Result, 'ö', 'o', [rfReplaceAll]));
  Result := LowerCase(StringReplace(Result, '''', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, ',', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '!', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '?', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '(', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, ')', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '[', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, ']', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '-', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '.', '', [rfReplaceAll]));
end;

procedure TLyricDownloader.Start;
begin
  FStatus := lsDownloading;
  if 'the ' = LowerCase(Copy(FArtist, 1, 4)) then
  begin
    FArtist := Trim(Copy(FArtist, 4, Maxint))
  end;
  FLyricFile.Clear;
  FThread.Start;
end;

procedure TLyricDownloader.Stop;
begin
  if not FThread.Stopped then
  begin
    FThread.Terminate;
    FStatus := lsDone;
  end;
end;

procedure TLyricDownloader.ThreadRun(Sender: TIdThreadComponent);
begin
  FPageDownloader.Url := 'http://www.azlyrics.com/lyrics/' + FixStrings(FArtist) + '/' + FixStrings(FSongName) + '.html';
  FPageDownloader.Start;
  while FPageDownloader.Status <> gsStopped do
  begin
    Sleep(100);
  end;
  FThread.Terminate;
end;

procedure TLyricDownloader.ThreadStopped(Sender: TIdThreadComponent);
begin
  FStatus := lsDone;
end;

procedure TLyricDownloader.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FStatus := lsDone;
end;

procedure TLyricDownloader.UpdateLyricStatus;
begin
  MainForm.LyricStatusLabel.Caption := FLyricStatusMsg;
end;

procedure TLyricDownloader.UpdateMainUI;
var
  I: Integer;
begin
  MainForm.LyricList.Items.Clear;
  for I := 0 to FLyricFile.Count - 1 do
  begin
    MainForm.LyricList.Items.Add(Trim(FLyricFile[i]));
  end;
  if FLyricFile.Count > 1 then
  begin
    MainForm.LyricStatusLabel.Caption := 'Loaded downloaded lyric';
  end;
end;

end.
