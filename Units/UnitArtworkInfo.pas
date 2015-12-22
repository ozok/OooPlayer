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

