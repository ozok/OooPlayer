unit UnitEQ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sSkinProvider, Vcl.StdCtrls, sLabel,
  Vcl.ExtCtrls, sPanel, Vcl.ComCtrls, sTrackBar, sCheckBox, sComboBox, UnitMusicPlayer, Generics.Collections, IniFiles;

type
  TEQValuesArray = array [0 .. 17] of integer;

type
  TEQFile = record
    FileName: string;
    EQValues: TEQValuesArray;
  end;

  TEQFiles = TList<TEQFile>;

type
  TEQForm = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sTrackBar1: TsTrackBar;
    sTrackBar2: TsTrackBar;
    sTrackBar3: TsTrackBar;
    sTrackBar4: TsTrackBar;
    sTrackBar5: TsTrackBar;
    sTrackBar6: TsTrackBar;
    sTrackBar7: TsTrackBar;
    sTrackBar8: TsTrackBar;
    sTrackBar9: TsTrackBar;
    sTrackBar10: TsTrackBar;
    sTrackBar11: TsTrackBar;
    sTrackBar12: TsTrackBar;
    sTrackBar13: TsTrackBar;
    sTrackBar14: TsTrackBar;
    sTrackBar15: TsTrackBar;
    sTrackBar16: TsTrackBar;
    sTrackBar17: TsTrackBar;
    sTrackBar18: TsTrackBar;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    EnableEQBtn: TsCheckBox;
    EQPresetsList: TsComboBox;
    procedure EnableEQBtnClick(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EQPresetsListChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEQFiles: TEQFiles;

    procedure SaveSettings;
    procedure LoadSettings;
  public
    { Public declarations }
  end;

var
  EQForm: TEQForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TEQForm.EnableEQBtnClick(Sender: TObject);
begin
  sPanel1.Enabled := EnableEQBtn.Checked;
  EQPresetsList.Enabled := EnableEQBtn.Checked;
  if EnableEQBtn.Checked then
  begin
    MainForm.EnableEQ;
  end
  else
  begin
    MainForm.DisableEQ;
  end;
end;

procedure TEQForm.EQPresetsListChange(Sender: TObject);
begin
  sTrackBar1.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[0];
  sTrackBar2.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[1];
  sTrackBar3.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[2];
  sTrackBar4.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[3];
  sTrackBar5.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[4];
  sTrackBar6.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[5];
  sTrackBar7.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[6];
  sTrackBar8.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[7];
  sTrackBar9.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[8];
  sTrackBar10.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[9];
  sTrackBar11.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[10];
  sTrackBar12.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[11];
  sTrackBar13.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[12];
  sTrackBar14.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[13];
  sTrackBar15.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[14];
  sTrackBar16.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[15];
  sTrackBar17.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[16];
  sTrackBar18.Position := FEQFiles[EQPresetsList.ItemIndex].EQValues[17];
end;

procedure TEQForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TEQForm.FormCreate(Sender: TObject);
var
  LEQTextFile: TStringList;
  I, j: Integer;
  LEQ: TEQFile;
  LEQFile: TStringList;
begin
  FEQFiles := TEQFiles.Create;
  LEQTextFile := TStringList.Create;
  LEQFile := TStringList.Create;
  try
    LEQTextFile.LoadFromFile(ExtractFileDir(Application.ExeName) + '\EQ.txt');
    for I := 0 to LEQTextFile.Count - 1 do
    begin
      LEQ.FileName := ExtractFileDir(Application.ExeName) + '\EQ\' + LEQTextFile[i] + '.txt';
      EQPresetsList.Items.Add(LEQTextFile[i]);
      LEQFile.LoadFromFile(LEQ.FileName);
      if LEQFile.Count = 18 then
      begin
        for j := 0 to LEQFile.Count - 1 do
        begin
          LEQ.EQValues[j] := LEQFile[j].ToInteger;
        end;
      end;

      FEQFiles.Add(LEQ);
    end;
  finally
    LEQFile.Free;
    LEQTextFile.Free;
  end;
  LoadSettings;
end;

procedure TEQForm.FormDestroy(Sender: TObject);
begin
  FEQFiles.Free;
end;

procedure TEQForm.FormShow(Sender: TObject);
begin
  Self.Color := MainForm.Color;
  EQPresetsList.Color := MainForm.PlaylistList.Color;
end;

procedure TEQForm.LoadSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      EnableEQBtn.Checked := ReadBool('eq', 'enable', True);
      EQPresetsList.ItemIndex := ReadInteger('eq', 'preset', 0);
      sTrackBar1.Position := ReadInteger('eq', '1', 0);
      sTrackBar2.Position := ReadInteger('eq', '2', 0);
      sTrackBar3.Position := ReadInteger('eq', '3', 0);
      sTrackBar4.Position := ReadInteger('eq', '4', 0);
      sTrackBar5.Position := ReadInteger('eq', '5', 0);
      sTrackBar6.Position := ReadInteger('eq', '6', 0);
      sTrackBar7.Position := ReadInteger('eq', '7', 0);
      sTrackBar8.Position := ReadInteger('eq', '8', 0);
      sTrackBar9.Position := ReadInteger('eq', '9', 0);
      sTrackBar10.Position := ReadInteger('eq', '10', 0);
      sTrackBar11.Position := ReadInteger('eq', '11', 0);
      sTrackBar12.Position := ReadInteger('eq', '12', 0);
      sTrackBar13.Position := ReadInteger('eq', '13', 0);
      sTrackBar14.Position := ReadInteger('eq', '14', 0);
      sTrackBar15.Position := ReadInteger('eq', '15', 0);
      sTrackBar16.Position := ReadInteger('eq', '16', 0);
      sTrackBar17.Position := ReadInteger('eq', '17', 0);
      sTrackBar18.Position := ReadInteger('eq', '18', 0);
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TEQForm.SaveSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(MainForm.FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      WriteBool('eq', 'enable', EnableEQBtn.Checked);
      WriteInteger('eq', 'preset', EQPresetsList.ItemIndex);
      WriteInteger('eq', '1', sTrackBar1.Position);
      WriteInteger('eq', '2', sTrackBar2.Position);
      WriteInteger('eq', '3', sTrackBar3.Position);
      WriteInteger('eq', '4', sTrackBar4.Position);
      WriteInteger('eq', '5', sTrackBar5.Position);
      WriteInteger('eq', '6', sTrackBar6.Position);
      WriteInteger('eq', '7', sTrackBar7.Position);
      WriteInteger('eq', '8', sTrackBar8.Position);
      WriteInteger('eq', '9', sTrackBar9.Position);
      WriteInteger('eq', '10', sTrackBar10.Position);
      WriteInteger('eq', '11', sTrackBar11.Position);
      WriteInteger('eq', '12', sTrackBar12.Position);
      WriteInteger('eq', '13', sTrackBar13.Position);
      WriteInteger('eq', '14', sTrackBar14.Position);
      WriteInteger('eq', '15', sTrackBar15.Position);
      WriteInteger('eq', '16', sTrackBar16.Position);
      WriteInteger('eq', '17', sTrackBar17.Position);
      WriteInteger('eq', '18', sTrackBar18.Position);
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TEQForm.sTrackBar1Change(Sender: TObject);
begin
  TsTrackBar(Sender).Hint := (15 - (TsTrackBar(Sender).Position / 100) - 15).ToString;
  MainForm.UpdateEQ;
end;

end.
