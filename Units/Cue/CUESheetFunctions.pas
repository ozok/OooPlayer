//********************************************************************************************************************************
//*                                                                                                                              *
//*     CUE Sheet Library V1.1.8.55 © 3delite 2008-2012                                                                          *
//*     See CUE Sheet Library Readme.txt for details                                                                             *
//*                                                                                                                              *
//* Two licenses are available if you use this library for commercial purposes:                                                  *
//* Shareware License: 50 Euros                                                                                                  *
//* Commercial License: 250 Euros                                                                                                *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/cuesheetlibrary.html                                       *
//*                                                                                                                              *
//* If you have any questions or enquiries please mail: 3delite@3delite.hu                                                       *
//*                                                                                                                              *
//* Good coding! :)                                                                                                              *
//* 3delite                                                                                                                      *
//********************************************************************************************************************************

unit CUESheetFunctions;

interface

uses
  SysUtils, Classes, StrUtils;

const
  STR_TITLE = 'TITLE';
  STR_PERFORMER = 'PERFORMER';
  STR_SONGWRITER = 'SONGWRITER';
  STR_CATALOG = 'CATALOG';
  STR_CDTEXTFILE = 'CDTEXTFILE';
  STR_REM = 'REM';
  STR_FILE = 'FILE';
  STR_TRACK = 'TRACK';
  STR_ISRC = 'ISRC';
  STR_FLAGS = 'FLAGS';
  STR_PREGAP = 'PREGAP';
  STR_INDEX = 'INDEX';
  STR_POSTGAP = 'POSTGAP';

type
  Bool = LongBool;

type
  TCUEAlbumInfo = record
    Title: PChar;
    Performer: PChar;
    Catalog: PChar;
    CDTextFile: PChar;
  end;

type
  TCUESectionData = record
    FileName: PChar;
    FileFormat: PChar;
  end;

type
  TCUETrackData = record
    TrackNumber: Cardinal;
    TrackFormat: PChar;
  end;

type
  TCUETrackIndexData = record
    Title: PChar;
    Perfomer: PChar;
    SongWriter: PChar;
    ISRC: PChar;
    Flags: PChar;
    PreGap: Integer;
    PostGap: Integer;
  end;

type
  TCUESaveMode = record
    Album: Bool;
    Performer: Bool;
    SongWriter: Bool;
    CDTextFile: Bool;
    REMLines: Bool;
    Catalog: Bool;
    Titles: Bool;
    Perfomers: Bool;
    SongWriters: Bool;
    ISRCs: Bool;
    Flags: Bool;
    PreGaps: Bool;
    PostGaps: Bool;
    ZeroBasedIndex: Bool;
  end;

type
  TCUESectionIndex = class
    Indexes: TStrings;
  end;

type
  TCUETrack = class
    TrackNumber: Cardinal;
    TrackFormat: string;
    Titles: TStrings;
    Perfomers: TStrings;
    SongWriters: TStrings;
    ISRCs: TStrings;
    Flags: TStrings;
    PreGaps: TStrings;
    Indexes: array of TCUESectionIndex;
    PostGaps: TStrings;
  end;

type
  TCUESection = class
    FileName: string;
    FileFormat: string;
    Tracks: array of TCUETrack;
  end;

type
  TCUESheet = class
  public
    FileName: string;
    Data: TStrings;
    AlbumTitle: string;
    Performer: string;
    SongWriter: string;
    REMLines: TStrings;
    Catalog: string;
    CDTextFile: string;
    Sections: array of TCUESection;
    SaveMode: TCUESaveMode;
    Unicode: Boolean;
    function DoLoad: Boolean;
    function DoSave: Boolean;
    function Clear: Boolean;
    function CreateSection(Section: Integer): Boolean;
    function FreeSection(Section: Integer): Boolean;
    function CreateTrack(Section, Track: Integer): Boolean;
    function FreeTrack(Section, Track: Integer): Boolean;
    function CreateIndex(Section, Track, Index: Integer): Boolean;
    function FreeIndex(Section, Track, Index: Integer): Boolean;
    constructor Create;
    destructor Destroy; override;
    function Load(FileName: string): Bool;
    function Save(FileName: string; Unicode: Bool): Bool;
    function GetSectionCount: Integer;
    function GetTrackCount(Section: Integer): Integer;
    function GetIndexCount(Section, Track: Integer): Integer;
    function GetIndexIndexCount(Section, Track, Index: Integer): Integer;
    function GetInfo(var Info: TCUEAlbumInfo): Bool;
    function GetSectionData(Section: Integer; var Data: TCUESectionData): Bool;
    function GetTrackData(Section, Track: Integer; var Data: TCUETrackData): Bool;
    function GetIndexData(Section, Track, Index: Integer; var Data: TCUETrackIndexData): Bool;
    function GetIndex(Section, Track, Index, IndexNo: Integer; var SeekPos: Integer): Bool;
    function AddSection(Data: TCUESectionData): Bool;
    function AddTrack(Section: Integer; Data: TCUETrackData): Bool;
    function AddIndex(Section, Track: Integer; Data: TCUETrackIndexData): Bool;
    function AddIndexIndex(Section, Track, Index: Integer; SeekPos: Integer): Bool;
    function SetInfo(Info: TCUEAlbumInfo): Bool;
    function AddREMLine(REMLine: PChar): Bool;
    function GetREMLine(Line: Integer; var REMLine: PChar): Bool;
    function SetSaveMode(SaveMode: TCUESaveMode): Bool;
    function GetSaveMode(var SaveMode: TCUESaveMode): Bool;
    function SetSectionData(Section: Integer; Data: TCUESectionData): Bool;
    function SetTrackData(Section, Track: Integer; Data: TCUETrackData): Bool;
    function SetIndexData(Section, Track, Index: Integer; Data: TCUETrackIndexData): Bool;
    function SetIndexIndexData(Section, Track, Index, IndexNo: Integer; SeekPos: Integer): Bool;
  end;

implementation

function LastPos(const SubStr: string; const S: string): Integer;
begin
  Result := Pos(ReverseString(SubStr), ReverseString(S));
  if (Result <> 0) then
    Result := ((Length(S) - Length(SubStr)) + 1) - Result + 1;
end;

function TCUESheet.DoLoad: Boolean;
var
  i: Integer;
  tmp: string;
  Frames: Integer;
  SectionNo, TrackNo, IndexNo: Integer;

  function CUETime2msec(CUETime: string): Cardinal;
  begin
    tmp := Copy(CUETime, 1, 2);
    Result := StrToInt(tmp) * 60 * 1000;
    tmp := Copy(CUETime, 4, 2);
    Result := Result + StrToInt(tmp) * 1000;
    Frames := StrToInt(Copy(CUETime, 7, 2));
    Result := Result + Round((80 / 60) * Frames * 10);
  end;

  function StripComment(Line: string): string;
  var
    KommPos: Integer;
  begin
    KommPos := Pos(';', Line);
    if KommPos > 0 then
    begin
      tmp := Copy(Line, 1, KommPos - 1);
      tmp := TrimRight(tmp);
      Result := tmp;
    end
    else
      Result := Line;
  end;

  function StripQuotes(Line: string): string;
  var
    QuotePos: Integer;
  begin
    QuotePos := Pos('"', Line);
    if QuotePos = 1 then
    begin
      tmp := Copy(Line, 2, Length(Line));
      Result := tmp;
    end
    else
    begin
      Result := Line;
      Exit;
    end;
    QuotePos := Pos('"', tmp);
    if QuotePos > 0 then
    begin
      tmp := Copy(tmp, 1, QuotePos - 1);
      Result := tmp;
    end
    else
      Result := Line;
  end;

  procedure ProcessPerformer(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 11, Length(tmp) - 10);
    tmp := StripQuotes(tmp);
    Performer := tmp;
  end;

  procedure ProcessTitle(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 7, Length(tmp) - 6);
    tmp := StripQuotes(tmp);
    AlbumTitle := tmp;
  end;

  procedure ProcessSongwriter(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 12, Length(tmp) - 11);
    tmp := StripQuotes(tmp);
    SongWriter := tmp;
  end;

  procedure ProcessCatalog(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 9, Length(tmp));
    tmp := StripQuotes(tmp);
    Catalog := tmp;
  end;

  procedure ProcessCDTextFile(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 12, Length(tmp) - 11);
    tmp := StripQuotes(tmp);
    CDTextFile := tmp;
  end;

  procedure ProcessREM(Line: string);
  begin
    tmp := Copy(Line, 5, Length(Line));
    REMLines.Append(tmp);
  end;

  procedure ProcessFileNames(Line: string);
  var
    StrFile: string;
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 6, Length(tmp));
    tmp := Copy(tmp, 1, LastPos(' ', tmp) - 1);
    tmp := StripQuotes(tmp);
    StrFile := tmp;
    CreateSection(Length(Sections));
    Sections[Length(Sections) - 1].FileName := tmp;
    tmp := StripComment(Line);
    tmp := Copy(tmp, Length(StrFile) + 9, Length(tmp));
    Sections[Length(Sections) - 1].FileFormat := tmp;
  end;

  procedure ProcessTitles(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 11, Length(tmp) - 10);
    tmp := StripQuotes(tmp);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].Titles.Append(tmp);
  end;

  procedure ProcessPerformers(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 15, Length(tmp) - 14);
    tmp := StripQuotes(tmp);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].Perfomers.Append(tmp);
  end;

  procedure ProcessSongWriters(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 16, Length(tmp) - 15);
    tmp := StripQuotes(tmp);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].SongWriters.Append(tmp);
  end;

  procedure ProcessISRCs(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 10, Length(tmp) - 9);
    tmp := StripQuotes(tmp);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].ISRCs.Append(tmp);
  end;

  procedure ProcessFlags(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 11, Length(tmp) - 11);
    tmp := StripQuotes(tmp);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].Flags.Append(tmp);
  end;

  procedure ProcessPreGaps(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 12, Length(tmp) - 10);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].PreGaps.Append(IntToStr(CUETime2msec(tmp)));
  end;

  procedure ProcessIndexes(Line: string);
  var
    SectionNo, TrackNo, IndexNo: Integer;
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 14, Length(tmp) - 13);
    SectionNo := Length(Sections) - 1;
    TrackNo := Length(Sections[SectionNo].Tracks) - 1;
    IndexNo := Length(Sections[SectionNo].Tracks[TrackNo].Indexes) - 1;
    Sections[SectionNo].Tracks[TrackNo].Indexes[IndexNo].Indexes.Append(IntToStr(CUETime2msec(tmp)));
  end;

  procedure ProcessPostGaps(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 13, Length(tmp) - 11);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].PostGaps.Append(IntToStr(CUETime2msec(tmp)));
  end;

  procedure ProcessTrack(Line: string);
  begin
    tmp := StripComment(Line);
    tmp := Copy(tmp, 12, Length(tmp));
    CreateTrack(Length(Sections) - 1, Length(Sections[Length(Sections) - 1].Tracks));
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].TrackFormat := tmp;
    tmp := StripComment(Line);
    tmp := Copy(tmp, 9, 2);
    Sections[Length(Sections) - 1].Tracks[Length(Sections[Length(Sections) - 1].Tracks) - 1].TrackNumber := StrToInt(tmp);
  end;

begin
  Result := False;

  if not FileExists(FileName) then
    Exit;

  Data.LoadFromFile(FileName);

    //* Process header
  i := 0;
  repeat
        //* Title
    tmp := UpperCase(Copy(Data[i], 1, 5));
    if tmp = STR_TITLE then
      ProcessTitle(Data[i]);
        //* Performer
    tmp := UpperCase(Copy(Data[i], 1, 9));
    if tmp = STR_PERFORMER then
      ProcessPerformer(Data[i]);
        //* Songwriter
    tmp := UpperCase(Copy(Data[i], 1, 10));
    if tmp = STR_SONGWRITER then
      ProcessSongwriter(Data[i]);
        //* Catalog
    tmp := UpperCase(Copy(Data[i], 1, 7));
    if tmp = STR_CATALOG then
      ProcessCatalog(Data[i]);
        //* CD Text File
    tmp := UpperCase(Copy(Data[i], 1, 10));
    if tmp = STR_CDTEXTFILE then
      ProcessCDTextFile(Data[i]);
        //* REM
    tmp := UpperCase(Copy(Data[i], 1, 3));
    if tmp = STR_REM then
    begin
      ProcessREM(Data[i]);
    end;
    Inc(i);
  until i >= Data.Count;

    //* Process entries
  i := -1;
  repeat
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 1, 4));
    if tmp = STR_FILE then
      ProcessFileNames(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 3, 5));
    if (tmp = STR_TRACK) then
      ProcessTrack(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 5));
    if tmp = STR_TITLE then
      ProcessTitles(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 9));
    if tmp = STR_PERFORMER then
      ProcessPerformers(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 10));
    if tmp = STR_SONGWRITER then
      ProcessSongWriters(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 4));
    if tmp = STR_ISRC then
      ProcessISRCs(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 5));
    if tmp = STR_FLAGS then
      ProcessFlags(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 6));
    if tmp = STR_PREGAP then
      ProcessPreGaps(Data[i])
    else
      Dec(i);
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 5));
    if tmp = STR_INDEX then
    begin
      Dec(i);
      SectionNo := Length(Sections) - 1;
      TrackNo := Length(Sections[SectionNo].Tracks) - 1;
      IndexNo := Length(Sections[SectionNo].Tracks[TrackNo].Indexes);
      CreateIndex(SectionNo, TrackNo, IndexNo);
      repeat
        Inc(i);
        if i >= Data.Count then
          Break;
        tmp := UpperCase(Copy(Data[i], 5, 5));
        if tmp = STR_INDEX then
        begin
          ProcessIndexes(Data[i]);
        end;
      until UpperCase(Copy(Data[i], 5, 5)) <> STR_INDEX;
      Dec(i);
    end;
    Inc(i);
    if i >= Data.Count then
      Break;
    tmp := UpperCase(Copy(Data[i], 5, 7));
    if tmp = STR_POSTGAP then
      ProcessPostGaps(Data[i])
    else
      Dec(i);
        //Inc(i);
  until i >= Data.Count;
  Result := True;
end;

function TCUESheet.DoSave: Boolean;
var
  CUE_file: TStrings;
  i, k, j, l: Integer;
  tmp: string;
  Enc: TEncoding;

  function mSec2CUETime(mSec: Cardinal): string;
  var
    tHours: string;
    tMinutes: string;
    tSecs: string;
    tmSecs: string;
    Seconds: Int64;
  begin
    Seconds := mSec div 1000;
    tHours := IntToStr(Seconds div 3600);
    tMinutes := IntToStr(((Seconds - (StrToInt(tHours) * 3600)) div 60));
    tSecs := IntToStr(Seconds - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60));
    if Length(tSecs) = 1 then
      tSecs := '0' + tSecs;
    tmSecs := IntToStr(mSec - ((StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60) + StrToInt(tSecs)) * 1000);
    tmSecs := IntToStr(Round(StrToInt(tmSecs) / 13.333));
    case Length(tmSecs) of
      1:
        tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    tMinutes := IntToStr(StrToInt(tMinutes) + (StrToInt(tHours) * 60));
    if Length(tMinutes) = 1 then
      tMinutes := '0' + tMinutes;
    Result := tMinutes + ':' + tSecs + ':' + tmSecs;
  end;

begin

  Result := False;

  try
    CUE_file := TStringList.Create;
    if SaveMode.REMLines then
    begin
      for i := 0 to REMLines.Count - 1 do
      begin
        CUE_file.Append(STR_REM + ' ' + REMLines[i]);
      end;
    end;
    if SaveMode.Performer then
    begin
      CUE_file.Append(STR_PERFORMER + ' "' + Performer + '"');
    end;
    if SaveMode.Album then
    begin
      CUE_file.Append(STR_TITLE + ' "' + AlbumTitle + '"');
    end;
    if SaveMode.SongWriter then
    begin
      CUE_file.Append(STR_SONGWRITER + ' "' + SongWriter + '"');
    end;
    if SaveMode.Catalog then
    begin
      CUE_file.Append(STR_CATALOG + ' ' + Catalog);
    end;
    if SaveMode.CDTextFile then
    begin
      CUE_file.Append(STR_CDTEXTFILE + ' "' + CDTextFile + '"');
    end;

    for k := 0 to Length(Sections) - 1 do
    begin

      CUE_file.Append(STR_FILE + ' "' + Sections[k].FileName + '" ' + Sections[k].FileFormat);

      for i := 0 to Length(Sections[k].Tracks) - 1 do
      begin

        tmp := IntToStr(i + 1);
        if Length(tmp) = 1 then
          tmp := '0' + tmp;
        CUE_file.Append('  ' + STR_TRACK + ' ' + tmp + ' ' + Sections[k].Tracks[i].TrackFormat);

        for j := 0 to Sections[k].Tracks[i].Titles.Count - 1 do
        begin

          if SaveMode.Titles then
          begin
            CUE_file.Append('    ' + STR_TITLE + ' "' + Sections[k].Tracks[i].Titles[j] + '"');
          end;
          if SaveMode.Perfomers then
          begin
            try
              tmp := Sections[k].Tracks[i].Perfomers[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_PERFORMER + ' "' + Sections[k].Tracks[i].Perfomers[j] + '"');
          end;
          if SaveMode.SongWriters then
          begin
            try
              tmp := Sections[k].Tracks[i].SongWriters[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_SONGWRITER + ' "' + Sections[k].Tracks[i].SongWriters[j] + '"');
          end;
          if SaveMode.ISRCs then
          begin
            try
              tmp := Sections[k].Tracks[i].ISRCs[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_ISRC + ' ' + Sections[k].Tracks[i].ISRCs[j]);
          end;
          if SaveMode.Flags then
          begin
            try
              tmp := Sections[k].Tracks[i].Flags[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_FLAGS + ' ' + Sections[k].Tracks[i].Flags[j]);
          end;
          if SaveMode.PreGaps then
          begin
            try
              tmp := Sections[k].Tracks[i].PreGaps[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_PREGAP + ' ' + mSec2CUETime(StrToInt(tmp)));
          end;
          for l := 0 to Sections[k].Tracks[i].Indexes[j].Indexes.Count - 1 do
          begin
            if SaveMode.ZeroBasedIndex then
              tmp := IntToStr(l)
            else
              tmp := IntToStr(l + 1);
            if Length(tmp) = 1 then
              tmp := '0' + tmp;
            CUE_file.Append('    ' + STR_INDEX + ' ' + tmp + ' ' + mSec2CUETime(StrToInt(Sections[k].Tracks[i].Indexes[j].Indexes[l])));
          end;
          if SaveMode.PostGaps then
          begin
            try
              tmp := Sections[k].Tracks[i].PostGaps[j];
            except
              tmp := '';
            end;
            if tmp <> '' then
              CUE_file.Append('    ' + STR_POSTGAP + ' ' + mSec2CUETime(StrToInt(tmp)));
          end;
        end;
      end;
    end;
    try
      if Unicode then
      begin
        Enc := TUnicodeEncoding.Create;
        CUE_file.SaveToFile(FileName, Enc.Unicode)
      end
      else
        CUE_file.SaveToFile(FileName);
      Data.Clear;
      Data.Text := CUE_file.Text;
      Result := True;
    except
      Result := False;
    end;
  finally
    FreeAndNil(CUE_file);
    if Unicode and (Enc <> nil) then
      FreeAndNil(Enc);
  end;
end;

constructor TCUESheet.Create;
begin
  inherited;
  Data := TStringList.Create;
  REMLines := TStringList.Create;
  SaveMode.Album := True;
  SaveMode.Performer := True;
  SaveMode.SongWriter := True;
  SaveMode.CDTextFile := False;
  SaveMode.REMLines := False;
  SaveMode.Catalog := False;
  SaveMode.Titles := True;
  SaveMode.Perfomers := True;
  SaveMode.SongWriters := True;
  SaveMode.ISRCs := False;
  SaveMode.Flags := False;
  SaveMode.PreGaps := False;
  SaveMode.PostGaps := False;
  SaveMode.ZeroBasedIndex := False;
end;

destructor TCUESheet.Destroy;
var
  i: Integer;
begin
  FreeAndNil(Data);
  FreeAndNil(REMLines);
  for i := Length(Sections) - 1 downto 0 do
  begin
    FreeSection(i);
  end;
  inherited;
end;

function TCUESheet.Load(FileName: string): Bool;
begin
  try
    Result := False;
    Clear;
    Self.FileName := FileName;
    Result := DoLoad;
  except
    Result := False;
  end;
end;

function TCUESheet.GetSectionCount: Integer;
begin
  try
    Result := Length(Sections);
  except
    Result := 0;
  end;
end;

function TCUESheet.GetTrackCount(Section: Integer): Integer;
begin
  try
    Result := Length(Sections[Section].Tracks);
  except
    Result := 0;
  end;
end;

function TCUESheet.GetIndexCount(Section, Track: Integer): Integer;
begin
  try
    Result := Length(Sections[Section].Tracks[Track].Indexes);
  except
    Result := 0;
  end;
end;

function TCUESheet.GetIndexIndexCount(Section, Track, Index: Integer): Integer;
begin
  try
    if (Section < Length(Sections)) and (Track < Length(Sections[Section].Tracks)) and (Index < Length(Sections[Section].Tracks[Track].Indexes)) then
    begin
      Result := Sections[Section].Tracks[Track].Indexes[Index].Indexes.Count;
    end
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

function TCUESheet.GetInfo(var Info: TCUEAlbumInfo): Bool;
begin
  Result := False;
  try
    Info.Title := PChar(AlbumTitle);
  except
    Info.Title := PChar('');
  end;
  try
    Info.Performer := PChar(Performer);
  except
    Info.Performer := PChar('');
  end;
  try
    Info.Catalog := PChar(Catalog);
  except
    Info.Catalog := PChar('');
  end;
  try
    Info.CDTextFile := PChar(CDTextFile);
  except
    Info.CDTextFile := PChar('');
  end;
  Result := True;
end;

function TCUESheet.GetSectionData(Section: Integer; var Data: TCUESectionData): Bool;
begin
  try
    Result := False;
    try
      Data.FileName := PChar(Sections[Section].FileName);
    except
      Data.FileName := PChar('');
    end;
    try
      Data.FileFormat := PChar(Sections[Section].FileFormat);
    except
      Data.FileFormat := PChar('');
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.GetTrackData(Section, Track: Integer; var Data: TCUETrackData): Bool;
begin
  try
    Result := False;
    try
      Data.TrackNumber := Sections[Section].Tracks[Track].TrackNumber;
      Data.TrackFormat := PChar(Sections[Section].Tracks[Track].TrackFormat);
    except
      Data.TrackNumber := 0;
      Data.TrackFormat := PChar('');
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.GetIndexData(Section, Track, Index: Integer; var Data: TCUETrackIndexData): Bool;
begin
  try
    Result := False;
    try
      if Index < Sections[Section].Tracks[Track].Titles.Count then
        Data.Title := PChar(Sections[Section].Tracks[Track].Titles[Index])
      else
        Data.Title := PChar('');
    except
      Data.Title := PChar('');
    end;
    try
      if Index < Sections[Section].Tracks[Track].Perfomers.Count then
        Data.Perfomer := PChar(Sections[Section].Tracks[Track].Perfomers[Index])
      else
        Data.Perfomer := PChar('');
    except
      Data.Perfomer := PChar('');
    end;
    try
      if Index < Sections[Section].Tracks[Track].SongWriters.Count then
        Data.SongWriter := PChar(Sections[Section].Tracks[Track].SongWriters[Index])
      else
        Data.SongWriter := PChar('');
    except
      Data.SongWriter := PChar('');
    end;
    try
      if Index < Sections[Section].Tracks[Track].ISRCs.Count then
        Data.ISRC := PChar(Sections[Section].Tracks[Track].ISRCs[Index])
      else
        Data.ISRC := PChar('');
    except
      Data.ISRC := PChar('');
    end;
    try
      if Index < Sections[Section].Tracks[Track].Flags.Count then
        Data.Flags := PChar(Sections[Section].Tracks[Track].Flags[Index])
      else
        Data.Flags := PChar('');
    except
      Data.Flags := PChar('');
    end;
    try
      if Index < Sections[Section].Tracks[Track].PreGaps.Count then
        Data.PreGap := StrToInt(Sections[Section].Tracks[Track].PreGaps[Index])
      else
        Data.PreGap := 0;
    except
      Data.PreGap := 0;
    end;
    try
      if Index < Sections[Section].Tracks[Track].PostGaps.Count then
        Data.PostGap := StrToInt(Sections[Section].Tracks[Track].PostGaps[Index])
      else
        Data.PostGap := 0;
    except
      Data.PostGap := 0;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.GetIndex(Section, Track, Index, IndexNo: Integer; var SeekPos: Integer): Bool;
begin
  try
    Result := False;
    try
      if Index < Length(Sections[Section].Tracks[Track].Indexes) then
        SeekPos := StrToInt(Sections[Section].Tracks[Track].Indexes[Index].Indexes[IndexNo])
      else
        SeekPos := 0;
    except
      SeekPos := 0;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.Save(FileName: string; Unicode: Bool): Bool;
begin
  try
    Result := False;
    Self.FileName := FileName;
    Self.Unicode := Unicode;
    Result := DoSave;
  except
    Result := False;
  end;
end;

function TCUESheet.Clear: Boolean;
var
  i: Integer;
begin
  try
    Result := False;
    FileName := '';
    Data.Clear;
    AlbumTitle := '';
    Performer := '';
    Performer := '';
    SongWriter := '';
    CDTextFile := '';
    REMLines.Clear;
    Catalog := '';
    for i := Length(Sections) - 1 downto 0 do
    begin
      FreeSection(i);
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.CreateSection(Section: Integer): Boolean;
begin
  try
    Result := False;
    SetLength(Sections, Section + 1);
    Sections[Section] := TCUESection.Create;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.FreeSection(Section: Integer): Boolean;
var
  i: Integer;
begin
  try
    Result := False;
    for i := Length(Sections[Section].Tracks) - 1 downto 0 do
    begin
      FreeTrack(Section, i);
    end;
    FreeAndNil(Sections[Section]);
    SetLength(Sections, Length(Sections) - 1);
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.CreateTrack(Section, Track: Integer): Boolean;
begin
  try
    Result := False;
    SetLength(Sections[Section].Tracks, Track + 1);
    Sections[Section].Tracks[Track] := TCUETrack.Create;
    Sections[Section].Tracks[Track].TrackFormat := '';
    Sections[Section].Tracks[Track].Titles := TStringList.Create;
    Sections[Section].Tracks[Track].Perfomers := TStringList.Create;
    Sections[Section].Tracks[Track].SongWriters := TStringList.Create;
    Sections[Section].Tracks[Track].ISRCs := TStringList.Create;
    Sections[Section].Tracks[Track].Flags := TStringList.Create;
    Sections[Section].Tracks[Track].PreGaps := TStringList.Create;
    Sections[Section].Tracks[Track].PostGaps := TStringList.Create;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.FreeTrack(Section, Track: Integer): Boolean;
var
  i: Integer;
begin
  try
    Result := False;
    for i := Length(Sections[Section].Tracks[Track].Indexes) - 1 downto 0 do
    begin
      FreeIndex(Section, Track, i);
    end;
    FreeAndNil(Sections[Section].Tracks[Track].Titles);
    FreeAndNil(Sections[Section].Tracks[Track].Perfomers);
    FreeAndNil(Sections[Section].Tracks[Track].SongWriters);
    FreeAndNil(Sections[Section].Tracks[Track].ISRCs);
    FreeAndNil(Sections[Section].Tracks[Track].Flags);
    FreeAndNil(Sections[Section].Tracks[Track].PreGaps);
    FreeAndNil(Sections[Section].Tracks[Track].PostGaps);
    FreeAndNil(Sections[Section].Tracks[Track]);
    SetLength(Sections[Section].Tracks, Length(Sections[Section].Tracks) - 1);
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.CreateIndex(Section, Track, Index: Integer): Boolean;
begin
  try
    Result := False;
    SetLength(Sections[Section].Tracks[Track].Indexes, Index + 1);
    Sections[Section].Tracks[Track].Indexes[Index] := TCUESectionIndex.Create;
    Sections[Section].Tracks[Track].Indexes[Index].Indexes := TStringList.Create;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.FreeIndex(Section, Track, Index: Integer): Boolean;
begin
  try
    Result := False;
    FreeAndNil(Sections[Section].Tracks[Track].Indexes[Index].Indexes);
    FreeAndNil(Sections[Section].Tracks[Track].Indexes[Index]);
    SetLength(Sections[Section].Tracks[Track].Indexes, Length(Sections[Section].Tracks[Track].Indexes) - 1);
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.AddSection(Data: TCUESectionData): Bool;
var
  Section: Integer;
begin
  try
    Result := False;
    Section := Length(Sections);
    CreateSection(Section);
    Sections[Section].FileName := Data.FileName;
    Sections[Section].FileFormat := Data.FileFormat;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.AddTrack(Section: Integer; Data: TCUETrackData): Bool;
var
  Track: Integer;
begin
  try
    Result := False;
    Track := Length(Sections[Section].Tracks);
    CreateTrack(Section, Track);
    Sections[Section].Tracks[Track].TrackNumber := Data.TrackNumber;
    Sections[Section].Tracks[Track].TrackFormat := Data.TrackFormat;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.AddIndex(Section, Track: Integer; Data: TCUETrackIndexData): Bool;
var
  Index: Integer;
begin
  try
    Result := False;
    Index := Length(Sections[Section].Tracks[Track].Indexes);
    CreateIndex(Section, Track, Index);
    Sections[Section].Tracks[Track].Titles.Add(Data.Title);
    Sections[Section].Tracks[Track].Perfomers.Add(Data.Perfomer);
    Sections[Section].Tracks[Track].SongWriters.Add(Data.SongWriter);
    Sections[Section].Tracks[Track].ISRCs.Add(Data.ISRC);
    Sections[Section].Tracks[Track].Flags.Add(Data.Flags);
    Sections[Section].Tracks[Track].PreGaps.Add(IntToStr(Data.PreGap));
    Sections[Section].Tracks[Track].PostGaps.Add(IntToStr(Data.PostGap));
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.AddIndexIndex(Section, Track, Index: Integer; SeekPos: Integer): Bool;
begin
  try
    Result := False;
    Sections[Section].Tracks[Track].Indexes[Index].Indexes.Append(IntToStr(SeekPos));
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetInfo(Info: TCUEAlbumInfo): Bool;
begin
  try
    Result := False;
    AlbumTitle := Info.Title;
    Performer := Info.Performer;
    Catalog := Info.Catalog;
    CDTextFile := Info.CDTextFile;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.AddREMLine(REMLine: PChar): Bool;
begin
  try
    Result := False;
    REMLines.Add(REMLine);
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.GetREMLine(Line: Integer; var REMLine: PChar): Bool;
begin
  try
    Result := False;
    if Line < REMLines.Count - 1 then
    begin
      REMLine := PChar(REMLines[Line]);
    end
    else
      REMLine := PChar('');
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetSaveMode(SaveMode: TCUESaveMode): Bool;
begin
  try
    Result := False;
    Self.SaveMode.Album := SaveMode.Album;
    Self.SaveMode.Performer := SaveMode.Performer;
    Self.SaveMode.SongWriter := SaveMode.SongWriter;
    Self.SaveMode.REMLines := SaveMode.REMLines;
    Self.SaveMode.Catalog := SaveMode.Catalog;
    Self.SaveMode.Titles := SaveMode.Titles;
    Self.SaveMode.Perfomers := SaveMode.Perfomers;
    Self.SaveMode.SongWriters := SaveMode.SongWriters;
    Self.SaveMode.ISRCs := SaveMode.ISRCs;
    Self.SaveMode.Flags := SaveMode.Flags;
    Self.SaveMode.PreGaps := SaveMode.PreGaps;
    Self.SaveMode.PostGaps := SaveMode.PostGaps;
    Self.SaveMode.ZeroBasedIndex := SaveMode.ZeroBasedIndex;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.GetSaveMode(var SaveMode: TCUESaveMode): Bool;
begin
  try
    Result := False;
    SaveMode.Album := Self.SaveMode.Album;
    SaveMode.Performer := Self.SaveMode.Performer;
    SaveMode.SongWriter := Self.SaveMode.SongWriter;
    SaveMode.REMLines := Self.SaveMode.REMLines;
    SaveMode.Catalog := Self.SaveMode.Catalog;
    SaveMode.Titles := Self.SaveMode.Titles;
    SaveMode.Perfomers := Self.SaveMode.Perfomers;
    SaveMode.SongWriters := Self.SaveMode.SongWriters;
    SaveMode.ISRCs := Self.SaveMode.ISRCs;
    SaveMode.Flags := Self.SaveMode.Flags;
    SaveMode.PreGaps := Self.SaveMode.PreGaps;
    SaveMode.PostGaps := Self.SaveMode.PostGaps;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetSectionData(Section: Integer; Data: TCUESectionData): Bool;
begin
  try
    Result := False;
    Sections[Section].FileName := Data.FileName;
    Sections[Section].FileFormat := Data.FileFormat;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetTrackData(Section, Track: Integer; Data: TCUETrackData): Bool;
begin
  try
    Result := False;
    Sections[Section].Tracks[Track].TrackNumber := Data.TrackNumber;
    Sections[Section].Tracks[Track].TrackFormat := Data.TrackFormat;
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetIndexData(Section, Track, Index: Integer; Data: TCUETrackIndexData): Bool;
begin
  try
    Result := False;
    Sections[Section].Tracks[Track].Titles[Index] := Data.Title;
    Sections[Section].Tracks[Track].Perfomers[Index] := Data.Perfomer;
    Sections[Section].Tracks[Track].SongWriters[Index] := Data.SongWriter;
    Sections[Section].Tracks[Track].ISRCs[Index] := Data.ISRC;
    Sections[Section].Tracks[Track].Flags[Index] := Data.Flags;
    Sections[Section].Tracks[Track].PreGaps[Index] := IntToStr(Data.PreGap);
    Sections[Section].Tracks[Track].PostGaps[Index] := IntToStr(Data.PostGap);
    Result := True;
  except
    Result := False;
  end;
end;

function TCUESheet.SetIndexIndexData(Section, Track, Index, IndexNo: Integer; SeekPos: Integer): Bool;
begin
  try
    Result := False;
    Sections[Section].Tracks[Track].Indexes[Index].Indexes[IndexNo] := IntToStr(SeekPos);
    Result := True;
  except
    Result := False;
  end;
end;

end.

