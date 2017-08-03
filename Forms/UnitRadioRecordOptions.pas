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
unit UnitRadioRecordOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, Vcl.ComCtrls, IniFiles, JvComponentBase,
  JvComputerInfoEx, ShellAPI;

type
  TRadioRecordOptionsForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    BitrateList: TComboBox;
    Info: TJvComputerInfoEx;
    Label3: TLabel;
    RecordSaveEdit: TJvDirectoryEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    procedure LoadSettings;
    procedure SaveSettings;
  public
    { Public declarations }
  end;

var
  RadioRecordOptionsForm: TRadioRecordOptionsForm;

implementation

{$R *.dfm}

uses
  UnitMain;

procedure TRadioRecordOptionsForm.Button1Click(Sender: TObject);
begin
  if DirectoryExists(RecordSaveEdit.Text) then
  begin
    ShellExecute(Handle, 'open', 'explorer', PChar(RecordSaveEdit.Text), nil, SW_SHOWNORMAL);
  end;
end;

procedure TRadioRecordOptionsForm.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TRadioRecordOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TRadioRecordOptionsForm.FormCreate(Sender: TObject);
begin
  LoadSettings;
end;

procedure TRadioRecordOptionsForm.LoadSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      if not MainForm.PortableMode then
      begin
        RecordSaveEdit.Text := SettingsFile.ReadString('radiorecord', 'output', Info.Folders.Personal + '\OooPlayer\');
        ForceDirectories(Info.Folders.Personal + '\OooPlayer\');
      end
      else
      begin
        RecordSaveEdit.Text := SettingsFile.ReadString('radiorecord', 'output', ExtractFileDir(Application.ExeName) + '\Recordings\');
        ForceDirectories(ExtractFileDir(Application.ExeName) + '\Recordings\');
      end;
      BitrateList.Text := SettingsFile.ReadString('radiorecord', 'bitrate', '128');
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TRadioRecordOptionsForm.SaveSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      SettingsFile.WriteString('radiorecord', 'output', RecordSaveEdit.Text);
      SettingsFile.WriteString('radiorecord', 'bitrate', BitrateList.Text);
    end;
  finally
    SettingsFile.Free;
  end;
end;

end.

