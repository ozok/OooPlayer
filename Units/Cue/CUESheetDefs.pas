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

unit CUESheetDefs;

interface

{$IFDEF MSWINDOWS}
uses
  Windows;
{$ENDIF}

function InitCUELibrary: Boolean;

function FreeCUELibrary: Boolean;

const
    {$IFDEF MSWINDOWS}
  CUEDLL = 'CUESheet.dll';
    {$ENDIF}
    {$IFDEF MACOS}
  CUEDLL = 'libCUESheet.dylib';
    {$ENDIF}

const
  NAME_CUE_Create = 'CUE_Create';
  NAME_CUE_Free = 'CUE_Free';
  NAME_CUE_Load = 'CUE_Load';
  NAME_CUE_Save = 'CUE_Save';
  NAME_CUE_Clear = 'CUE_Clear';
  NAME_CUE_GetSectionCount = 'CUE_GetSectionCount';
  NAME_CUE_GetTrackCount = 'CUE_GetTrackCount';
  NAME_CUE_GetIndexCount = 'CUE_GetIndexCount';
  NAME_CUE_GetIndexIndexCount = 'CUE_GetIndexIndexCount';
  NAME_CUE_GetInfo = 'CUE_GetInfo';
  NAME_CUE_SetInfo = 'CUE_SetInfo';
  NAME_CUE_GetSectionData = 'CUE_GetSectionData';
  NAME_CUE_GetTrackData = 'CUE_GetTrackData';
  NAME_CUE_GetIndexData = 'CUE_GetIndexData';
  NAME_CUE_GetIndex = 'CUE_GetIndex';
  NAME_CUE_AddSection = 'CUE_AddSection';
  NAME_CUE_AddTrack = 'CUE_AddTrack';
  NAME_CUE_AddIndex = 'CUE_AddIndex';
  NAME_CUE_AddIndexIndex = 'CUE_AddIndexIndex';
  NAME_CUE_AddREMLine = 'CUE_AddREMLine';
  NAME_CUE_GetREMLine = 'CUE_GetREMLine';
  NAME_CUE_GetSaveMode = 'CUE_GetSaveMode';
  NAME_CUE_SetSaveMode = 'CUE_SetSaveMode';
  NAME_CUE_SetSectionData = 'CUE_SetSectionData';
  NAME_CUE_SetTrackData = 'CUE_SetTrackData';
  NAME_CUE_SetIndexData = 'CUE_SetIndexData';
  NAME_CUE_SetIndexIndexData = 'CUE_SetIndexIndexData';

type
  HCUESheetLibrary = Pointer;

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
  t_CUE_Create = function: HCUESheetLibrary; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_Free = function(CUEData: HCUESheetLibrary): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_Load = function(CUEData: HCUESheetLibrary; FileName: PChar): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_Save = function(CUEData: HCUESheetLibrary; FileName: PChar; Unicode: Bool): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_Clear = function(CUEData: HCUESheetLibrary): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetSectionCount = function(CUEData: HCUESheetLibrary): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetTrackCount = function(CUEData: HCUESheetLibrary; Section: Integer): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetIndexCount = function(CUEData: HCUESheetLibrary; Section, Track: Integer): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetIndexIndexCount = function(CUEData: HCUESheetLibrary; Section, Track, Index: Integer): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetInfo = function(CUEData: HCUESheetLibrary; var Info: TCUEAlbumInfo): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetInfo = function(CUEData: HCUESheetLibrary; Info: TCUEAlbumInfo): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetSectionData = function(CUEData: HCUESheetLibrary; Section: Integer; var Data: TCUESectionData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetTrackData = function(CUEData: HCUESheetLibrary; Section, Track: Integer; var Data: TCUETrackData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetIndexData = function(CUEData: HCUESheetLibrary; Section, Track, Index: Integer; var Data: TCUETrackIndexData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetIndex = function(CUEData: HCUESheetLibrary; Section, Track, Index, IndexNo: Integer; var SeekPos: Integer): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_AddSection = function(CUEData: HCUESheetLibrary; Data: TCUESectionData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_AddTrack = function(CUEData: HCUESheetLibrary; Section: Integer; Data: TCUETrackData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_AddIndex = function(CUEData: HCUESheetLibrary; Section, Track: Integer; Data: TCUETrackIndexData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_AddIndexIndex = function(CUEData: HCUESheetLibrary; Section, Track, Index: Integer; SeekPos: Integer): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_AddREMLine = function(CUEData: HCUESheetLibrary; REMLine: PChar): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetREMLine = function(CUEData: HCUESheetLibrary; Line: Integer; var REMLine: PChar): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetSaveMode = function(CUEData: HCUESheetLibrary; SaveMode: TCUESaveMode): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_GetSaveMode = function(CUEData: HCUESheetLibrary; var SaveMode: TCUESaveMode): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetSectionData = function(CUEData: HCUESheetLibrary; Section: Integer; Data: TCUESectionData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetTrackData = function(CUEData: HCUESheetLibrary; Section, Track: Integer; Data: TCUETrackData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetIndexData = function(CUEData: HCUESheetLibrary; Section, Track, Index: Integer; Data: TCUETrackIndexData): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

  t_CUE_SetIndexIndexData = function(CUEData: HCUESheetLibrary; Section, Track, Index, IndexNo: Integer; SeekPos: Integer): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

var
  CUE_Create: t_CUE_Create;
  CUE_Free: t_CUE_Free;
  CUE_Load: t_CUE_Load;
  CUE_Save: t_CUE_Save;
  CUE_Clear: t_CUE_Clear;
  CUE_GetSectionCount: t_CUE_GetSectionCount;
  CUE_GetTrackCount: t_CUE_GetTrackCount;
  CUE_GetIndexCount: t_CUE_GetIndexCount;
  CUE_GetIndexIndexCount: t_CUE_GetIndexIndexCount;
  CUE_GetInfo: t_CUE_GetInfo;
  CUE_SetInfo: t_CUE_SetInfo;
  CUE_GetSectionData: t_CUE_GetSectionData;
  CUE_GetTrackData: t_CUE_GetTrackData;
  CUE_GetIndexData: t_CUE_GetIndexData;
  CUE_GetIndex: t_CUE_GetIndex;
  CUE_AddSection: t_CUE_AddSection;
  CUE_AddTrack: t_CUE_AddTrack;
  CUE_AddIndex: t_CUE_AddIndex;
  CUE_AddIndexIndex: t_CUE_AddIndexIndex;
  CUE_AddREMLine: t_CUE_AddREMLine;
  CUE_GetREMLine: t_CUE_GetREMLine;
  CUE_GetSaveMode: t_CUE_GetSaveMode;
  CUE_SetSaveMode: t_CUE_SetSaveMode;
  CUE_SetSectionData: t_CUE_SetSectionData;
  CUE_SetTrackData: t_CUE_SetTrackData;
  CUE_SetIndexData: t_CUE_SetIndexData;
  CUE_SetIndexIndexData: t_CUE_SetIndexIndexData;

var
  CUEDLLHandle: THandle = 0;
  CUEDLLLoaded: Boolean = False;

implementation

uses
  SysUtils;

function InitCUELibrary: Boolean;
begin
  CUEDLLHandle := LoadLibrary(PChar(CUEDLL));
  Result := CUEDLLHandle <> 0;
  if Result then
  begin
    CUE_Create := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_Create));
    CUE_Free := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_Free));
    CUE_Load := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_Load));
    CUE_Save := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_Save));
    CUE_Clear := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_Clear));
    CUE_GetSectionCount := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetSectionCount));
    CUE_GetTrackCount := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetTrackCount));
    CUE_GetIndexCount := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetIndexCount));
    CUE_GetIndexIndexCount := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetIndexIndexCount));
    CUE_GetInfo := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetInfo));
    CUE_SetInfo := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetInfo));
    CUE_GetSectionData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetSectionData));
    CUE_GetTrackData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetTrackData));
    CUE_GetIndexData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetIndexData));
    CUE_GetIndex := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetIndex));
    CUE_AddSection := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_AddSection));
    CUE_AddTrack := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_AddTrack));
    CUE_AddIndex := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_AddIndex));
    CUE_AddIndexIndex := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_AddIndexIndex));
    CUE_AddREMLine := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_AddREMLine));
    CUE_GetREMLine := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetREMLine));
    CUE_SetSaveMode := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetSaveMode));
    CUE_GetSaveMode := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_GetSaveMode));
    CUE_SetSectionData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetSectionData));
    CUE_SetTrackData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetTrackData));
    CUE_SetIndexData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetIndexData));
    CUE_SetIndexIndexData := GetProcAddress(CUEDLLHandle, PChar(NAME_CUE_SetIndexIndexData));
  end;
  if (@CUE_Create = nil) or (@CUE_Free = nil) or (@CUE_Load = nil) or (@CUE_Save = nil) or (@CUE_Clear = nil) or (@CUE_GetSectionCount = nil) or (@CUE_GetTrackCount = nil) or (@CUE_GetIndexCount = nil) or (@CUE_GetIndexIndexCount = nil) or (@CUE_GetInfo = nil) or (@CUE_SetInfo = nil) or (@CUE_GetSectionData = nil) or (@CUE_GetTrackData = nil) or (@CUE_GetIndexData = nil) or (@CUE_GetIndex = nil) or (@CUE_AddSection = nil) or (@CUE_AddTrack = nil) or (@CUE_AddIndex = nil) or (@CUE_AddIndexIndex = nil) or (@CUE_AddREMLine = nil) or (@CUE_GetREMLine = nil) or (@CUE_GetSaveMode = nil) or (@CUE_SetSaveMode = nil) or (@CUE_SetSectionData = nil) or (@CUE_SetTrackData = nil) or (@CUE_SetIndexData = nil) or (@CUE_SetIndexIndexData = nil) then
    Result := False;

  if Result then
    CUEDLLLoaded := True;
end;

function FreeCUELibrary: Boolean;
begin
  Result := False;
  if CUEDLLHandle <> 0 then
  begin
    Result := FreeLibrary(CUEDLLHandle);
    if Result then
    begin
      CUEDLLHandle := 0;
      CUEDLLLoaded := False;
    end;
  end;
end;

initialization
  InitCUELibrary;

finalization
  FreeCUELibrary;

end.

