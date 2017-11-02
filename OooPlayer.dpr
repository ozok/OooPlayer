program OooPlayer;

uses
  madExcept,
  Vcl.Forms,
  UnitMain in 'Forms\UnitMain.pas' {MainForm},
  MediaInfoDLL in 'Units\Others\MediaInfoDLL.pas',
  UnitSearch in 'Forms\UnitSearch.pas' {SearchForm},
  UnitSettings in 'Forms\UnitSettings.pas' {SettingsForm},
  TagTypes in 'Units\Tag\TagTypes.pas',
  APEv2Library in 'Units\TagLibraries\APEv2Library.pas',
  FlacTagLibrary in 'Units\TagLibraries\FlacTagLibrary.pas',
  ID3v1Library in 'Units\TagLibraries\ID3v1Library.pas',
  ID3v2Library in 'Units\TagLibraries\ID3v2Library.pas',
  MP4TagLibrary in 'Units\TagLibraries\MP4TagLibrary.pas',
  OggVorbisAndOpusTagLibrary in 'Units\TagLibraries\OggVorbisAndOpusTagLibrary.pas',
  UnitLog in 'Forms\UnitLog.pas' {LogForm},
  UnitAbout in 'Forms\UnitAbout.pas' {AboutForm},
  MusicPlayer in 'Units\Player\MusicPlayer.pas',
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
  LyricDownloader in 'Units\Lyric\LyricDownloader.pas',
  UnitRadioInfo in 'Forms\UnitRadioInfo.pas' {RadioInfoForm},
  UnitNewRadio in 'Forms\UnitNewRadio.pas' {NewRadioForm},
  bassenc in 'BassUnits\bassenc.pas',
  UnitRadioRecordOptions in 'Forms\UnitRadioRecordOptions.pas' {RadioRecordOptionsForm},
  bassmix in 'BassUnits\bassmix.pas',
  TagWriter in 'Units\Tag\TagWriter.pas',
  Vcl.Themes,
  Vcl.Styles,
  ImageResize in 'Units\Artwork\ImageResize.pas',
  ArtworkReader in 'Units\Artwork\ArtworkReader.pas',
  UnitEQ in 'Forms\UnitEQ.pas' {EQForm},
  ArtworkInfo in 'Units\Artwork\ArtworkInfo.pas',
  LastFMToolLauncher in 'Units\Process\LastFMToolLauncher.pas',
  TagReader in 'Units\Tag\TagReader.pas',
  SubProcessLauncher in 'Units\Process\SubProcessLauncher.pas',
  CueParser in 'Units\Cue\CueParser.pas',
  bass_fx in 'BassUnits\bass_fx.pas',
  bassalac in 'BassUnits\bassalac.pas',
  UnitShuffleList in 'Forms\UnitShuffleList.pas' {ShuffleListForm},
  Playlist in 'Types\Playlist.pas',
  Radiolist in 'Types\Radiolist.pas',
  CommonTypes in 'Types\CommonTypes.pas',
  UnitProgress in 'Forms\UnitProgress.pas' {ProgressForm},
  CUESheetDefs in 'Units\Cue\CUESheetDefs.pas',
  CUESheetFunctions in 'Units\Cue\CUESheetFunctions.pas',
  spectrum_vis in 'Vis\spectrum_vis.pas',
  VisTypes in 'Types\VisTypes.pas',
  ThreadMsgConstants in 'Constants\ThreadMsgConstants.pas';

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
  Application.CreateForm(TRadioRecordOptionsForm, RadioRecordOptionsForm);
  Application.CreateForm(TEQForm, EQForm);
  Application.CreateForm(TShuffleListForm, ShuffleListForm);
  Application.CreateForm(TProgressForm, ProgressForm);
  Application.Run;

end.
