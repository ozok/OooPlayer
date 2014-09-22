program OooPlayer;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  UnitMain in 'Forms\UnitMain.pas' {MainForm},
  MediaInfoDLL in 'Units\MediaInfoDLL.pas',
  windows7taskbar in 'Units\windows7taskbar.pas',
  UnitSearch in 'Forms\UnitSearch.pas' {SearchForm},
  UnitSettings in 'Forms\UnitSettings.pas' {SettingsForm},
  UnitFileInfo in 'Forms\UnitFileInfo.pas' {InfoForm},
  UnitTagReader in 'Units\UnitTagReader.pas',
  UnitTagTypes in 'Units\UnitTagTypes.pas',
  APEv2Library in 'Units\TagLibraries\APEv2Library.pas',
  FlacTagLibrary in 'Units\TagLibraries\FlacTagLibrary.pas',
  ID3v1Library in 'Units\TagLibraries\ID3v1Library.pas',
  ID3v2Library in 'Units\TagLibraries\ID3v2Library.pas',
  MP4TagLibrary in 'Units\TagLibraries\MP4TagLibrary.pas',
  OggVorbisAndOpusTagLibrary in 'Units\TagLibraries\OggVorbisAndOpusTagLibrary.pas',
  UnitLog in 'Forms\UnitLog.pas' {LogForm},
  UnitAbout in 'Forms\UnitAbout.pas' {AboutForm},
  UnitMusicPlayer in 'Units\UnitMusicPlayer.pas',
  uTExtendedX87 in 'Units\TagLibraries\uTExtendedX87.pas',
  WMATagLibrary in 'Units\TagLibraries\WMATagLibrary.pas',
  WAVTagLibrary in 'Units\TagLibraries\WAVTagLibrary.pas',
  bass in 'BassUnits\bass.pas',
  bass_aac in 'BassUnits\bass_aac.pas',
  bass_ac3 in 'BassUnits\bass_ac3.pas',
  bass_alac in 'BassUnits\bass_alac.pas',
  bass_ape in 'BassUnits\bass_ape.pas',
  bass_mpc in 'BassUnits\bass_mpc.pas',
  bass_ofr in 'BassUnits\bass_ofr.pas',
  bass_spx in 'BassUnits\bass_spx.pas',
  bass_tta in 'BassUnits\bass_tta.pas',
  bassflac in 'BassUnits\bassflac.pas',
  bassopus in 'BassUnits\bassopus.pas',
  basswma in 'BassUnits\basswma.pas',
  basswv in 'BassUnits\basswv.pas',
  UnitLyricDownloader in 'Units\UnitLyricDownloader.pas',
  bassmix in 'BassUnits\bassmix.pas',
  UnitRadioInfo in 'Forms\UnitRadioInfo.pas' {RadioInfoForm},
  UnitNewRadio in 'Forms\UnitNewRadio.pas' {NewRadioForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'OooPlayer';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TLogForm, LogForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TNewRadioForm, NewRadioForm);
  Application.Run;

end.
