unit UnitLyricDownloader;

interface

uses System.Classes, IdBaseComponent, IdThreadComponent, StrUtils, SysUtils, IdThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes;

type
  TLyricDownloaderStatus = (lsDownloading = 0, lsDone = 1, lsError = 2, lsIdle = 3);

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
  public
    property SongTitle: string read FSongName write FSongName;
    property Artist: string read FArtist write FArtist;
    property Album: string read FAlbum write FAlbum;
    property Status: TLyricDownloaderStatus read FStatus;
    property Lyrics: TStringList read FLyricFile;

    procedure Start;
    procedure Stop;

    constructor Create(const LyricFolder: string);
    destructor Destroy;
  end;

implementation

{ TLyricDownloader }

uses UnitMain, UnitLog;

procedure TLyricDownloader.AddToLog;
begin
  LogForm.LogList.Lines.Add(FLogLine);
end;

constructor TLyricDownloader.Create(const LyricFolder: string);
var
  Def: TJvCustomUrlGrabberDefaultProperties;
begin
  FStatus := lsIdle;

  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;

  Def := TJvCustomUrlGrabberDefaultProperties.Create(nil);
  FPageDownloader := TJvHttpUrlGrabber.Create(nil, '', Def);
  with FPageDownloader do
  begin
    OnDoneStream := DoneStream;
    OnError := Error;
    OutputMode := omStream;
    Agent := '';
  end;

  FLyricFolder := LyricFolder;
  FLyricFile := TStringList.Create;
end;

destructor TLyricDownloader.Destroy;
begin
  FThread.Free;
  FPageDownloader.Free;
  FLyricFile.Free;
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
    FLyricFile.Add('Stream is zero');
    FThread.Synchronize(UpdateMainUI);
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
          FLyricFile.Add(FixLine(LLine));
        end;
      end;
    finally
      LSR.Close;
      LSR.Free;
    end;
    FThread.Synchronize(UpdateMainUI);
    if FLyricFile.Count > 1 then
    begin
      FLyricFile.SaveToFile(FLyricFolder + MainForm.CreateLyricFileName(FSongName, FArtist, FAlbum), TEncoding.UTF8);
    end
    else
    begin
      FLyricStatusMsg := 'Could not found any lyrics';
      FThread.Synchronize(UpdateLyricStatus);
      FLogLine := 'Failed to download lyric from ' + 'http://www.azlyrics.com/lyrics/' + FixStrings(FArtist) + '/' + FixStrings(FSongName) + '.html';
      FThread.Synchronize(AddToLog);
    end;
    FStatus := lsDone;
  end;
end;

procedure TLyricDownloader.Error(Sender: TObject; ErrorMsg: string);
begin
  FStatus := lsError;
end;

function TLyricDownloader.FixLine(const Str: string): string;
begin
  Result := Trim(StringReplace(Str, '<br />', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<!-- start of lyrics -->', '', [rfReplaceAll]));
end;

function TLyricDownloader.FixStrings(const Str: string): string;
begin
  Result := LowerCase(StringReplace(Str, ' ', '', [rfReplaceAll]));
  Result := LowerCase(StringReplace(Result, '&', '', [rfReplaceAll]));
end;

procedure TLyricDownloader.Start;
begin
  FStatus := lsDownloading;
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
begin
  MainForm.LyricList.Items.Clear;
  MainForm.LyricList.Items.AddStrings(FLyricFile);
  if FLyricFile.Count > 1 then
  begin
    MainForm.LyricStatusLabel.Caption := 'Loaded downloaded lyric';
  end;
end;

end.
