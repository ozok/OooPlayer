unit UnitLyricDownloader;

interface

uses System.Classes, IdBaseComponent, IdThreadComponent, StrUtils, SysUtils, IdThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes, dialogs;

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
    FLyricSourceIndex: integer;
    FLyricPageLink: string;

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
  START_STR_BAT = '<pre id="from_pre">';
  END_STR_BAT = '<pre id="to_pre" style="display';
  BAT_SPAN = '<span style="font-size';
  METRO_START = '<div id="lyrics-body-text">';
  METRO_END = '<div id="selected-song-meaning-open" unselectable="on" style="display:none;">';
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
      FLogLine := 'Failed to download lyric from ' + FPageDownloader.Url;
      FThread.Synchronize(AddToLog);
    end;
    FStatus := lsError;
  end
  else
  begin
    LAddToLyricFile := False;
    LSR := TStreamReader.Create(Stream);
    try
      case FLyricSourceIndex of
        0: // az
          begin
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
          end;
        1: // bat
          begin
            while not LSR.EndOfStream do
            begin
              LLine := Trim(LSR.ReadLine);
              if Copy(LLine, 1, Length(START_STR_BAT)) = START_STR_BAT then
              begin
                LAddToLyricFile := True;
              end
              else if Copy(LLine, 1, Length(END_STR_BAT)) = END_STR_BAT then
              begin
                Break;
              end;
              if LAddToLyricFile then
              begin
                if Copy(LLine, 1, Length(BAT_SPAN)) <> BAT_SPAN then
                begin
                  FLyricFile.Add(Trim(FixLine(LLine)));
                end;
              end;
            end;
          end;
        2: // metro
          begin
            while not LSR.EndOfStream do
            begin
              LLine := Trim(LSR.ReadLine);
              if LLine = METRO_START then
              begin
                LAddToLyricFile := True;
              end
              else if LLine = METRO_END then
              begin
                Break;
              end;
              if LAddToLyricFile then
              begin
                FLyricFile.Add(Trim(FixLine(LLine)));
              end;
            end;
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
        try
          FLyricFile.SaveToFile(FLyricFolder + MainForm.CreateLyricFileName(Title, Artist, Album), TEncoding.UTF8);
        except
          on E: EFCreateError do
          begin
            FLyricStatusMsg := 'Loaded downloaded lyric but cannot save to file ' + MainForm.CreateLyricFileName(Title, Artist, Album) + '.txt';
            FThread.Synchronize(UpdateLyricStatus);
          end;
        end;
      end;
    end
    else
    begin
      FLyricStatusMsg := 'Could not found any lyrics';
      FThread.Synchronize(UpdateLyricStatus);
      if SettingsForm.LogLyricFailBtn.Checked then
      begin
        FLogLine := 'Failed to download lyric from ' + FPageDownloader.Url;
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
  FThread.Synchronize(EnableUIControls);
end;

function TLyricDownloader.FixLine(const Str: string): string;
begin
  Result := Str;

  Result := Trim(StringReplace(Result, '<div id="lyrics-body-text">', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</p><p class=''verse''>', #13#10, [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<p class=''verse''>', #13#10, [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</p>	</div>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<br />', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</i>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<!-- start of lyrics -->', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<pre id="from_pre">', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '</pre>', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<p class=''''verse''''> ', '', [rfReplaceAll]));
  Result := Trim(StringReplace(Result, '<br/>', '', [rfReplaceAll]));

  Result := Trim(Result)
end;

function TLyricDownloader.FixStrings(const Str: string): string;
begin
  case FLyricSourceIndex of
    0: // azlyrics
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
    1: // batlyrics
      begin
        Result := LowerCase(StringReplace(Str, ' & ', 'and', [rfReplaceAll]));
        Result := LowerCase(StringReplace(Result, ' ', '_', [rfReplaceAll]));
        Result := LowerCase(StringReplace(Result, 'Ö', 'o', [rfReplaceAll]));
        Result := LowerCase(StringReplace(Result, 'ö', 'o', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, ',', '', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, '!', '', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, '?', '', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, '[', '', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, ']', '', [rfReplaceAll]));
        Result := Trim(StringReplace(Result, '.', '', [rfReplaceAll]));
      end;
    2: // metrolyrics
      begin
        Result := LowerCase(StringReplace(Str, ' & ', '-', [rfReplaceAll]));
        Result := LowerCase(StringReplace(Result, ' ', '-', [rfReplaceAll]));
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
        Result := Trim(StringReplace(Result, '.', '', [rfReplaceAll]));
      end;
  end;
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
  FLyricSourceIndex := MainForm.LyricSourceList.ItemIndex;
  case FLyricSourceIndex of
    0:
      FPageDownloader.Url := 'http://www.azlyrics.com/lyrics/' + FixStrings(FArtist) + '/' + FixStrings(FSongName) + '.html';
    1:
      FPageDownloader.Url := 'http://batlyrics.net/' + FixStrings(FSongName) + '-lyrics-' + FixStrings(FArtist) + '.html';
    2:
      FPageDownloader.Url := 'http://www.metrolyrics.com/' + FixStrings(FSongName) + '-lyrics-' + FixStrings(FArtist) + '.html';
  end;
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
