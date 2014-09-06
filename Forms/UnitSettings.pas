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

unit UnitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, IniFiles,
  Vcl.Mask, JvExMask, JvSpin;

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
    TabSheet4: TTabSheet;
    VisEnableBtn: TCheckBox;
    VisIntervalEdit: TJvSpinEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadArtBtnClick(Sender: TObject);
    procedure VisEnableBtnClick(Sender: TObject);
    procedure VisIntervalEditChange(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSettings;
    procedure SaveSettings;
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  LoadSettings;
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
      VisEnableBtn.Checked := SettingsFile.ReadBool('settings', 'vis', True);
      VisIntervalEdit.Text := SettingsFile.ReadString('settings', 'visint', '100');
    end;
  finally
    SettingsFile.Free;
    LoadArtBtnClick(Self);
    VisEnableBtnClick(Self);
    VisIntervalEditChange(Self);
  end;
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
      SettingsFile.WriteBool('settings', 'vis', VisEnableBtn.Checked);
      SettingsFile.WriteString('settings', 'visint', VisIntervalEdit.Text);
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TSettingsForm.VisEnableBtnClick(Sender: TObject);
begin
  VisIntervalEdit.Enabled := VisEnableBtn.Checked;
  MainForm.VisTimer.Enabled := VisEnableBtn.Checked;
  if not VisEnableBtn.Checked then
  begin
    MainForm.Gauge1.Progress := 0;
    MainForm.Gauge2.Progress := 0;
    MainForm.Gauge3.Progress := 0;
    MainForm.Gauge4.Progress := 0;
  end;
end;

procedure TSettingsForm.VisIntervalEditChange(Sender: TObject);
begin
  if VisIntervalEdit.Value > 0 then
  begin
    MainForm.VisTimer.Interval := Abs(Round(VisIntervalEdit.Value));
  end;
end;

end.
