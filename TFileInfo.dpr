program TFileInfo;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  UnitMain in 'TFileInfo\UnitMain.pas' {MainForm},
  MediaInfoDLL in 'Units\MediaInfoDLL.pas',
  UnitAbout in 'TFileInfo\UnitAbout.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
