{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
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
unit UnitInternalArtworkReader;

interface

uses Classes, SysUtils, IdBaseComponent, IdThreadComponent, IdThread;

type
  TInternalArtworkReader = class
  private
    FThread: TIdThreadComponent;
    FFile: string;

    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
  public
    Busy: Boolean;
    property FileName: string read FFile write FFile;
    constructor create;
    destructor destroy; override;
    procedure Start;
  end;

implementation

uses UnitMain;

{ TInternalArtworkReader }

constructor TInternalArtworkReader.create;
begin
  FThread := TIdThreadComponent.create(nil);
  FThread.Priority := tpIdle;
  FThread.StopMode := smSuspend;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;
  Busy := False;
end;

destructor TInternalArtworkReader.destroy;
begin
  FThread.Free;
  inherited;
end;

procedure TInternalArtworkReader.Start;
begin
  Busy := True;
  FThread.Start;
end;

procedure TInternalArtworkReader.ThreadRun(Sender: TIdThreadComponent);
begin
  Busy := True;
  try
    if FileExists(FFile) then
    begin
      if not MainForm.LoadInternalCoverArt(FFile) then
      begin
        MainForm.LoadExternalCoverArt(FileName);
      end;
    end;
  finally
    Busy := False;
  end;
  FThread.Terminate;
end;

procedure TInternalArtworkReader.ThreadStopped(Sender: TIdThreadComponent);
begin
  Busy := False;
end;

procedure TInternalArtworkReader.ThreadTerminate(Sender: TIdThreadComponent);
begin
  Busy := False;
end;

end.
