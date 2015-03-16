{ *
  * Copyright (C) 2014-2015 ozok <ozok26@gmail.com>
  *
  * This file is part of OooPlayer.
  *
  * OooPlayer is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
  * (at your option) any later version.
  *
  * OooPlayer is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with OooPlayer.  If not, see <http://www.gnu.org/licenses/>.
  *
  * }
unit UnitArtistInfo;

interface

uses System.Classes, IdBaseComponent, IdThreadComponent, StrUtils, SysUtils, IdThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes, Rest.Utils, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerStream, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, System.Types, WinApi.Windows, VCL.Graphics, VCL.Imaging.jpeg;

type
  TArtistInfoStatus = (lsDownloading = 0, lsDone = 1, lsError = 2, lsIdle = 3);

type
  TWikiInfo = record
    Title: string;
    Origin: string;
    Genre: string;
    Years: string;
  end;

type
  TArtistInfo = class
  private
    FThread: TIdThreadComponent;
    FPageDownloader: TIdHTTP;
    FImageDownloader: TIdHTTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    FArtist: string;
    FStatus: TArtistInfoStatus;
    FWikiOutput: string;
    FStatusText: string;
    FLogLine: string;
    FRecDepthCounter: integer;
    FPageList: TStringList;
    FImageStream: TMemoryStream;
    FAppdata: string;

    // thread events
    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);

    procedure WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);

    procedure UpdateMainUI;
    procedure UpdateLyricStatus;
    procedure AddToLog;
    procedure EnableUIControls;
    procedure Error(Sender: TObject; ErrorMsg: string);
    procedure LoadArtistImg;

    function GetPageAsString(const Artist: string): string;
  public
    property Artist: string read FArtist write FArtist;
    property Status: TArtistInfoStatus read FStatus;
    property Output: string read FWikiOutput;
    property AppData: string read FAppdata write FAppdata;

    procedure Start(const Artist: string);
    procedure Stop;

    constructor Create();
    destructor Destroy; override;
  end;

const
  REQUEST_URL = 'http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=%s&api_key=0a5674077da2782718075412eab00800';

implementation

{ TArtistInfo }

uses UnitMain, UnitLog, UnitSettings;

procedure TArtistInfo.AddToLog;
begin
  LogForm.LogList.Lines.Add(FLogLine);
end;

constructor TArtistInfo.Create();
begin
  FStatus := lsIdle;

  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;

  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FPageDownloader := TIdHTTP.Create(nil);
  with FPageDownloader do
  begin
    OnWorkBegin := WorkBegin;
    OnWork := Work;
    IOHandler := FSSLHandler;
    Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0';
  end;

  FPageList := TStringList.Create;
  FImageStream := TMemoryStream.Create;
end;

destructor TArtistInfo.Destroy;
begin
  try
    FThread.Free;
  except

  end;
  FPageDownloader.Free;
  FSSLHandler.Free;
  FPageList.Free;
  FImageStream.Free;
end;

procedure TArtistInfo.EnableUIControls;
begin

end;

procedure TArtistInfo.Error(Sender: TObject; ErrorMsg: string);
begin
  FStatus := lsError;
  FStatusText := 'Lyric downloader error msg: ' + ErrorMsg;
  FThread.Synchronize(UpdateLyricStatus);
  try
    FThread.Synchronize(UpdateLyricStatus);
  except

  end;
  try
    FThread.Synchronize(EnableUIControls);
  except

  end;
end;

function TArtistInfo.GetPageAsString(const Artist: string): string;
var
  LPos1, LPos2: integer;
  LImageURL: string;
  LSplitList: TStringList;
  I: Integer;
begin
  try
    Inc(FRecDepthCounter);
    Result := FPageDownloader.Get(Format(REQUEST_URL, [URIEncode(Artist)]));
    LPos1 := Pos('<summary>', Result);
    LPos2 := Pos('</summary>', Result);
    FWikiOutput := Result.Substring(LPos1 + 9, LPos2 - LPos1 - 10).Replace('<![CDATA[', '').Replace(']]>', '').Trim;

    LSplitList := TStringList.Create;
    try
      LSplitList.Text := Result;
      for I := 0 to LSplitList.Count - 1 do
      begin
        if LSplitList[i].Trim.StartsWith('<image size="extralarge">') then
        begin
          LImageURL := LSplitList[i].Trim.Replace('<image size="extralarge">', '').Replace('</image>', '').Trim;
        end;
      end;
    finally
      LSplitList.Free;
    end;
    if LImageURL.Length > 0 then
    begin
      if LImageURL.StartsWith('http') then
      begin
        try

          FPageDownloader.Get(LImageURL, FImageStream);
          FThread.Synchronize(LoadArtistImg);
        except
          on E: Exception do
          begin

            LogForm.LogList.Lines.Add(E.Message);
          end;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      FStatusText := 'Error while getting info page ' + E.Message;
      LogForm.LogList.Lines.Add(FPageDownloader.URL.GetFullURI());
      FThread.Synchronize(UpdateLyricStatus);
    end;
  end;
end;

procedure TArtistInfo.LoadArtistImg;
var
  LJPEG: TJPEGImage;
begin
  if FImageStream.Size > 0 then
  begin
    if FileExists(FAppdata + '\artist.jpg') then
      SysUtils.DeleteFile(FAppdata + '\artist.jpg');

    FImageStream.SaveToFile(FAppdata + '\artist.jpg');
    LJPEG := TJPEGImage.Create;
    try
    try

      LJPEG.LoadFromStream(FImageStream);// LoadFromFile(FAppdata + '\artist.jpg');
      LJPEG.DIBNeeded;
      MainForm.BandImage.Picture.Assign(LJPEG);
    except on E: Exception do
    end;
    finally
      LJPEG.Free;
    end;

  end
  else
  begin
    LogForm.LogList.Lines.Add('stem: ' + FImageStream.Size.ToString());
  end;
end;

procedure TArtistInfo.Start(const Artist: string);
begin
  FStatus := lsDownloading;
  FArtist := Artist;
  FRecDepthCounter := 0;
  if 'the ' = LowerCase(Copy(FArtist, 1, 4)) then
  begin
    FArtist := Trim(Copy(FArtist, 4, Maxint))
  end;
  FWikiOutput := '';
  try
    FThread.Start;
  except
    on E: Exception do
    begin
      FStatus := lsDone;
    end;
  end;
end;

procedure TArtistInfo.Stop;
begin
  if not FThread.Stopped then
  begin
    try
      FThread.Terminate;
    except

    end;
    FStatus := lsDone;
  end;
end;

procedure TArtistInfo.ThreadRun(Sender: TIdThreadComponent);
var
  LWikiInfo: TWikiInfo;
begin
  FStatusText := 'Searching...';
  FThread.Synchronize(UpdateLyricStatus);
  try
    FThread.Synchronize(UpdateLyricStatus);
  except

  end;

  GetPageAsString(FArtist);
  FThread.Synchronize(UpdateMainUI);

  try
    FThread.Terminate;
  except

  end;
end;

procedure TArtistInfo.ThreadStopped(Sender: TIdThreadComponent);
begin
  FStatus := lsDone;
end;

procedure TArtistInfo.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FStatus := lsDone;
end;

procedure TArtistInfo.UpdateLyricStatus;
begin
  // MainForm.WikiStatusLabel.Caption := FStatusText;
end;

procedure TArtistInfo.UpdateMainUI;
begin
  MainForm.HtmlViewer1.LoadFromString(FWikiOutput);
end;

procedure TArtistInfo.Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin

end;

procedure TArtistInfo.WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin

end;

end.
