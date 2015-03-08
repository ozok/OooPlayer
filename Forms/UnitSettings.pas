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

unit UnitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, IniFiles, Vcl.Mask, JvExMask, JvSpin, JvThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, ShellAPI, sComboBox, sLabel, sButton,
  sCheckBox, sPageControl, sSkinProvider, sEdit, sSpinEdit;

type
  TSettingsForm = class(TForm)
    PageControl1: TsPageControl;
    Button1: TsButton;
    TabSheet1: TsTabSheet;
    TabSheet2: TsTabSheet;
    PlayCursorBtn: TsCheckBox;
    PlayJumpBtn: TsCheckBox;
    CheckUpdateBtn: TsCheckBox;
    TabSheet3: TsTabSheet;
    LoadArtBtn: TsCheckBox;
    CoverArtList: TsComboBox;
    TabSheet5: TsTabSheet;
    LyricBtn: TsCheckBox;
    LogLyricFailBtn: TsCheckBox;
    UpdateChecker: TJvHttpUrlGrabber;
    UpdateThread: TJvThread;
    Button2: TsButton;
    sSkinProvider1: TsSkinProvider;
    sTabSheet1: TsTabSheet;
    SkinsList: TsComboBox;
    BufferEdit: TsSpinEdit;
    PlaylistItemTextList: TsComboBox;
    WindowTitleList: TsComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadArtBtnClick(Sender: TObject);
    procedure BufferEditChange(Sender: TObject);
    procedure UpdateThreadExecute(Sender: TObject; Params: Pointer);
    procedure Button2Click(Sender: TObject);
    procedure UpdateCheckerDoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; Url: string);
    procedure FormShow(Sender: TObject);
    procedure SkinsListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PlaylistItemTextListChange(Sender: TObject);
  private
    { Private declarations }
    procedure GetAllSkins;
  public
    { Public declarations }
    procedure LoadSettings;
    procedure SaveSettings;
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses UnitMain, UnitAbout, UnitLog;

procedure TSettingsForm.BufferEditChange(Sender: TObject);
begin
  MainForm.SetPlayerBuffer(Round(BufferEdit.Value));
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TSettingsForm.Button2Click(Sender: TObject);
begin
  UpdateThread.Execute(nil);
end;

procedure TSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  GetAllSkins;
  LoadSettings;
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  LoadSettings;
end;

procedure TSettingsForm.GetAllSkins;
var
  I: Integer;
begin
  SkinsList.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\skins.txt');
  for I := 0 to SkinsList.Items.Count - 1 do
  begin
    SkinsList.Items[i] := ChangeFileExt(SkinsList.Items[i], '');
  end;
end;

procedure TSettingsForm.LoadArtBtnClick(Sender: TObject);
begin
  CoverArtList.Enabled := LoadArtBtn.Checked;
end;

procedure TSettingsForm.LoadSettings;
var
  SettingsFile: TIniFile;
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
      LogLyricFailBtn.Checked := SettingsFile.ReadBool('settings', 'loglyric', False);
      BufferEdit.Text := SettingsFile.ReadString('settings', 'buffer', '500');
      SkinsList.ItemIndex := SettingsFile.ReadInteger('settings', 'skin2', 33);
      WindowTitleList.ItemIndex := SettingsFile.ReadInteger('settings', 'windowtitle', 0);
      PlaylistItemTextList.ItemIndex := SettingsFile.ReadInteger('settings', 'playlistitemtext', 2);
    end;
  finally
    SettingsFile.Free;
    LoadArtBtnClick(Self);
    SkinsListChange(Self);
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
      SettingsFile.WriteBool('settings', 'loglyric', LogLyricFailBtn.Checked);
      SettingsFile.WriteString('settings', 'buffer', BufferEdit.Text);
      SettingsFile.WriteInteger('settings', 'skin2', SkinsList.ItemIndex);
      SettingsFile.WriteInteger('settings', 'windowtitle', WindowTitleList.ItemIndex);
      SettingsFile.WriteInteger('settings', 'playlistitemtext', PlaylistItemTextList.ItemIndex);
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TSettingsForm.SkinsListChange(Sender: TObject);
begin
  if SkinsList.ItemIndex > 0 then
  begin
    MainForm.sSkinManager1.BeginUpdate;
    MainForm.sSkinManager1.SkinName := SkinsList.Text + '.asz';
    MainForm.sSkinManager1.Active := True;
    MainForm.sSkinManager1.EndUpdate(True);
  end
  else
  begin
    MainForm.sSkinManager1.Active := False;
    MainForm.PlayList.Font.Color := clBlack;
    MainForm.RadioList.Font.Color := clBlack;
    MainForm.QueueList.Font.Color := clBlack;
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
