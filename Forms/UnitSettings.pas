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

unit UnitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  IniFiles, Vcl.Mask, JvExMask, JvSpin, JvThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, ShellAPI, IdGlobal, IdHash,
  IdHashMessageDigest, Vcl.Samples.Spin, Bass, Generics.Collections;

type
  TSettingsForm = class(TForm)
    PageControl1: TPageControl;
    Button1: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PlayCursorBtn: TCheckBox;
    PlayJumpBtn: TCheckBox;
    CheckUpdateBtn: TCheckBox;
    TabSheet3: TTabSheet;
    LoadArtBtn: TCheckBox;
    CoverArtList: TComboBox;
    TabSheet5: TTabSheet;
    LyricBtn: TCheckBox;
    LogLyricFailBtn: TCheckBox;
    UpdateChecker: TJvHttpUrlGrabber;
    UpdateThread: TJvThread;
    Button2: TButton;
    BufferEdit: TSpinEdit;
    PlaylistItemTextList: TComboBox;
    WindowTitleList: TComboBox;
    sTabSheet2: TTabSheet;
    LastFMUserEdit: TEdit;
    LastFMPassEdit: TEdit;
    LastFMSaveBtn: TButton;
    LastFMEnableBtn: TCheckBox;
    sLabel4: TLabel;
    ShowDownloadedLyrics: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DeviceList: TComboBox;
    Label6: TLabel;
    Button3: TButton;
    ApplyDeviceBtn: TButton;
    procedure Button1Click(Sender: TObject);
    procedure LoadArtBtnClick(Sender: TObject);
    procedure BufferEditChange(Sender: TObject);
    procedure UpdateThreadExecute(Sender: TObject; Params: Pointer);
    procedure Button2Click(Sender: TObject);
    procedure UpdateCheckerDoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; Url: string);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PlaylistItemTextListChange(Sender: TObject);
    procedure LastFMSaveBtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ApplyDeviceBtnClick(Sender: TObject);
  private
    { Private declarations }
    FDeviceChanged: Boolean;
  public
    { Public declarations }
    LastFMUser: string;
    LastFMHashedPass: string;
    procedure LoadSettings;
    procedure SaveSettings;
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses
  UnitMain, UnitAbout, UnitLog;

procedure TSettingsForm.ApplyDeviceBtnClick(Sender: TObject);
var
  LResult: integer;
begin
  LResult := MainForm.ChangeDevice(DeviceList.ItemIndex + 1);
  if LResult = BASS_OK then
  begin
    Application.MessageBox('Device has been changed. You can continue the playback.', 'Info', MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox(PWideChar('Unable to change the device. Error code: ' + FloatToStr(LResult)), 'Error', MB_ICONERROR);
  end;
end;

procedure TSettingsForm.BufferEditChange(Sender: TObject);
begin
  MainForm.SetPlayerBuffer(BufferEdit.Value);
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  SaveSettings;
  Self.Close;
end;

procedure TSettingsForm.Button2Click(Sender: TObject);
begin
  UpdateThread.Execute(nil);
end;

procedure TSettingsForm.Button3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  LoadSettings;
end;

procedure TSettingsForm.FormShow(Sender: TObject);
var
  LDevices: TList<BASS_DEVICEINFO>;
  i: integer;
begin
  DeviceList.Items.Clear;
  LDevices := MainForm.GetDevices;

  for i := 0 to LDevices.Count - 1 do
  begin
    DeviceList.Items.Add(LDevices[i].name);
  end;

  LoadSettings;
end;

procedure TSettingsForm.LastFMSaveBtnClick(Sender: TObject);
var
  LMD5: TIdHashMessageDigest5;
  LSettingsFile: TIniFile;
begin
  if (Length(LastFMUserEdit.Text) > 0) and (Length(LastFMPassEdit.Text) > 0) then
  begin
    LMD5 := TIdHashMessageDigest5.Create;
    try
      LSettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\lastfm.ini');
      try
        LSettingsFile.WriteString('general', 'user', LastFMUserEdit.Text);
        LSettingsFile.WriteString('general', 'pass', LMD5.HashStringAsHex(UTF8Encode(LastFMPassEdit.Text)).ToLower);
        LastFMPassEdit.Text := LMD5.HashStringAsHex(UTF8Encode(LastFMPassEdit.Text)).ToLower;

        LastFMUser := LastFMUserEdit.Text;
        LastFMHashedPass := LastFMPassEdit.Text;
      finally
        LSettingsFile.Free;
      end;
    finally
      LMD5.Free;
    end;
    LastFMPassEdit.Text := '';
    Application.MessageBox('Your last.fm user name and hashed password is saved.', 'Info', MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox('Please enter your user name and password.', 'Error', MB_ICONERROR);
  end;
end;

procedure TSettingsForm.LoadArtBtnClick(Sender: TObject);
begin
  CoverArtList.Enabled := LoadArtBtn.Checked;
end;

procedure TSettingsForm.LoadSettings;
var
  SettingsFile: TIniFile;
  LDeviceIndex: integer;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      PlayCursorBtn.Checked := SettingsFile.ReadBool('settings', 'playcur', True);
      PlayJumpBtn.Checked := SettingsFile.ReadBool('settings', 'playjmp', True);
      CheckUpdateBtn.Checked := SettingsFile.ReadBool('settings', 'update', True);
      LoadArtBtn.Checked := SettingsFile.ReadBool('settings', 'loadcover', True);
      CoverArtList.ItemIndex := SettingsFile.ReadInteger('settings', 'cover', 0);
      LyricBtn.Checked := SettingsFile.ReadBool('settings', 'lyric', True);
      ShowDownloadedLyrics.Checked := SettingsFile.ReadBool('settings', 'showloyric', True);
      LogLyricFailBtn.Checked := SettingsFile.ReadBool('settings', 'loglyric', False);
      BufferEdit.Text := SettingsFile.ReadString('settings', 'buffer', '500');
      WindowTitleList.ItemIndex := SettingsFile.ReadInteger('settings', 'windowtitle', 0);
      PlaylistItemTextList.ItemIndex := SettingsFile.ReadInteger('settings', 'playlistitemtext', 2);
      LastFMEnableBtn.Checked := SettingsFile.ReadBool('settings', 'lastfm', True);
      if DeviceList.Items.Count > 0 then
      begin
        LDeviceIndex := SettingsFile.ReadInteger('General', 'DeviceId', 1) - 1;
        if LDeviceIndex < DeviceList.Items.Count then
        begin
          DeviceList.ItemIndex := LDeviceIndex;
        end;
      end;
    end;
  finally
    SettingsFile.Free;
    LoadArtBtnClick(Self);
  end;
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\lastfm.ini');
  try
    LastFMUserEdit.Text := SettingsFile.ReadString('general', 'user', '');
    // LastFMPassEdit.Text := SettingsFile.ReadString('general', 'pass', '');

    LastFMUser := LastFMUserEdit.Text;
    LastFMHashedPass := SettingsFile.ReadString('general', 'pass', '');
  finally
    SettingsFile.Free;
  end;
end;

procedure TSettingsForm.PlaylistItemTextListChange(Sender: TObject);
begin
  MainForm.ChangePlaylistColumnNames;
  MainForm.PlayList.Invalidate;
end;

procedure TSettingsForm.SaveSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      SettingsFile.WriteBool('settings', 'playcur', PlayCursorBtn.Checked);
      SettingsFile.WriteBool('settings', 'playjmp', PlayJumpBtn.Checked);
      SettingsFile.WriteBool('settings', 'update', CheckUpdateBtn.Checked);
      SettingsFile.WriteBool('settings', 'loadcover', LoadArtBtn.Checked);
      SettingsFile.WriteInteger('settings', 'cover', CoverArtList.ItemIndex);
      SettingsFile.WriteBool('settings', 'lyric', LyricBtn.Checked);
      SettingsFile.WriteBool('settings', 'showloyric', ShowDownloadedLyrics.Checked);
      SettingsFile.WriteBool('settings', 'loglyric', LogLyricFailBtn.Checked);
      SettingsFile.WriteString('settings', 'buffer', BufferEdit.Text);
      SettingsFile.WriteInteger('settings', 'windowtitle', WindowTitleList.ItemIndex);
      SettingsFile.WriteInteger('settings', 'playlistitemtext', PlaylistItemTextList.ItemIndex);
      SettingsFile.WriteBool('settings', 'lastfm', LastFMEnableBtn.Checked);
      SettingsFile.WriteInteger('General', 'DeviceId', DeviceList.ItemIndex + 1);
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TSettingsForm.UpdateCheckerDoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; Url: string);
var
  VersionFile: TStringList;
  LatestVersion: Integer;
begin
  VersionFile := TStringList.Create;
  try
    if StreamSize > 0 then
    begin
      VersionFile.LoadFromStream(Stream);
      if VersionFile.Count = 1 then
      begin
        if TryStrToInt(VersionFile.Strings[0], LatestVersion) then
        begin
          if LatestVersion > BuildInt then
          begin
            if ID_YES = Application.MessageBox('There is a new version. Would you like to go homepage and download it?', 'New Version', MB_ICONQUESTION or MB_YESNO) then
            begin
              ShellExecute(Handle, 'open', 'http://www.fosshub.com/OooPlayer.html', nil, nil, SW_NORMAL);
            end;
          end
          else
          begin
            Application.MessageBox('You have the latest version.', 'Update Check', MB_ICONINFORMATION);
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(VersionFile);
  end;
end;

procedure TSettingsForm.UpdateThreadExecute(Sender: TObject; Params: Pointer);
begin
  with UpdateChecker do
  begin
    Url := 'http://sourceforge.net/projects/oooplayer/files/version.txt/download';
    Start;
  end;

  UpdateThread.CancelExecute;
end;

end.

