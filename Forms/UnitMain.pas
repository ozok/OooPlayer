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

unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Generics.Collections, Vcl.Menus, JvExControls,
  JvArrowButton, JvComponentBase, JvSearchFiles, JvBaseDlg, JvBrowseFolder,
  MediaInfoDll, JvExComCtrls, JvComCtrls, Vcl.ImgList, JvThreadTimer,
  JvExStdCtrls,
  JvListBox, IniFiles, Vcl.Buttons, JvFormPlacement, JvAppStorage,
  JvAppIniStorage, StrUtils, ShellAPI, JvComputerInfoEx, UnitTagTypes,
  UnitTagReader,
  PNGImage, JvDragDrop, JvThread, JvUrlListGrabber, JvUrlGrabbers, JvTrayIcon,
  Jpeg, UnitMusicPlayer, Bass, BASSenc, IdBaseComponent, IdThreadComponent,
  UnitLyricDownloader, UnitTagWriter, UnitImageResize, JvAnimatedImage,
  JvGIFCtrl,
  JvExExtCtrls, JvImage, JvAppInst, UnitArtworkReader, Vcl.Taskbar,
  System.Win.TaskbarCore, sSkinManager, sDialogs, sMemo, sListView,
  sPageControl, sStatusBar, sLabel, sComboBox, sBitBtn, sPanel, sBevel,
  sSplitter, sSkinProvider, acProgressBar, sTrackBar, acImage, acPNG,
  acAlphaHints, acAlphaImageList, sButton, Vcl.AppEvnts,
  acShellCtrls, sComboBoxes, sTreeView, sListBox, System.Types,
  sEdit, sGauge, UnitLastFMToolLauncher, Pipes, UnitSubProcessLauncher,
  GraphUtil,
  Vcl.XPMan, UnitCueParser, System.ImageList;

type
  TPlaybackType = (music = 0, radio = 1);

type
  TPlaylistFile = class
    Name, PlaylistFile: string;
    CurrentItemIndex: integer;
  end;

  TPlaylistFiles = TList<TPlaylistFile>;

type
  TRadioStation = packed record
    Name: string;
    URL: Ansistring;
    Web: string;
  end;

  TRadioList = TList<TRadioStation>;

type
  TCurrentItemInfo = packed record
    // ItemIndex: integer;
    FullFileName: string;
    DurationBass: int64;
    DurationAsSecInt: Integer;
    InfoStr: string;
  end;

type
  TMyDragObject = class(TDragObject)
  public
    ItemIndex: Integer;
  end;

type
  TRadioRecordInfo = record
    FileName: string;
    Title: string;
    Artist: string;
  end;

type
  TMainForm = class(TForm)
    TopBarPnl: TsPanel;
    OpenFolder: TJvBrowseForFolderDialog;
    MusicSearch: TJvSearchFiles;
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    E1: TMenuItem;
    P1: TMenuItem;
    P2: TMenuItem;
    P3: TMenuItem;
    S1: TMenuItem;
    P4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    V1: TMenuItem;
    V2: TMenuItem;
    P5: TMenuItem;
    J1: TMenuItem;
    A3: TMenuItem;
    A4: TMenuItem;
    S2: TMenuItem;
    C1: TMenuItem;
    PlayListMenu: TPopupMenu;
    o1: TMenuItem;
    F2: TMenuItem;
    AppIniFileStorage: TJvAppIniFileStorage;
    FormStorage: TJvFormStorage;
    G1: TMenuItem;
    SysInfo: TJvComputerInfoEx;
    R1: TMenuItem;
    StatusBar: TsStatusBar;
    N1: TMenuItem;
    s3: TMenuItem;
    L1: TMenuItem;
    N4: TMenuItem;
    E2: TMenuItem;
    L2: TMenuItem;
    ProgressPanel: TsPanel;
    AbortBtn: TsBitBtn;
    ProgressLabel: TsLabel;
    R2: TMenuItem;
    DragDrop: TJvDragDrop;
    H1: TMenuItem;
    C2: TMenuItem;
    E3: TMenuItem;
    A1: TMenuItem;
    UpdateThread: TJvThread;
    OpenDialog: TsOpenDialog;
    S4: TMenuItem;
    D1: TMenuItem;
    TrayMenu: TPopupMenu;
    P6: TMenuItem;
    P7: TMenuItem;
    S5: TMenuItem;
    v3: TMenuItem;
    V4: TMenuItem;
    PositionTimer: TTimer;
    FuncPages: TsPageControl;
    TabSheet1: TsTabSheet;
    TabSheet2: TsTabSheet;
    RadioList: TsListView;
    RadioListMenu: TPopupMenu;
    S6: TMenuItem;
    A2: TMenuItem;
    V5: TMenuItem;
    M1: TMenuItem;
    R3: TMenuItem;
    A5: TMenuItem;
    A6: TMenuItem;
    R4: TMenuItem;
    RadioRecordPanel: TsPanel;
    RecordRadioBtn: TsBitBtn;
    StopRadioRecordBtn: TsBitBtn;
    RadioRecordFormatList: TsComboBox;
    Label1: TsLabel;
    RadioRecordingOptionsBtn: TsBitBtn;
    RadioRecordModeList: TsComboBox;
    Label2: TsLabel;
    RadioRecordOutputFolderBtn: TsBitBtn;
    D2: TMenuItem;
    S7: TMenuItem;
    S8: TMenuItem;
    LyricPanel: TsPanel;
    LyricStatusLabel: TsLabel;
    pnl3: TsPanel;
    LyricTitleEdit: TLabeledEdit;
    LyricArtistEdit: TLabeledEdit;
    LyricSearchBtn: TsBitBtn;
    LyricSourceList: TsComboBox;
    PlayList: TsListView;
    QueueList: TsListView;
    Splitter1: TsSplitter;
    Splitter2: TsSplitter;
    LyricList: TsListBox;
    QueuelistMenu: TPopupMenu;
    P8: TMenuItem;
    R5: TMenuItem;
    C3: TMenuItem;
    AppInstances: TJvAppInstances;
    ProgressTimer: TTimer;
    OverlayImgs: TImageList;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sAlphaHints1: TsAlphaHints;
    CategoryList: TsAlphaImageList;
    LabelScrollTimer: TJvThreadTimer;
    E4: TMenuItem;
    AddMenu: TPopupMenu;
    H2: TMenuItem;
    ShortcutPanel: TsPanel;
    AddMenuBtn: TsBitBtn;
    RemoveMenuBtn: TsBitBtn;
    SearchMenuBtn: TsBitBtn;
    PlaylistMenuBtn: TsBitBtn;
    A7: TMenuItem;
    A8: TMenuItem;
    RemoveMenu: TPopupMenu;
    D3: TMenuItem;
    D4: TMenuItem;
    Playlist2Menu: TPopupMenu;
    S10: TMenuItem;
    L3: TMenuItem;
    RadioConnectionBar: TsProgressBar;
    CoverPanel: TsPanel;
    CoverImage: TJvImage;
    VolumePnl: TsPanel;
    VolumeBar: TsTrackBar;
    sPanel5: TsPanel;
    Panel1: TsPanel;
    PositionLabel: TsLabel;
    sPanel1: TsPanel;
    InfoPanel: TsPanel;
    TitleLabel: TsLabel;
    sPanel2: TsPanel;
    NextBtn: TsBitBtn;
    PauseBtn: TsBitBtn;
    PlayBtn: TsBitBtn;
    PrevBtn: TsBitBtn;
    StopBtn: TsBitBtn;
    sPanel3: TsPanel;
    LogsBtn: TsBitBtn;
    EQBtn: TsBitBtn;
    SearchBtn: TsBitBtn;
    SettingsBtn: TsBitBtn;
    PlaybackOrderList: TsComboBox;
    sWebLabel1: TsWebLabel;
    PrevArtworkBtn: TsBitBtn;
    NextArtworkBtn: TsBitBtn;
    sPanel7: TsPanel;
    CoverArtInfoLabel: TsLabel;
    sSplitter1: TsSplitter;
    FuncListMenu: TPopupMenu;
    N5: TMenuItem;
    D5: TMenuItem;
    R6: TMenuItem;
    CategoryPages: TsPageControl;
    sTabSheet2: TsTabSheet;
    sTabSheet4: TsTabSheet;
    PlaylistListPanel: TsPanel;
    AddPlaylistBtn: TsBitBtn;
    RemovePlaylistBtn: TsBitBtn;
    RenamePlaylistBtn: TsButton;
    sSplitter2: TsSplitter;
    LastFMLaunchTimer: TTimer;
    InfoLabel: TsLabel;
    PipeServer: TPipeServer;
    TrayIcon: TJvTrayIcon;
    UpdateChecker: TJvHttpUrlGrabber;
    PlaybackImages: TsAlphaImageList;
    H3: TMenuItem;
    H4: TMenuItem;
    F3: TMenuItem;
    Taskbar2: TTaskbar;
    XPManifest1: TXPManifest;
    ReloadLyricTitleBtn: TsBitBtn;
    PlaylistView: TsListView;
    RadioThread: TIdThreadComponent;
    RadiosView: TsListView;
    R7: TMenuItem;
    LeftPanelBtn: TsBitBtn;
    RightPanelBtn: TsBitBtn;
    PositionBar: TsTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MusicSearchProgress(Sender: TObject);
    procedure MusicSearchFindFile(Sender: TObject; const AName: string);
    procedure PlayListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PauseBtnClick(Sender: TObject);
    procedure VolumeBarChange(Sender: TObject);
    procedure PositionTimerTimer(Sender: TObject);
    procedure PlayListMouseEnter(Sender: TObject);
    procedure PositionBarChanged(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure V2Click(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure J1Click(Sender: TObject);
    procedure PlayBtnClick(Sender: TObject);
    procedure A4Click(Sender: TObject);
    procedure PositionBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure S2Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure PlayListData(Sender: TObject; Item: TListItem);
    procedure G1Click(Sender: TObject);
    procedure PlaybackOrderListChange(Sender: TObject);
    procedure o1Click(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure s3Click(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure AbortBtnClick(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure C2Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure UpdateCheckerDoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; URL: string);
    procedure UpdateThreadExecute(Sender: TObject; Params: Pointer);
    procedure A3Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure PlayListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PlayListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PlayListStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure D1Click(Sender: TObject);
    procedure RadioListData(Sender: TObject; Item: TListItem);
    procedure RadioCatListChange(Sender: TObject);
    procedure RadioListMouseEnter(Sender: TObject);
    procedure RadioListDblClick(Sender: TObject);
    procedure RadioListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure FuncPagesChange(Sender: TObject);
    procedure RadioThreadRun(Sender: TIdThreadComponent);
    procedure LyricListMouseEnter(Sender: TObject);
    procedure LyricSearchBtnClick(Sender: TObject);
    procedure LyricTitleEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure S6Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure QueueListDblClick(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure A5Click(Sender: TObject);
    procedure A6Click(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure RecordRadioBtnClick(Sender: TObject);
    procedure RadioRecordingOptionsBtnClick(Sender: TObject);
    procedure StopRadioRecordBtnClick(Sender: TObject);
    procedure RadioRecordOutputFolderBtnClick(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure S7Click(Sender: TObject);
    procedure S8Click(Sender: TObject);
    procedure FuncPagesMouseLeave(Sender: TObject);
    procedure PlayListMouseLeave(Sender: TObject);
    procedure QueueListMouseLeave(Sender: TObject);
    procedure QueueListMouseEnter(Sender: TObject);
    procedure LyricListMouseLeave(Sender: TObject);
    procedure RadioListMouseLeave(Sender: TObject);
    procedure TopBarPnlMouseEnter(Sender: TObject);
    procedure ProgressLabelMouseEnter(Sender: TObject);
    procedure ProgressPanelMouseEnter(Sender: TObject);
    procedure PlayBtnMouseEnter(Sender: TObject);
    procedure PauseBtnMouseEnter(Sender: TObject);
    procedure StopBtnMouseEnter(Sender: TObject);
    procedure PrevBtnMouseEnter(Sender: TObject);
    procedure NextBtnMouseEnter(Sender: TObject);
    procedure PositionBarMouseEnter(Sender: TObject);
    procedure VolumeBarMouseEnter(Sender: TObject);
    procedure SearchBtnMouseEnter(Sender: TObject);
    procedure SettingsBtnMouseEnter(Sender: TObject);
    procedure LogsBtnMouseEnter(Sender: TObject);
    procedure AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
    procedure ProgressTimerTimer(Sender: TObject);
    procedure VolumeBarToolTip(Sender: TObject; var ToolTipText: string);
    procedure TaskBar2ThumbButtonClick(Sender: TObject; AButtonID: Integer);
    procedure AddPlaylistBtnClick(Sender: TObject);
    procedure RemovePlaylistBtnClick(Sender: TObject);
    procedure RenamePlaylistBtnClick(Sender: TObject);
    procedure LabelScrollTimerTimer(Sender: TObject);
    procedure E4Click(Sender: TObject);
    procedure H2Click(Sender: TObject);
    procedure AddMenuBtnClick(Sender: TObject);
    procedure RemoveMenuBtnClick(Sender: TObject);
    procedure PlaylistMenuBtnClick(Sender: TObject);
    procedure EQBtnClick(Sender: TObject);
    procedure EQBtnMouseEnter(Sender: TObject);
    procedure P8Click(Sender: TObject);
    procedure R5Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure PrevArtworkBtnClick(Sender: TObject);
    procedure NextArtworkBtnClick(Sender: TObject);
    procedure TitleLabelMouseEnter(Sender: TObject);
    procedure RadiosViewChange(Sender: TObject; Node: TTreeNode);
    procedure LastFMLaunchTimerTimer(Sender: TObject);
    procedure CategoryPagesResize(Sender: TObject);
    procedure LyricPanelResize(Sender: TObject);
    procedure QueueListData(Sender: TObject; Item: TListItem);
    procedure sSkinManager1Deactivate(Sender: TObject);
    procedure InfoLabelMouseEnter(Sender: TObject);
    procedure InfoPanelMouseEnter(Sender: TObject);
    procedure PipeServerPipeConnect(Sender: TObject; Pipe: HPIPE);
    procedure FormActivate(Sender: TObject);
    procedure sSkinManager1Activate(Sender: TObject);
    procedure PlayListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure PlaylistViewClick(Sender: TObject);
    procedure RadiosViewClick(Sender: TObject);
    procedure H3Click(Sender: TObject);
    procedure H4Click(Sender: TObject);
    procedure sPanel5MouseEnter(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure ReloadLyricTitleBtnClick(Sender: TObject);
    procedure PlaylistViewResize(Sender: TObject);
    procedure PlaylistViewCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure RadiosViewCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure RadiosViewResize(Sender: TObject);
    procedure R7Click(Sender: TObject);
    procedure VolumeBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure DirectoryListClick(Sender: TObject);
  private
    { Private declarations }
    FLastDir: string;
    FStopAddFiles: Boolean;
    FDraggingCurrentFile: Boolean;
    FDraggedQueueItemIndex: integer;
    FJpeg: TJPEGImage;
    FPng: TPngImage;
    FRadioURL: Ansistring;
    FRadioLogItem: string;
    FLyricDownloader: TLyricDownloader;
    FPageHasntChangedYet: Boolean;
    FTagWriter: TTagWriter;
    FArtworkReader: TArtworkReader;
    FExternalArtworkFiles: TStringList;
    FCurrentRadioCatName: string;
    FCurrentRadioCatIndex: integer;
    FLastFMToolLauncher: TLastFMToolLauncher;
    FTagEditorLauncher: TSubProcessLauncher;
    FLastFMLaunchCounter: integer;
    FLastFMArtist, FLastFMSong: string;
    FTagFiles: TStringList;
    FInfoFiles: TStringList;
    FCategoryIndex: integer;

    procedure AddFile(const FileName: string);
    procedure AddCueSheet(const CUEPath: string);
    function GetDurationEx(const FileName: string): integer;
    procedure ReScanFile(const FileIndex: integer);

    procedure LoadPlayList;
    procedure SavePlayList;
    function GeneratePlaylistFileName: string;

    procedure LoadSettings;
    procedure SaveSettings;

    procedure ScrollToCurrentSong;

    procedure LoadM3UPlaylist(const PlaylistPath: string);
    procedure LoadPPFPlaylist(const PlaylistPath: string);
    procedure SaveM3UPlayList(const FileName: string; const UTF8: Boolean);
    procedure SavePPFPlaylist(const FileName: string);

    procedure CreateUserRadioLists;
    procedure MoveRadioStations;

    procedure WriteTagsToRecordFile;

    procedure UpdateOverlayIcon(const Index: integer);

    procedure ChangeSkin(const SkinIndex: integer);

    procedure LastFMScrobble;
  public
    { Public declarations }
    // encoder paths
    FLamePath, FOggEncPath, FOpusEncPath, FFDKPath: string;

    FPlayListFiles: TPlaylistFiles;
    FStoppedByUser: Boolean;
    FPlaylists: TList<TPlaylist>;
    FQueueLists: TList<TQueueList>;
    FRadioStations: TRadioList;
    FCurrentItemInfo: TCurrentItemInfo;
    FTagReader: TTagReader;
    FAppDataFolder: string;
    FPlaybackType: TPlaybackType;
    FCurrentRadioIndex: integer;
    FLyricAlbumStr: string;
    FShuffleIndexes: TList<Integer>;
    FShuffleIndex: Integer;
    PortableMode: Boolean;
    ArtworkFileName: string;
    FSelectedPlaylistIndex: integer;
    FActivePlaylistIndex: integer;
    FActiveRadioListIndex: integer;
    FArtistLabel: string;
    FAlbumLabel: string;
    FTitleLabel: string;
    FSelfCaption: string;
    FWinHandle: HWND;
    FActivelyPlayedPlaylistIndex: integer;
    FLevels: TLevel;

    procedure Log(s: string);

    procedure ScrollToItem(const ItemIndex: integer);

    procedure PlayItem(const ItemIndex: integer);
    procedure PlayItemUIUpdate;
    function PlayWindowTitle(const Song, Artist, Album: string): string;

    function RemoveInvalidChars(const Title: string): string;

    // handles msgessent from radio thread
    procedure WndProc(var Msg: TMessage); override;

    // Radio player funcs
    function IsRadioPlayerPaused: Boolean;
    function IsRadioPlayerStopped: Boolean;

    procedure LoadRadioStations;
    procedure ReloadRadioCategory;
    procedure PlayRadio(const URL: Ansistring);
    procedure PauseRadio;
    procedure ResumeRadio;
    procedure StopRadio;
    procedure SetRadioVolume(const Volume: integer);
    procedure AddToRadioLog;
    procedure RadioResetUI;
    procedure StartRadioRecording;
    procedure StopRadioRecording;
    procedure RecordingDisableUI;
    procedure RecordingEnableUI;
    function CreateRadioRecordFileName: TRadioRecordInfo;
    function GetRecordedFileType(const FileName: string): string;
    function CodecToExtension(const AudioCodec: string): string;
    // Radio player funcs

    function CreateLyricFileName(const Title, Artist, Album: string): string;
    function BassErrorCodeToString(const ErrorCode: integer): string;
    procedure SetPlayerBuffer(const Buffer: DWORD);

    procedure HandlePlaybackFromBassThread;

    procedure UpdateLyricBoxWidth;

    procedure UpdateEQ;
    procedure DisableEQ;
    procedure EnableEQ;

    procedure ChangePlaylistColumnNames;

    procedure GenerateShuffleList;
  end;

var
  MainForm: TMainForm;
  WinHandle: HWND;
  FRadioHandle: HSTREAM;
  FRadioRecordProcessID: Cardinal;
  FPlayer: TMusicPlayer;
  FRecordingRadio: Boolean;
  FRadioRecordingInfo: TRadioRecordInfo;

const
{$DEFINE WRITEDEBUGLOG}
  BuildInt = 2975;
  Portable = False;
  WM_INFO_UPDATE = WM_USER + 101;
  RESET_UI = 0;
  SHOW_ERROR = 1;
  UPDATE_PROGRESS = 2;
  UPDATE_META_NAME = 3;
  UPDATE_META_BITRATE = 4;
  UPDATE_META = 7;
  STATUS_UPDATE = 8;
  REPAINT_RADIO_LIST = 9;
  STOP_IMG_ANIM = 10;
  DOWNLOAD_LYRIC = 11;
  START_RECORDING = 12;
  PLAY_NEXT_SONG = 13;
  UPDATE_LEVELS = 14;

implementation

{$R *.dfm}

uses UnitSearch, UnitSettings, UnitLog, UnitAbout, UnitRadioInfo,
  UnitNewRadio, UnitRadioRecordOptions, UnitEQ;

// radio sync func
procedure StatusProc(Buffer: Pointer; len: DWORD; user: Pointer); stdcall;
var
  LFS: TFileStream;
begin
  if (Buffer <> nil) and (len = 0) then
  begin
    SendMessage(WinHandle, WM_INFO_UPDATE, STATUS_UPDATE, DWORD(PAnsiChar(Buffer)));
  end
  else if (Buffer <> nil) and (len > 0) and FRecordingRadio then
  begin
    if Length(FRadioRecordingInfo.FileName) > 0 then
    begin
      if FileExists(FRadioRecordingInfo.FileName) then
      begin
        LFS := TFileStream.Create(FRadioRecordingInfo.FileName, fmOpenReadWrite);
      end
      else
      begin
        LFS := TFileStream.Create(FRadioRecordingInfo.FileName, fmCreate);
      end;
      try
        LFS.Seek(0, soEnd);
        LFS.Write(Buffer^, len);
      finally
        LFS.Free;
      end;
    end;
  end;
end;

// radio meta sync funcs
procedure DoMeta();
var
  meta: PAnsiChar;
  p: Integer;
begin
  meta := BASS_ChannelGetTags(FRadioHandle, BASS_TAG_META);
  if (meta <> nil) then
  begin
    p := Pos('StreamTitle=', String(Ansistring(meta)));
    if (p = 0) then
      Exit;
    p := p + 13;
    SendMessage(WinHandle, WM_INFO_UPDATE, UPDATE_META, DWORD(PAnsiChar(Ansistring(Copy(meta, p, Pos(';', String(meta)) - p - 1)))));
  end;
end;

procedure MetaSync(handle: HSYNC; channel, data: DWORD; user: Pointer); stdcall;
begin
  DoMeta();
end;

procedure TMainForm.A1Click(Sender: TObject);
begin
  Self.Enabled := False;
  AboutForm.Show;
end;

procedure TMainForm.A2Click(Sender: TObject);
var
  i: integer;
begin
  for I := 0 to PlayList.Items.Count - 1 do
  begin
    if PlayList.Items[i].Selected then
    begin
      // add if not already in the queue
      if not FQueueLists[FSelectedPlaylistIndex].Contains(i) then
      begin
        // add to queue list
        FQueueLists[FSelectedPlaylistIndex].Add(i);
        // PlayList.Invalidate;
        // add to queue list
        QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
        QueueList.Invalidate;
        PlayList.Items[i].Update;
      end;
    end;
  end;
end;

procedure TMainForm.A3Click(Sender: TObject);
var
  I: Integer;
begin
  if DirectoryExists(FLastDir) then
  begin
    OpenDialog.InitialDir := FLastDir;
  end;
  if OpenDialog.Execute then
  begin
    FStopAddFiles := False;
    PlayList.Items.BeginUpdate;
    PlaylistListPanel.Enabled := False;
    ShortcutPanel.Enabled := False;
    ProgressPanel.Visible := True;
    try
      for I := 0 to OpenDialog.Files.Count - 1 do
      begin
        Application.ProcessMessages;
        ProgressLabel.Caption := ExtractFileDir(OpenDialog.Files[i]);
        if FStopAddFiles then
        begin
          Break;
        end
        else
        begin
          AddFile(OpenDialog.Files[i]);
        end;
      end;
    finally
      ProgressPanel.Visible := False;
      PlayList.Items.EndUpdate;
      PlaylistListPanel.Enabled := True;
      ShortcutPanel.Enabled := True;
      SavePlayList;
      FLastDir := OpenFolder.Directory;
      Self.Width := Self.Width + 1;
      Self.Width := Self.Width - 1;
      GenerateShuffleList;
      FShuffleIndex := -1;
      StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files/' + FPlayListFiles[FSelectedPlaylistIndex].Name;
      FStopAddFiles := True;
    end;
  end;
end;

procedure TMainForm.A4Click(Sender: TObject);
begin
  if DirectoryExists(FLastDir) then
  begin
    OpenFolder.Directory := FLastDir;
  end;
  if OpenFolder.Execute then
  begin
    PlayList.Items.BeginUpdate;
    PlaylistListPanel.Enabled := False;
    ShortcutPanel.Enabled := False;
    ProgressPanel.Visible := True;
    try
      MusicSearch.RecurseDepth := MaxInt;
      MusicSearch.RootDirectory := OpenFolder.Directory;
      MusicSearch.Search;
    finally
      ProgressPanel.Visible := False;
      PlayList.Items.EndUpdate;
      PlaylistListPanel.Enabled := True;
      ShortcutPanel.Enabled := True;
      SavePlayList;
      FLastDir := OpenFolder.Directory;
      Self.Width := Self.Width + 1;
      Self.Width := Self.Width - 1;
      GenerateShuffleList;
      FShuffleIndex := -1;
      StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files/' + FPlayListFiles[FSelectedPlaylistIndex].Name;
    end;
  end;
end;

procedure TMainForm.A5Click(Sender: TObject);
var
  LStreamWriter: TStreamWriter;
  LReader: TStringList;
begin
  if FCurrentRadioCatName <> 'User Favourites' then
  begin
    if not Portable then
    begin
      LStreamWriter := TStreamWriter.Create(FAppDataFolder + '\User Favourites.txt', True);
      LReader := TStringList.Create;
      try
        LReader.LoadFromFile(FAppDataFolder + '\' + FCurrentRadioCatName + '.txt');
        LStreamWriter.WriteLine(LReader[RadioList.ItemIndex]);
      finally
        LStreamWriter.Close;
        LStreamWriter.Free;
        LReader.Free;
      end;
    end
    else
    begin
      LStreamWriter := TStreamWriter.Create(ExtractFileDir(Application.ExeName) + '\Radios\User Favourites.txt', True);
      LReader := TStringList.Create;
      try
        LReader.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Radios\' + FCurrentRadioCatName + '.txt');
        LStreamWriter.WriteLine(LReader[RadioList.ItemIndex]);
      finally
        LStreamWriter.Close;
        LStreamWriter.Free;
        LReader.Free;
      end;
    end;
  end;
end;

procedure TMainForm.A6Click(Sender: TObject);
begin
  if FCurrentRadioCatName <> 'User Favourites' then
  begin
    Self.Enabled := False;
    NewRadioForm.RadioCategory := FCurrentRadioCatName;
    NewRadioForm.Portable := Portable;
    NewRadioForm.Show;
  end;
end;

procedure TMainForm.AbortBtnClick(Sender: TObject);
begin
  if MusicSearch.Searching then
  begin
    MusicSearch.Abort;
    ProgressPanel.Visible := False;
    PlayList.Items.EndUpdate;
    PlaylistListPanel.Enabled := True;
    ShortcutPanel.Enabled := True;
    SavePlayList;
    FLastDir := OpenFolder.Directory;
    Self.Width := Self.Width + 1;
    Self.Width := Self.Width - 1;
    GenerateShuffleList;
    FShuffleIndex := -1;
    StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
  end;
  FStopAddFiles := True;
end;

procedure TMainForm.AddCueSheet(const CUEPath: string);
var
  LCueParser: TCueSplitter;
  LMediaInfoHandle: Cardinal;
  FileDuration: integer;
  I: integer;
  LTitle, LArtist, LAlbum, LDuration, LBitrate, LChannels, LCodec, LSampleRate: string;
  LPlayListItem: TPlayItem;
begin
  LCueParser := TCueSplitter.Create(CUEPath);
  LCueParser.FileDuration := GetDurationEx(LCueParser.SongFileName);
  try
    LCueParser.ParseCueSheet;
    if LCueParser.ErrorMsg <> 0 then
    begin
      Log('Error with cue ' + CUEPath + '. Error code: ' + FloatToStr(LCueParser.ErrorMsg));
    end
    else
    begin
      if FileExists(LCueParser.SongFileName) then
      begin
        // New handle for mediainfo
        LMediaInfoHandle := MediaInfo_New();
        if LMediaInfoHandle <> 0 then
        begin
          try
            // Open a file in complete mode
            MediaInfo_Open(LMediaInfoHandle, PWideChar(LCueParser.SongFileName));
            MediaInfo_Option(0, 'Complete', '1');

            if LMediaInfoHandle <> 0 then
            begin
              FileDuration := GetDurationEx(LCueParser.SongFileName);

              // get tags from cue file
              if LCueParser.TrackCount > 0 then
              begin
                // each track is treated as a file
                for I := 0 to LCueParser.TrackCount - 1 do
                begin
                  Application.ProcessMessages;

                  // info
                  LBitrate := MediaInfo_Get(LMediaInfoHandle, Stream_Audio, 0, 'BitRate/String', Info_Text, Info_Name);
                  LChannels := MediaInfo_Get(LMediaInfoHandle, Stream_Audio, 0, 'Channel(s)/String', Info_Text, Info_Name);
                  LCodec := MediaInfo_Get(LMediaInfoHandle, Stream_Audio, 0, 'Codec/String', Info_Text, Info_Name);
                  // a workaround for ALAC being reported as "Lossless"
                  if LCodec = 'Lossless' then
                  begin
                    LCodec := MediaInfo_Get(LMediaInfoHandle, Stream_Audio, 0, 'Format', Info_Text, Info_Name);
                  end;
                  LSampleRate := MediaInfo_Get(LMediaInfoHandle, Stream_Audio, 0, 'SamplingRate', Info_Text, Info_Name);
                  // tags
                  LTitle := LCueParser.CueTracksInfos[i].CueTrackTagInfo.Title;
                  LArtist := LCueParser.CueTracksInfos[i].CueTrackTagInfo.Artist;
                  LAlbum := LCueParser.CueTracksInfos[i].CueTrackTagInfo.Album;

                  LTitle := Trim(LTitle);
                  LArtist := Trim(LArtist);
                  LAlbum := Trim(LAlbum);
                  LDuration := '00:00:00.000';
                  LCodec := Trim(LCodec);
                  LSampleRate := Trim(LSampleRate);

                  if (Length(LTitle) < 1) then
                  begin
                    // if cannot get title
                    // set to file name
                    LTitle := ChangeFileExt(ExtractFileName(LCueParser.SongFileName), '');
                  end;

                  if (Length(LArtist) < 1) then
                  begin
                    LArtist := 'unkown';
                  end;

                  if (Length(LAlbum) < 1) then
                  begin
                    LAlbum := 'unkown';
                  end;

                  if (Length(LDuration) < 1) then
                  begin
                    LDuration := '00:00:00.000';
                  end;

                  if (Length(LBitrate) < 1) then
                  begin
                    LBitrate := 'N/A';
                  end;

                  if (Length(LChannels) < 1) then
                  begin
                    LChannels := 'N/A';
                  end;

                  if (Length(LCodec) < 1) then
                  begin
                    LCodec := 'N/A';
                  end;

                  if (Length(LSampleRate) < 1) then
                  begin
                    LSampleRate := 'N/A';
                  end;
                  // increase playlist item count
                  PlayList.Items.Count := PlayList.Items.Count + 1;

                  LPlayListItem := TPlayItem.Create;
                  LPlayListItem.FullFileName := LCueParser.SongFileName;
                  LPlayListItem.DurationStr := LDuration;
                  LPlayListItem.Title := LTitle;
                  LPlayListItem.Artist := LArtist;
                  LPlayListItem.Album := LAlbum;
                  LPlayListItem.Bitrate := LBitrate;
                  LPlayListItem.Channels := LChannels;
                  LPlayListItem.Codec := LCodec;
                  LPlayListItem.SampleRate := LSampleRate;
                  // these two values are used for cue sheets
                  LPlayListItem.Duration := LCueParser.CueTracksInfos[i].CueTrackDurationInfo.Duration;
                  LPlayListItem.StartPos := LCueParser.CueTracksInfos[i].CueTrackDurationInfo.StartPos;
                  LPlayListItem.EndPos := LCueParser.CueTracksInfos[i].CueTrackDurationInfo.StartPos;
                  FPlaylists[FSelectedPlaylistIndex].Add(LPlayListItem);
                end;
              end;
            end
            else
            begin
              Log('Couldn''t add ' + LCueParser.SongFileName + ' because mediainfo can''t open it.');
            end;
          finally
            MediaInfo_Close(LMediaInfoHandle);
          end;
        end
        else
        begin
          Log('Couldn''t add ' + LCueParser.SongFileName + ' because mediainfo can''t be loaded.');
        end;
      end
      else
      begin
        Log('Couldn''t add ' + LCueParser.SongFileName + ' because file indicated in cue sheet doesn''t exist: ' + LCueParser.SongFileName);
      end;
    end;
  finally
    LCueParser.Free;
  end;
end;

procedure TMainForm.AddFile(const FileName: string);
var
  MediaInfoHandle: Cardinal;
  LPlayListItem, LTmpItem: TPlayItem;
  LTitle, LArtist, LAlbum, LDuration, LBitrate, LChannels, LCodec, LSampleRate: string;
begin

  if (FileExists(FileName)) then
  begin
    if ExtractFileExt(FileName).ToLower = '.cue' then
    begin
      // cue sheet
      AddCueSheet(FileName);
    end
    else
    begin
      // normal audio file
      MediaInfoHandle := MediaInfo_New();

      // initial values
      LTitle := 'unknown';
      LArtist := 'unknown';
      LAlbum := 'unknown';
      LDuration := '00:00:00.000';

      if (MediaInfoHandle <> 0) then
      begin
        try
          MediaInfo_Open(MediaInfoHandle, PWideChar(FileName));
          MediaInfo_Option(MediaInfoHandle, 'Complete', '1');

          // info
          LDuration := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Duration/String3', Info_Text, Info_Name);
          LBitrate := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'BitRate/String', Info_Text, Info_Name);
          LChannels := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Channel(s)/String', Info_Text, Info_Name);
          LCodec := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Codec/String', Info_Text, Info_Name);
          // a workaround for ALAC being reported as "Lossless"
          if LCodec = 'Lossless' then
          begin
            LCodec := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Format', Info_Text, Info_Name);
          end;
          LSampleRate := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'SamplingRate', Info_Text, Info_Name);
          // tags
          LTmpItem := FTagReader.ReadTags(FileName);
          LTitle := LTmpItem.Title;
          LArtist := LTmpItem.Artist;
          LAlbum := LTmpItem.Album;
          LTmpItem.Free;

          LTitle := Trim(LTitle);
          LArtist := Trim(LArtist);
          LAlbum := Trim(LAlbum);
          LDuration := Trim(LDuration);
          LCodec := Trim(LCodec);
          LSampleRate := Trim(LSampleRate);

          if (Length(LTitle) < 1) then
          begin
            // if cannot get title
            // set to file name
            LTitle := ChangeFileExt(ExtractFileName(FileName), '');
          end;

          if (Length(LArtist) < 1) then
          begin
            LArtist := 'unkown';
          end;

          if (Length(LAlbum) < 1) then
          begin
            LAlbum := 'unkown';
          end;

          if (Length(LDuration) < 1) then
          begin
            LDuration := '00:00:00.000';
          end;

          if (Length(LBitrate) < 1) then
          begin
            LBitrate := 'N/A';
          end;

          if (Length(LChannels) < 1) then
          begin
            LChannels := 'N/A';
          end;

          if (Length(LCodec) < 1) then
          begin
            LCodec := 'N/A';
          end;

          if (Length(LSampleRate) < 1) then
          begin
            LSampleRate := 'N/A';
          end;
          // increase playlist item count
          PlayList.Items.Count := PlayList.Items.Count + 1;

          LPlayListItem := TPlayItem.Create;
          LPlayListItem.FullFileName := FileName;
          LPlayListItem.DurationStr := LDuration;
          LPlayListItem.Title := LTitle;
          LPlayListItem.Artist := LArtist;
          LPlayListItem.Album := LAlbum;
          LPlayListItem.Bitrate := LBitrate;
          LPlayListItem.Channels := LChannels;
          LPlayListItem.Codec := LCodec;
          LPlayListItem.SampleRate := LSampleRate;
          // these two values are used for cue sheets
          LPlayListItem.Duration := 0;
          LPlayListItem.StartPos := 0;
          FPlaylists[FSelectedPlaylistIndex].Add(LPlayListItem);
        finally
          MediaInfo_Close(MediaInfoHandle);
        end;
      end;
    end;
  end;
end;

procedure TMainForm.AddMenuBtnClick(Sender: TObject);
var
  p: TPoint;
begin
  p := AddMenuBtn.ClientToScreen(Point(0, 0));
  AddMenu.Popup(p.X, p.Y + AddMenuBtn.Height)
end;

procedure TMainForm.AddPlaylistBtnClick(Sender: TObject);
var
  LName: string;
  LPlaylistFile: TPlaylistFile;
  I: Integer;
  LPlaylist: TPlaylist;
  LQueueList: TQueueList;
  LSW: TStreamWriter;
  LListItem: TListItem;
begin
  LName := InputBox('New playlist name', 'Name', 'Playlist' + FPlayListFiles.Count.ToString());
  if LName.Length > 0 then
  begin
    LPlaylistFile := TPlaylistFile.Create;
    LQueueList := TQueueList.Create;
    LPlaylistFile.Name := LName;
    LPlaylistFile.PlaylistFile := FAppDataFolder + '\' + GeneratePlaylistFileName + '.dat';
    LPlaylistFile.CurrentItemIndex := -1;
    FPlayListFiles.Add(LPlaylistFile);
    LSW := TStreamWriter.Create(FAppDataFolder + '\playlists.dat', False);
    try
      for I := 0 to FPlayListFiles.Count - 1 do
      begin
        LSW.WriteLine(FPlayListFiles[i].Name + '|' + FPlayListFiles[i].PlaylistFile + '|' + FPlayListFiles[i].CurrentItemIndex.ToString());
      end;
    finally
      LSW.Close;
      LSW.Free;
    end;

    LListItem := PlaylistView.Items.Add;
    LListItem.Caption := FPlayListFiles.Count.ToString() + '.';
    LListItem.SubItems.Add(LPlaylistFile.Name);
    FSelectedPlaylistIndex := FPlayListFiles.Count - 1;

    LPlaylist := TPlaylist.Create;
    FPlaylists.Add(LPlaylist);
    FQueueLists.Add(LQueueList);
    SavePlayList;
    PlaylistViewClick(Self);
    // PlaylistListChange(Self);
  end;
end;

procedure TMainForm.AddToRadioLog;
begin
  LogForm.LogList.Lines.Add(FRadioLogItem);
  if LogForm.Visible = False then
  begin
    LogForm.Show;
  end;
end;

procedure TMainForm.AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
var
  i: integer;
begin
  if CmdLine.Count >= 1 then
  begin
    FStopAddFiles := False;
    PlayList.Items.BeginUpdate;
    ProgressPanel.Visible := True;
    try
      for I := 0 to CmdLine.Count - 1 do
      begin
        Application.ProcessMessages;
        ProgressLabel.Caption := ExtractFileDir(CmdLine[i]);
        if FStopAddFiles then
        begin
          Break;
        end
        else
        begin
          AddFile(CmdLine[i]);
        end;
      end;
    finally
      ProgressPanel.Visible := False;
      PlayList.Items.EndUpdate;
      SavePlayList;
      // FLastDir := OpenFolder.Directory;
      Self.Width := Self.Width + 1;
      Self.Width := Self.Width - 1;
      GenerateShuffleList;
      FShuffleIndex := -1;
      StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
      FStopAddFiles := True;
      if PlayList.Items.Count > 0 then
      begin
        PlayItem(PlayList.Items.Count - 1);
        PlayItemUIUpdate;
      end;
    end;
  end;
end;

function TMainForm.BassErrorCodeToString(const ErrorCode: integer): string;
begin
  case ErrorCode of
    - 1:
      Result := 'Unkown error';
    1:
      Result := 'Not enough memory';
    2:
      Result := 'Unable to open file';
    3:
      Result := 'BASS_ERROR_DRIVER';
    4:
      Result := 'BASS_ERROR_BUFLOST';
    5:
      Result := 'BASS_ERROR_HANDLE ';
    6:
      Result := 'BASS_ERROR_FORMAT';
    7:
      Result := 'BASS_ERROR_POSITION ';
    8:
      Result := 'BASS_ERROR_INIT';
    9:
      Result := 'BASS_ERROR_START ';
    14:
      Result := 'BASS_ERROR_ALREADY ';
    18:
      Result := 'BASS_ERROR_NOCHAN ';
    19:
      Result := 'BASS_ERROR_ILLTYPE ';
    20:
      Result := 'BASS_ERROR_ILLPARAM ';
    21:
      Result := 'BASS_ERROR_NO3D';
    22:
      Result := 'BASS_ERROR_NOEAX ';
    23:
      Result := 'BASS_ERROR_DEVICE ';
    24:
      Result := 'BASS_ERROR_NOPLAY';
    25:
      Result := 'BASS_ERROR_FREQ ';
    27:
      Result := 'BASS_ERROR_NOTFILE ';
    28:
      Result := 'BASS_ERROR_NOHW ';
    29:
      Result := 'BASS_ERROR_EMPTY ';
    31:
      Result := 'BASS_ERROR_NONET';
    32:
      Result := 'BASS_ERROR_CREATE ';
    33:
      Result := 'BASS_ERROR_NOFX ';
    34:
      Result := 'BASS_ERROR_NOTAVAIL';
    37:
      Result := 'BASS_ERROR_DECODE';
    39:
      Result := 'BASS_ERROR_DX ';
    40:
      Result := 'Connection timed out. Please try later.';
    41:
      Result := 'BASS_ERROR_FILEFORM';
    42:
      Result := 'BASS_ERROR_SPEAKER ';
    43:
      Result := 'BASS_ERROR_VERSION ';
    44:
      Result := 'BASS_ERROR_CODEC ';
    45:
      Result := 'BASS_ERROR_ENDED';
    46:
      Result := 'BASS_ERROR_BUSY';
  end;
end;

procedure TMainForm.LogsBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.RadioRecordingOptionsBtnClick(Sender: TObject);
begin
  Self.Enabled := False;
  RadioRecordOptionsForm.Show;
end;

procedure TMainForm.RadioRecordOutputFolderBtnClick(Sender: TObject);
begin
  if DirectoryExists(RadioRecordOptionsForm.RecordSaveEdit.Text) then
  begin
    ShellExecute(handle, 'open', 'explorer', PChar(RadioRecordOptionsForm.RecordSaveEdit.Text), nil, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.C1Click(Sender: TObject);
var
  I: Integer;
begin
  if MusicSearch.Searching then
    Exit;

  PlayList.Items.Clear;
  for I := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
  begin
    FPlaylists[FSelectedPlaylistIndex][i].Free;
  end;
  FQueueLists[FSelectedPlaylistIndex].Clear;
  QueueList.Items.Count := 0;
  QueueList.Invalidate;
  FPlaylists[FSelectedPlaylistIndex].Clear;
  PlayList.Items.Count := 0;
  FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := -1;
  FCurrentItemInfo.FullFileName := '';
  FShuffleIndexes.Clear;
  FShuffleIndex := -1;
  SavePlayList;
  StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
end;

procedure TMainForm.C2Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', PWideChar(ExtractFileDir(Application.ExeName) + '\changelog.txt'), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.C3Click(Sender: TObject);
begin
  if QueueList.Items.Count > 0 then
  begin
    // delete it from lists
    FQueueLists[FSelectedPlaylistIndex].Clear;
    QueueList.Items.Clear;
    QueueList.Invalidate;
    // PlayList.Invalidate;
  end;
end;

procedure TMainForm.CategoryPagesResize(Sender: TObject);
begin
  AddPlaylistBtn.Width := (PlaylistListPanel.Width - 18) div 3;
  RemovePlaylistBtn.Width := (PlaylistListPanel.Width - 18) div 3;
  RenamePlaylistBtn.Width := (PlaylistListPanel.Width - 18) div 3;
end;

procedure TMainForm.ChangePlaylistColumnNames;
begin
  case SettingsForm.PlaylistItemTextList.ItemIndex of
    0:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Title';
          Columns[1].Caption := 'Album';
          Columns[2].Caption := 'Artist';
        end;
      end;
    1:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Album';
          Columns[1].Caption := 'Title';
          Columns[2].Caption := 'Artist';
        end;
      end;
    2:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Artist';
          Columns[1].Caption := 'Album';
          Columns[2].Caption := 'Title';
        end;
      end;
    3:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Title';
          Columns[1].Caption := 'Artist';
          Columns[2].Caption := 'Album';
        end;
      end;
    4:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Album';
          Columns[1].Caption := 'Artist';
          Columns[2].Caption := 'Title';
        end;
      end;
    5:
      begin
        with PlayList do
        begin
          Columns[0].Caption := 'Artist';
          Columns[1].Caption := 'Title';
          Columns[2].Caption := 'Album';
        end;
      end;
  end;
end;

procedure TMainForm.ChangeSkin(const SkinIndex: integer);
var
  LSkins: TStringList;
begin
  LSkins := TStringList.Create;
  try
    LSkins.LoadFromFile(ExtractFileDir(Application.ExeName) + '\skins.txt');
    if LSkins.Count < SkinIndex then
    begin
      sSkinManager1.SkinName := LSkins[SkinIndex];
    end;
  finally
    LSkins.Free;
  end;
end;

function TMainForm.CodecToExtension(const AudioCodec: string): string;
var
  LCodecStr: string;
begin
  LCodecStr := AudioCodec.Trim;

  if ContainsText(LCodecStr, 'vorbis') then
  begin
    Result := '.ogg';
  end
  else if (LCodecStr = 'MPEG-1 Audio layer 2') or ContainsText(LCodecStr, 'mp2') then
  begin
    Result := '.mp2'
  end
  else if (LCodecStr = 'MPEG-1 Audio layer 3') or ContainsText(LCodecStr, 'mp3') or ContainsText(LCodecStr, 'lame') or ContainsText(LCodecStr, 'mpeg') or ContainsText(LCodecStr, 'mpa1l3') then
  begin
    Result := '.mp3';
  end
  else if ContainsText(LCodecStr, 'aac') then
  begin
    Result := '.m4a';
  end
  else if ContainsText(LCodecStr, 'truehd') then
  begin
    Result := '.thd';
  end
  else if ContainsText(LCodecStr, 'ac3') then
  begin
    Result := '.ac3';
  end
  else if ContainsText(LCodecStr, 'wavpack') then
  begin
    Result := '.wv';
  end
  else if ContainsText(LCodecStr, 'wav') or ContainsText(LCodecStr, 'pcm') then
  begin
    Result := '.wav';
  end
  else if ContainsText(LCodecStr, 'mpa1l2') then
  begin
    Result := '.mp2';
  end
  else if ContainsText(LCodecStr, 'amr') then
  begin
    Result := '.amr';
  end
  else if ContainsText(LCodecStr, 'flac') then
  begin
    Result := '.flac';
  end
  else if ContainsText(LCodecStr, 'dts') then
  begin
    Result := '.dts';
  end
  else if ContainsText(LCodecStr, 'monkey') then
  begin
    Result := '.ape';
  end;
end;

function TMainForm.CreateLyricFileName(const Title, Artist, Album: string): string;
const
  InvalidChars: array [0 .. 7] of char = ('<', '>', ':', '"', '|', '/', '?', '*');
var
  I: Integer;
begin
  Result := Title + '_' + Artist + '_' + Album + '.txt';
  for I := Low(InvalidChars) to High(InvalidChars) do
  begin
    Result := StringReplace(Result, InvalidChars[i], '', [rfReplaceAll]);
  end;
end;

function TMainForm.CreateRadioRecordFileName: TRadioRecordInfo;
var
  LOutputFile: string;
  LSplitLst: TStringList;
begin
  case RadioRecordModeList.ItemIndex of
    0: // seperate file for each file
      begin
        // make sure we have tags
        if Length(FArtistLabel) > 0 then
        begin
          LSplitLst := TStringList.Create;
          try
            LSplitLst.StrictDelimiter := True;
            LSplitLst.Delimiter := '-';
            LSplitLst.DelimitedText := FArtistLabel;
            if LSplitLst.Count >= 2 then
            begin
              LOutputFile := FRadioStations[FCurrentRadioIndex].Name + ' - ' + Trim(LSplitLst[1]) + ' - ' + Trim(LSplitLst[0]);
              if RadioRecordFormatList.ItemIndex = 4 then
              begin
                Result.Title := Trim(LSplitLst[1]);
                Result.Artist := Trim(LSplitLst[0]);
              end
              else
              begin
                Result.Title := '"' + Trim(LSplitLst[1]) + '" ';
                Result.Artist := '"' + Trim(LSplitLst[0]) + '" ';
              end;
            end
            else
            begin
              // use date time
              LOutputFile := FRadioStations[FCurrentRadioIndex].Name + ' - ' + DateTimeToStr(Now);
            end;
          finally
            LSplitLst.Free;
          end;
        end
        else
        begin
          // if tags aren't present use date and date
          LOutputFile := FRadioStations[FCurrentRadioIndex].Name + ' - ' + DateTimeToStr(Now);
        end;
      end;
    1: // single long file
      begin
        LOutputFile := FRadioStations[FCurrentRadioIndex].Name + ' - ' + DateTimeToStr(Now)
      end;
  end;
  if Length(Result.FileName) >= 251 then
  begin
    Result.FileName := Copy(Result.FileName, 1, 250);
  end;
  // extension
  case RadioRecordFormatList.ItemIndex of
    0:
      LOutputFile := LOutputFile + '.mp3';
    1:
      LOutputFile := LOutputFile + '.ogg';
    2:
      LOutputFile := LOutputFile + '.opus';
    3:
      LOutputFile := LOutputFile + '.m4a';
    4:
      LOutputFile := LOutputFile + '.tmp';
  end;

  LOutputFile := StringReplace(LOutputFile, '/', '_', [rfReplaceAll]);
  LOutputFile := StringReplace(LOutputFile, '\', '_', [rfReplaceAll]);
  Result.FileName := LOutputFile;
  // remove chars that are not allowed
  Result.FileName := StringReplace(Result.FileName, '<', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '>', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, ':', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '"', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '|', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '?', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '|', '_', [rfReplaceAll]);
  Result.FileName := StringReplace(Result.FileName, '*', '_', [rfReplaceAll]);
  if RadioRecordFormatList.ItemIndex = 4 then
  begin
    Result.FileName := ExcludeTrailingPathDelimiter(RadioRecordOptionsForm.RecordSaveEdit.Text) + '\' + Result.FileName;
  end
  else
  begin
    Result.FileName := '"' + ExcludeTrailingPathDelimiter(RadioRecordOptionsForm.RecordSaveEdit.Text) + '\' + Result.FileName + '"';
  end;
end;

procedure TMainForm.CreateUserRadioLists;
var
  LDummyFile: TStringList;
begin
  LDummyFile := TStringList.Create;
  try
    if not Portable then
    begin
      if not FileExists(FAppDataFolder + '\User Favourites.txt') then
      begin
        LDummyFile.SaveToFile(FAppDataFolder + '\User Favourites.txt', TEncoding.UTF8);
      end;
    end
    else
    begin
      if not FileExists(ExtractFileDir(Application.ExeName) + '\Radios\User Favourites.txt') then
      begin
        LDummyFile.SaveToFile(ExtractFileDir(Application.ExeName) + '\Radios\User Favourites.txt', TEncoding.UTF8);
      end;
    end;
  finally
    LDummyFile.Free;
  end;
end;

procedure TMainForm.D1Click(Sender: TObject);
var
  i: Integer;
begin
  if MusicSearch.Searching then
    Exit;

  for i := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
  begin
    if PlayList.Items[i].Selected then
    begin
      PlayList.Items.Count := PlayList.Items.Count - 1;
      FPlaylists[FSelectedPlaylistIndex].Delete(i);
      if i < FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
      begin
        FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex - 1;
      end
      else if i = FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
      begin
        if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1) < FPlaylists[FSelectedPlaylistIndex].Count then
        begin
          FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1;
        end
        else if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex - 1) > -1 then
        begin
          FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := 0;
        end
        else
        begin
          FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := -1;
        end;
      end;
    end;
  end;
  // PlayList.Invalidate;
end;

procedure TMainForm.D2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SQXZVLR553H64', nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.DirectoryListClick(Sender: TObject);
begin
  FuncPages.ActivePageIndex := 2;
end;

procedure TMainForm.DisableEQ;
var
  LEQValues: TEQValues;
begin
  LEQValues[0] := 0;
  LEQValues[1] := 0;
  LEQValues[2] := 0;
  LEQValues[3] := 0;
  LEQValues[4] := 0;
  LEQValues[5] := 0;
  LEQValues[6] := 0;
  LEQValues[7] := 0;
  LEQValues[8] := 0;
  LEQValues[9] := 0;
  LEQValues[10] := 0;
  LEQValues[11] := 0;
  LEQValues[12] := 0;
  LEQValues[13] := 0;
  LEQValues[14] := 0;
  LEQValues[15] := 0;
  LEQValues[16] := 0;
  LEQValues[17] := 0;
  FPlayer.ChangeEQ(LEQValues);
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
var
  i: Integer;
  Extension: string;
  DirectoriesToSearch: TStringList;
begin
  FStopAddFiles := False;
  PlayList.Items.BeginUpdate;
  PlaylistListPanel.Enabled := False;
  ShortcutPanel.Enabled := False;
  ProgressPanel.Visible := True;
  DirectoriesToSearch := TStringList.Create;
  try
    for i := 0 to Value.Count - 1 do
    begin
      Application.ProcessMessages;
      Extension := LowerCase(ExtractFileExt(Value[i]));
      if FStopAddFiles then
      begin
        Break;
      end
      else
      begin
        // decide if file or directory
        if DirectoryExists(Value[i]) then
        begin
          DirectoriesToSearch.Add(Value[i]);
        end
        else
        begin
          if (Extension = '.mp3') or (Extension = '.aac') or (Extension = '.ogg') or (Extension = '.opus') or (Extension = '.flac') or (Extension = '.alac') or (Extension = '.ape') or
            (Extension = '.mpc') or (Extension = '.tta') or (Extension = '.wv') or (Extension = '.wma') or (Extension = '.ac3') or (Extension = '.spx') or (Extension = '.tak') or
            (Extension = '.ofr') or (Extension = '.wav') or (Extension = '.cue') then
          begin
            AddFile(Value[i]);
            FLastDir := ExtractFileDir(Value[i]);
          end;
        end;
      end;
    end;
    // add directory content
    if not FStopAddFiles then
    begin
      if DirectoriesToSearch.Count > 0 then
      begin
        for I := 0 to DirectoriesToSearch.Count - 1 do
        begin
          Application.ProcessMessages;
          MusicSearch.RootDirectory := DirectoriesToSearch[i];
          MusicSearch.Search;
          FLastDir := DirectoriesToSearch[i];
        end;
      end;
    end;
  finally
    ProgressPanel.Visible := False;
    PlayList.Items.EndUpdate;
    PlaylistListPanel.Enabled := True;
    ShortcutPanel.Enabled := True;
    SavePlayList;
    FLastDir := OpenFolder.Directory;
    Self.Width := Self.Width + 1;
    Self.Width := Self.Width - 1;
    GenerateShuffleList;
    FShuffleIndex := -1;
    StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
    FStopAddFiles := True;
  end;
end;

procedure TMainForm.E2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TMainForm.E3Click(Sender: TObject);
const
  NewLine = '%0D%0A';
var
  mail: PChar;
  mailbody: string;
begin
  mailbody := AboutForm.Label1.Caption;
  mailbody := mailbody + NewLine + 'Bugs: ' + NewLine + NewLine + NewLine + 'Suggestions: ' + NewLine + NewLine + NewLine;
  mail := PWideChar('mailto:ozok26@gmail.com?subject=OooPlayer&body=' + mailbody);

  ShellExecute(0, 'open', mail, nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.E4Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TMainForm.EnableEQ;
begin
  // FPlayer.InitQE;
  UpdateEQ;
end;

procedure TMainForm.EQBtnClick(Sender: TObject);
begin
  EQForm.Show;
end;

procedure TMainForm.EQBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.F2Click(Sender: TObject);
var
  I: Integer;
begin
  if PlayList.ItemIndex > -1 then
  begin
    FTagFiles.Clear;
    FInfoFiles.Clear;
    for I := 0 to PlayList.Items.Count - 1 do
    begin
      if PlayList.Items[i].Selected then
      begin
        FTagFiles.Add(FPlaylists[FSelectedPlaylistIndex][i].FullFileName);
      end;
    end;
    if not FTagEditorLauncher.IsRunning then
    begin
      FTagEditorLauncher.Start('', ExtractFileDir(Application.ExeName) + '\OooTagEditor.exe');
    end;
  end;
end;

procedure TMainForm.F3Click(Sender: TObject);
var
  LFilePath: string;
begin
  if PlayList.ItemIndex > -1 then
  begin
    FTagFiles.Clear;
    FInfoFiles.Clear;
    LFilePath := FPlaylists[FSelectedPlaylistIndex][PlayList.ItemIndex].FullFileName;
    FInfoFiles.Add(LFilePath);
    if not FTagEditorLauncher.IsRunning then
    begin
      FTagEditorLauncher.Start('', ExtractFileDir(Application.ExeName) + '\TFileInfo.exe');
    end;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  PipeServer.Broadcast(PWideChar('Active')^, Length('Active') * SizeOf(WideChar));
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // VisTimer.Enabled := False;
  StopBtnClick(Self);
  AbortBtnClick(Self);
  SavePlayList;
  SaveSettings;
  TrayIcon.Active := False;
  Sleep(100);
  FLyricDownloader.Stop;
  FTagEditorLauncher.Stop;
  Taskbar2.OverlayIcon := nil;
  while not RadioThread.Terminated do
  begin
    RadioThread.TerminateAndWaitFor;
    Sleep(100)
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  LRadios: TStringList;
  I: Integer;
  LItem: TListItem;
begin
  FPlayer := TMusicPlayer.Create(handle);
  case FPlayer.ErrorMsg of
    MY_ERROR_BASS_NOT_LOADED:
      begin
        Application.MessageBox('Couldn''t load bass.dll library.', 'Fatal Error', MB_ICONERROR);
        Application.Terminate;
      end;
  end;

  if BASS_PluginLoad('bass_aac.dll', BASS_UNICODE) < 1 then
  begin
    Application.MessageBox('Unable to load aac plugin!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  if BASS_PluginLoad('basswma.dll', BASS_UNICODE) < 1 then
  begin
    Application.MessageBox('Unable to load wma plugin!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  if not MediaInfoDLL_Load(ExtractFileDir(Application.ExeName) + '\mediainfo.dll') then
  begin
    Application.MessageBox('Couldn''t load mediainfo.dll library.', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;

  // encoder paths
  FLamePath := ExtractFileDir(Application.ExeName) + '\Encoders\lame.exe';
  FOggEncPath := ExtractFileDir(Application.ExeName) + '\Encoders\oggenc2.exe';
  FOpusEncPath := ExtractFileDir(Application.ExeName) + '\Encoders\opusenc.exe';
  FFDKPath := ExtractFileDir(Application.ExeName) + '\Encoders\fdkaac.exe';
  if not FileExists(FLamePath) then
  begin
    Application.MessageBox('Unable to find lame.exe!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  if not FileExists(FOggEncPath) then
  begin
    Application.MessageBox('Unable to find oggenc2.exe!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  if not FileExists(FOpusEncPath) then
  begin
    Application.MessageBox('Unable to find opusenc.exe!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  if not FileExists(FFDKPath) then
  begin
    Application.MessageBox('Unable to find fdkaac.exe!', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;

  // radio playe config
  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1);
  BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 0);
  WinHandle := handle;
  FWinHandle := handle;

  if Portable then
  begin
    FAppDataFolder := ExtractFileDir(Application.ExeName) + '\'
  end
  else
  begin
    FAppDataFolder := SysInfo.Folders.AppData + '\OooPlayer\'
  end;
  if not DirectoryExists(FAppDataFolder) then
  begin
    if not ForceDirectories(FAppDataFolder) then
    begin
      Application.MessageBox('Unable to create profile folder.', 'FATAL ERROR', MB_ICONERROR);
      Application.Terminate;
    end;
  end;
  ForceDirectories(FAppDataFolder + '\lyric\');

  FPlaylists := TList<TPlaylist>.Create;
  FQueueLists := TList<TQueueList>.Create;

  FCurrentRadioIndex := -1;
  FStoppedByUser := False;
  AppIniFileStorage.FileName := FAppDataFolder + 'position5.ini';
  FShuffleIndexes := TList<Integer>.Create;
  FTagReader := TTagReader.Create;
  CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');
  FPng := TPngImage.Create;
  FJpeg := TJPEGImage.Create;
  FRadioStations := TRadioList.Create;
  PositionBar.Max := MaxInt;
  FLyricDownloader := TLyricDownloader.Create(FAppDataFolder + '\lyric\');
  FPageHasntChangedYet := True;
  PortableMode := Portable;
  FTagWriter := TTagWriter.Create;
  FArtworkReader := TArtworkReader.Create;
  FArtworkReader.DefaultImgPath := ExtractFileDir(Application.ExeName) + '\logo.png';
  FArtworkReader.AppDataFolder := FAppDataFolder;
  Taskbar2.ProgressMaxValue := High(Int64);
  FPlayListFiles := TPlaylistFiles.Create;
  FStopAddFiles := True;
  sSkinManager1.SkinDirectory := ExtractFileDir(Application.ExeName) + '\skins\';
  FExternalArtworkFiles := TStringList.Create;
  FuncPages.Pages[0].TabVisible := False;
  FuncPages.Pages[1].TabVisible := False;
  FLastFMToolLauncher := TLastFMToolLauncher.Create;
  FTagEditorLauncher := TSubProcessLauncher.Create;
  PipeServer.Active := True;
  FTagFiles := TStringList.Create;
  FInfoFiles := TStringList.Create;

  LRadios := TStringList.Create;
  try
    if FileExists(ExtractFileDir(Application.ExeName) + '\radios.txt') then
    begin
      LRadios.LoadFromFile(ExtractFileDir(Application.ExeName) + '\radios.txt');
      for I := 0 to LRadios.Count - 1 do
      begin
        LItem := RadiosView.Items.Add;
        LItem.Caption := (I + 1).ToString() + '.';
        LItem.SubItems.Add(LRadios[i]);
      end;
    end;
  finally
    LRadios.Free;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  I: Integer;
  j: Integer;
begin
  FPlayer.Free;
  for I := 0 to FPlaylists.Count - 1 do
  begin
    for j := 0 to FPlaylists[i].Count - 1 do
    begin
      FPlaylists[i][j].Free;
    end;
    FPlaylists[i].Free;
  end;
  for I := 0 to FPlayListFiles.Count - 1 do
  begin
    FPlayListFiles[i].Free;
  end;
  if FPlayListFiles <> nil then
  begin
    FPlayListFiles.Free;
  end;
  for I := 0 to FQueueLists.Count - 1 do
  begin
    FQueueLists[i].Free;
  end;
  if FQueueLists <> nil then
  begin
    FQueueLists.Free;
  end;
  FPlaylists.Free;
  FShuffleIndexes.Free;
  FTagReader.Free;
  FJpeg.Free;
  FPng.Free;
  FRadioStations.Free;
  BASS_Free;
  FLyricDownloader.Free;
  FTagWriter.Free;
  FArtworkReader.Free;
  FExternalArtworkFiles.Free;
  FLastFMToolLauncher.Free;
  FTagEditorLauncher.Free;
  FTagFiles.Free;
  FInfoFiles.Free;
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if VolumeBar.Focused then
  begin
    V2Click(Self);
    Handled := True;
  end;
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if VolumeBar.Focused then
  begin
    V1Click(Self);
    Handled := True;
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  // PlayList.Columns[4].Width := 100;
  // PlayList.Columns[0].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  // PlayList.Columns[1].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  // PlayList.Columns[2].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  try
    RadioList.Columns[0].Width := (RadioList.ClientWidth - 20) div RadioList.Columns.Count;
    RadioList.Columns[1].Width := (RadioList.ClientWidth - 20) div RadioList.Columns.Count;
    RadioList.Columns[2].Width := (RadioList.ClientWidth - 20) div RadioList.Columns.Count;
    QueueList.Columns[0].Width := QueueList.ClientWidth - QueueList.Columns[1].Width;
    StatusBar.Panels[0].Width := StatusBar.ClientWidth - StatusBar.Panels[1].Width;
  except
    on E: Exception do
      Log(E.Message);
  end;
  if FPlaybackType = music then
  begin
    if (FPlayer.PlayerStatus2 = psPlaying) or (FPlayer.PlayerStatus2 = psPaused) then
    begin
      if FPlaylists.Count > 0 then
      begin
        if (FSelectedPlaylistIndex < FPlaylists.Count) and (FSelectedPlaylistIndex > -1) then
        begin
          if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) then
          begin
            with FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex] do
            begin
              TitleLabel.Caption := Title + ' - ' + Album + ' - ' + Artist;
              FTitleLabel := TitleLabel.Caption;
              Self.Caption := FSelfCaption;
              FSelfCaption := Self.Caption;
              if TitleLabel.Width < TitleLabel.Canvas.TextWidth(TitleLabel.Caption) then
              begin
                TitleLabel.Caption := TitleLabel.Caption + ' - '
              end;
              if Self.Width < Self.Canvas.TextWidth(TitleLabel.Caption) then
              begin
                Self.Caption := Self.Caption + ' - '
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  I: Integer;
  LSF: TIniFile;
begin
  LoadPlayList;
  LoadSettings;
  MoveRadioStations;
  CreateUserRadioLists;
  LoadRadioStations;
  GenerateShuffleList;
  FShuffleIndex := -1;
  StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;

  // FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex is reseted to -1 above so we need to
  // re-read it from ini file
  LSF := TIniFile.Create(FAppDataFolder + '\settings.ini');
  try
    FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := LSF.ReadInteger('player', 'itemindex', -1);
  finally
    LSF.Free;
  end;
  if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count then
  begin
    PlayList.ItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
    ScrollToCurrentSong;
  end;
  if (FCurrentRadioIndex < FRadioStations.Count) and (FCurrentRadioIndex > -1) then
  begin
    RadioList.ItemIndex := FCurrentRadioIndex;
    RadioList.Items[FCurrentRadioIndex].MakeVisible(False);
  end;
  // update check
  if SettingsForm.CheckUpdateBtn.Checked then
  begin
    UpdateThread.Execute(nil)
  end;
  // PlayList.Columns[0].Width := PlayList.ClientWidth - PlayList.Columns[1].Width;
  FPlayer.SetBuffer(Round(SettingsForm.BufferEdit.Value));
  // add parameters as files to playlist
  if ParamCount >= 1 then
  begin
    FStopAddFiles := False;
    PlayList.Items.BeginUpdate;
    ProgressPanel.Visible := True;
    try
      for I := 1 to ParamCount do
      begin
        Application.ProcessMessages;
        ProgressLabel.Caption := ExtractFileDir(ParamStr(i));
        if FStopAddFiles then
        begin
          Break;
        end
        else
        begin
          AddFile(ParamStr(i));
        end;
      end;
    finally
      ProgressPanel.Visible := False;
      PlayList.Items.EndUpdate;
      SavePlayList;
      // FLastDir := OpenFolder.Directory;
      GenerateShuffleList;
      FShuffleIndex := -1;
      StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
      FStopAddFiles := True;
      if PlayList.Items.Count > 0 then
      begin
        PlayItem(PlayList.Items.Count - 1);
        PlayItemUIUpdate;
      end;
    end;
  end;
  Self.Width := Self.Width + 1;
  Self.Width := Self.Width - 1;
  // TrayIcon.ShowApplication;
  Self.FocusControl(VolumeBar);
  // Self.BringToFront;
  // playlist columns
  ChangePlaylistColumnNames;
  TrayIcon.ShowApplication;
  // IdThreadComponent1.Start;
end;

procedure TMainForm.G1Click(Sender: TObject);
begin
  SettingsForm.Show;
end;

procedure TMainForm.GenerateShuffleList;
var
  I: Integer;
  LIndex: Integer;
begin
  FShuffleIndexes.Clear;
  if FPlaylists.Count > FSelectedPlaylistIndex then
  begin
    for I := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
    begin
      FShuffleIndexes.Add(i);
    end;
    Randomize;
    for I := FShuffleIndexes.Count - 1 downto 0 do
    begin
      LIndex := Random(FShuffleIndexes.Count);
      FShuffleIndexes.Exchange(i, LIndex);
    end;
  end;
end;

function TMainForm.GeneratePlaylistFileName: string;
var
  LGUID: TGUID;
begin
  CreateGUID(LGUID);
  Result := GUIDToString(LGUID);
end;

function TMainForm.GetDurationEx(const FileName: string): integer;
var
  LMediaInfoHandle: Cardinal;
  VDuration: string;
begin
  Result := 0;
  if (FileExists(FileName)) then
  begin
    // New handle for mediainfo
    LMediaInfoHandle := MediaInfo_New();
    if LMediaInfoHandle <> 0 then
    begin
      try
        // Open a file in complete mode
        MediaInfo_Open(LMediaInfoHandle, PWideChar(FileName));
        MediaInfo_Option(0, 'Complete', '1');
        // get length
        VDuration := MediaInfo_Get(LMediaInfoHandle, Stream_Video, 0, 'Duration', Info_Text, Info_Name);
        if Length(VDuration) < 1 then
        begin
          if Length(Trim(VDuration)) < 1 then
          begin
            VDuration := MediaInfo_Get(LMediaInfoHandle, Stream_General, 0, 'Duration', Info_Text, Info_Name);
            if Length(VDuration) < 1 then
            begin
              VDuration := '0';
            end;
          end
          else
          begin
            VDuration := '0';
          end;
        end;
        Result := StrToInt64(VDuration);
      finally
        MediaInfo_Close(LMediaInfoHandle);
      end;
    end;
  end;
end;

function TMainForm.GetRecordedFileType(const FileName: string): string;
var
  MediaInfoHandle: Cardinal;
  LCodec: string;
begin
  Result := '.mp3';
  if (FileExists(FileName)) then
  begin
    // New handle for mediainfo
    MediaInfoHandle := MediaInfo_New();
    if (MediaInfoHandle <> 0) then
    begin
      try
        // read duration of file
        MediaInfo_Open(MediaInfoHandle, PWideChar(FileName));
        MediaInfo_Option(MediaInfoHandle, 'Complete', '1');

        LCodec := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Codec/String', Info_Text, Info_Name);
        // a workaround for ALAC being reported as "Lossless"
        if LCodec = 'Lossless' then
        begin
          LCodec := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Format', Info_Text, Info_Name);
        end;
        Log('Recorded codec format: ' + LCodec);
        Result := CodecToExtension(LCodec);
      finally
        MediaInfo_Close(MediaInfoHandle);
      end;
    end;
  end;
end;

procedure TMainForm.H2Click(Sender: TObject);
begin
  QueueList.Visible := not QueueList.Visible;
  H2.Checked := not QueueList.Visible;
  Splitter1.Visible := QueueList.Visible;
  FormResize(Self);
end;

procedure TMainForm.H3Click(Sender: TObject);
begin
  CategoryPages.Visible := not CategoryPages.Visible;
  H3.Checked := not CategoryPages.Visible;
  LeftPanelBtn.Down := H3.Checked;
  sSplitter2.Visible := CategoryPages.Visible;
  FormResize(Self);
end;

procedure TMainForm.H4Click(Sender: TObject);
begin
  LyricPanel.Visible := not LyricPanel.Visible;
  H4.Checked := not LyricPanel.Visible;
  RightPanelBtn.Down := H4.Checked;
  Splitter2.Visible := LyricPanel.Visible;
  FormResize(Self);
end;

procedure TMainForm.HandlePlaybackFromBassThread;
var
  LRndIndex: integer;
begin
  PlayItemUIUpdate;
  case PlaybackOrderList.ItemIndex of
    0: // normal
      begin
        // if playlist is not empty
        if PlayList.Items.Count > 0 then
        begin
          // first try queue
          if FQueueLists[FSelectedPlaylistIndex].Count > 0 then
          begin
            // delete it from lists
            FQueueLists[FSelectedPlaylistIndex].Delete(0);
            QueueList.Items.Delete(0);
            QueueList.Invalidate;
          end
          else
          begin
            // playback follows selection
            if SettingsForm.PlayCursorBtn.Checked then
            begin
              // try selected file
              if PlayList.ItemIndex > -1 then
              begin
                // if not last played item selected
                if PlayList.ItemIndex <> FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
                begin

                end
                else
                begin
                  // if last played item selected then try next item
                  if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                  begin

                  end
                  else
                  begin

                  end;
                end;
              end
              else
              begin
                // play next item
                if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                begin

                end;
              end;
            end
            else
            begin
              // ignore selection and try next song
              if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
              begin

              end;
            end;
          end;
        end
        else
        begin
          // empty playlist
          MainForm.FStoppedByUser := True;
          PositionBar.Position := 0;
          MainForm.Caption := 'OooPlayer';
          CoverImage.Picture.LoadFromFile('logo.png');
          TitleLabel.Caption := '';
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          FArtistLabel := '';
          FAlbumLabel := '';
          PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
          LyricList.Items.Clear;
          if MainForm.Enabled and MainForm.Visible then
            MainForm.FocusControl(VolumeBar);
        end;
      end;
    1: // random
      begin
        if PlayList.Items.Count > 0 then
        begin
          Randomize;
          LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;
        end
        else
        begin
          // empty playlist
          MainForm.FStoppedByUser := True;
          PositionBar.Position := 0;
          MainForm.Caption := 'OooPlayer';
          CoverImage.Picture.LoadFromFile('logo.png');
          TitleLabel.Caption := '';
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          FArtistLabel := '';
          FAlbumLabel := '';
          PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
          LyricList.Items.Clear;
          if MainForm.Enabled and MainForm.Visible then
            MainForm.FocusControl(VolumeBar);
        end;
      end;
    2: // repeat track
      begin
        if PlayList.Items.Count > 0 then
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          try
            if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
            begin

            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;

          end;
        end
        else
        begin
          // empty playlist
          MainForm.FStoppedByUser := True;
          PositionBar.Position := 0;
          MainForm.Caption := 'OooPlayer';
          CoverImage.Picture.LoadFromFile('logo.png');
          TitleLabel.Caption := '';
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          FArtistLabel := '';
          FAlbumLabel := '';
          PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
          LyricList.Items.Clear;
          if MainForm.Enabled and MainForm.Visible then
            MainForm.FocusControl(VolumeBar);
        end;
      end;
    3: // shuffle
      begin
        if PlayList.Items.Count > 0 then
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          try
            if FShuffleIndex + 1 < FShuffleIndexes.Count then
            begin
              FShuffleIndex := 1 + FShuffleIndex;
              if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
              begin

              end;
            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;

          end;
        end
        else
        begin
          // empty playlist
          MainForm.FStoppedByUser := True;
          PositionBar.Position := 0;
          MainForm.Caption := 'OooPlayer';
          CoverImage.Picture.LoadFromFile('logo.png');
          TitleLabel.Caption := '';
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          FArtistLabel := '';
          FAlbumLabel := '';
          PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
          LyricList.Items.Clear;
          if MainForm.Enabled and MainForm.Visible then
            MainForm.FocusControl(VolumeBar);
        end;
      end;
  end;
end;

procedure TMainForm.InfoLabelMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.InfoPanelMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

function TMainForm.IsRadioPlayerPaused: Boolean;
begin
  Result := BASS_ChannelIsActive(FRadioHandle) = BASS_ACTIVE_PAUSED
end;

function TMainForm.IsRadioPlayerStopped: Boolean;
begin
  Result := BASS_ChannelIsActive(FRadioHandle) = BASS_ACTIVE_STOPPED
end;

procedure TMainForm.J1Click(Sender: TObject);
begin
  ScrollToCurrentSong;
end;

procedure TMainForm.L1Click(Sender: TObject);
var
  LOpenDlg: TOpenDialog;
  LExt: string;
begin
  PlayList.Items.BeginUpdate;
  PlaylistListPanel.Enabled := False;
  ShortcutPanel.Enabled := True;
  LOpenDlg := TOpenDialog.Create(Self);
  try
    LOpenDlg.Filter := 'Supported|*.m3u;*.m3u8;*.ppf';
    if LOpenDlg.Execute then
    begin
      LExt := LowerCase(ExtractFileExt(LOpenDlg.FileName));
      if LExt = '.m3u' then
      begin
        LoadM3UPlaylist(LOpenDlg.FileName);
      end
      else if LExt = '.m3u8' then
      begin
        LoadM3UPlaylist(LOpenDlg.FileName);
      end
      else if LExt = '.ppf' then
      begin
        LoadPPFPlaylist(LOpenDlg.FileName);
      end;
    end;
  finally
    LOpenDlg.Free;
    PlayList.Items.Count := FPlaylists[FSelectedPlaylistIndex].Count;
    Self.Width := Self.Width + 1;
    Self.Width := Self.Width - 1;
    PlayList.Items.EndUpdate;
    PlaylistListPanel.Enabled := True;
    ShortcutPanel.Enabled := False;
  end;
end;

procedure TMainForm.L2Click(Sender: TObject);
begin
  LogForm.Show;
end;

procedure TMainForm.LabelScrollTimerTimer(Sender: TObject);
var
  LContent: string;
  LTextWidth: integer;
begin
  if Length(TitleLabel.Caption) < 1 then
    Exit;
  try
    LTextWidth := TitleLabel.Canvas.TextWidth(TitleLabel.Caption);
    if LTextWidth > TitleLabel.Width then
    begin
      LContent := TitleLabel.Caption;
      TitleLabel.Caption := Copy(LContent, 2, Length(LContent) - 1) + Copy(LContent, 1, 1)
    end
    else
    begin
      TitleLabel.Caption := FTitleLabel;
    end;

    LTextWidth := Self.Canvas.TextWidth(Self.Caption) + 160;
    // Log(FloatToStr(Self.ClientWidth) + '/' + LTextWidth.ToString());
    if LTextWidth > Self.ClientWidth then
    begin
      LContent := Self.Caption;
      Self.Caption := Copy(LContent, 2, Length(LContent) - 1) + Copy(LContent, 1, 1)
    end
    else
    begin
      Self.Caption := FSelfCaption;
    end;

  except
    on E: Exception do
  end;

end;

procedure TMainForm.LastFMLaunchTimerTimer(Sender: TObject);
begin
  if FPlayer.PlayerStatus2 = psPlaying then
  begin
    Inc(FLastFMLaunchCounter);
    if FLastFMLaunchCounter >= 30 then
    begin
      LastFMLaunchTimer.Enabled := False;
      LastFMScrobble;
    end;
  end;
end;

procedure TMainForm.LastFMScrobble;
begin
  if SettingsForm.LastFMEnableBtn.Checked then
  begin
    if (Length(SettingsForm.LastFMUser) > 0) or (Length(SettingsForm.LastFMHashedPass) > 0) then
    begin
      if (Length(FLastFMArtist) > 0) and (Length(FLastFMSong) > 0) then
      begin
        FLastFMToolLauncher.Stop;
        FLastFMToolLauncher.Start('" " "' + SettingsForm.LastFMUser.Trim + '" "' + SettingsForm.LastFMHashedPass + '" "' + FLastFMArtist + '" "' + FLastFMSong + '"',
          ExtractFileDir(Application.ExeName) + '\lastfm\lastfmscrobble.exe');
      end;
    end;
  end;
end;

procedure TMainForm.LoadM3UPlaylist(const PlaylistPath: string);
var
  LStreamReader: TStreamReader;
  LLine: string;
begin
  if FileExists(PlaylistPath) then
  begin
    LStreamReader := TStreamReader.Create(PlaylistPath, True);
    try
      while not LStreamReader.EndOfStream do
      begin
        Application.ProcessMessages;
        LLine := Trim(LStreamReader.ReadLine);
        if Copy(LLine, 1, 1) <> '#' then
        begin
          AddFile(LLine);
        end;
      end;
    finally
      LStreamReader.Close;
      LStreamReader.Free;
    end;
  end;
end;

procedure TMainForm.LoadPlayList;
var
  LStreamReader: TStreamReader;
  LPlayListItem: TPlayItem;
  LLine: string;
  LSpltLst: TStringList;
  LInt: integer;
  LPlaylistFile: TPlaylistFile;
  LStreamWriter: TStreamWriter;
  i: integer;
  LPlaylist: TPlaylist;
  LListItem: TListItem;
  LQueueList: TQueueList;
begin
  // load playlists.
  // if playlists file doesnt exists, create it.
  if FileExists(FAppDataFolder + '\playlists.dat') then
  begin
    LStreamReader := TStreamReader.Create(FAppDataFolder + '\playlists.dat', True);
    LSpltLst := TStringList.Create;
    try
      LSpltLst.Delimiter := '|';
      LSpltLst.StrictDelimiter := True;

      while not LStreamReader.EndOfStream do
      begin
        LLine := Trim(LStreamReader.ReadLine);

        LSpltLst.DelimitedText := LLine;
        if LSpltLst.Count >= 2 then
        begin
          LPlaylistFile := TPlaylistFile.Create;
          LPlaylistFile.Name := LSpltLst[0];
          LPlaylistFile.PlaylistFile := LSpltLst[1];
          if LSpltLst.Count = 3 then
          begin
            LPlaylistFile.CurrentItemIndex := LSpltLst[2].ToInteger();
          end
          else
          begin
            LPlaylistFile.CurrentItemIndex := -1;
          end;
          FPlayListFiles.Add(LPlaylistFile);
        end;
      end;
    finally
      LStreamReader.Close;
      LStreamReader.Free;
      LSpltLst.Free;

      for I := 0 to FPlayListFiles.Count - 1 do
      begin
        LListItem := PlaylistView.Items.Add;
        LListItem.Caption := (i + 1).ToString() + '.';
        LListItem.SubItems.Add(FPlayListFiles[i].Name);
      end;
      FSelectedPlaylistIndex := FPlayListFiles.Count - 1;
      PlayList.ItemIndex := FSelectedPlaylistIndex;
    end;
  end
  else
  begin
    // create playlists file and default playlist to it
    LStreamWriter := TStreamWriter.Create(FAppDataFolder + '\playlists.dat', False);
    try
      LStreamWriter.WriteLine('Default|' + FAppDataFolder + '\playlist.dat');
    finally
      LStreamWriter.Close;
      LStreamWriter.Free;
    end;
    LPlaylistFile := TPlaylistFile.Create;
    LPlaylistFile.Name := 'Default';
    LPlaylistFile.PlaylistFile := FAppDataFolder + '\playlist.dat';
    FPlayListFiles.Add(LPlaylistFile);

    for I := 0 to FPlayListFiles.Count - 1 do
    begin
      LListItem := PlaylistView.Items.Add;
      LListItem.Caption := (i + 1).ToString() + '.';
      LListItem.SubItems.Add(FPlayListFiles[i].Name);
    end;
    FSelectedPlaylistIndex := FPlayListFiles.Count - 1;
    PlayList.ItemIndex := FSelectedPlaylistIndex;
  end;

  // load actual files to memory
  for I := 0 to FPlayListFiles.Count - 1 do
  begin
    if FileExists(FPlayListFiles[i].PlaylistFile) then
    begin
      LStreamReader := TStreamReader.Create(FPlayListFiles[i].PlaylistFile, True);
      LSpltLst := TStringList.Create;
      LPlaylist := TPlaylist.Create;
      LQueueList := TQueueList.Create;
      try
        LSpltLst.Delimiter := '|';
        LSpltLst.StrictDelimiter := True;

        while not LStreamReader.EndOfStream do
        begin
          LLine := Trim(LStreamReader.ReadLine);

          LSpltLst.DelimitedText := LLine;
          if LSpltLst.Count >= 9 then
          begin
            LPlayListItem := TPlayItem.Create;
            LPlayListItem.FullFileName := LSpltLst[0];
            LPlayListItem.Artist := LSpltLst[1];
            LPlayListItem.Album := LSpltLst[2];
            LPlayListItem.Title := LSpltLst[3];
            LPlayListItem.DurationStr := LSpltLst[4];
            LPlayListItem.Bitrate := LSpltLst[5];
            LPlayListItem.Channels := LSpltLst[6];
            LPlayListItem.Codec := LSpltLst[7];
            LPlayListItem.SampleRate := LSpltLst[8];
            LPlayListItem.PlayCount := 0;
            LPlayListItem.Stars := 0;
            // play count and star.
            // this values are added later so in order to keep compability with
            // older versions we must check the size.
            if LSpltLst.Count >= 11 then
            begin
              if TryStrToInt(LSpltLst[9], LInt) then
              begin
                LPlayListItem.PlayCount := LInt;
              end;
              if TryStrToInt(LSpltLst[10], LInt) then
              begin
                LPlayListItem.Stars := LInt;
              end;
            end;
            LPlaylist.Add(LPlayListItem);
          end
          else if LSpltLst.Count = 1 then
          begin
            if LSpltLst[0].StartsWith('#') then
            begin
              LQueueList.Add(LSpltLst[0].Replace('#', '').Trim.ToInteger());
            end;
          end;
        end;
      finally
        FPlaylists.Add(LPlaylist);
        FQueueLists.Add(LQueueList);
        LStreamReader.Close;
        LStreamReader.Free;
        LSpltLst.Free;
        PlayList.Items.Count := FPlaylists[i].Count;
        QueueList.Items.Count := FQueueLists[i].Count;
      end;
    end
    else
    begin
      // create an empty playlist file if playlistfilename doesnt exist
      LStreamWriter := TStreamWriter.Create(FPlayListFiles[i].PlaylistFile, False);
      try
        LPlaylist := TPlaylist.Create;
        FPlaylists.Add(LPlaylist);

        LQueueList := TQueueList.Create;
        FQueueLists.Add(LQueueList);
      finally
        LStreamWriter.Close;
        LStreamWriter.Free;
      end;
    end;
  end;
end;

procedure TMainForm.LoadPPFPlaylist(const PlaylistPath: string);
var
  LStreamReader: TStreamReader;
  LPlayListItem: TPlayItem;
  LLine: string;
  LSpltLst: TStringList;
  LInt: integer;
begin
  if FileExists(PlaylistPath) then
  begin
    LStreamReader := TStreamReader.Create(PlaylistPath, True);
    LSpltLst := TStringList.Create;
    try
      LSpltLst.Delimiter := '|';
      LSpltLst.StrictDelimiter := True;

      while not LStreamReader.EndOfStream do
      begin
        LLine := Trim(LStreamReader.ReadLine);

        LSpltLst.DelimitedText := LLine;
        if LSpltLst.Count >= 9 then
        begin
          LPlayListItem := TPlayItem.Create;
          LPlayListItem.FullFileName := LSpltLst[0];
          LPlayListItem.Artist := LSpltLst[1];
          LPlayListItem.Album := LSpltLst[2];
          LPlayListItem.Title := LSpltLst[3];
          LPlayListItem.DurationStr := LSpltLst[4];
          LPlayListItem.Bitrate := LSpltLst[5];
          LPlayListItem.Channels := LSpltLst[6];
          LPlayListItem.Codec := LSpltLst[7];
          LPlayListItem.SampleRate := LSpltLst[8];
          LPlayListItem.PlayCount := 0;
          LPlayListItem.Stars := 0;
          // play count and star.
          // this values are added later so in onder to keep compability with
          // older versions we must check the size.
          if LSpltLst.Count >= 11 then
          begin
            if TryStrToInt(LSpltLst[9], LInt) then
            begin
              LPlayListItem.PlayCount := LInt;
            end;
            if TryStrToInt(LSpltLst[10], LInt) then
            begin
              LPlayListItem.Stars := LInt;
            end;
          end;
          FPlaylists[FSelectedPlaylistIndex].Add(LPlayListItem);
        end;
      end;
    finally
      LStreamReader.Close;
      LStreamReader.Free;
      LSpltLst.Free;
    end;
  end;
end;

procedure TMainForm.LoadRadioStations;
var
  LStreamReader: TStreamReader;
  LLine: string;
  LRadioStation: TRadioStation;
  LSplitList: TStringList;
begin
  // remove all radio stations
  FRadioStations.Clear;
  RadioList.Items.Count := 0;
  RadioList.Invalidate;
  if Length(FCurrentRadioCatName) > 0 then
  begin
    if not Portable then
    begin
      LStreamReader := TStreamReader.Create(FAppDataFolder + '\' + FCurrentRadioCatName + '.txt');
    end
    else
    begin
      LStreamReader := TStreamReader.Create(ExtractFileDir(Application.ExeName) + '\Radios\' + FCurrentRadioCatName + '.txt');
    end;
    LSplitList := TStringList.Create;
    try
      LSplitList.StrictDelimiter := True;
      LSplitList.Delimiter := ';';
      while not LStreamReader.EndOfStream do
      begin
        LLine := Trim(LStreamReader.ReadLine);
        if Length(LLine) > 0 then
        begin
          LSplitList.DelimitedText := LLine;
          if LSplitList.Count >= 3 then
          begin
            LRadioStation.Name := LSplitList[0];
            LRadioStation.Web := LSplitList[1];
            LRadioStation.URL := LSplitList[2];

            RadioList.Items.Count := RadioList.Items.Count + 1;
            FRadioStations.Add(LRadioStation);
          end
        end;
      end;
    finally
      LStreamReader.Close;
      LStreamReader.Free;
      LSplitList.Free;
    end;
  end;

end;

procedure TMainForm.LoadSettings;
var
  SettingsFile: TIniFile;
  LSkinIndex: integer;
begin
  SettingsFile := TIniFile.Create(FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := ReadInteger('player', 'itemindex', -1);
      VolumeBar.Position := ReadInteger('player', 'volume', 50);
      PlaybackOrderList.ItemIndex := ReadInteger('player', 'order', 0);
      FLastDir := ReadString('player', 'lastdir', SysInfo.Folders.Personal);
      FCurrentRadioCatIndex := ReadInteger('radio', 'cat', 0);
      if (ReadInteger('radio', 'cat', 0)) < RadiosView.Items.Count then
      begin
        RadiosView.Items[ReadInteger('radio', 'cat', 0)].Selected := True;
        RadiosViewClick(Self);
      end;
      FCurrentRadioIndex := ReadInteger('radio', 'curr', -1);
      QueueList.Height := ReadInteger('ui', 'queueh', 120);
      RadioRecordFormatList.ItemIndex := ReadInteger('radio', 'recformat2', 0);
      RadioRecordModeList.ItemIndex := ReadInteger('radio', 'recmethod', 0);
      LyricSourceList.ItemIndex := ReadInteger('lyric', 'source2', 1);
      SearchForm.chkCloseOnPlayBtn.Checked := ReadBool('search', 'close', True);
      LyricPanel.Width := ReadInteger('player', 'lyricw', 250);
      FSelectedPlaylistIndex := ReadInteger('player', 'playlistindex', 0);
      PlaylistView.Items[FSelectedPlaylistIndex].Selected := True;
      PlaylistViewClick(Self);

      FCategoryIndex := ReadInteger('general', 'categoryindex', 0);
      CategoryPages.ActivePageIndex := FCategoryIndex;
      FuncPages.ActivePageIndex := FCategoryIndex;

      QueueList.Visible := ReadBool('player', 'queuevisible', True);
      Splitter2.Visible := LyricPanel.Visible;
      H2.Checked := not QueueList.Visible;
      Splitter1.Visible := QueueList.Visible;
      CategoryPages.Visible := ReadBool('player', 'catvisible', True);
      H3.Checked := not CategoryPages.Visible;
      LeftPanelBtn.Down := H3.Checked;
      sSplitter2.Visible := CategoryPages.Visible;
      LyricPanel.Visible := ReadBool('player', 'lyricvisible', True);
      H4.Checked := not LyricPanel.Visible;
      RightPanelBtn.Down := H4.Checked;
      Splitter2.Visible := LyricPanel.Visible;

      LSkinIndex := SettingsFile.ReadInteger('settings', 'skin2', 33);
      CoverPanel.Height := SettingsFile.ReadInteger('settings', 'coverheight', 182);
      CategoryPages.Width := SettingsFile.ReadInteger('settings', 'categorywidth', 255);

      SettingsForm.HueBar.Position := SettingsFile.ReadInteger('settings', 'hue', 0);
      SettingsForm.SaturationBar.Position := SettingsFile.ReadInteger('settings', 'satu', 0);
      SettingsForm.BrightnessBar.Position := SettingsFile.ReadInteger('settings', 'bright', 0);
      SettingsForm.HueBarChange(Self);
      SettingsForm.SaturationBarChange(Self);
      SettingsForm.BrightnessBarChange(Self);

      with PlayList do
      begin
        Columns[0].Width := ReadInteger('columns', '1', 200);
        Columns[1].Width := ReadInteger('columns', '2', 200);
        Columns[2].Width := ReadInteger('columns', '3', 200);
        Columns[3].Width := ReadInteger('columns', '4', 150);
        Columns[4].Width := ReadInteger('columns', '5', 150);
        Columns[5].Width := ReadInteger('columns', '6', 150);
        Columns[6].Width := ReadInteger('columns', '7', 150);
        Columns[7].Width := ReadInteger('columns', '8', 50);
      end;
    end;
  finally
    SettingsFile.Free;
    if (LSkinIndex > 0) and (LSkinIndex < 111) then
    begin
      MainForm.sSkinManager1.BeginUpdate;
      ChangeSkin(LSkinIndex - 1);
      MainForm.sSkinManager1.Active := True;
      MainForm.sSkinManager1.EndUpdate(False);
    end
    else
    begin
      MainForm.sSkinManager1.Active := False;
    end;
  end;
end;

procedure TMainForm.Log(s: string);
begin
{$IFDEF WRITEDEBUGLOG}
  LogForm.LogList.Lines.Add(s);
{$ENDIF}
end;

procedure TMainForm.LyricListMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(LyricList);
end;

procedure TMainForm.LyricListMouseLeave(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.LyricPanelResize(Sender: TObject);
begin
  UpdateLyricBoxWidth;
end;

procedure TMainForm.LyricSearchBtnClick(Sender: TObject);
begin
  if not FStopAddFiles then
    Exit;

  if FPlaybackType = music then
  begin
    if FPlayer.PlayerStatus2 <> psStopped then
    begin
      if (Length(LyricTitleEdit.Text) > 0) and (Length(LyricArtistEdit.Text) > 0) then
      begin
        if SettingsForm.LyricBtn.Checked then
        begin
          FLyricDownloader.Stop;
          if FPlaylists[FSelectedPlaylistIndex].Count < 1 then
            Exit;

          if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) then
          begin
            LyricSearchBtn.Enabled := False;
            LyricArtistEdit.Enabled := False;
            LyricTitleEdit.Enabled := False;
            LyricSourceList.Enabled := False;
            ReloadLyricTitleBtn.Enabled := False;
            FLyricDownloader.SongTitle := LyricTitleEdit.Text;
            FLyricDownloader.Artist := LyricArtistEdit.Text;
            FLyricDownloader.Album := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album;
            FLyricDownloader.ItemInfo.Title := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title;
            FLyricDownloader.ItemInfo.Artist := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist;
            FLyricDownloader.ItemInfo.Album := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album;
            FLyricDownloader.Start;
          end;
        end;
      end;
    end;
  end
  else if FPlaybackType = radio then
  begin
    if not IsRadioPlayerStopped then
    begin
      if (Length(LyricTitleEdit.Text) > 0) and (Length(LyricArtistEdit.Text) > 0) then
      begin
        LyricSearchBtn.Enabled := False;
        LyricArtistEdit.Enabled := False;
        LyricTitleEdit.Enabled := False;
        LyricSourceList.Enabled := False;
        ReloadLyricTitleBtn.Enabled := False;
        if SettingsForm.LyricBtn.Checked then
        begin
          FLyricDownloader.Stop;
          if FPlaylists[FSelectedPlaylistIndex].Count < 1 then
            Exit;
          FLyricDownloader.SongTitle := LyricTitleEdit.Text;
          FLyricDownloader.Artist := LyricArtistEdit.Text;
          FLyricDownloader.Album := 'Radio';
          FLyricDownloader.ItemInfo.Title := LyricTitleEdit.Text;
          FLyricDownloader.ItemInfo.Artist := LyricArtistEdit.Text;
          FLyricDownloader.ItemInfo.Album := 'Radio';
          FLyricDownloader.Start;
        end;
      end
      else
      begin
        LyricSearchBtn.Enabled := True;
        LyricArtistEdit.Enabled := True;
        LyricTitleEdit.Enabled := True;
        LyricSourceList.Enabled := True;
        ReloadLyricTitleBtn.Enabled := True;
      end;
    end;
  end;
end;

procedure TMainForm.LyricTitleEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    LyricSearchBtnClick(Self);
  end;
end;

procedure TMainForm.M1Click(Sender: TObject);
begin
  FuncPages.ActivePageIndex := 0;
  CategoryPages.ActivePageIndex := 0;
end;

procedure TMainForm.MoveRadioStations;
var
  I: Integer;
begin
  for I := 1 to RadiosView.Items.Count - 1 do
  begin
    if not Portable then
    begin
      if not FileExists(FAppDataFolder + '\' + RadiosView.Items[i].SubItems[0] + '.txt') then
      begin
        CopyFile(PWideChar(ExtractFileDir(Application.ExeName) + '\Radios\' + RadiosView.Items[i].SubItems[0] + '.txt'),
          PWideChar(FAppDataFolder + '\' + RadiosView.Items[i].SubItems[0] + '.txt'), True);
      end;
    end;
  end;
end;

procedure TMainForm.MusicSearchFindFile(Sender: TObject; const AName: string);
begin
  ProgressLabel.Caption := ExtractFileDir(AName);
  AddFile(AName);
end;

procedure TMainForm.MusicSearchProgress(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TMainForm.NextArtworkBtnClick(Sender: TObject);
begin
  if FArtworkReader.ExternalArtworkFiles.Count > 0 then
  begin
    FArtworkReader.LoadNextExternalCoverArt;
  end;
end;

procedure TMainForm.NextBtnClick(Sender: TObject);
var
  LRndIndex: Integer;
begin
  if FPlaybackType = music then
  begin
    case PlaybackOrderList.ItemIndex of
      0: // normal
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          // first try queue
          if FQueueLists[FSelectedPlaylistIndex].Count > 0 then
          begin
            // play first item in the queue list
            PlayItem(FQueueLists[FSelectedPlaylistIndex][0]);
            PlayItemUIUpdate;
            // remove item from queue
            FQueueLists[FSelectedPlaylistIndex].Delete(0);
            QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
            QueueList.Invalidate;
            // PlayList.Invalidate;
          end
          else
          begin
            // playback follows selection
            if SettingsForm.PlayCursorBtn.Checked then
            begin
              // try selected file
              if PlayList.ItemIndex > -1 then
              begin
                if PlayList.ItemIndex <> FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
                begin
                  PlayItem(PlayList.ItemIndex);
                  PlayItemUIUpdate;
                end
                else
                begin
                  if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                  begin
                    PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                    PlayItemUIUpdate;
                  end;
                end;
              end
              else
              begin
                // play next item
                if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
                begin
                  PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                  PlayItemUIUpdate;
                end;
              end;
            end
            else
            begin
              // ignore selection and try next song
              if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1 < PlayList.Items.Count then
              begin
                PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1);
                PlayItemUIUpdate;
              end;
            end;
          end;
        end;
      1: // random
        begin
          Randomize;
          LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          PlayItem(LRndIndex);
          PlayItemUIUpdate;
        end;
      2: // repeat track
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          try
            if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
            begin
              PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
              PlayItemUIUpdate;
            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;

          end;
        end;
      3: // shuffle
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;
          try
            if FShuffleIndex + 1 < FShuffleIndexes.Count then
            begin
              FShuffleIndex := 1 + FShuffleIndex;
              if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
              begin
                PlayItem(FShuffleIndexes[FShuffleIndex]);
                PlayItemUIUpdate;
              end;
            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;
          end;
        end;
    end;
  end;
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.NextBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.o1Click(Sender: TObject);
var
  FileDir: string;
  index: Integer;
begin
  index := PlayList.ItemIndex;
  if index > -1 then
  begin
    FileDir := ExtractFileDir(FPlaylists[FSelectedPlaylistIndex][index].FullFileName);

    if DirectoryExists(FileDir) then
    begin
      ShellExecute(handle, 'open', 'explorer', PChar(' /n,/select, ' + '"' + FPlaylists[FSelectedPlaylistIndex][index].FullFileName + '"'), nil, SW_SHOWNORMAL);
    end;
  end;
end;

procedure TMainForm.FuncPagesChange(Sender: TObject);
begin
  if FPageHasntChangedYet then
  begin
    Self.Width := Self.Width + 1;
    Self.Width := Self.Width - 1;
    FPageHasntChangedYet := False;
  end;
end;

procedure TMainForm.FuncPagesMouseLeave(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PlaylistViewClick(Sender: TObject);
begin
  if PlaylistView.ItemIndex > -1 then
  begin
    FuncPages.ActivePageIndex := 0;

    PlayList.Items.Count := 0;
    FCurrentItemInfo.FullFileName := '';
    FShuffleIndexes.Clear;
    FShuffleIndex := -1;
    PlayList.Items.Count := 0;
    QueueList.Items.Count := 0;
    FSelectedPlaylistIndex := PlaylistView.ItemIndex;
    PlayList.Items.Count := FPlaylists[FSelectedPlaylistIndex].Count;
    QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
    QueueList.Invalidate;
    GenerateShuffleList;
    FShuffleIndex := -1;
    PlayList.Repaint;
    PlayList.Refresh;
    StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
    ScrollToCurrentSong;
    FuncPages.ActivePageIndex := 0;
  end;
end;

procedure TMainForm.PlaylistViewCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index = FActivePlaylistIndex then
  begin
    Sender.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    Sender.Canvas.Font.Style := [];
  end;
end;

procedure TMainForm.PlaylistViewResize(Sender: TObject);
begin
  PlaylistView.Columns[0].Width := 45;
  PlaylistView.Columns[1].Width := PlaylistView.ClientWidth - PlaylistView.Columns[0].Width - 20;
end;

procedure TMainForm.P8Click(Sender: TObject);
begin
  if QueueList.ItemIndex > -1 then
  begin
    // play selected item
    PlayItem(FQueueLists[FSelectedPlaylistIndex][QueueList.ItemIndex]);
    PlayItemUIUpdate;
    // delete it from lists
    FQueueLists[FSelectedPlaylistIndex].Delete(QueueList.ItemIndex);
    QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
    QueueList.Invalidate;
    // PlayList.Invalidate;
  end;
end;

procedure TMainForm.PauseBtnClick(Sender: TObject);
begin
  if FPlaybackType = music then
  begin
    if FPlayer.PlayerStatus = psPlaying then
    begin
      FPlayer.Pause;
      PositionTimer.Enabled := False;
      ProgressTimer.Enabled := PositionTimer.Enabled;
      InfoLabel.Caption := 'Paused | ' + FCurrentItemInfo.InfoStr;

      Taskbar2.ProgressState := TTaskBarProgressState.Paused;
      if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) then
      begin
        PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Update;
      end;
      UpdateOverlayIcon(2);
    end
    else if FPlayer.PlayerStatus = psPaused then
    begin
      FPlayer.Resume;
      FPlayer.SetVolume(100 - VolumeBar.Position);
      PositionTimer.Enabled := True;
      ProgressTimer.Enabled := PositionTimer.Enabled;
      InfoLabel.Caption := 'Playing | ' + FCurrentItemInfo.InfoStr;

      Taskbar2.ProgressState := TTaskBarProgressState.Normal;
      if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) then
      begin
        PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Update;
      end;
      UpdateOverlayIcon(1);
    end;
  end
  else if FPlaybackType = radio then
  begin
    if not IsRadioPlayerStopped then
    begin
      if IsRadioPlayerPaused then
      begin
        ResumeRadio;
      end
      else
      begin
        PauseRadio;
      end;
    end;
  end;
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PauseBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PauseRadio;
begin
  if BASS_ChannelIsActive(FRadioHandle) = BASS_ACTIVE_PLAYING then
  begin
    BASS_ChannelPause(FRadioHandle);
    UpdateOverlayIcon(2);
  end;
end;

procedure TMainForm.PipeServerPipeConnect(Sender: TObject; Pipe: HPIPE);
var
  LSkinName: string;
  LHue: string;
  LBrightness: string;
  LSaturation: string;
  I: Integer;
begin
  if sSkinManager1.Active then
  begin
    LSkinName := 'Skin:' + sSkinManager1.SkinName;
  end
  else
  begin
    LSkinName := 'Skin:none';
  end;
  LHue := 'Hue:' + sSkinManager1.HueOffset.ToString();
  LBrightness := 'Brig:' + sSkinManager1.Brightness.ToString();
  LSaturation := 'Sat:' + sSkinManager1.Saturation.ToString();

  if FTagFiles.Count > 0 then
  begin
    for I := 0 to FTagFiles.Count - 1 do
    Begin
      if not PipeServer.Broadcast(PWideChar('File:' + FTagFiles[i])^, Length('File:' + FTagFiles[i]) * SizeOf(WideChar)) then
      begin
        LogForm.LogList.Lines.Add('Unable to broadcast tag editor message.');
        if not LogForm.Visible then
        begin
          LogForm.Show;
        end;
      end;
    End;
  end
  else if FInfoFiles.Count > 0 then
  begin
    for I := 0 to FInfoFiles.Count - 1 do
    Begin
      if not PipeServer.Broadcast(PWideChar('FileInfo:' + FInfoFiles[i])^, Length('FileInfo:' + FInfoFiles[i]) * SizeOf(WideChar)) then
      begin
        LogForm.LogList.Lines.Add('Unable to broadcast info message.');
        if not LogForm.Visible then
        begin
          LogForm.Show;
        end;
      end;
    End;
  end;
  PipeServer.Broadcast(PWideChar(LSkinName)^, Length(LSkinName) * SizeOf(WideChar));
  PipeServer.Broadcast(PWideChar(LHue)^, Length(LHue) * SizeOf(WideChar));
  PipeServer.Broadcast(PWideChar(LBrightness)^, Length(LBrightness) * SizeOf(WideChar));
  PipeServer.Broadcast(PWideChar(LSaturation)^, Length(LSaturation) * SizeOf(WideChar));
  FTagFiles.Clear;
  FInfoFiles.Clear;
end;

procedure TMainForm.PlaybackOrderListChange(Sender: TObject);
begin
  if PlaybackOrderList.ItemIndex = 2 then
  begin
    GenerateShuffleList;
    FShuffleIndex := -1;
  end;
end;

procedure TMainForm.PlayBtnClick(Sender: TObject);
var
  LRndIndex: Integer;
begin
  if (FPlayer.PlayerStatus2 = psPlaying) or (FPlayer.PlayerStatus2 = psPaused) then
  begin
    // music playing
{$REGION 'music play'}
    if FPlayer.PlayerStatus2 = psPaused then
    begin
      // if paused then resume
      FPlayer.Resume;
      FPlayer.SetVolume(100 - VolumeBar.Position);
      PositionTimer.Enabled := True;
      ProgressTimer.Enabled := PositionTimer.Enabled;
      InfoLabel.Caption := 'Playing | ' + FCurrentItemInfo.InfoStr;

      Taskbar2.ProgressState := TTaskBarProgressState.Normal;
      if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) then
      begin
        PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Update;
      end;
      UpdateOverlayIcon(1);
    end
    else
    begin
      if PlayList.ItemIndex = -1 then
      begin
        if PlayList.Items.Count > 0 then
        begin
          PlayList.ItemIndex := 0;
        end;
      end;
      if PlayList.ItemIndex > -1 then
      begin
        case PlaybackOrderList.ItemIndex of
          0: // normal
            begin
              if SettingsForm.PlayCursorBtn.Checked then
              begin
                // follow the cursor
                // if selected a different item
                if PlayList.ItemIndex <> FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
                begin
                  PositionTimer.Enabled := False;
                  ProgressTimer.Enabled := PositionTimer.Enabled;

                  PlayItem(PlayList.ItemIndex);
                  PlayItemUIUpdate;
                end
                else
                begin
                  // current item is selected
                  // if paused continue
                  if FPlayer.PlayerStatus2 = psPaused then
                  begin
                    FPlayer.Pause;
                  end
                  else if FPlayer.PlayerStatus2 = psStopped then
                  begin
                    // if stopped start platyng
                    PositionTimer.Enabled := False;
                    ProgressTimer.Enabled := PositionTimer.Enabled;

                    PlayItem(PlayList.ItemIndex);
                    PlayItemUIUpdate;
                  end;
                end;
              end
              else
              begin
                // don't follow the cursor
                // if paused continue
                if FPlayer.PlayerStatus2 = psPaused then
                begin
                  FPlayer.Pause;
                end
                else if FPlayer.PlayerStatus2 = psStopped then
                begin
                  // if stopped start platyng
                  PositionTimer.Enabled := False;
                  ProgressTimer.Enabled := PositionTimer.Enabled;

                  PlayItem(PlayList.ItemIndex);
                  PlayItemUIUpdate;
                end;
              end;
            end;
          1: // random
            begin
              Randomize;
              LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
              PositionTimer.Enabled := False;
              ProgressTimer.Enabled := PositionTimer.Enabled;

              PlayItem(LRndIndex);
              PlayItemUIUpdate;
            end;
          2: // repeat track
            begin
              PositionTimer.Enabled := False;
              ProgressTimer.Enabled := PositionTimer.Enabled;

              try
                if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
                begin
                  PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
                  PlayItemUIUpdate;
                end;
              finally
                PositionTimer.Enabled := True;
                ProgressTimer.Enabled := PositionTimer.Enabled;

              end;
            end;
          3: // shuffle
            begin
              PositionTimer.Enabled := False;
              ProgressTimer.Enabled := PositionTimer.Enabled;

              try
                if FShuffleIndex + 1 < FShuffleIndexes.Count then
                begin
                  FShuffleIndex := 1 + FShuffleIndex;
                  if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
                  begin
                    PlayItem(FShuffleIndexes[FShuffleIndex]);
                    PlayItemUIUpdate;
                  end;
                end;
              finally
                PositionTimer.Enabled := True;
                ProgressTimer.Enabled := PositionTimer.Enabled;

              end;
            end;
        end;
      end;
      if Self.Enabled and Self.Visible then
        Self.FocusControl(VolumeBar);
    end;
{$ENDREGION}
  end
  else if not IsRadioPlayerStopped then
  begin
    // radio playing
{$REGION 'Radio'}
    begin
      if IsRadioPlayerPaused then
      begin
        // resume
        ResumeRadio;
        Taskbar2.ProgressState := TTaskBarProgressState.Normal;
        UpdateOverlayIcon(1);
      end
      else
      begin
        // start playing selected radio
        // make sure a radio is selected
        if RadioList.ItemIndex = -1 then
        begin
          if RadioList.Items.Count > 0 then
          begin
            RadioList.ItemIndex := 0;
          end;
        end;
        // start playing
        // if selected a different radio
        if PlayList.ItemIndex <> FCurrentRadioIndex then
        begin
          // kill prev process
          if not IsRadioPlayerStopped then
          begin
            StopRadio;
          end;
          FCurrentRadioIndex := RadioList.ItemIndex;
          PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
        end
        else
        begin
          // current radio is selected
          if IsRadioPlayerPaused then
          begin
            ResumeRadio
          end
          else if IsRadioPlayerStopped then
          begin
            // kill prev process
            if not IsRadioPlayerStopped then
            begin
              StopRadio;
            end;
            FCurrentRadioIndex := RadioList.ItemIndex;
            PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
          end;
        end;
      end;
    end;
{$ENDREGION}
  end
  else
  begin
    // nothing plays
    // start according to selected tab page
    case FuncPages.ActivePageIndex of
      0: // music player
        begin
{$REGION 'music play'}
          if FPlayer.PlayerStatus2 = psPaused then
          begin
            // if paused then resume
            // it'll not reach here, this code is dead
            FPlayer.Pause;
            FPlayer.SetVolume(100 - VolumeBar.Position);
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;
            InfoLabel.Caption := 'Playing | ' + FCurrentItemInfo.InfoStr;

            Taskbar2.ProgressState := TTaskBarProgressState.Normal;
            UpdateOverlayIcon(1);
          end
          else
          begin
            if PlayList.ItemIndex = -1 then
            begin
              if PlayList.Items.Count > 0 then
              begin
                PlayList.ItemIndex := 0;
              end;
            end;
            if PlayList.ItemIndex > -1 then
            begin
              case PlaybackOrderList.ItemIndex of
                0: // normal
                  begin
                    if SettingsForm.PlayCursorBtn.Checked then
                    begin
                      // follow the cursor
                      // if selected a different item
                      if PlayList.ItemIndex <> FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
                      begin
                        PositionTimer.Enabled := False;
                        ProgressTimer.Enabled := PositionTimer.Enabled;

                        PlayItem(PlayList.ItemIndex);
                        PlayItemUIUpdate;
                      end
                      else
                      begin
                        // current item is selected
                        // if paused continue
                        if FPlayer.PlayerStatus2 = psPaused then
                        begin
                          FPlayer.Pause;
                        end
                        else if FPlayer.PlayerStatus2 = psStopped then
                        begin
                          // if stopped start platyng
                          PositionTimer.Enabled := False;
                          ProgressTimer.Enabled := PositionTimer.Enabled;

                          PlayItem(PlayList.ItemIndex);
                          PlayItemUIUpdate;
                        end;
                      end;
                    end
                    else
                    begin
                      // don't follow the cursor
                      // if paused continue
                      if FPlayer.PlayerStatus2 = psPaused then
                      begin
                        FPlayer.Pause;
                      end
                      else if FPlayer.PlayerStatus2 = psStopped then
                      begin
                        // if stopped start platyng
                        PositionTimer.Enabled := False;
                        ProgressTimer.Enabled := PositionTimer.Enabled;

                        PlayItem(PlayList.ItemIndex);
                        PlayItemUIUpdate;
                      end;
                    end;
                  end;
                1: // random
                  begin
                    Randomize;
                    LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
                    PositionTimer.Enabled := False;
                    ProgressTimer.Enabled := PositionTimer.Enabled;

                    PlayItem(LRndIndex);
                    PlayItemUIUpdate;
                  end;
                2: // repear track
                  begin
                    PositionTimer.Enabled := False;
                    ProgressTimer.Enabled := PositionTimer.Enabled;

                    try
                      if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
                      begin
                        PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
                        PlayItemUIUpdate;
                      end;
                    finally
                      PositionTimer.Enabled := True;
                      ProgressTimer.Enabled := PositionTimer.Enabled;

                    end;
                  end;
                3: // shuffle
                  begin
                    PositionTimer.Enabled := False;
                    ProgressTimer.Enabled := PositionTimer.Enabled;

                    try
                      if FShuffleIndex + 1 < FShuffleIndexes.Count then
                      begin
                        FShuffleIndex := 1 + FShuffleIndex;
                        if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
                        begin
                          PlayItem(FShuffleIndexes[FShuffleIndex]);
                          PlayItemUIUpdate;
                        end;
                      end;
                    finally
                      PositionTimer.Enabled := True;
                      ProgressTimer.Enabled := PositionTimer.Enabled;

                    end;
                  end;
              end;
            end;
            if Self.Enabled and Self.Visible then
              Self.FocusControl(VolumeBar);
          end;
{$ENDREGION}
        end;
      1: // radio
{$REGION 'Radio'}
        begin
          if IsRadioPlayerPaused then
          begin
            // resume
            ResumeRadio;
            Taskbar2.ProgressState := TTaskBarProgressState.Normal;
            UpdateOverlayIcon(1);
          end
          else
          begin
            // start playing selected radio
            // make sure a radio is selected
            if RadioList.ItemIndex = -1 then
            begin
              if RadioList.Items.Count > 0 then
              begin
                RadioList.ItemIndex := 0;
              end;
            end;
            // start playing
            // if selected a different radio
            if PlayList.ItemIndex <> FCurrentRadioIndex then
            begin
              // kill prev process
              if not IsRadioPlayerStopped then
              begin
                StopRadio;
              end;
              FCurrentRadioIndex := RadioList.ItemIndex;
              PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
            end
            else
            begin
              // current radio is selected
              if IsRadioPlayerPaused then
              begin
                ResumeRadio
              end
              else if IsRadioPlayerStopped then
              begin
                // kill prev process
                if not IsRadioPlayerStopped then
                begin
                  StopRadio;
                end;
                FCurrentRadioIndex := RadioList.ItemIndex;
                PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
              end;
            end;
          end;
        end;
{$ENDREGION}
    end;
  end;
end;

procedure TMainForm.PlayBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PlayItem(const ItemIndex: integer);
begin
  FPlaybackType := music;
  FPlayer.Stop;
  FCategoryIndex := 0;

  if FPlayer.ErrorMsg = MY_ERROR_OK then
  begin
    FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := ItemIndex;

    if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count then
    begin
      FCurrentItemInfo.FullFileName := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].FullFileName;
      if FileExists(FCurrentItemInfo.FullFileName) then
      begin
        FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
        FActivePlaylistIndex := FSelectedPlaylistIndex;
        FPlayer.FileName := FCurrentItemInfo.FullFileName;
        FPlayer.Play;
        FCurrentItemInfo.DurationBass := FPlayer.TotalLength;
        PositionBar.Max := MaxInt;
        Taskbar2.ProgressMaxValue := MaxInt;
        FCurrentItemInfo.DurationAsSecInt := FPlayer.DurationAsSec;
        FPlayer.SetVolume(100 - VolumeBar.Position);
        FStoppedByUser := False;
      end
      else
      begin
        FPlayer.Stop;
        FStoppedByUser := False;
      end;
    end
    else
    begin
      FPlayer.Stop;
      FStoppedByUser := False;
    end;
  end
  else
  begin
    // fplayer didn't return OK
    // FPlayer.Stop;
    // FStoppedByUser := False;
    StopBtnClick(Self);
  end;

end;

procedure TMainForm.PlayItemUIUpdate;
var
  LImageFile: string;
  LPlayIndex: integer;
  LPlayCountStr: string;
begin
  FPlaybackType := music;
  StopRadio;
  PositionTimer.Enabled := False;
  ProgressTimer.Enabled := PositionTimer.Enabled;
  if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) then
  begin
    PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Update;
  end;

  if FPlayer.ErrorMsg = MY_ERROR_OK then
  begin
    LPlayIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
    if FPlaylists[FSelectedPlaylistIndex].Count > 0 then
    begin
      if not FileExists(FPlaylists[FSelectedPlaylistIndex][LPlayIndex].FullFileName) then
      begin
        LogForm.LogList.Lines.Add('[' + DateTimeToStr(Now) + '] Unable to find ' + FPlaylists[FSelectedPlaylistIndex][LPlayIndex].FullFileName);
        if not LogForm.Visible then
        begin
          LogForm.Show;
        end;
        Exit;
      end;

      if LPlayIndex < FPlaylists[FSelectedPlaylistIndex].Count then
      begin
        if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1 then
        begin
          PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Selected := False;
        end;
        // play count
        if FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].PlayCount = 1 then
        begin
          LPlayCountStr := '1 time'
        end
        else
        begin
          LPlayCountStr := FloatToStr(FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].PlayCount) + ' times'
        end;
        // file info
        with FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex] do
        begin
          FCurrentItemInfo.InfoStr := Bitrate + ' | ' + Channels + ' | ' + Codec + ' | ' + SampleRate + ' hz | ' + LPlayCountStr + ' | ' + DurationStr;
          InfoLabel.Caption := 'Playing | ' + FCurrentItemInfo.InfoStr;
        end;

        // position to default
        PositionBar.Position := 0;
        PositionTimer.Enabled := True;
        ProgressTimer.Enabled := PositionTimer.Enabled;
        // reset playlist
        PlayList.ItemIndex := -1;
        PlayList.ItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
        Taskbar2.ProgressState := TTaskBarProgressState.Normal;
        UpdateOverlayIcon(1);
        // PlayList.Refresh;
        // update title label
        with FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex] do
        begin
          Self.Caption := PlayWindowTitle(Title, Artist, Album);
          TitleLabel.Caption := Title + ' - ' + Album + ' - ' + Artist;
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          if TitleLabel.Width < TitleLabel.Canvas.TextWidth(TitleLabel.Caption) then
          begin
            TitleLabel.Caption := TitleLabel.Caption + ' - '
          end;
          FAlbumLabel := Album;
          FArtistLabel := Artist;
          FLastFMArtist := Artist;
          FLastFMSong := Title;
          PlayCount := PlayCount + 1;
        end;
        // jump to current song
        if SettingsForm.PlayJumpBtn.Checked then
        begin
          J1Click(nil);
        end;
        // load cover art
        if SettingsForm.LoadArtBtn.Checked then
        begin
          if not FArtworkReader.IsBusy then
          begin
            FArtworkReader.SongPath := FCurrentItemInfo.FullFileName;
            FArtworkReader.Start;
          end;
        end
        else
        begin
          // default cover
          LImageFile := ExtractFileDir(Application.ExeName) + '\logo.png';
          CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');
        end;

        if SettingsForm.LastFMEnableBtn.Checked then
        begin
          FLastFMLaunchCounter := 0;
          LastFMLaunchTimer.Enabled := True;
        end;

        // load/download lyrics
        LyricList.Items.Clear;
        LyricStatusLabel.Caption := '';
        LyricTitleEdit.Text := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title;
        LyricArtistEdit.Text := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist;
        FLyricAlbumStr := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album;
        LyricSearchBtn.Enabled := False;
        LyricArtistEdit.Enabled := False;
        LyricTitleEdit.Enabled := False;
        LyricSourceList.Enabled := False;
        ReloadLyricTitleBtn.Enabled := False;

        // load existing lyric file
        if FileExists(FAppDataFolder + '\lyric\' + CreateLyricFileName(FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title,
          FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist,
          FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album)) and SettingsForm.ShowDownloadedLyrics.Checked then
        begin
          LyricList.Items.Clear;
          LyricList.Items.LoadFromFile(FAppDataFolder + '\lyric\' + CreateLyricFileName(FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title,
            FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist,
            FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album));
          LyricStatusLabel.Caption := 'Loaded local lyric file';
          LyricSearchBtn.Enabled := True;
          LyricArtistEdit.Enabled := True;
          LyricTitleEdit.Enabled := True;
          LyricSourceList.Enabled := True;
          ReloadLyricTitleBtn.Enabled := True;
          UpdateLyricBoxWidth;
        end
        else if SettingsForm.LyricBtn.Checked then
        begin
          // download new lyric
          FLyricDownloader.Stop;
          if FPlaylists[FSelectedPlaylistIndex].Count < 1 then
            Exit;
          FLyricDownloader.SongTitle := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title;
          FLyricDownloader.Artist := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist;
          FLyricDownloader.Album := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album;
          FLyricDownloader.ItemInfo.Title := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title;
          FLyricDownloader.ItemInfo.Artist := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist;
          FLyricDownloader.ItemInfo.Album := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Album;
          FLyricDownloader.Start;
        end
        else
        begin
          LyricSearchBtn.Enabled := True;
          LyricArtistEdit.Enabled := True;
          LyricTitleEdit.Enabled := True;
          LyricSourceList.Enabled := True;
          ReloadLyricTitleBtn.Enabled := True;
        end;
        // Self.Enabled := False;
        SaveSettings;
        PlaylistView.Refresh;
        Sleep(100);
        // Self.Enabled := True;
      end
      else
      begin
        FPlayer.Stop;
        FStoppedByUser := False;
        LImageFile := ExtractFileDir(Application.ExeName) + '\logo.png';
        CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');

        LogForm.LogList.Lines.Add('[' + DateTimeToStr(Now) + '] Reached the end of the playlist');
        if not LogForm.Visible then
        begin
          LogForm.Show;
        end;
      end;
    end
    else
    begin
      // ShowMessage('ad');
      // FPlayer.Stop;
      // FStoppedByUser := False;
      StopBtnClick(Self);
      LImageFile := ExtractFileDir(Application.ExeName) + '\logo.png';
      CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');

      LogForm.LogList.Lines.Add('[' + DateTimeToStr(Now) + '] Reached the end of the playlist');
      if not LogForm.Visible then
      begin
        LogForm.Show;
      end;
    end;
  end
  else
  begin
    // fplayer didn't return OK
    // FPlayer.Stop;
    // FStoppedByUser := False;
    StopBtnClick(Self);

    LogForm.LogList.Lines.Add('[' + DateTimeToStr(Now) + '] Player returned error code: ' + FloatToStr(FPlayer.ErrorMsg));
    if not LogForm.Visible then
    begin
      LogForm.Show;
    end;
  end;

  StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
end;

procedure TMainForm.PlayListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  L, H, s: Word;
begin
  if (Item.Index mod 2) = 0 then
  begin
    Sender.Canvas.Brush.Color := (Sender as TsListView).Color;
  end
  else
  begin
    if sSkinManager1.Active then
    begin
      ColorRGBToHLS((Sender as TsListView).Color, H, L, s);
      if L < 10 then
      begin
        L := 10;
        L := (L * 120) div 100;
      end
      else if L > 90 then
      begin
        L := (L * 80) div 100;
      end;
      Sender.Canvas.Brush.Color := ColorHLSToRGB(H, L, s);
    end
    else
    begin
      Sender.Canvas.Brush.Color := clGradientInactiveCaption;
    end;
  end;
end;

procedure TMainForm.PlayListData(Sender: TObject; Item: TListItem);
var
  LItemCaption: string;
begin
  if FPlaylists.Count > FSelectedPlaylistIndex then
  begin
    if Item.Index < FPlaylists[FSelectedPlaylistIndex].Count then
    begin
      case SettingsForm.PlaylistItemTextList.ItemIndex of
        0:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Title;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Album);
              Item.SubItems.Add(Artist);
            end;
          end;
        1:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Album;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Title);
              Item.SubItems.Add(Artist);
            end;
          end;
        2:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Artist;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Album);
              Item.SubItems.Add(Title);
            end;
          end;
        3:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Title;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Artist);
              Item.SubItems.Add(Album);
            end;
          end;
        4:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Album;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Artist);
              Item.SubItems.Add(Title);
            end;
          end;
        5:
          begin
            with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
            begin
              Item.Caption := FloatToStr(Item.Index + 1) + '. ' + Artist;
              LItemCaption := Item.Caption;
              Item.SubItems.Add(Title);
              Item.SubItems.Add(Album);
            end;
          end;
      end;
      with FPlaylists[FSelectedPlaylistIndex][Item.Index] do
      begin
        Item.SubItems.Add(DurationStr);
        Item.SubItems.Add(Bitrate);
        Item.SubItems.Add(SampleRate + ' Hz');
        Item.SubItems.Add(Channels);
        Item.SubItems.Add(Codec);
      end;
      if FSelectedPlaylistIndex = FActivePlaylistIndex then
      begin
        if Item.Index = FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex then
        begin
          if FPlayer.PlayerStatus2 = psPlaying then
          begin
            Item.StateIndex := 0
          end
          else if FPlayer.PlayerStatus2 = psPaused then
          begin
            Item.StateIndex := 1
          end
          else
          begin
            if FQueueLists[FSelectedPlaylistIndex].Contains(Item.Index) then
            begin
              Item.StateIndex := 2;
            end
            else
            begin
              Item.StateIndex := -1
            end;
          end;
        end
        else
        begin
          Item.StateIndex := -1;
          if FQueueLists[FSelectedPlaylistIndex].Contains(Item.Index) then
          begin
            Item.StateIndex := 2;
          end
          else
          begin
            Item.StateIndex := -1;
          end;
        end;
      end
      else
      begin
        Item.StateIndex := -1;
      end;
    end;
  end;
end;

procedure TMainForm.PlayListDblClick(Sender: TObject);
begin
  if PlayList.ItemIndex > -1 then
  begin
    PositionTimer.Enabled := False;
    ProgressTimer.Enabled := PositionTimer.Enabled;

    PlayItem(PlayList.ItemIndex);
    PlayItemUIUpdate;
  end;
end;

procedure TMainForm.PlayListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
  Item := PlayList.GetItemAt(X, Y);
  if Item <> nil then
  begin
    FPlaylists[FSelectedPlaylistIndex].Move(TMyDragObject(Source).ItemIndex, Item.Index);
    if FDraggingCurrentFile then
    begin
      FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex := Item.Index;
    end;
    if FDraggedQueueItemIndex > -1 then
    begin
      FQueueLists[FSelectedPlaylistIndex][FDraggedQueueItemIndex] := Item.Index;
    end;
    PlayList.Items[TMyDragObject(Source).ItemIndex].Selected := True;
    PlayList.Items[Item.Index].Selected := False;
    // PlayList.Invalidate;
  end;
end;

procedure TMainForm.PlayListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TMyDragObject);
end;

procedure TMainForm.PlaylistMenuBtnClick(Sender: TObject);
var
  p: TPoint;
begin
  p := PlaylistMenuBtn.ClientToScreen(Point(0, 0));
  Playlist2Menu.Popup(p.X, p.Y + PlaylistMenuBtn.Height)
end;

procedure TMainForm.PlayListMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(PlayList);
end;

procedure TMainForm.PlayListMouseLeave(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PlayListStartDrag(Sender: TObject; var DragObject: TDragObject);
var
  Item: TListItem;
  I: Integer;
begin
  Item := PlayList.Selected;
  if Item <> nil then
  begin
    DragObject := TMyDragObject.Create;
    TMyDragObject(DragObject).ItemIndex := Item.Index;
    FDraggingCurrentFile := Item.Index = FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
    FDraggedQueueItemIndex := -1;
    for I := 0 to FQueueLists[FSelectedPlaylistIndex].Count - 1 do
    begin
      if FQueueLists[FSelectedPlaylistIndex][i] = Item.Index then
      begin
        FDraggedQueueItemIndex := I;
        Break;
      end;
    end;
  end;
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PlayRadio(const URL: Ansistring);
begin
  // stop music player
  FStoppedByUser := True;
  FCategoryIndex := 1;

  FPlayer.Stop;
  StopRadioRecording;
  PositionBar.Position := 0;
  Self.Caption := 'OooPlayer';
  PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
  CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');
  TitleLabel.Caption := 'Trying to connect to the radio station...';
  FTitleLabel := TitleLabel.Caption;
  FSelfCaption := Self.Caption;
  FArtistLabel := '';
  FAlbumLabel := '';
  PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
  LyricList.Items.Clear;
  Taskbar2.ProgressMaxValue := High(Int64);
  Taskbar2.ProgressValue := 0;
  UpdateOverlayIcon(3);
  // PlayList.Invalidate;
  PositionTimer.Enabled := False;
  ProgressTimer.Enabled := PositionTimer.Enabled;
  InfoLabel.Caption := '';

  FPlaybackType := radio;
  RadioConnectionBar.Visible := True;
  RadioConnectionBar.Style := pbstMarquee;
  // stop radio player
  if not IsRadioPlayerStopped then
  begin
    StopRadio;
  end;
  // stop thread because we wiil run it again
  if not RadioThread.Terminated then
  begin
    RadioThread.Terminate;
  end;
  while not RadioThread.Terminated do
  begin
    Application.ProcessMessages;
    Sleep(50);
  end;

  RadioList.Invalidate;
  FRadioURL := URL;
  UpdateOverlayIcon(1);
  RadiosView.Refresh;
  RadioThread.Start;
end;

function TMainForm.PlayWindowTitle(const Song, Artist, Album: string): string;
begin
  case SettingsForm.WindowTitleList.ItemIndex of
    0:
      begin
        Result := Song + ' - ' + Album + ' - ' + Artist + ' [OooPlayer]';
      end;
    1:
      begin
        Result := Album + ' - ' + Song + ' - ' + Artist + ' [OooPlayer]';
      end;
    2:
      begin
        Result := Artist + ' - ' + Album + ' - ' + Song + ' [OooPlayer]';
      end;
    3:
      begin
        Result := Song + ' - ' + Artist + ' - ' + Album + ' [OooPlayer]';
      end;
    4:
      begin
        Result := Album + ' - ' + Artist + ' - ' + Song + ' [OooPlayer]';
      end;
    5:
      begin
        Result := Artist + ' - ' + Song + ' - ' + Album + ' [OooPlayer]';
      end;
  end;
end;

procedure TMainForm.PositionBarChanged(Sender: TObject);
begin
  if (FPlayer.PlayerStatus2 = psPlaying) or (FPlayer.PlayerStatus2 = psPaused) then
  begin
    PositionTimer.Enabled := False;
    ProgressTimer.Enabled := PositionTimer.Enabled;

    try
      if not FPlayer.SetPosition((FPlayer.TotalLength * PositionBar.Position) div High(Int64)) then
      begin
        PositionBar.Position := FPlayer.Position;
      end;
    finally
      PositionTimer.Enabled := True;
      ProgressTimer.Enabled := PositionTimer.Enabled;

    end;
  end;
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PositionBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NewTractBarPosition: Integer;
begin
  if FPlayer.PlayerStatus2 = psPlaying then
  begin
    PositionTimer.Enabled := False;
    ProgressTimer.Enabled := False;
    // the new position on the trackbar
    NewTractBarPosition := Round((X / PositionBar.ClientWidth) * FCurrentItemInfo.DurationBass);
    if (NewTractBarPosition <> PositionBar.Position) then
    begin
      FPlayer.Pause;
      Sleep(50);
      try
        if FPlayer.SetPosition((FPlayer.TotalLength * NewTractBarPosition) div FCurrentItemInfo.DurationBass) then
        begin
          // PositionBar.Position := NewTractBarPosition;
        end;
      finally
        Sleep(50);
        FPlayer.Resume;
        PositionTimer.Enabled := True;
        ProgressTimer.Enabled := True;
      end;
    end;
  end;
end;

procedure TMainForm.PositionBarMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.PositionTimerTimer(Sender: TObject);
var
  LPosition: Integer;
begin
  if FPlayer.PlayerStatus2 = psPlaying then
  begin
    LPosition := (MaxInt * FPlayer.Position) div FCurrentItemInfo.DurationBass;
    if LPosition <> PositionBar.Position then
    begin
      PositionBar.Position := LPosition;
      Taskbar2.ProgressValue := LPosition;
    end;
  end
  else
  begin
    // stopped
    if FStoppedByUser then
    begin
      PositionTimer.Enabled := False;
      ProgressTimer.Enabled := PositionTimer.Enabled;
    end;
  end;
end;

procedure TMainForm.PrevArtworkBtnClick(Sender: TObject);
begin
  if FArtworkReader.ExternalArtworkFiles.Count > 0 then
  begin
    FArtworkReader.LoadPrevExternalCoverArt;
  end;
end;

procedure TMainForm.PrevBtnClick(Sender: TObject);
var
  LRndIndex: Integer;
begin
  if FPlaybackType = music then
  begin
    case PlaybackOrderList.ItemIndex of
      0: // normal
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          if FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > 0 then
          begin
            PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex - 1);
            PlayItemUIUpdate;
          end;
        end;
      1: // random
        begin
          Randomize;
          LRndIndex := Random(FPlaylists[FSelectedPlaylistIndex].Count);
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          PlayItem(LRndIndex);
          PlayItemUIUpdate;
        end;
      2: // repear track
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;

          try
            if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < PlayList.Items.Count) then
            begin
              PlayItem(FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
              PlayItemUIUpdate;
            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;

          end;
        end;
      3: // shuffle
        begin
          PositionTimer.Enabled := False;
          ProgressTimer.Enabled := PositionTimer.Enabled;
          try
            if FShuffleIndex > 0 then
            begin
              FShuffleIndex := -1 + FShuffleIndex;
              if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
              begin
                PlayItem(FShuffleIndexes[FShuffleIndex]);
                PlayItemUIUpdate;
              end;
            end;
          finally
            PositionTimer.Enabled := True;
            ProgressTimer.Enabled := PositionTimer.Enabled;
          end;
        end;
    end;
  end;
end;

procedure TMainForm.PrevBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.ProgressLabelMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.ProgressPanelMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.ProgressTimerTimer(Sender: TObject);
begin
  if FPlayer.PlayerStatus2 = psPlaying then
  begin
    PositionLabel.Caption := FPlayer.PositionStr + '/' + FPlayer.IntToTime(FCurrentItemInfo.DurationAsSecInt - FPlayer.PositionAsSec) + '/' + FPlayer.IntToTime(FCurrentItemInfo.DurationAsSecInt);
    PositionBar.Hint := FPlayer.PositionStr;
  end;
end;

procedure TMainForm.QueueListData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < FQueueLists[FSelectedPlaylistIndex].Count then
  begin
    Item.Caption := FPlaylists[FSelectedPlaylistIndex][FQueueLists[FSelectedPlaylistIndex][Item.Index]].Artist + ' - ' + FPlaylists[FSelectedPlaylistIndex]
      [FQueueLists[FSelectedPlaylistIndex][Item.Index]].Album + ' - ' + FPlaylists[FSelectedPlaylistIndex][FQueueLists[FSelectedPlaylistIndex][Item.Index]].Title;
    Item.SubItems.Add(FPlaylists[FSelectedPlaylistIndex][FQueueLists[FSelectedPlaylistIndex][Item.Index]].DurationStr);
  end;
end;

procedure TMainForm.QueueListDblClick(Sender: TObject);
begin
  if QueueList.ItemIndex > -1 then
  begin
    // play selected item
    PlayItem(FQueueLists[FSelectedPlaylistIndex][QueueList.ItemIndex]);
    PlayItemUIUpdate;
    // delete it from lists
    FQueueLists[FSelectedPlaylistIndex].Delete(QueueList.ItemIndex);
    QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
    QueueList.Invalidate;
    // PlayList.Invalidate;
  end;
end;

procedure TMainForm.QueueListMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(QueueList);
end;

procedure TMainForm.QueueListMouseLeave(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.R1Click(Sender: TObject);
var
  I: Integer;
begin
  PlayList.Items.BeginUpdate;
  try
    for I := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
    begin
      Application.ProcessMessages;
      ReScanFile(i);
    end;
  finally
    PlayList.Items.EndUpdate;
  end;
end;

procedure TMainForm.R2Click(Sender: TObject);
var
  I: Integer;
  FDeletedQueueIndex: integer;
begin
  if PlayList.ItemIndex > -1 then
  begin
    FDeletedQueueIndex := -1;
    // if a queued item is selected to be deleted, store its index to delete it later
    for I := 0 to FQueueLists[FSelectedPlaylistIndex].Count - 1 do
    begin
      if FQueueLists[FSelectedPlaylistIndex][i] = PlayList.ItemIndex then
      begin
        FDeletedQueueIndex := i;
        Break;
      end;
    end;
    // adjust queue items
    for I := 0 to FQueueLists[FSelectedPlaylistIndex].Count - 1 do
    begin
      // if queued item is below the deleted item then decrease it's index by 1
      if FQueueLists[FSelectedPlaylistIndex][i] > PlayList.ItemIndex then
      begin
        FQueueLists[FSelectedPlaylistIndex][i] := FQueueLists[FSelectedPlaylistIndex][i] - 1;
      end;
    end;
    if FDeletedQueueIndex > -1 then
    begin
      FQueueLists[FSelectedPlaylistIndex].Delete(FDeletedQueueIndex);
      QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
      QueueList.Invalidate;
    end;
    PlayList.Items[PlayList.ItemIndex].Delete;
    FPlaylists[FSelectedPlaylistIndex].Delete(PlayList.ItemIndex);
    PlayList.Items.Count := PlayList.Items.Count - 1;
    PlayList.Repaint;
    StatusBar.Panels[0].Text := FloatToStr(PlayList.Items.Count) + ' files / ' + FPlayListFiles[FSelectedPlaylistIndex].Name;
  end;
end;

procedure TMainForm.R3Click(Sender: TObject);
begin
  FuncPages.ActivePageIndex := 1;
  CategoryPages.ActivePageIndex := 1;
end;

procedure TMainForm.R4Click(Sender: TObject);
var
  LRadioFile: TStringList;
begin
  if RadioList.ItemIndex > -1 then
  begin
    LRadioFile := TStringList.Create;
    try
      if FCurrentRadioIndex = RadioList.ItemIndex then
      begin
        FCurrentRadioIndex := -1;
      end;
      if FCurrentRadioIndex > RadioList.ItemIndex then
      begin
        Dec(FCurrentRadioIndex);
      end;
      if not Portable then
      begin
        LRadioFile.LoadFromFile(FAppDataFolder + '\' + FCurrentRadioCatName + '.txt');
        LRadioFile.Delete(RadioList.ItemIndex);
        LRadioFile.SaveToFile(FAppDataFolder + '\' + FCurrentRadioCatName + '.txt', TEncoding.UTF8);
      end
      else
      begin
        LRadioFile.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Radios\' + FCurrentRadioCatName + '.txt');
        LRadioFile.Delete(RadioList.ItemIndex);
        LRadioFile.SaveToFile(ExtractFileDir(Application.ExeName) + '\Radios\' + FCurrentRadioCatName + '.txt', TEncoding.UTF8);
      end;
      FRadioStations.Delete(RadioList.ItemIndex);
      RadioList.Items.Count := FRadioStations.Count;

      ReloadRadioCategory;
      if RadioList.Items.Count > 0 then
      begin
        if (FCurrentRadioIndex < RadioList.Items.Count) and (FCurrentRadioIndex > -1) then
        begin
          RadioList.Items[FCurrentRadioIndex].MakeVisible(False);
        end;
      end;
    finally
      LRadioFile.Free;
    end;
  end;
end;

procedure TMainForm.R5Click(Sender: TObject);
begin
  if QueueList.ItemIndex > -1 then
  begin
    // delete it from lists
    FQueueLists[FSelectedPlaylistIndex].Delete(QueueList.ItemIndex);
    QueueList.Items.Count := FQueueLists[FSelectedPlaylistIndex].Count;
    QueueList.Invalidate;
    // PlayList.Invalidate;
  end;
end;

procedure TMainForm.R7Click(Sender: TObject);
var
  I: Integer;
  LCounter: integer;
begin
  if ProgressPanel.Visible then
    Exit;

  if ID_YES = Application.MessageBox('This will remove items that no longer exist on your disk from active playlist. Do you wish to continue?', 'Question', MB_ICONQUESTION or MB_YESNO) then
  begin
    Self.Enabled := False;
    StopBtnClick(Self);
    LogForm.Show;
    LogForm.ESCCanClose := False;
    LCounter := 0;

    LogForm.LogList.Lines.Add('Starting to remove files that no longer exist from ' + PlaylistView.Items[FSelectedPlaylistIndex].SubItems[0]);

    for I := FPlaylists[FSelectedPlaylistIndex].Count - 1 downto 0 do
    begin
      Application.ProcessMessages;
      if not FileExists(FPlaylists[FSelectedPlaylistIndex][i].FullFileName) then
      begin
        LogForm.LogList.Lines.Add('Deleted ' + FPlaylists[FSelectedPlaylistIndex][i].FullFileName);
        FPlaylists[FSelectedPlaylistIndex].Delete(i);
        PlayList.Items.Delete(i);
        Inc(LCounter);
      end;
    end;

    SavePlayList;
    PlayList.Items.Count := FPlaylists[FSelectedPlaylistIndex].Count;
    PlayList.Repaint;

    LogForm.LogList.Lines.Add('Deleted ' + FloatToStr(LCounter) + ' items.');
    LogForm.ESCCanClose := True;

    Self.Enabled := True;
    Self.BringToFront;
  end;
end;

procedure TMainForm.RadioCatListChange(Sender: TObject);
begin
  LoadRadioStations;
  FCurrentRadioIndex := -1;
  RadioList.Invalidate;
end;

procedure TMainForm.RadioListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if IsRadioPlayerStopped then
  begin
    Sender.Canvas.Font.Style := []
  end
  else
  begin
    if Item.Index = FCurrentRadioIndex then
    begin
      Sender.Canvas.Font.Style := [fsBold]
    end
    else
    begin
      Sender.Canvas.Font.Style := []
    end;
  end;
end;

procedure TMainForm.RadioListData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < RadioList.Items.Count then
  begin
    Item.Caption := FRadioStations[Item.Index].Name;
    Item.SubItems.Add(FRadioStations[Item.Index].Web);
    Item.SubItems.Add(FRadioStations[Item.Index].URL);
  end;
end;

procedure TMainForm.RadioListDblClick(Sender: TObject);
begin
  if RadioList.ItemIndex > -1 then
  begin
    // do nothing if current stations is double clicked
    if RadioList.ItemIndex <> FCurrentRadioIndex then
    begin
      FCurrentRadioIndex := RadioList.ItemIndex;
      PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
      FActiveRadioListIndex := FCurrentRadioCatIndex;
    end
    else
    begin
      if IsRadioPlayerStopped or (FRadioHandle = 0) then
      begin
        PlayRadio(FRadioStations[FCurrentRadioIndex].URL);
        FActiveRadioListIndex := FCurrentRadioCatIndex;
      end;
    end;
  end;
end;

procedure TMainForm.RadioListMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(RadioList);
end;

procedure TMainForm.RadioListMouseLeave(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.RadioResetUI;
begin
  FTitleLabel := TitleLabel.Caption;
  FArtistLabel := '';
  FAlbumLabel := '';
  Self.Caption := 'OooPlayer';
  FSelfCaption := Self.Caption;
end;

procedure TMainForm.RadiosViewChange(Sender: TObject; Node: TTreeNode);
begin
  if Assigned(Node) then
  begin
    if (Node.AbsoluteIndex > 0) then
    begin
      FCurrentRadioCatName := Node.Text;
      LoadRadioStations;
      FCurrentRadioIndex := -1;
      FCurrentRadioCatIndex := Node.AbsoluteIndex;
      RadioList.Invalidate;
      FuncPages.ActivePageIndex := 1;
    end
    else if Node.AbsoluteIndex = 0 then
    begin
      // root
    end;
  end;
end;

procedure TMainForm.RadiosViewClick(Sender: TObject);
begin
  if RadiosView.ItemIndex > -1 then
  begin
    FuncPages.ActivePageIndex := 1;
    FCurrentRadioCatName := RadiosView.Items[RadiosView.ItemIndex].SubItems[0];
    LoadRadioStations;
    FCurrentRadioIndex := -1;
    FCurrentRadioCatIndex := RadiosView.ItemIndex;
    RadioList.Invalidate;
    FuncPages.ActivePageIndex := 1;
  end;
end;

procedure TMainForm.RadiosViewCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index = FActiveRadioListIndex then
  begin
    Sender.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    Sender.Canvas.Font.Style := [];
  end;
end;

procedure TMainForm.RadiosViewResize(Sender: TObject);
begin
  RadiosView.Columns[0].Width := 45;
  RadiosView.Columns[1].Width := RadiosView.ClientWidth - RadiosView.Columns[0].Width - 20;
end;

procedure TMainForm.RadioThreadRun(Sender: TIdThreadComponent);
var
  LCacheProgress: Integer;
  LLen: Cardinal;
  LMeta: PAnsiChar;
begin
  // previous stream
  BASS_StreamFree(FRadioHandle);
  // reset UI
  SendMessage(WinHandle, WM_INFO_UPDATE, RESET_UI, 0);
  LCacheProgress := 0;

  // create radio stream
  FRadioHandle := BASS_StreamCreateURL(PAnsiChar(FRadioURL), 0, BASS_STREAM_BLOCK or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, @StatusProc, nil);
  if FRadioHandle = 0 then
  begin
    try
      FRadioLogItem := 'Unable to play: ' + string(FRadioURL);
      RadioThread.Synchronize(AddToRadioLog);
      FRadioLogItem := 'Bass radio error: ' + BassErrorCodeToString(BASS_ErrorGetCode());
      RadioThread.Synchronize(AddToRadioLog);
      RadioThread.Synchronize(RadioResetUI);
    except
      on E: Exception do

    end;
    SendMessage(WinHandle, WM_INFO_UPDATE, STOP_IMG_ANIM, LCacheProgress);
  end
  else
  begin
    // cache progress
    repeat
      LLen := BASS_StreamGetFilePosition(FRadioHandle, BASS_FILEPOS_END);
      if (LLen = DW_Error) then
      begin
        Break;
      end;
      LCacheProgress := (BASS_StreamGetFilePosition(FRadioHandle, BASS_FILEPOS_BUFFER) * 100) div LLen;
      // update ui
      SendMessage(WinHandle, WM_INFO_UPDATE, UPDATE_PROGRESS, LCacheProgress);
    until (LCacheProgress > 75) or (BASS_StreamGetFilePosition(FRadioHandle, BASS_FILEPOS_CONNECTED) = 0);

    // get meta data
    LMeta := BASS_ChannelGetTags(FRadioHandle, BASS_TAG_ICY);
    if (LMeta = nil) then
    begin
      // try http if icy fails
      LMeta := BASS_ChannelGetTags(FRadioHandle, BASS_TAG_HTTP);
      SendMessage(WinHandle, WM_INFO_UPDATE, UPDATE_META_NAME, DWORD(PAnsiChar(LMeta)));
    end;
    if (LMeta <> nil) then
    begin
      while (LMeta^ <> #0) do
      begin
        if (Copy(LMeta, 1, 9) = 'icy-name:') then
          SendMessage(WinHandle, WM_INFO_UPDATE, UPDATE_META_NAME, DWORD(PAnsiChar(Copy(LMeta, 10, MaxInt))))
        else if (Copy(LMeta, 1, 7) = 'icy-br:') then
          SendMessage(WinHandle, WM_INFO_UPDATE, UPDATE_META_BITRATE, DWORD(PAnsiChar('Bitrate: ' + Copy(LMeta, 8, MaxInt))));
        LMeta := LMeta + Length(LMeta) + 1;
      end;
    end;
    // get the stream title and set sync for subsequent titles
    DoMeta();
    BASS_ChannelSetSync(FRadioHandle, BASS_SYNC_META, 0, @MetaSync, nil);
    // play it!
    BASS_ChannelPlay(FRadioHandle, False);
    SetRadioVolume(VolumeBar.Position);
    // re-paint radio list
    SendMessage(WinHandle, WM_INFO_UPDATE, REPAINT_RADIO_LIST, 0);
    // stop-loading animation
    SendMessage(WinHandle, WM_INFO_UPDATE, STOP_IMG_ANIM, 0);
    // download lyric
    SendMessage(WinHandle, WM_INFO_UPDATE, DOWNLOAD_LYRIC, 0);
  end;
  try
    RadioThread.Terminate;
  except

  end;
end;

procedure TMainForm.RecordingDisableUI;
begin
  RecordRadioBtn.Enabled := False;
  StopRadioRecordBtn.Enabled := True;
  RadioRecordFormatList.Enabled := False;
  RadioRecordModeList.Enabled := False;
end;

procedure TMainForm.RecordingEnableUI;
begin
  RecordRadioBtn.Enabled := True;
  StopRadioRecordBtn.Enabled := False;
  RadioRecordFormatList.Enabled := True;
  RadioRecordModeList.Enabled := True;
end;

procedure TMainForm.RecordRadioBtnClick(Sender: TObject);
begin
  StartRadioRecording;
end;

procedure TMainForm.ReloadLyricTitleBtnClick(Sender: TObject);
var
  LSplitList: TStringList;
begin
  if not FStopAddFiles then
    Exit;
  if FPlaybackType = music then
  begin
    if FPlayer.PlayerStatus2 <> psStopped then
    begin
      if SettingsForm.LyricBtn.Checked then
      begin
        if FPlaylists[FSelectedPlaylistIndex].Count < 1 then
          Exit;

        if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) then
        begin
          LyricTitleEdit.Text := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Title;
          LyricArtistEdit.Text := FPlaylists[FSelectedPlaylistIndex][FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Artist;
        end;
      end;
    end;
  end
  else if FPlaybackType = radio then
  begin
    LyricList.Items.Clear;
    LyricStatusLabel.Caption := '';
    LyricTitleEdit.Text := '';
    LyricArtistEdit.Text := '';
    LSplitList := TStringList.Create;
    Log(FTitleLabel);
    try
      // try to get tags
      // artist - title is assumed
      LSplitList.StrictDelimiter := True;
      LSplitList.Delimiter := '-';
      LSplitList.DelimitedText := FTitleLabel;
      if LSplitList.Count >= 2 then
      begin
        // sometimes there are no tags so we must check for them
        if (Length(Trim(LSplitList[1])) > 0) and (Length(Trim(LSplitList[0])) > 0) then
        begin
          LyricTitleEdit.Text := Trim(LSplitList[1]);
          LyricArtistEdit.Text := Trim(LSplitList[0]);
        end;
      end;
    finally
      LSplitList.Free;
    end;
  end;
end;

procedure TMainForm.ReloadRadioCategory;
var
  LStreamReader: TStreamReader;
  LLine: string;
  LRadioStation: TRadioStation;
  LSplitList: TStringList;
begin
  // remove all radio stations
  FRadioStations.Clear;
  RadioList.Items.Count := 0;
  RadioList.Invalidate;
  if not Portable then
  begin
    LStreamReader := TStreamReader.Create(FAppDataFolder + '\' + FCurrentRadioCatName + '.txt');
  end
  else
  begin
    LStreamReader := TStreamReader.Create(ExtractFileDir(Application.ExeName) + '\Radios\' + FCurrentRadioCatName + '.txt');
  end;
  LSplitList := TStringList.Create;
  try
    LSplitList.StrictDelimiter := True;
    LSplitList.Delimiter := ';';
    while not LStreamReader.EndOfStream do
    begin
      LLine := Trim(LStreamReader.ReadLine);
      if Length(LLine) > 0 then
      begin
        LSplitList.DelimitedText := LLine;
        if LSplitList.Count = 3 then
        begin
          LRadioStation.Name := LSplitList[0];
          LRadioStation.Web := LSplitList[1];
          LRadioStation.URL := LSplitList[2];

          RadioList.Items.Count := RadioList.Items.Count + 1;
          FRadioStations.Add(LRadioStation);
        end;
      end;
    end;
  finally
    LStreamReader.Close;
    LStreamReader.Free;
    LSplitList.Free;
  end;
end;

function TMainForm.RemoveInvalidChars(const Title: string): string;
const
  InvalidCharacters: set of char = ['\', '/', ':', '*', '?', '"', '<', '>', '|', ' '];
var
  Tmp: string;
  I: Integer;
begin
  Result := Title;
  Tmp := '';
  for I := 1 to Length(Title) do
  begin
    if not CharInSet(Title[i], InvalidCharacters) then
    begin
      Tmp := Tmp + Title[i];
    end;
  end;
  Result := Tmp;
end;

procedure TMainForm.RemoveMenuBtnClick(Sender: TObject);
var
  p: TPoint;
begin
  p := RemoveMenuBtn.ClientToScreen(Point(0, 0));
  RemoveMenu.Popup(p.X, p.Y + RemoveMenuBtn.Height)
end;

procedure TMainForm.RemovePlaylistBtnClick(Sender: TObject);
var
  LSW: TStreamWriter;
  i: integer;
  LSelectedIndex: Integer;
begin
  // cannot delete default one
  if PlaylistView.ItemIndex > -1 then
  begin
    LSelectedIndex := PlaylistView.ItemIndex;
    if ID_YES = Application.MessageBox('Delete selected playlist? This cannot be undone.', 'Playlist Selection', MB_ICONQUESTION or MB_YESNO) then
    begin
      // delete playlist file
      if FileExists(FPlayListFiles[LSelectedIndex].PlaylistFile) then
      begin
        DeleteFile(FPlayListFiles[LSelectedIndex].PlaylistFile)
      end;
      FPlayListFiles.Delete(LSelectedIndex);
      LSW := TStreamWriter.Create(FAppDataFolder + '\playlists.dat', False);
      try
        for I := 0 to FPlayListFiles.Count - 1 do
        begin
          LSW.WriteLine(FPlayListFiles[i].Name + '|' + FPlayListFiles[i].PlaylistFile + '|' + FPlayListFiles[i].CurrentItemIndex.ToString());
        end;
      finally
        LSW.Close;
        LSW.Free;
      end;
      FPlaylists.Delete(LSelectedIndex);
      PlaylistView.Items.Delete(LSelectedIndex);
      FSelectedPlaylistIndex := FPlayListFiles.Count - 1;
      PlaylistViewClick(Self);
      SavePlayList;
    end;
  end;
end;

procedure TMainForm.RenamePlaylistBtnClick(Sender: TObject);
var
  LPlaylistFile: TPlaylistFile;
  LNewName: string;
  LSW: TStreamWriter;
  i: integer;
  LOldPlaylistIndex: integer;
  LSelectedIndex: integer;
begin
  if PlaylistView.ItemIndex > -1 then
  begin
    LSelectedIndex := PlaylistView.ItemIndex;
    LNewName := InputBox('Playlist name', 'Name', FPlayListFiles[LSelectedIndex].Name);
    if LNewName.Length > 0 then
    begin
      LPlaylistFile := TPlaylistFile.Create;
      LPlaylistFile.Name := LNewName;
      LPlaylistFile.PlaylistFile := FPlayListFiles[LSelectedIndex].PlaylistFile;
      LPlaylistFile.CurrentItemIndex := FPlayListFiles[LSelectedIndex].CurrentItemIndex;
      FPlayListFiles[LSelectedIndex] := LPlaylistFile;
      LSW := TStreamWriter.Create(FAppDataFolder + '\playlists.dat', False);
      try
        for I := 0 to FPlayListFiles.Count - 1 do
        begin
          LSW.WriteLine(FPlayListFiles[i].Name + '|' + FPlayListFiles[i].PlaylistFile + '|' + FPlayListFiles[i].CurrentItemIndex.ToString());
        end;
      finally
        LSW.Close;
        LSW.Free;
      end;
      PlaylistView.Items[LSelectedIndex].Caption := FloatToStr(LSelectedIndex + 1) + '.';
      PlaylistView.Items[LSelectedIndex].SubItems[0] := LNewName;
      FSelectedPlaylistIndex := LOldPlaylistIndex;
      PlaylistView.Items[LSelectedIndex].Selected := True;
      PlaylistViewClick(Self);
      SavePlayList;
    end;
  end;
end;

procedure TMainForm.ReScanFile(const FileIndex: integer);
var
  MediaInfoHandle: Cardinal;
  LPlayListItem, LTmpItem: TPlayItem;
  LTitle, LArtist, LAlbum, LDuration, LBitrate, LChannels, LCodec, LSampleRate: string;
begin

  if (FileExists(FPlaylists[FSelectedPlaylistIndex][FileIndex].FullFileName)) then
  begin

    // New handle for mediainfo
    MediaInfoHandle := MediaInfo_New();
    { BassTagHandle := Bass_StreamCreateFile(false, PChar(FileName), 0, 0,
      Bass_Stream_Decode or BASS_UNICODE); }

    // initial values
    LTitle := 'unknown';
    LArtist := 'unknown';
    LAlbum := 'unknown';
    LDuration := '00:00:00.000';

    if (MediaInfoHandle <> 0) then
    begin

      try
        // read duration of file
        MediaInfo_Open(MediaInfoHandle, PWideChar(FPlaylists[FSelectedPlaylistIndex][FileIndex].FullFileName));
        MediaInfo_Option(MediaInfoHandle, 'Complete', '1');

        LDuration := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Duration/String3', Info_Text, Info_Name);
        LBitrate := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'BitRate/String', Info_Text, Info_Name);
        LChannels := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Channel(s)/String', Info_Text, Info_Name);
        LCodec := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'Codec/String', Info_Text, Info_Name);
        LSampleRate := MediaInfo_Get(MediaInfoHandle, Stream_Audio, 0, 'SamplingRate', Info_Text, Info_Name);
        // tags
        LTmpItem := FTagReader.ReadTags(FPlaylists[FSelectedPlaylistIndex][FileIndex].FullFileName);
        LTitle := LTmpItem.Title;
        LArtist := LTmpItem.Artist;
        LAlbum := LTmpItem.Album;

        LTitle := Trim(LTitle);
        LArtist := Trim(LArtist);
        LAlbum := Trim(LAlbum);
        LDuration := Trim(LDuration);
        LCodec := Trim(LCodec);
        LSampleRate := Trim(LSampleRate);

        if (Length(LTitle) < 1) then
        begin
          // if cannot get title
          // set to file name
          LTitle := ChangeFileExt(ExtractFileName(FPlaylists[FSelectedPlaylistIndex][FileIndex].FullFileName), '');
        end;

        if (Length(LArtist) < 1) then
        begin
          LArtist := 'unkown';
        end;

        if (Length(LAlbum) < 1) then
        begin
          LAlbum := 'unkown';
        end;

        if (Length(LDuration) < 1) then
        begin
          LDuration := '00:00:00.000';
        end;

        if (Length(LBitrate) < 1) then
        begin
          LBitrate := 'N/A';
        end;

        if (Length(LChannels) < 1) then
        begin
          LChannels := 'N/A';
        end;

        if (Length(LCodec) < 1) then
        begin
          LCodec := 'N/A';
        end;

        if (Length(LSampleRate) < 1) then
        begin
          LSampleRate := 'N/A';
        end;

        LPlayListItem := FPlaylists[FSelectedPlaylistIndex][FileIndex];

        LPlayListItem.DurationStr := LDuration;
        LPlayListItem.Title := LTitle;
        LPlayListItem.Artist := LArtist;
        LPlayListItem.Album := LAlbum;
        LPlayListItem.DurationStr := LDuration;
        LPlayListItem.Bitrate := LBitrate;
        LPlayListItem.Channels := LChannels;
        LPlayListItem.Codec := LCodec;
        LPlayListItem.SampleRate := LSampleRate;
        FPlaylists[FSelectedPlaylistIndex][FileIndex] := LPlayListItem;
      finally
        MediaInfo_Close(MediaInfoHandle);
      end;
    end;
  end;
end;

procedure TMainForm.ResumeRadio;
begin
  if BASS_ChannelIsActive(FRadioHandle) = BASS_ACTIVE_PAUSED then
  begin
    BASS_ChannelPlay(FRadioHandle, False);
    UpdateOverlayIcon(1);
  end;
end;

procedure TMainForm.S2Click(Sender: TObject);
begin
  Self.Enabled := False;
  case FuncPages.ActivePageIndex of
    0:
      SearchForm.SearchType := stmusic;
    1:
      SearchForm.SearchType := stradio;
  end;
  SearchForm.ActiveControl := SearchForm.QueryEdit;
  SearchForm.Show;
end;

procedure TMainForm.s3Click(Sender: TObject);
var
  LSaveDlg: TSaveDialog;
begin
  if PlayList.Items.Count < 1 then
    Exit;

  LSaveDlg := TSaveDialog.Create(Self);
  try
    LSaveDlg.Filter := 'Player Playlist|*.ppf|M3U|*.m3u|M3U8|*.m3u8';
    if LSaveDlg.Execute then
    begin
      case LSaveDlg.FilterIndex of
        1:
          SavePPFPlaylist(ChangeFileExt(LSaveDlg.FileName, '.ppf'));
        2:
          SaveM3UPlayList(ChangeFileExt(LSaveDlg.FileName, '.m3u'), False);
        3:
          SaveM3UPlayList(ChangeFileExt(LSaveDlg.FileName, '.m3u8'), True);
      end;
    end;
  finally
    LSaveDlg.Free;
  end;
end;

procedure TMainForm.S4Click(Sender: TObject);
begin
  PlayList.SelectAll;
end;

procedure TMainForm.S6Click(Sender: TObject);
begin
  if RadioList.ItemIndex > -1 then
  begin
    TRadioInfoForm.Create(Application).Show;
  end;
end;

procedure TMainForm.S7Click(Sender: TObject);
begin
  if PlayList.ItemIndex > -1 then
  begin
    ShellExecute(handle, 'open', PChar('http://www.youtube.com/results?search_query=' + FPlaylists[FSelectedPlaylistIndex][PlayList.ItemIndex].Artist + '+' + FPlaylists[FSelectedPlaylistIndex]
      [PlayList.ItemIndex].Title), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.S8Click(Sender: TObject);
begin
  if PlayList.ItemIndex > -1 then
  begin
    ShellExecute(handle, 'open', PChar('https://www.google.com.tr/search?q=' + StringReplace(FPlaylists[FSelectedPlaylistIndex][PlayList.ItemIndex].Artist, ' ', '+', [rfReplaceAll]) + '+' +
      StringReplace(FPlaylists[FSelectedPlaylistIndex][PlayList.ItemIndex].Title, ' ', '+', [rfReplaceAll])), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.SaveM3UPlayList(const FileName: string; const UTF8: Boolean);
var
  LStreamWriter: TStreamWriter;
  I: Integer;
begin
  if not UTF8 then
  begin
    LStreamWriter := TStreamWriter.Create(FileName, False, TEncoding.ANSI);
  end
  else
  begin
    LStreamWriter := TStreamWriter.Create(FileName, False, TEncoding.UTF8);
  end;
  try
    for I := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
    begin
      Application.ProcessMessages;
      with FPlaylists[FSelectedPlaylistIndex][i] do
      begin
        LStreamWriter.WriteLine(FullFileName);
      end;
    end;
  finally
    LStreamWriter.Close;
    LStreamWriter.Free;
  end;
end;

procedure TMainForm.SavePlayList;
var
  LStreamWriter: TStreamWriter;
  I: Integer;
  j: Integer;
begin
  for j := 0 to FPlayListFiles.Count - 1 do
  begin
    // delete all playlists file prior to creating them again
    if FileExists(FPlayListFiles[j].PlaylistFile) then
    begin
      DeleteFile(FPlayListFiles[j].PlaylistFile)
    end;

    // create a playlist file for each playlist
    LStreamWriter := TStreamWriter.Create(FPlayListFiles[j].PlaylistFile, False, TEncoding.UTF8);
    try
      for I := 0 to FPlaylists[j].Count - 1 do
      begin
        with FPlaylists[j][i] do
        begin
          LStreamWriter.WriteLine(FullFileName + '|' + Artist + '|' + Album + '|' + Title + '|' + DurationStr + '|' + Bitrate + '|' + Channels + '|' + Codec + '|' + SampleRate + '|' +
            FloatToStr(PlayCount) + '|' + FloatToStr(Stars));
        end;
      end;
      for I := 0 to FQueueLists[j].Count - 1 do
      begin
        LStreamWriter.WriteLine('#' + FQueueLists[j][i].ToString());
      end;
    finally
      LStreamWriter.Close;
      LStreamWriter.Free;
    end;
  end;
end;

procedure TMainForm.SavePPFPlaylist(const FileName: string);
var
  LStreamWriter: TStreamWriter;
  I: Integer;
begin
  LStreamWriter := TStreamWriter.Create(FileName, False, TEncoding.UTF8);
  try
    for I := 0 to FPlaylists[FSelectedPlaylistIndex].Count - 1 do
    begin
      Application.ProcessMessages;
      with FPlaylists[FSelectedPlaylistIndex][i] do
      begin
        LStreamWriter.WriteLine(FullFileName + '|' + Artist + '|' + Album + '|' + Title + '|' + DurationStr + '|' + Bitrate + '|' + Channels + '|' + Codec + '|' + SampleRate);
      end;
    end;
  finally
    LStreamWriter.Close;
    LStreamWriter.Free;
  end;
end;

procedure TMainForm.SaveSettings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := TIniFile.Create(FAppDataFolder + '\settings.ini');
  try
    with SettingsFile do
    begin
      WriteInteger('player', 'itemindex', FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex);
      WriteInteger('player', 'volume', VolumeBar.Position);
      WriteInteger('player', 'order', PlaybackOrderList.ItemIndex);
      WriteString('player', 'lastdir', FLastDir);
      WriteInteger('radio', 'cat', FCurrentRadioCatIndex);
      WriteInteger('general', 'func', FuncPages.ActivePageIndex);
      WriteInteger('radio', 'curr', FCurrentRadioIndex);
      WriteInteger('ui', 'queueh', QueueList.Height);
      WriteInteger('radio', 'recformat2', RadioRecordFormatList.ItemIndex);
      WriteInteger('radio', 'recmethod', RadioRecordModeList.ItemIndex);
      WriteInteger('lyric', 'source2', LyricSourceList.ItemIndex);
      WriteBool('search', 'close', SearchForm.chkCloseOnPlayBtn.Checked);
      WriteInteger('player', 'lyricw', LyricPanel.Width);
      WriteInteger('player', 'playlistindex', FSelectedPlaylistIndex);
      WriteBool('player', 'queuevisible', QueueList.Visible);
      WriteBool('player', 'lyricvisible', LyricPanel.Visible);
      WriteBool('player', 'catvisible', CategoryPages.Visible);
      WriteInteger('settings', 'coverheight', CoverPanel.Height);
      WriteInteger('settings', 'categorywidth', CategoryPages.Width);
      WriteInteger('general', 'categoryindex', FCategoryIndex);

      with PlayList do
      begin
        WriteInteger('columns', '1', Columns[0].Width);
        WriteInteger('columns', '2', Columns[1].Width);
        WriteInteger('columns', '3', Columns[2].Width);
        WriteInteger('columns', '4', Columns[3].Width);
        WriteInteger('columns', '5', Columns[4].Width);
        WriteInteger('columns', '6', Columns[5].Width);
        WriteInteger('columns', '7', Columns[6].Width);
        WriteInteger('columns', '8', Columns[7].Width);
      end;
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TMainForm.ScrollToCurrentSong;
begin
  PlayList.Items.BeginUpdate;
  try
    if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) and (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex > -1) then
    begin
      PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].MakeVisible(False);
      PlayList.ItemIndex := -1;
      PlayList.ItemIndex := FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex;
      PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex].Selected := True;
      if (FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1) < PlayList.Items.Count then
      begin
        PlayList.Items[FPlayListFiles[FSelectedPlaylistIndex].CurrentItemIndex + 1].Selected := False;
      end;
    end;
  finally
    PlayList.Items.EndUpdate;
  end;
end;

procedure TMainForm.ScrollToItem(const ItemIndex: integer);
begin
  if (ItemIndex < FPlaylists[FSelectedPlaylistIndex].Count) and (ItemIndex > -1) then
  begin
    PlayList.Items[ItemIndex].MakeVisible(False);
    PlayList.ItemIndex := -1;
    PlayList.ItemIndex := ItemIndex;
  end;
end;

procedure TMainForm.SearchBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.SetPlayerBuffer(const Buffer: DWORD);
begin
  FPlayer.SetBuffer(Buffer);
end;

procedure TMainForm.SetRadioVolume(const Volume: integer);
begin
  BASS_ChannelSetAttribute(FRadioHandle, BASS_ATTRIB_VOL, Volume / 100.0)
end;

procedure TMainForm.SettingsBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.sPanel5MouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.Splitter1Moved(Sender: TObject);
begin
  PlayList.Columns[0].Width := PlayList.ClientWidth - PlayList.Columns[1].Width;
end;

procedure TMainForm.Splitter2Moved(Sender: TObject);
begin
  // PlayList.Columns[4].Width := 100;
  // PlayList.Columns[0].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  // PlayList.Columns[1].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  // PlayList.Columns[2].Width := (PlayList.ClientWidth - PlayList.Columns[3].Width - PlayList.Columns[4].Width) div 3;
  QueueList.Columns[0].Width := QueueList.ClientWidth - QueueList.Columns[1].Width;
  StatusBar.Panels[0].Width := StatusBar.ClientWidth - StatusBar.Panels[1].Width;
  RadioList.Columns[0].Width := RadioList.ClientWidth - 20;
end;

procedure TMainForm.sSkinManager1Activate(Sender: TObject);
begin
  Self.Canvas.Font.Assign(Self.Font);
end;

procedure TMainForm.sSkinManager1Deactivate(Sender: TObject);
begin
  if Assigned(Self.Canvas) then
  begin
    Self.Canvas.Font.Assign(Self.Font);
  end;
end;

procedure TMainForm.StartRadioRecording;
var
  LEncodeCMD: PWideChar;
  LChanInfo: BASS_CHANNELINFO;
  LRadioInfo: TRadioRecordInfo;
begin
  if FPlaybackType = radio then
  begin
    if not IsRadioPlayerStopped then
    begin
      if not IsRadioPlayerPaused then
      begin
        // record radio and encode it
        if RadioRecordFormatList.ItemIndex <> 4 then
        begin
          // get channel frequency
          BASS_ChannelGetInfo(FRadioHandle, LChanInfo);
          LRadioInfo := CreateRadioRecordFileName;
          LEncodeCMD := '';
          case RadioRecordFormatList.ItemIndex of
            0: // mp3
              LEncodeCMD := PWideChar('"' + FLamePath + '" -r -s ' + FloatToStr(LChanInfo.freq) + ' -b ' + RadioRecordOptionsForm.BitrateList.Text + ' --tt ' + LRadioInfo.Title + ' --ta ' +
                LRadioInfo.Artist + ' - -o ' + LRadioInfo.FileName);
            1: // ogg
              LEncodeCMD := PWideChar('"' + FOggEncPath + '" --ignorelength -r -R ' + FloatToStr(LChanInfo.freq) + ' -b ' + RadioRecordOptionsForm.BitrateList.Text + ' -t ' + LRadioInfo.Title + ' -a '
                + LRadioInfo.Artist + ' - -o ' + LRadioInfo.FileName);
            2: // opus
              LEncodeCMD := PWideChar('"' + FOpusEncPath + '" --hard-cbr --bitrate ' + RadioRecordOptionsForm.BitrateList.Text + ' --title ' + LRadioInfo.Title + ' --artist ' + LRadioInfo.Artist +
                ' --raw --raw-rate ' + FloatToStr(LChanInfo.freq) + ' - ' + LRadioInfo.FileName);
            3: // aac
              LEncodeCMD := PWideChar('"' + FFDKPath + '" -m 0 -b ' + RadioRecordOptionsForm.BitrateList.Text + ' --title ' + LRadioInfo.Title + ' --artist ' + LRadioInfo.Artist +
                ' --moov-before-mdat --ignorelength -R --raw-rate ' + FloatToStr(LChanInfo.freq) + ' - -o ' + LRadioInfo.FileName);
          end;
          FRadioRecordProcessID := BASS_Encode_Start(FRadioHandle, LEncodeCMD, BASS_UNICODE, nil, nil);
          if FRadioRecordProcessID > 0 then
          begin
            RecordingDisableUI;
            FRecordingRadio := True;
          end
          else
          begin
            FRecordingRadio := False;
            // show error
            LogForm.LogList.Lines.Add('Radio recording bass error: ' + FloatToStr(BASS_ErrorGetCode));
            if not LogForm.Visible then
            begin
              LogForm.Show;
            end;
          end;
        end
        else
        begin
          // save radio directly to the disc
          RecordingDisableUI;
          FRecordingRadio := True;
          FRadioRecordingInfo := CreateRadioRecordFileName;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
begin
  if FPlaybackType = music then
  begin
    // music
    FStoppedByUser := True;
    FPlayer.Stop;
  end
  else if FPlaybackType = radio then
  begin
    // radio
    if not IsRadioPlayerStopped then
    begin
      StopRadio;
      StopRadioRecording;
    end;
  end;
  PositionBar.Position := 0;
  Self.Caption := 'OooPlayer';
  CoverImage.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.png');
  TitleLabel.Caption := '';
  FTitleLabel := TitleLabel.Caption;
  FSelfCaption := Self.Caption;
  FArtistLabel := '';
  FAlbumLabel := '';
  PositionLabel.Caption := '00:00:00/00:00:00/00:00:00';
  InfoLabel.Caption := 'Stopped';
  LyricList.Items.Clear;
  Taskbar2.ProgressMaxValue := High(Int64);
  Taskbar2.ProgressValue := 0;
  UpdateOverlayIcon(3);
  // PlayList.Invalidate;
  RadioList.Invalidate;
  LyricList.Items.Clear;
  LyricTitleEdit.Clear;
  LyricArtistEdit.Clear;
  // LeftLevelBar.Position := 0;
  // RightLevelBar.Position := 0;
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.StopBtnMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.StopRadio;
begin
  if BASS_ChannelIsActive(FRadioHandle) <> BASS_ACTIVE_STOPPED then
  begin
    BASS_ChannelStop(FRadioHandle)
  end;
end;

procedure TMainForm.StopRadioRecordBtnClick(Sender: TObject);
begin
  StopRadioRecording;
end;

procedure TMainForm.StopRadioRecording;
begin
  if FPlaybackType = radio then
  begin
    BASS_Encode_Stop(FRadioHandle);
    RecordingEnableUI;
    FRecordingRadio := False;
    // write tags to file if directly save to disc is selected
    if RadioRecordFormatList.ItemIndex = 4 then
    begin
      WriteTagsToRecordFile;
      // rename file according to file type
      if FileExists(FRadioRecordingInfo.FileName) then
      begin
        RenameFile(FRadioRecordingInfo.FileName, ChangeFileExt(FRadioRecordingInfo.FileName, GetRecordedFileType(FRadioRecordingInfo.FileName)));
        FRadioRecordingInfo.FileName := ChangeFileExt(FRadioRecordingInfo.FileName, GetRecordedFileType(FRadioRecordingInfo.FileName));
        WriteTagsToRecordFile;
      end;
    end;
  end;
end;

procedure TMainForm.TaskBar2ThumbButtonClick(Sender: TObject; AButtonID: Integer);
begin
  case AButtonID of
    0:
      PlayBtnClick(Self);
    1:
      PauseBtnClick(Self);
    2:
      StopBtnClick(Self);
    3:
      PrevBtnClick(Self);
    4:
      NextBtnClick(Self);
  end;
end;

procedure TMainForm.TitleLabelMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.TopBarPnlMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.UpdateCheckerDoneStream(Sender: TObject; Stream: TStream; StreamSize: Integer; URL: string);
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
              ShellExecute(handle, 'open', 'http://www.fosshub.com/OooPlayer.html', nil, nil, SW_NORMAL);
            end;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(VersionFile);
  end;
end;

procedure TMainForm.UpdateEQ;
var
  LEQValues: TEQValues;
begin
  // fill eq values list
  LEQValues[0] := EQForm.sTrackBar1.Position / 100;
  LEQValues[1] := EQForm.sTrackBar2.Position / 100;
  LEQValues[2] := EQForm.sTrackBar3.Position / 100;
  LEQValues[3] := EQForm.sTrackBar4.Position / 100;
  LEQValues[4] := EQForm.sTrackBar5.Position / 100;
  LEQValues[5] := EQForm.sTrackBar6.Position / 100;
  LEQValues[6] := EQForm.sTrackBar7.Position / 100;
  LEQValues[7] := EQForm.sTrackBar8.Position / 100;
  LEQValues[8] := EQForm.sTrackBar9.Position / 100;
  LEQValues[9] := EQForm.sTrackBar10.Position / 100;
  LEQValues[10] := EQForm.sTrackBar11.Position / 100;
  LEQValues[11] := EQForm.sTrackBar12.Position / 100;
  LEQValues[12] := EQForm.sTrackBar13.Position / 100;
  LEQValues[13] := EQForm.sTrackBar14.Position / 100;
  LEQValues[14] := EQForm.sTrackBar15.Position / 100;
  LEQValues[15] := EQForm.sTrackBar16.Position / 100;
  LEQValues[16] := EQForm.sTrackBar17.Position / 100;
  LEQValues[17] := EQForm.sTrackBar18.Position / 100;
  // update eq
  FPlayer.ChangeEQ(LEQValues);
end;

procedure TMainForm.UpdateLyricBoxWidth;
var
  i, LIntWidth, LIntMaxWidth: Integer;
begin
  // update the lyric box width according to the content
  // with font in mind
  LIntMaxWidth := 0;
  LyricList.Canvas.Font.Assign(LyricList.Font);
  for i := 0 to LyricList.Items.Count - 1 do
  begin
    LIntWidth := LyricList.Canvas.TextWidth(LyricList.Items.Strings[i] + 'x');
    if LIntMaxWidth < LIntWidth then
      LIntMaxWidth := LIntWidth;
  end;
  SendMessage(LyricList.handle, LB_SETHORIZONTALEXTENT, LIntMaxWidth + 20, 0);
end;

procedure TMainForm.UpdateOverlayIcon(const Index: integer);
begin
  // change play status icon
  Taskbar2.OverlayIcon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\ico\' + FloatToStr(Index) + '.ico');
  Taskbar2.ApplyOverlayChanges;
end;

procedure TMainForm.UpdateThreadExecute(Sender: TObject; Params: Pointer);
begin
  // download version text from server
  with UpdateChecker do
  begin
    URL := 'http://sourceforge.net/projects/oooplayer/files/version.txt/download';
    Start;
  end;
  UpdateThread.CancelExecute;
end;

procedure TMainForm.V1Click(Sender: TObject);
begin
  if VolumeBar.Position > 0 then
  begin
    VolumeBar.Position := VolumeBar.Position - 1
  end;
end;

procedure TMainForm.V2Click(Sender: TObject);
begin
  if VolumeBar.Position < 100 then
  begin
    VolumeBar.Position := VolumeBar.Position + 1
  end;
end;

procedure TMainForm.VolumeBarChange(Sender: TObject);
begin
  if FPlaybackType = music then
  begin
    if (FPlayer.PlayerStatus = psPlaying) or (FPlayer.PlayerStatus = psPaused) then
    begin
      FPlayer.SetVolume(100 - VolumeBar.Position);
    end;
    StatusBar.Panels[1].Text := FloatToStr(100 - VolumeBar.Position) + '%'
  end
  else if FPlaybackType = radio then
  begin
    // radio
    if not IsRadioPlayerStopped then
    begin
      SetRadioVolume(VolumeBar.Position);
    end;
  end;

  StatusBar.Panels[1].Text := FloatToStr(100 - VolumeBar.Position) + '%';
  VolumeBar.Hint := FloatToStr(100 - VolumeBar.Position) + '%';
end;

procedure TMainForm.VolumeBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NewTractBarPosition: Integer;
begin
  // the new position on the trackbar
  NewTractBarPosition := Round((Y / VolumeBar.ClientHeight) * 100);
  if (NewTractBarPosition <> VolumeBar.Position) then
  begin
    VolumeBar.Position := NewTractBarPosition;
    if FPlaybackType = music then
    begin
      if (FPlayer.PlayerStatus = psPlaying) or (FPlayer.PlayerStatus = psPaused) then
      begin
        FPlayer.SetVolume(100 - VolumeBar.Position);
      end;
      StatusBar.Panels[1].Text := FloatToStr(100 - VolumeBar.Position) + '%'
    end
    else if FPlaybackType = radio then
    begin
      // radio
      if not IsRadioPlayerStopped then
      begin
        SetRadioVolume(VolumeBar.Position);
      end;
    end;

    StatusBar.Panels[1].Text := FloatToStr(100 - VolumeBar.Position) + '%'
  end;
end;

procedure TMainForm.VolumeBarMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(VolumeBar);
end;

procedure TMainForm.VolumeBarToolTip(Sender: TObject; var ToolTipText: string);
begin
  ToolTipText := FloatToStr(VolumeBar.Position)
end;

procedure TMainForm.WndProc(var Msg: TMessage);
var
  LSplitList: TStringList;
begin
  inherited;
  if Msg.Msg = WM_INFO_UPDATE then
  begin
    if (Msg.WParam = UPDATE_META) or (Msg.WParam = UPDATE_META_NAME) then
    begin
      // radio recording
      // seperate file for each song
      if FRecordingRadio then
      begin
        Log('Recording radio.');
        if RadioRecordModeList.ItemIndex = 0 then
        begin
          StopRadioRecording;
          StartRadioRecording;
        end
        else
        begin
          // single file so do nothing
        end;
      end;
    end;
    case Msg.WParam of
      RESET_UI:
        begin
          Log('Reset ui');
          TitleLabel.Caption := 'Connecting...';
          TitleLabel.Caption := '';
          FTitleLabel := TitleLabel.Caption;
          FArtistLabel := '';
          FAlbumLabel := '';
          Self.Caption := 'Radio [OooPlayer]';
          FSelfCaption := Self.Caption;
        end;
      SHOW_ERROR:
        begin
          Log('error');
          TitleLabel.Caption := 'Error';
          FTitleLabel := TitleLabel.Caption;
          FRadioLogItem := 'Unable to play radio. Error code: ' + IntToStr(Msg.LParam);
          AddToRadioLog;
          RadioConnectionBar.Visible := False;
          RadioConnectionBar.Style := pbstNormal;
        end;
      UPDATE_PROGRESS:
        begin
          Log('update progress');
          TitleLabel.Caption := Format('Buffering... %d%%', [Msg.LParam]);
          FTitleLabel := TitleLabel.Caption;
        end;
      UPDATE_META_NAME:
        begin
          Log('update meta anme');
          FTitleLabel := String(PAnsiChar(Msg.LParam));
          TitleLabel.Caption := FTitleLabel + ' - ' + FAlbumLabel + ' - ' + FArtistLabel;
          if (not FTitleLabel.StartsWith('HTTP')) and (FTitleLabel.Length > 0) then
          begin
            Self.Caption := String(PAnsiChar(Msg.LParam)) + ' [OooPlayer]';
          end
          else
          begin
            Self.Caption := 'Radio [OooPlayer]';
          end;
          FTitleLabel := TitleLabel.Caption;
          FSelfCaption := Self.Caption;
          if TitleLabel.Width < TitleLabel.Canvas.TextWidth(TitleLabel.Caption) then
          begin
            TitleLabel.Caption := TitleLabel.Caption + ' - '
          end;
        end;
      UPDATE_META_BITRATE:
        begin
          Log('update bitrate');
          FAlbumLabel := String(PAnsiChar(Msg.LParam)) + ' kbps';
          TitleLabel.Caption := String(PAnsiChar(Msg.LParam)) + ' - ' + FAlbumLabel + ' - ' + FArtistLabel;
          FTitleLabel := TitleLabel.Caption;
          if TitleLabel.Width < TitleLabel.Canvas.TextWidth(TitleLabel.Caption) then
          begin
            TitleLabel.Caption := TitleLabel.Caption + ' - '
          end;
        end;
      // 5:
      // Label5.Caption := String(PAnsiChar(msg.LParam));
      // 6:
      // Label3.Caption := String(PAnsiChar(msg.LParam));
      UPDATE_META:
        begin
          Log('update meta');
          FTitleLabel := String(PAnsiChar(Msg.LParam));
          TitleLabel.Caption := FTitleLabel + ' - ' + FAlbumLabel + ' - ' + FArtistLabel;
          if (not FTitleLabel.StartsWith('HTTP')) and (FTitleLabel.Length > 0) then
          begin
            Self.Caption := String(PAnsiChar(Msg.LParam)) + ' [OooPlayer]';
          end
          else
          begin
            Self.Caption := 'Radio [OooPlayer]';
          end;
          FTitleLabel := TitleLabel.Caption;
          // radio recording
          // seperate file for each song
          if FRecordingRadio then
          begin
            Log('Recording radio.');
            if RadioRecordModeList.ItemIndex = 0 then
            begin
              StopRadioRecording;
              StartRadioRecording;
            end
            else
            begin
              // single file so do nothing
            end;
          end;
        end;
      STATUS_UPDATE:
        begin
          Log('status update');
          if (String(PAnsiChar(Msg.LParam)) = 'ICY 200 OK') or (String(PAnsiChar(Msg.LParam)) = 'HTTP/1.0 200 OK') then
          begin
            InfoLabel.Caption := 'Playing';
          end
          else
          begin
            InfoLabel.Caption := String(PAnsiChar(Msg.LParam));
          end;
        end;
      REPAINT_RADIO_LIST:
        RadioList.Invalidate;
      STOP_IMG_ANIM:
        begin
          Log('stop anim');
          RadioConnectionBar.Visible := False;
          RadioConnectionBar.Style := pbstNormal;
        end;
      DOWNLOAD_LYRIC:
        begin
          Log('download lyric');
          // lyric
          LyricList.Items.Clear;
          LyricStatusLabel.Caption := '';
          LyricTitleEdit.Text := '';
          LyricArtistEdit.Text := '';
          LSplitList := TStringList.Create;
          Log(FTitleLabel);
          try
            // try to get tags
            // artist - title is assumed
            LSplitList.StrictDelimiter := True;
            LSplitList.Delimiter := '-';
            LSplitList.DelimitedText := FTitleLabel;
            if LSplitList.Count >= 2 then
            begin
              // sometimes there are no tags so we must check for them
              if (Length(Trim(LSplitList[1])) > 0) and (Length(Trim(LSplitList[0])) > 0) then
              begin
                LyricTitleEdit.Text := Trim(LSplitList[1]);
                LyricArtistEdit.Text := Trim(LSplitList[0]);
                FLyricAlbumStr := 'Radio';
                LyricSearchBtn.Enabled := False;
                LyricArtistEdit.Enabled := False;
                LyricTitleEdit.Enabled := False;
                LyricSourceList.Enabled := False;
                ReloadLyricTitleBtn.Enabled := False;
                FLyricDownloader.Stop;
                if FPlaylists[FSelectedPlaylistIndex].Count < 1 then
                  Exit;
                FLyricDownloader.SongTitle := Trim(LSplitList[1]);
                FLyricDownloader.Artist := Trim(LSplitList[0]);
                FLyricDownloader.Album := 'Radio';
                FLyricDownloader.ItemInfo.Title := Trim(LSplitList[1]);
                FLyricDownloader.ItemInfo.Artist := Trim(LSplitList[0]);
                FLyricDownloader.ItemInfo.Album := 'Radio';
                FLyricDownloader.Start;
              end
              else
              begin
                LyricSearchBtn.Enabled := True;
                LyricArtistEdit.Enabled := True;
                LyricTitleEdit.Enabled := True;
                LyricSourceList.Enabled := True;
                ReloadLyricTitleBtn.Enabled := True;
              end;
            end
            else
            begin
              LyricSearchBtn.Enabled := True;
              LyricArtistEdit.Enabled := True;
              LyricTitleEdit.Enabled := True;
              LyricSourceList.Enabled := True;
              ReloadLyricTitleBtn.Enabled := True;
            end;
          finally
            LSplitList.Free;
          end;
        end;
      PLAY_NEXT_SONG:
        begin
          Log('play next file');
          HandlePlaybackFromBassThread;
        end;
      // UPDATE_LEVEL:
      // begin
      // Log('left: ' + FloatToStr(FLevels.Left));
      // end;
    end;
  end
end;

procedure TMainForm.WriteTagsToRecordFile;
var
  LTag: TTag;
begin
  if FileExists(FRadioRecordingInfo.FileName) then
  begin
    LogForm.LogList.Lines.Add(FRadioRecordingInfo.FileName);
    LogForm.LogList.Lines.Add(FRadioRecordingInfo.Title);
    LogForm.LogList.Lines.Add(FRadioRecordingInfo.Artist);
    LTag.Title := FRadioRecordingInfo.Title;
    LTag.Artist := FRadioRecordingInfo.Artist;
    FTagWriter.WriteTags(FRadioRecordingInfo.FileName, @LTag, RadioRecordFormatList.ItemIndex, '');
  end;
end;

end.
