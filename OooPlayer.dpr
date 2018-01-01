program OooPlayer;

uses
  madExcept,
  Vcl.Forms,
  UnitMain in 'Forms\UnitMain.pas' {MainForm},
  MediaInfoDLL in 'Units\Others\MediaInfoDLL.pas',
  UnitSearch in 'Forms\UnitSearch.pas' {SearchForm},
  UnitSettings in 'Forms\UnitSettings.pas' {SettingsForm},
  UnitTagTypes in 'Units\Tag\UnitTagTypes.pas',
  APEv2Library in 'Units\TagLibraries\APEv2Library.pas',
  FlacTagLibrary in 'Units\TagLibraries\FlacTagLibrary.pas',
  ID3v1Library in 'Units\TagLibraries\ID3v1Library.pas',
  ID3v2Library in 'Units\TagLibraries\ID3v2Library.pas',
  MP4TagLibrary in 'Units\TagLibraries\MP4TagLibrary.pas',
  OggVorbisAndOpusTagLibrary in 'Units\TagLibraries\OggVorbisAndOpusTagLibrary.pas',
  UnitLog in 'Forms\UnitLog.pas' {LogForm},
  UnitAbout in 'Forms\UnitAbout.pas' {AboutForm},
  UnitMusicPlayer in 'Units\Player\UnitMusicPlayer.pas',
  uTExtendedX87 in 'Units\TagLibraries\uTExtendedX87.pas',
  WMATagLibrary in 'Units\TagLibraries\WMATagLibrary.pas',
  WAVTagLibrary in 'Units\TagLibraries\WAVTagLibrary.pas',
  bass in 'BassUnits\bass.pas',
  bass_aac in 'BassUnits\bass_aac.pas',
  bass_ac3 in 'BassUnits\bass_ac3.pas',
  bass_ape in 'BassUnits\bass_ape.pas',
  bass_mpc in 'BassUnits\bass_mpc.pas',
  bass_ofr in 'BassUnits\bass_ofr.pas',
  bass_spx in 'BassUnits\bass_spx.pas',
  bass_tta in 'BassUnits\bass_tta.pas',
  bassflac in 'BassUnits\bassflac.pas',
  bassopus in 'BassUnits\bassopus.pas',
  basswma in 'BassUnits\basswma.pas',
  basswv in 'BassUnits\basswv.pas',
  UnitLyricDownloader in 'Units\Lyric\UnitLyricDownloader.pas',
  UnitRadioInfo in 'Forms\UnitRadioInfo.pas' {RadioInfoForm},
  UnitNewRadio in 'Forms\UnitNewRadio.pas' {NewRadioForm},
  bassenc in 'BassUnits\bassenc.pas',
  UnitRadioRecordOptions in 'Forms\UnitRadioRecordOptions.pas' {RadioRecordOptionsForm},
  bassmix in 'BassUnits\bassmix.pas',
  UnitTagWriter in 'Units\Tag\UnitTagWriter.pas',
  Vcl.Themes,
  Vcl.Styles,
  UnitImageResize in 'Units\Artwork\UnitImageResize.pas',
  UnitArtworkReader in 'Units\Artwork\UnitArtworkReader.pas',
  UnitEQ in 'Forms\UnitEQ.pas' {EQForm},
  UnitArtworkInfo in 'Units\Artwork\UnitArtworkInfo.pas',
  UnitLastFMToolLauncher in 'Units\Process\UnitLastFMToolLauncher.pas',
  UnitTagReader in 'Units\Tag\UnitTagReader.pas',
  UnitSubProcessLauncher in 'Units\Process\UnitSubProcessLauncher.pas',
  UnitCueParser in 'Units\Cue\UnitCueParser.pas',
  bass_fx in 'BassUnits\bass_fx.pas',
  bassalac in 'BassUnits\bassalac.pas',
  UnitShuffleList in 'Forms\UnitShuffleList.pas' {ShuffleListForm},
  Playlist in 'Types\Playlist.pas',
  Radiolist in 'Types\Radiolist.pas',
  CommonTypes in 'Types\CommonTypes.pas',
  UnitProgress in 'Forms\UnitProgress.pas' {ProgressForm},
  Utils in 'Units\Others\Utils.pas',
  JsonSerializer in 'Units\Others\JsonSerializer.pas',
  Constants in 'Units\Constants\Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.Title := 'OooPlayer';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TLogForm, LogForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TNewRadioForm, NewRadioForm);
  Application.CreateForm(TRadioRecordOptionsForm, RadioRecordOptionsForm);
  Application.CreateForm(TEQForm, EQForm);
  Application.CreateForm(TShuffleListForm, ShuffleListForm);
  Application.CreateForm(TProgressForm, ProgressForm);
  Application.Run;

end.
