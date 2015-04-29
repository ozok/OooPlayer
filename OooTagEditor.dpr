program OooTagEditor;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  UnitMain in 'TagEditor\UnitMain.pas' {MainForm} ,
  UnitTagReader in 'Units\UnitTagReader.pas',
  UnitTagTypes in 'Units\UnitTagTypes.pas',
  MediaInfoDLL in 'Units\MediaInfoDLL.pas',
  APEv2Library in 'units\taglibraries\APEv2Library.pas',
  FlacTagLibrary in 'units\taglibraries\FlacTagLibrary.pas',
  ID3v1Library in 'Units\TagLibraries\ID3v1Library.pas',
  ID3v2Library in 'Units\TagLibraries\ID3v2Library.pas',
  MP4TagLibrary in 'units\taglibraries\MP4TagLibrary.pas',
  OggVorbisAndOpusTagLibrary in 'units\taglibraries\OggVorbisAndOpusTagLibrary.pas',
  uTExtendedX87 in 'units\taglibraries\uTExtendedX87.pas',
  WAVTagLibrary in 'units\taglibraries\WAVTagLibrary.pas',
  WMATagLibrary in 'units\taglibraries\WMATagLibrary.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
