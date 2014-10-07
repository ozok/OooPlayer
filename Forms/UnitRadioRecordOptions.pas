unit UnitRadioRecordOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, Vcl.ComCtrls, IniFiles, JvComponentBase, JvComputerInfoEx, ShellAPI;

type
  TRadioRecordOptionsForm = class(TForm)
    RecordSaveEdit: TJvDirectoryEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    BitrateList: TComboBox;
    Info: TJvComputerInfoEx;
    Label3: TLabel;
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

uses UnitMain;

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
