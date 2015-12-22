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
unit UnitArtworkReader;

interface

uses
  Classes, SysUtils, IdBaseComponent, IdThreadComponent, IdThread, UnitTagTypes,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, UnitImageResize, UnitTagReader,
  UnitArtworkInfo;

type
  TArtworkReader = class
  private
    FThread: TIdThreadComponent;
    FResizeThread: TIdThreadComponent;
    FInfoUpdateThread: TIdThreadComponent;
    FSongPath: string;
    FJpeg: TJPEGImage;
    FPng: TPngImage;
    FExternalArtworkFiles: TStringList;
    FExternalArtworkIndex: integer;
    FTempCoverPath: string;
    FCoverArtFileToLoad: string;
    FDefaultImgPath: string;
    FBusy: Boolean;
    FTagReader: TTagReader;
    FAppDataFolder: string;
    FCoverType: TCoverArtType;
    FCoverStream: TStream;
    FCoverArtInfoStr: string;
    FArtworkInfo: TArtworkInfo;
    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
    procedure ResizeThreadRun(Sender: TIdThreadComponent);
    procedure ResizeThreadStopped(Sender: TIdThreadComponent);
    procedure ResizeThreadTerminate(Sender: TIdThreadComponent);
    procedure InfoThreadRun(Sender: TIdThreadComponent);
    procedure InfoThreadStopped(Sender: TIdThreadComponent);
    procedure InfoThreadTerminate(Sender: TIdThreadComponent);
    procedure LoadCoverArt;
    function LoadExternalCoverArt(const FileName: string): Boolean;
    function LoadInternalCoverArt(const FileName: string): Boolean;
    procedure LoadPicFromStream(const Stream: TStream; const PicType: TCoverArtType);
    function ListExternalArtworkFiles(const Dir: string): string;
    procedure LoadCoverFile;
    procedure LoadCoverFromMemory;
    procedure ResizeCoverArtToLoad(const CoverArtPath: string);
    procedure SetAppData(const Value: string);
    procedure UpdateInfo;
  public
    property IsBusy: Boolean read FBusy;
    property SongPath: string read FSongPath write FSongPath;
    property ExternalArtworkFiles: TStringList read FExternalArtworkFiles;
    property DefaultImgPath: string read FDefaultImgPath write FDefaultImgPath;
    property AppDataFolder: string read FAppDataFolder write SetAppData;
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure LoadNextExternalCoverArt;
    procedure LoadPrevExternalCoverArt;
  end;

implementation

uses
  UnitMain, UnitSettings, UnitLog;

{ TArtworkReader }

constructor TArtworkReader.Create;
begin
  FThread := TIdThreadComponent.Create(nil);
  FThread.Priority := tpIdle;
  FThread.StopMode := smSuspend;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;

  FResizeThread := TIdThreadComponent.Create(nil);
  FResizeThread.Priority := tpIdle;
  FResizeThread.StopMode := smSuspend;
  FResizeThread.OnRun := ResizeThreadRun;
  FResizeThread.OnStopped := ResizeThreadStopped;
  FResizeThread.OnTerminate := ResizeThreadTerminate;

  FInfoUpdateThread := TIdThreadComponent.Create(nil);
  FInfoUpdateThread.Priority := tpIdle;
  FInfoUpdateThread.StopMode := smSuspend;
  FInfoUpdateThread.OnRun := InfoThreadRun;
  FInfoUpdateThread.OnStopped := InfoThreadStopped;
  FInfoUpdateThread.OnTerminate := InfoThreadTerminate;

  FBusy := False;
  FTagReader := TTagReader.Create;
  FCoverStream := TStream.Create;
  FExternalArtworkFiles := TStringList.Create;
  FJpeg := TJPEGImage.Create;
  FPng := TPngImage.Create;
  FArtworkInfo := TArtworkInfo.Create;
end;

destructor TArtworkReader.Destroy;
begin
  FThread.Free;
  FInfoUpdateThread.Free;
  FResizeThread.Free;
  FTagReader.Free;
  FExternalArtworkFiles.Free;
  FCoverStream.Free;
  FJpeg.Free;
  FPng.Free;
  FArtworkInfo.Free;
  inherited;
end;

procedure TArtworkReader.InfoThreadRun(Sender: TIdThreadComponent);
begin
  FInfoUpdateThread.Synchronize(UpdateInfo);
  FInfoUpdateThread.Terminate;
end;

procedure TArtworkReader.InfoThreadStopped(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

procedure TArtworkReader.InfoThreadTerminate(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

function TArtworkReader.ListExternalArtworkFiles(const Dir: string): string;
var
  Search: TSearchRec;
  FileName: string;
  Extension: string;
begin
  Result := '';
  if DirectoryExists(Dir) then
  begin
    if (FindFirst(Dir + '\*.*', faAnyFile, Search) = 0) then
    begin
      repeat
        if (Search.Name <> '.') and (Search.Name <> '..') then
        begin
          FileName := Dir + '\' + Search.Name;

          Extension := LowerCase(ExtractFileExt(FileName));
          if (Extension = '.jpg') or (Extension = '.jpeg') or (Extension = '.png') or (Extension = '.bmp') or (Extension = '.gif') then
          begin
            FExternalArtworkFiles.Add(FileName);
          end;
        end;
      until (FindNext(Search) <> 0);
      FindClose(Search);
    end;
  end;
end;

procedure TArtworkReader.LoadCoverArt;
begin
  FBusy := False;
  FExternalArtworkFiles.Clear;
  case SettingsForm.CoverArtList.ItemIndex of
    0: // external
      begin
        if not LoadExternalCoverArt(FSongPath) then
        begin
          LoadInternalCoverArt(FSongPath)
        end;
      end;
    1: // internal first
      begin
        if not LoadInternalCoverArt(FSongPath) then
        begin
          LoadExternalCoverArt(FSongPath)
        end;
      end;
  end;
end;

procedure TArtworkReader.LoadCoverFromMemory;
begin
  case FCoverType of
    none:
      begin
        FCoverArtFileToLoad := FDefaultImgPath;
        FCoverArtInfoStr := '';
        FThread.Synchronize(LoadCoverFile);
        FInfoUpdateThread.Start;
      end;
    jpeg:
      begin
        MainForm.CoverImage.Picture.Assign(FJpeg);
        FInfoUpdateThread.Start;
      end;
    png:
      begin
        MainForm.CoverImage.Picture.Assign(FPng);
        FInfoUpdateThread.Start;
      end;
    bmp:
      begin
        MainForm.CoverImage.LoadFromStream(FCoverStream);
        FInfoUpdateThread.Start;
      end;
    gif:
      begin
        MainForm.CoverImage.Picture.Assign(FJpeg);
        FInfoUpdateThread.Start;
      end;
  end;
end;

procedure TArtworkReader.LoadCoverFile;
begin
  if FileExists(FCoverArtFileToLoad) then
  begin
    MainForm.CoverImage.Picture.LoadFromFile(FCoverArtFileToLoad);
  end;
end;

function TArtworkReader.LoadExternalCoverArt(const FileName: string): Boolean;
var
  LImageFile: string;
  LImgResizer: TImageResizer;
begin
  Result := False;
  // populate external cover files list
  FExternalArtworkFiles.Clear;
  ListExternalArtworkFiles(ExtractFileDir(FileName));
  LogForm.LogList.Lines.AddStrings(FExternalArtworkFiles);
  FExternalArtworkIndex := -1;
  // if some files are found
  // resize them and load the first one
  if FExternalArtworkFiles.Count > 0 then
  begin
    FExternalArtworkIndex := 0;
    LImageFile := FExternalArtworkFiles[0];
    LImgResizer := TImageResizer.Create;
    try
      // resize the image and load it to the main form
      if (LowerCase(ExtractFileExt(LImageFile)) = '.jpg') or (LowerCase(ExtractFileExt(LImageFile)) = '.jpeg') then
      begin
        LImgResizer.ResizeJpgEx(LImageFile, FTempCoverPath + '.jpg');
        if FileExists(FTempCoverPath + '.jpg') then
        begin
          FCoverArtFileToLoad := FTempCoverPath + '.jpg';
          FArtworkInfo.FileName := LImageFile;
          FCoverArtInfoStr := FArtworkInfo.InfoStr;
          FThread.Synchronize(LoadCoverFile);
          FInfoUpdateThread.Start;
        end;
      end
      else if LowerCase(ExtractFileExt(LImageFile)) = '.png' then
      begin
        LImgResizer.ResizePNGEx(LImageFile, FTempCoverPath + '.png');
        if FileExists(FTempCoverPath + '.png') then
        begin
          FCoverArtFileToLoad := FTempCoverPath + '.png';
          FArtworkInfo.FileName := LImageFile;
          FCoverArtInfoStr := FArtworkInfo.InfoStr;
          FThread.Synchronize(LoadCoverFile);
          FInfoUpdateThread.Start;
        end;
      end;
      // todo: for other formats
    finally
      LImgResizer.Free;
    end;
    Result := True;
  end
  else
  begin
    FCoverArtFileToLoad := FDefaultImgPath;
    FCoverArtInfoStr := '';
    FThread.Synchronize(LoadCoverFile);
    FInfoUpdateThread.Start;
  end;
end;

function TArtworkReader.LoadInternalCoverArt(const FileName: string): Boolean;
begin
  Result := False;
  if not FBusy then
  begin
    // read cover art
    FTagReader.ReadArtwork(FileName);
  end
  else
  begin
    // if busy from a previous read
    // just load the default image
    FCoverArtFileToLoad := FDefaultImgPath;
    FCoverArtInfoStr := '';
    FThread.Synchronize(LoadCoverFile);
    FInfoUpdateThread.Start;
    Exit;
  end;

  // load internal cover art
  if FTagReader.PicType <> none then
  begin
    LoadPicFromStream(FTagReader.PicStream, FTagReader.PicType);
    Result := True;
  end
  else
  begin
    FCoverArtFileToLoad := FDefaultImgPath;
    FCoverArtInfoStr := '';
    FThread.Synchronize(LoadCoverFile);
    FInfoUpdateThread.Start;
  end;
end;

procedure TArtworkReader.LoadNextExternalCoverArt;
begin
  if FExternalArtworkFiles.Count > 0 then
  begin
    if (FExternalArtworkIndex + 1) < FExternalArtworkFiles.Count then
    begin
      Inc(FExternalArtworkIndex);
      FCoverArtFileToLoad := FExternalArtworkFiles[FExternalArtworkIndex];
      FArtworkInfo.FileName := FCoverArtFileToLoad;
      FCoverArtInfoStr := FArtworkInfo.InfoStr;
      FResizeThread.Start;
      FInfoUpdateThread.Start;
    end;
  end;
end;

procedure TArtworkReader.LoadPicFromStream(const Stream: TStream; const PicType: TCoverArtType);
var
  LImgResizer: TImageResizer;
  LTmpFile: string;
begin
  if PicType = none then
  begin
    // default image incase of no image
    FCoverArtFileToLoad := FDefaultImgPath;
    FCoverArtInfoStr := '';
    FThread.Synchronize(LoadCoverFile);
    FInfoUpdateThread.Start;
  end
  else if PicType = TCoverArtType.jpeg then
  begin
    try
      LImgResizer := TImageResizer.Create;
      try
        LTmpFile := FAppDataFolder + '\cover.jpg';
        LImgResizer.ResizeJpgStream(Stream, LTmpFile);
        FCoverArtInfoStr := FArtworkInfo.ReadFromStream(Stream);
        FJpeg.LoadFromFile(LTmpFile);
        FJpeg.DIBNeeded;
        FCoverType := jpeg;
        if not FJpeg.Empty then
        begin
          FThread.Synchronize(LoadCoverFromMemory);
          FInfoUpdateThread.Start;
        end;
      finally
        LImgResizer.Free;
      end;
    except
      on E: Exception do
      begin
        FCoverArtFileToLoad := FDefaultImgPath;
        FCoverArtInfoStr := '';
        FThread.Synchronize(LoadCoverFile);
        FInfoUpdateThread.Start;
      end;
    end;
  end
  else if PicType = png then
  begin
    try
      LImgResizer := TImageResizer.Create;
      try
        LTmpFile := FAppDataFolder + '\cover.png';
        LImgResizer.ResizePngStream(Stream, LTmpFile);
        FCoverArtInfoStr := FArtworkInfo.ReadFromStream(Stream);
        FPng.LoadFromFile(LTmpFile);
        FCoverType := png;
        if not FPng.Empty then
        begin
          FThread.Synchronize(LoadCoverFromMemory);
          FInfoUpdateThread.Start;
        end;
      finally
        LImgResizer.Free;
      end;
    except
      on E: Exception do
      begin
        FCoverArtFileToLoad := FDefaultImgPath;
        FCoverArtInfoStr := '';
        FThread.Synchronize(LoadCoverFile);
        FInfoUpdateThread.Start;
      end;
    end;
  end
  else if PicType = bmp then
  begin
    if Stream.Size > 0 then
    begin
      try
        FCoverType := bmp;
        FCoverStream.CopyFrom(Stream, Stream.Size);
        FCoverArtInfoStr := FArtworkInfo.ReadFromStream(Stream);
        FThread.Synchronize(LoadCoverFromMemory);
      except
        on E: Exception do
        begin
          FCoverArtFileToLoad := FDefaultImgPath;
          FCoverArtInfoStr := '';
          FThread.Synchronize(LoadCoverFile);
          FInfoUpdateThread.Start;
        end;
      end;
    end;
  end;
end;

procedure TArtworkReader.LoadPrevExternalCoverArt;
begin
  if FExternalArtworkFiles.Count > 0 then
  begin
    if FExternalArtworkIndex > 0 then
    begin
      Dec(FExternalArtworkIndex);
      FCoverArtFileToLoad := FExternalArtworkFiles[FExternalArtworkIndex];
      FArtworkInfo.FileName := FCoverArtFileToLoad;
      FCoverArtInfoStr := FArtworkInfo.InfoStr;
      FResizeThread.Start;
      FInfoUpdateThread.Start;
    end;
  end;
end;

procedure TArtworkReader.ResizeCoverArtToLoad(const CoverArtPath: string);
var
  LImgResizer: TImageResizer;
begin
  LImgResizer := TImageResizer.Create;
  try
    if (LowerCase(ExtractFileExt(CoverArtPath)) = '.jpg') or (LowerCase(ExtractFileExt(CoverArtPath)) = '.jpeg') then
    begin
      LImgResizer.ResizeJpgEx(CoverArtPath, FTempCoverPath + '.jpg');
      if FileExists(FTempCoverPath + '.jpg') then
      begin
        FCoverArtFileToLoad := FTempCoverPath + '.jpg';
        FThread.Synchronize(LoadCoverFile);
      end;
    end
    else if LowerCase(ExtractFileExt(CoverArtPath)) = '.png' then
    begin
      LImgResizer.ResizePNGEx(CoverArtPath, FTempCoverPath + '.png');
      if FileExists(FTempCoverPath + '.png') then
      begin
        FCoverArtFileToLoad := FTempCoverPath + '.png';
        FThread.Synchronize(LoadCoverFile);
      end;
    end;
    // todo: for other formats
  finally
    LImgResizer.Free;
  end;

end;

procedure TArtworkReader.ResizeThreadRun(Sender: TIdThreadComponent);
begin
  FBusy := True;
  try
    if FileExists(FCoverArtFileToLoad) then
    begin
      ResizeCoverArtToLoad(FCoverArtFileToLoad);
      FThread.Synchronize(LoadCoverFile);
    end;
  finally
    FBusy := False;
  end;
  FResizeThread.Terminate;
end;

procedure TArtworkReader.ResizeThreadStopped(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

procedure TArtworkReader.ResizeThreadTerminate(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

procedure TArtworkReader.SetAppData(const Value: string);
begin
  FAppDataFolder := Value;
  FArtworkInfo.AppData := FAppDataFolder;
end;

procedure TArtworkReader.Start;
begin
  FBusy := True;
  FTempCoverPath := FAppDataFolder + '\cover';
  FThread.Start;
end;

procedure TArtworkReader.ThreadRun(Sender: TIdThreadComponent);
begin
  FBusy := True;
  try
    if FileExists(FSongPath) then
    begin
      MainForm.ArtworkFileName := SongPath;
      FThread.Synchronize(LoadCoverArt);
    end;
  finally
    FBusy := False;
  end;
  FThread.Terminate;
end;

procedure TArtworkReader.ThreadStopped(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

procedure TArtworkReader.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FBusy := False;
end;

procedure TArtworkReader.UpdateInfo;
begin
  MainForm.CoverArtInfoLabel.Caption := FCoverArtInfoStr;
end;

end.

