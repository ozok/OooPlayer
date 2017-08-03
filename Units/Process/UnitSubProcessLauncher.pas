{ *
  * Copyright (C) 2011-2017 ozok <ozok26@gmail.com>
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
unit UnitSubProcessLauncher;

interface

uses
  Classes, Windows, SysUtils, JvCreateProcess, Messages, StrUtils, ComCtrls;

type
  TSubProcessLauncher = class(TObject)
  private
    FProcess: TJvCreateProcess;
    procedure ProcessTerminate(Sender: TObject; ExitCode: Cardinal);
    function GetRunning: Boolean;
  public
    property IsRunning: Boolean read GetRunning;
    constructor Create();
    destructor Destroy(); override;
    procedure Start(const SettingsFilePath: string; const ProcessPath: string);
    procedure Stop();
  end;

implementation

uses
  UnitLog;

{ TSubProcessLauncher }

constructor TSubProcessLauncher.Create;
begin
  inherited Create;

  FProcess := TJvCreateProcess.Create(nil);
  with FProcess do
  begin
    OnTerminate := ProcessTerminate;
    ConsoleOptions := [coRedirect];
    CreationFlags := [cfUnicode];
    Priority := ppIdle;

    with StartupInfo do
    begin
      DefaultPosition := True;
      DefaultSize := True;
      DefaultWindowState := True;
      ShowWindow := swNormal;
    end;

    WaitForTerminate := True;
  end;
end;

destructor TSubProcessLauncher.Destroy;
begin
  inherited Destroy;
  FProcess.Free;
end;

function TSubProcessLauncher.GetRunning: Boolean;
begin
  Result := 0 <> FProcess.ProcessInfo.hProcess;
end;

procedure TSubProcessLauncher.ProcessTerminate(Sender: TObject; ExitCode: Cardinal);
begin
  if ExitCode <> 0 then
  begin
    LogForm.LogList.Lines.Add('lastfmtoollauncher error code: ' + FloatToStr(ExitCode));
    LogForm.LogList.Lines.Add('lastfmtoollauncher exe: ' + FProcess.ApplicationName);
    LogForm.LogList.Lines.Add('lastfmtoollauncher cmd: ' + FProcess.CommandLine);

  end;
  LogForm.LogList.Lines.AddStrings(FProcess.ConsoleOutput);
end;

procedure TSubProcessLauncher.Start(const SettingsFilePath: string; const ProcessPath: string);
begin
  if FProcess.ProcessInfo.hProcess = 0 then
  begin
    // if FileExists(SettingsFilePath) then
    begin
      if FileExists(ProcessPath) then
      begin
        FProcess.ApplicationName := '';
        FProcess.CommandLine := ProcessPath + ' "' + SettingsFilePath + '"';
        FProcess.Run;
      end
      else
      begin
        LogForm.LogList.Lines.Add('Unable to find file ' + ProcessPath)
      end;
    end
    // else
    // begin
    // LogForm.LogList.Lines.Add('Unable to find file ' + SettingsFilePath)
    // end;;
  end;
end;

procedure TSubProcessLauncher.Stop;
begin
  if FProcess.ProcessInfo.hProcess > 0 then
  begin
    TerminateProcess(FProcess.ProcessInfo.hProcess, 0);
  end;
end;

end.

