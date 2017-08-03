{ *
  * Copyright (C) 2014-2017 ozok <ozok26@gmail.com>
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
unit UnitArtworkInfo;

interface

uses
  Classes, Windows, SysUtils, Messages, StrUtils, UnitTagTypes, MediaInfoDll;

type
  TArtworkInfo = class
  private
    FFileName: string;
    FAppDataFolder: string;
    function GetInfo: string;
  public
    property InfoStr: string read GetInfo;
    property FileName: string read FFileName write FFileName;
    property AppData: string read FAppDataFolder write FAppDataFolder;
    constructor Create;
    destructor Destroy; override;
    function ReadFromStream(const Stream: TStream): string;
  end;

implementation

{ TArtworkInfo }

constructor TArtworkInfo.Create;
begin

end;

destructor TArtworkInfo.Destroy;
begin

  inherited;
end;

function TArtworkInfo.GetInfo: string;
var
  LMediaInfoHandle: Cardinal;
  LImageFormat: string;
  LDimension: string;
  LBitDepth: string;
begin
  Result := '';
  LMediaInfoHandle := MediaInfo_New;
  if LMediaInfoHandle <> 0 then
  begin
    MediaInfo_Open(LMediaInfoHandle, PWideChar(FFileName));
    MediaInfo_Option(0, 'Complete', '');

    LImageFormat := MediaInfo_Get(LMediaInfoHandle, Stream_Image, 0, 'Format', Info_Text, Info_Name);
    LBitDepth := MediaInfo_Get(LMediaInfoHandle, Stream_Image, 0, 'BitDepth/String', Info_Text, Info_Name);
    LDimension := string(MediaInfo_Get(LMediaInfoHandle, Stream_Image, 0, 'Width', Info_Text, Info_Name)) + 'x' + string(MediaInfo_Get(LMediaInfoHandle, Stream_Image, 0, 'Height', Info_Text, Info_Name));

    Result := LowerCase(LImageFormat + ', ' + LDimension + ', ' + LBitDepth);
  end;
end;

function TArtworkInfo.ReadFromStream(const Stream: TStream): string;
var
  LMS: TMemoryStream;
begin
  LMS := TMemoryStream.Create;
  try
    LMS.LoadFromStream(Stream);
    if FileExists(FAppDataFolder + '\tmp') then
    begin
      DeleteFile(FAppDataFolder + '\tmp')
    end;
    LMS.SaveToFile(FAppDataFolder + '\tmp');
    FFileName := FAppDataFolder + '\tmp';
    Result := GetInfo;
  finally
    LMS.Free;
  end;
end;

end.

