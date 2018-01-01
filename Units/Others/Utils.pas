unit Utils;

interface

uses
  nxLogging, System.Classes, System.SysUtils, System.StrUtils, JsonSerializer,
  System.Types, Constants, Winapi.Windows, ShlObj;

procedure LogSend(const Msg: string);

procedure LogSendError(const Msg: string);

procedure LogSendException(const Msg: string; const Ex: Exception);

function FileSizetoString(_FileSize: Int64): string;


function GetExeBuild(const ExePath: string): string;

implementation

function GetExeBuild(const ExePath: string): string;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PWideChar(ExePath), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PWideChar(ExePath), 0, VerInfoSize, PVerInfo) then
    begin
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
      begin
        with PVerValue^ do
        begin
          Result := FloatToStr(LoWord(dwFileVersionLS));
        end;
      end;
    end;
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

function FileSizetoString(_FileSize: Int64): string;
begin
    if _FileSize > OneExbiByte then
    Result := Format(('%.2f EB'), [_FileSize / OneExbiByte])
  else if _FileSize > OnePebiByte then
    Result := Format(('%.2f PB'), [_FileSize / OnePebiByte])
  else if _FileSize > OneTebiByte then
    Result := Format(('%.2f TB'), [_FileSize / OneTebiByte])
  else if _FileSize > OneGibiByte then
    Result := Format(('%.2f GB'), [_FileSize / OneGibiByte])
  else if _FileSize > OneMebiByte then
    Result := Format(('%.2f MB'), [_FileSize / OneMebiByte])
  else if _FileSize > OneKibiByte then
    Result := Format(('%.2f KB'), [_FileSize / OneKibiByte])
  else
    Result := Format(('%d Byte'), [_FileSize])
end;

procedure LogSend(const Msg: string);
begin
  try
    Logger.error(Msg);
  except
    on E: Exception do
    begin
      // Ignored.
    end;
  end;
end;

procedure LogSendError(const Msg: string);
begin
  try
    Logger.log(NXLL_INFO, Msg);
  except
    on E: Exception do
    begin
      // Ignored.
    end;
  end;
end;

procedure LogSendException(const Msg: string; const Ex: Exception);
const
  STR1 = #$A;
  STR2 = #$D;
var
  LSB: TStringBuilder;
  LLines: TStringDynArray;
  I: Integer;
  LLine: string;
  LStackTrace: string;
  LJsonLine: string;
  LStrs: TStringList;
  LStepCount: integer;
  J: Integer;
  LMsg: string;
begin
  // Check if destination exists.
  // If it does not exist, then it may
  // mean that it was destroyed.
  LSB := TStringBuilder.Create;
  try
    try
      Logger.error('', Msg, TNxLoggerCategory.NXLCAT_NONE, Ex);
      Logger.error('{"exception": ' + JsonSerializer.TJsonSerializer.Serialize(Ex) + '}');

      LStackTrace := StringReplace(Ex.StackTrace, #$A, ' ', [rfReplaceAll]);
      LStackTrace := StringReplace(LStackTrace, #$D, ' ', [rfReplaceAll]).Trim;
//        Logger.error(LStackTrace);
//
      LLines := System.StrUtils.SplitString(LStackTrace, ' ');
      LSB.Append('[');
      LStrs := TStringList.Create;
      try
        for I := 0 to Length(LLines) - 1 do
        begin
          LLine := LLines[I].Trim;
          if (Length(LLine) > 0) then
          begin
            LStrs.Add(LLine);
          end;
        end;

        LJsonLine := '';
        LStepCount := LStrs.Count div 5;
        for I := 0 to LStepCount - 1 do
        begin
          LJsonLine := '';
          for J := (I * 5) to ((I + 1) * 5) - 1 do
          begin
            if J < LStrs.Count then
            begin
              LLine := LStrs[J];
              LJsonLine := LJsonLine + ' ' + LLine;
            end;
          end;
          LSB.Append('"' + LJsonLine + '",');
          LJsonLine := '';
        end;
      finally
        LStrs.Free;
      end;

      LSB.Append(']');
//
      Logger.error('{"Stack trace": ' + LSB.ToString + '}');
    except
      on E: Exception do
      begin
        LMsg := E.StackTrace;
      end;
    end;
  finally
    LSB.Free;
  end;
end;

end.

