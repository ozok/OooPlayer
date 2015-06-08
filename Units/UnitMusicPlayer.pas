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
unit UnitMusicPlayer;

interface

uses System.Classes, BASS, BASS_AAC, BASSFLAC, BassWMA, BASSWV, BASS_AC3,
  BASS_ALAC, BASS_APE, BASS_MPC, BASS_OFR, BASS_SPX, BASS_TTA, BassOPUS,
  Windows, SysUtils, StrUtils, Generics.Collections, MediaInfoDll, Bassmix;

type
  TPlayerStatus = (psPlaying = 0, psPaused = 1, psStopped = 2, psStalled = 3, psUnkown = 4);

type
  TEQValues = array [0 .. 17] of single;

type
  TLevels = record
    Left, Right: Cardinal;
  end;

type
  TMusicPlayer = class
  private
    FBassHandle: HSTREAM;
    FPlayerStatus: TPlayerStatus;
    FErrorMsg: integer;
    FFileName: string;
    FVolumeLevel: integer;
    FPositionAsSec: integer;
    FTAKPluginHandle: Cardinal;
    FMixHandle: HSTREAM;
    FPosition: int64;
    FFXHandle: Cardinal;
    FEQParams: array [0 .. 17] of HFX;

    function GetBassStreamStatus: TPlayerStatus;
    function GetTotalLength(): int64;
    function GetPosition(): int64;
    function GetPositionStr: string;
    function GetSecondDuration: Integer;

    function IsM4AALAC: Boolean;
    function GetBassErrorCode: Integer;
    function GetMixerPlayStatus: TPlayerStatus;
  public
    property PlayerStatus: TPlayerStatus read FPlayerStatus;
    property PlayerStatus2: TPlayerStatus read GetBassStreamStatus;
    property MixerPlayStatus: TPlayerStatus read GetMixerPlayStatus;
    property ErrorMsg: Integer read FErrorMsg;
    property FileName: string read FFileName write FFileName;
    property TotalLength: int64 read GetTotalLength;
    property Position: int64 read GetPosition;
    property PositionStr: string read GetPositionStr;
    property DurationAsSec: integer read GetSecondDuration;
    property PositionAsSec: integer read FPositionAsSec;
    property Channel: Cardinal read FBassHandle;
    property BassErrorCode: Integer read GetBassErrorCode;
    property MixHandle: HSTREAM read FMixHandle;
    // property Levels: TLevels read FLevels;

    constructor Create(const WinHandle: Cardinal);
    destructor Destroy; override;

    procedure Play;
    procedure Stop;
    procedure Pause;
    procedure Resume;
    procedure SetVolume(const Volume: integer);
    function SetPosition(const Position: int64): Boolean;
    function IntToTime(IntTime: Integer): string;
    procedure SetBuffer(const Buffer: DWORD);
    procedure ChangeEQ(const EQValues: TEQValues);
//    procedure RemoveEQ;
    procedure InitQE;
  end;

const
  MY_ERROR_OK = 0;
  MY_ERROR_BASS_NOT_LOADED = 1;
  MY_ERROR_COULDNT_STOP_STREAM = 2;
  MY_ERROR_STREAM_ZERO = 3;
  MY_ERROR_COULDNT_FREE_STREAM = 4;
  LEVEL_MAX = 32768;
  UPDATE_LEVEL = 14;
  WM_COPYDATA = 74;
  EQ_FRENQ: array [0 .. 17] of integer = (31, 63, 87, 125, 175, 250, 350, 500, 700, 1000, 1400, 2000, 2800, 4000, 5600, 8000, 11000, 16000);

implementation

{ TMusicPlayer }

uses UnitMain, UnitSettings, UnitLog, UnitEQ;

// procedure SyncProc(hSync: Thandle; hChan: THandle; NotUsed: DWord; MyObject: DWord); stdcall;
procedure SyncProc(hSync: Thandle; hChan: HSTREAM; NotUsed: DWORD; MyObject: DWORD); stdcall;
var
  LRndIndex: integer;
begin
  with MainForm do
  begin
    case PlaybackOrderList.ItemIndex of
      0: // normal
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;
          // if playlist is not empty
          if PlayList.Items.Count > 0 then
          begin
            // first try queue
            if FQueueLists[FSelectedPlaylistIndex].Count > 0 then
            begin
              // play first queue item
              PlayItem(FQueueLists[FSelectedPlaylistIndex][0]);
            end
            else
            begin
              // playback follows selection
              if SettingsForm.PlayCursorBtn.Checked then
              begin
                // try selected file
                if PlayList.ItemIndex > -1 then
                begin
                  // if not last played item selected
                  if PlayList.ItemIndex <> FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
                  begin
                    PlayItem(PlayList.ItemIndex);
                  end
                  else
                  begin
                    // if last played item selected then try next item
                    if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                    begin
                      PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                    end
                    else
                    begin
                      PlayItem(0);
                    end;
                  end;
                end
                else
                begin
                  // play next item
                  if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                  begin
                    PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                  end;
                end;
              end
              else
              begin
                // ignore selection and try next song
                if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                begin
                  PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                end;
              end;
            end;
          end
          else
          begin
            // empty playlist
            FPlayer.Stop;
          end;
        end;
      1: // random
        begin
          if PlayList.Items.Count > 0 then
          begin
            Randomize;
            LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
            PositionTimer.Enabled := False;
            ProgressTimer.Enabled := PositionTimer.Enabled;
            PlayItem(LRndIndex);
          end
          else
          begin
            // empty playlist
            FPlayer.Stop;
          end;
        end;
      2: // repeat track
        begin
          if PlayList.Items.Count > 0 then
          begin
            PositionTimer.Enabled := False;
            ProgressTimer.Enabled := PositionTimer.Enabled;
            try
              if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
              begin
                PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
              end;
            finally
              PositionTimer.Enabled := True;
              ProgressTimer.Enabled := PositionTimer.Enabled;
            end;
          end
          else
          begin
            // empty playlist
            FPlayer.Stop;
          end;
        end;
      3: // shuffle
        begin
          if PlayList.Items.Count > 0 then
          begin
            PositionTimer.Enabled := False;
            ProgressTimer.Enabled := PositionTimer.Enabled;
            try
              if FShuffleIndex + 1 < FShuffleIndexes.Count then
              begin
                FShuffleIndex := 1 + FShuffleIndex;
                if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
                begin
                  PlayItem(FShuffleIndexes[FShuffleIndex]);
                end;
              end;
            finally
              PositionTimer.Enabled := True;
              ProgressTimer.Enabled := PositionTimer.Enabled;
            end;
          end
          else
          begin
            // empty playlist
            FPlayer.Stop;
          end;
        end;
    end;
  end;
  SendMessage(WinHandle, WM_INFO_UPDATE, PLAY_NEXT_SONG, 0);
  BASS_ChannelSetPosition(FPlayer.MixHandle, 0, BASS_POS_BYTE);
end;

procedure TMusicPlayer.ChangeEQ(const EQValues: TEQValues);
var
  I: Integer;
  LEQ: BASS_DX8_PARAMEQ;
begin
  for I := Low(EQValues) to High(EQValues) do
  begin
    BASS_FXGetParameters(FEQParams[i], @LEQ);
    LEQ.fGain := EQValues[i];
    BASS_FXSetParameters(FEQParams[i], @LEQ);
  end;
end;

constructor TMusicPlayer.Create(const WinHandle: Cardinal);
begin
  FPlayerStatus := psStopped;
  FErrorMsg := MY_ERROR_OK;
  if not BASS_Init(1, 44100, 0, WinHandle, nil) then
  begin
    FErrorMsg := MY_ERROR_BASS_NOT_LOADED;
  end;
  FTAKPluginHandle := BASS_PluginLoad('bass_tak2.4.dll', BASS_UNICODE);
  if FTAKPluginHandle < 1 then
  begin
    FErrorMsg := MY_ERROR_BASS_NOT_LOADED;
  end;

  BASS_SetConfig(BASS_CONFIG_FLOATDSP, 1);
  // BASS_SetConfig(BASS_CONFIG_ASYNCFILE_BUFFER, 131072);
  // BASS_SetConfig(BASS_CONFIG_BUFFER, 2000);

  FMixHandle := BASS_Mixer_StreamCreate(44100, 2, BASS_MIXER_END or BASS_MIXER_BUFFER);
  BASS_ChannelSetSync(FMixHandle, BASS_SYNC_END or BASS_SYNC_MIXTIME, 0, @SyncProc, nil);
  // BASS_Mixer_ChannelFlags(FMixHandle, BASS_CONFIG_MIXER_BUFFER, 4);
end;

destructor TMusicPlayer.Destroy;
begin
  if FTAKPluginHandle > 0 then
  begin
    BASS_PluginFree(FTAKPluginHandle)
  end;
  BASS_StreamFree(FBassHandle);
  BASS_Free();
  inherited;
end;

function TMusicPlayer.GetBassErrorCode: Integer;
begin
  Result := BASS_ErrorGetCode;
end;

function TMusicPlayer.GetBassStreamStatus: TPlayerStatus;
begin
  case BASS_ChannelIsActive(FMixHandle) of
    BASS_ACTIVE_STOPPED:
      Result := psStopped;
    BASS_ACTIVE_PLAYING:
      Result := psPlaying;
    BASS_ACTIVE_STALLED:
      Result := psStalled;
    BASS_ACTIVE_PAUSED:
      Result := psPaused;
  else
    Result := psUnkown;
  end;
end;

function TMusicPlayer.GetMixerPlayStatus: TPlayerStatus;
begin
  case BASS_ChannelIsActive(FMixHandle) of
    BASS_ACTIVE_STOPPED:
      Result := psStopped;
    BASS_ACTIVE_PLAYING:
      Result := psPlaying;
    BASS_ACTIVE_STALLED:
      Result := psStalled;
    BASS_ACTIVE_PAUSED:
      Result := psPaused;
  else
    Result := psUnkown;
  end;
end;

function TMusicPlayer.GetPosition: int64;
begin
  Result := 0;
  if FBassHandle > 0 then
  begin
    Result := BASS_ChannelGetPosition(FBassHandle, BASS_POS_BYTE);
    FPosition := Result;
  end;
end;

function TMusicPlayer.GetPositionStr: string;
begin
  if FBassHandle > 0 then
  begin
    FPositionAsSec := Round(BASS_ChannelBytes2Seconds(FBassHandle, BASS_ChannelGetPosition(FBassHandle, BASS_POS_BYTE)));
    Result := IntToTime(FPositionAsSec);
  end;
end;

function TMusicPlayer.GetSecondDuration: Integer;
begin
  Result := 0;
  if FBassHandle > 0 then
  begin
    Result := Round(BASS_ChannelBytes2Seconds(FBassHandle, BASS_ChannelGetLength(FBassHandle, BASS_POS_BYTE)));
  end;
end;

function TMusicPlayer.GetTotalLength: int64;
begin
  Result := 0;
  if FBassHandle > 0 then
  begin
    Result := BASS_ChannelGetLength(FBassHandle, BASS_POS_BYTE);
  end;
end;

procedure TMusicPlayer.InitQE;
var
  LEQ: BASS_DX8_PARAMEQ;
  I: Integer;
begin
//  RemoveEQ;
  for i := Low(EQ_FRENQ) to High(EQ_FRENQ) do
  begin
    FEQParams[i] := 0;
  end;
  for i := Low(EQ_FRENQ) to High(EQ_FRENQ) do
  begin
    FEQParams[i] := BASS_ChannelSetFX(FBassHandle, BASS_FX_DX8_PARAMEQ, 13);

    case BASS_ErrorGetCode of
      BASS_ERROR_HANDLE:
        LogForm.LogList.Lines.Add('Cant''t create equalizer because of invalid handle.');
      BASS_ERROR_ILLTYPE:
        LogForm.LogList.Lines.Add('Cant''t create equalizer because of illegal type.');
      BASS_ERROR_NOFX:
        LogForm.LogList.Lines.Add('Cant''t create equalizer because of DirectX error.');
      BASS_ERROR_FORMAT:
        LogForm.LogList.Lines.Add('Cant''t create equalizer because of format error.');
      BASS_ERROR_UNKNOWN:
        LogForm.LogList.Lines.Add('Cant''t create equalizer because of an unkown error.');
    end;

    LEQ.fGain := 0;
    LEQ.fBandwidth := 3;
    LEQ.fCenter := EQ_FRENQ[i];
    if not BASS_FXSetParameters(FEQParams[i], @LEQ) then
    begin
      LogForm.LogList.Lines.Add('EQ error: Unable to set params for freq: ' + FEQParams[i].ToString());
    end;
  end;
end;

function TMusicPlayer.IntToTime(IntTime: Integer): string;
var
  hour: Integer;
  second: Integer;
  minute: Integer;
  strhour: string;
  strminute: string;
  strsecond: String;
begin

  if (Time > 0) then
  begin

    hour := IntTime div 3600;
    minute := (IntTime div 60) - (hour * 60);
    second := (IntTime mod 60);

    if (second < 10) then
    begin
      strsecond := '0' + FloatToStr(second);
    end
    else
    begin
      strsecond := FloatToStr(second);
    end;

    if (minute < 10) then
    begin
      strminute := '0' + FloatToStr(minute);
    end
    else
    begin
      strminute := FloatToStr(minute);
    end;

    if (hour < 10) then
    begin
      strhour := '0' + FloatToStr(hour);
    end
    else
    begin
      strhour := FloatToStr(hour);
    end;

    Result := strhour + ':' + strminute + ':' + strsecond;
  end
  else
  begin
    Result := '00:00:00';
  end;
end;

function TMusicPlayer.IsM4AALAC: Boolean;
var
  MediaInfoHandle: Cardinal;
  LCodec: string;
begin
  Result := False;
  if (FileExists(FFileName)) then
  begin
    // New handle for mediainfo
    MediaInfoHandle := MediaInfo_New();
    if MediaInfoHandle <> 0 then
    begin
      try
        // Open a file in complete mode
        MediaInfo_Open(MediaInfoHandle, PwideChar(FFileName));
        MediaInfo_Option(0, 'Complete', '1');
        LCodec := Trim(MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Codec', Info_Text, Info_Name));
        Result := 'alac' = LCodec;
      finally
        MediaInfo_Close(MediaInfoHandle);
      end;
    end;
  end;
end;

procedure TMusicPlayer.Pause;
begin
  if GetMixerPlayStatus = psPlaying then
  begin
    if BASS_ChannelPause(FMixHandle) then
      FPlayerStatus := psPaused;
  end;
end;

procedure TMusicPlayer.Play;
var
  LExt: string;
begin
  // free the stream first
  if FBassHandle <> 0 then
  begin
    if not BASS_StreamFree(FBassHandle) then
    begin
      FErrorMsg := MY_ERROR_COULDNT_FREE_STREAM;
      exit;
    end;
  end;
  // create stream according to file extension
  LExt := LowerCase(ExtractFileExt(FFileName));
  if (LExt = '.aac') or (LExt = '.m4b') then
  begin
    FBassHandle := BASS_MP4_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.m4a') then
  begin
    if IsM4AALAC then
    begin
      FBassHandle := BASS_ALAC_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX)
    end
    else
    begin
      FBassHandle := BASS_MP4_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
    end;
  end
  else if (LExt = '.flac') then
  begin
    FBassHandle := BASS_FLAC_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.ape') then
  begin
    FBassHandle := BASS_APE_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.ac3') then
  begin
    FBassHandle := BASS_AC3_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.wv') then
  begin
    FBassHandle := BASS_WV_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.ofr') then
  begin
    FBassHandle := BASS_OFR_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.spx') then
  begin
    FBassHandle := BASS_SPX_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.tta') then
  begin
    FBassHandle := BASS_TTA_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else if (LExt = '.opus') then
  begin
    FBassHandle := BASS_OPUS_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end
  else
  begin
    FBassHandle := Bass_StreamCreateFile(False, PwideChar(FFileName), 0, 0, BASS_UNICODE or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE or BASS_STREAM_PRESCAN or BASS_SAMPLE_FX);
  end;
  if FBassHandle > 0 then
  begin
    BASS_ChannelSetAttribute(FBassHandle, BASS_ATTRIB_VOL, (100 - MainForm.VolumeBar.Position) / 100.0);
    BASS_Mixer_StreamAddChannel(FMixHandle, FBassHandle, BASS_STREAM_AUTOFREE or BASS_MIXER_NORAMPIN or BASS_MIXER_BUFFER);
    BASS_ChannelSetPosition(FMixHandle, 0, BASS_POS_BYTE);

    if BASS_ChannelPlay(FMixHandle, False) then
    begin
      InitQE;
      FErrorMsg := MY_ERROR_OK;
      FPlayerStatus := psPlaying;
    end
    else
    begin
      FErrorMsg := MY_ERROR_STREAM_ZERO;
      FPlayerStatus := psStopped;
    end;
  end
  else
  begin
    FErrorMsg := MY_ERROR_STREAM_ZERO;
  end;
end;

procedure TMusicPlayer.Resume;
begin
  if GetMixerPlayStatus = psPaused then
  begin
    if BASS_ChannelPlay(FMixHandle, False) then
    begin
      FPlayerStatus := psPlaying;
    end;
  end;
end;

procedure TMusicPlayer.SetBuffer(const Buffer: DWORD);
begin
  BASS_SetConfig(BASS_CONFIG_BUFFER, Buffer);
end;

function TMusicPlayer.SetPosition(const Position: int64): Boolean;
begin
  Result := BASS_ChannelSetPosition(FBassHandle, Position, BASS_POS_BYTE);
end;

procedure TMusicPlayer.SetVolume(const Volume: integer);
begin
  if BASS_ChannelSetAttribute(FBassHandle, BASS_ATTRIB_VOL, Volume / 100.0) then
  begin
    FVolumeLevel := Volume;
  end;
end;

procedure TMusicPlayer.Stop;
begin
  if GetBassStreamStatus <> psStopped then
  begin
    if BASS_ChannelStop(FBassHandle) and BASS_ChannelStop(FMixHandle) then
    begin
      FPlayerStatus := psStopped;
    end;
  end;
end;

end.
