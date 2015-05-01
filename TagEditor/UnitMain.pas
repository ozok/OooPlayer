unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sTreeView, Vcl.StdCtrls,
  sButton, Vcl.ExtCtrls, sPanel, sScrollBox, sPageControl, sSkinProvider,
  sSkinManager, UnitTagReader, Generics.Collections, sEdit, UnitTagTypes, MediaInfoDll,
  Pipes, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, sListView, sConst,
  Vcl.ImgList, acAlphaImageList, JvComponentBase, JvDragDrop, sComboBox,
  Vcl.Buttons, sBitBtn, sStatusBar, Vcl.Menus;

type
  TFileItem = class
    FullPath, TagType, Title, Artist, Album, AlbumArtist, Genre, Comment, Track, Composer, Year: string;
  end;

  TFileItems = TList<TFileItem>;

type
  TTagItem = class(TCustomControl)
    Panel: TsPanel;
    TagEdit: TsEdit;
    constructor Create(const ParentControl: TsScrollBox; const _Index: integer; const PreviousBottom: Integer);
    Destructor Destroy; override;
  end;

  TTagItems = TList<TTagItem>;

type
  TMainForm = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    PageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sPanel1: TsPanel;
    ApplyBtn: TsButton;
    ReloadBtn: TsButton;
    PipeClient1: TPipeClient;
    FileList: TsListView;
    sAlphaImageList1: TsAlphaImageList;
    TitleEdit: TsEdit;
    ArtistEdit: TsEdit;
    AlbumArtistEdit: TsEdit;
    AlbumEdit: TsEdit;
    DateEdit: TsEdit;
    TrackEdit: TsEdit;
    ComposerEdit: TsEdit;
    CommentEdit: TsEdit;
    GenreList: TsComboBox;
    JvDragDrop1: TJvDragDrop;
    sStatusBar1: TsStatusBar;
    TopPanel: TsPanel;
    AddFileBtn: TsBitBtn;
    RemoveSelectedBtn: TsBitBtn;
    RemoveAllBtn: TsBitBtn;
    AboutBtn: TsBitBtn;
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    T1: TMenuItem;
    A1: TMenuItem;
    R1: TMenuItem;
    R2: TMenuItem;
    S1: TMenuItem;
    R3: TMenuItem;
    A2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure PipeClient1PipeMessage(Sender: TObject; Pipe: HPIPE; Stream: TStream);
    procedure FileListData(Sender: TObject; Item: TListItem);
    procedure FileListClick(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure TitleEditChange(Sender: TObject);
  private
    { Private declarations }
    FTagReader: TTagReader;
    FEditedListItem: TListItem;
    FTagItems: TTagItems;
    FTags: TGeneralTagList;
    FDisplayTags: TGeneralTagList;
    FAppData: string;
    FId3v2TagFieldNames: TDictionary<string, string>;
    FMp4TagFieldNames: TDictionary<string, string>;
    FSettingsFile: TStringList;
    FFileItems: TFileItems;

    procedure EditChange(Sender: TObject);
    procedure LoadTagFielNames;
    procedure GetFileInfoForDisplay(const FileName: string);
  public
    { Public declarations }
    procedure GetFileInfo(const FileIndex: integer);
    // protected
    // procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ApplyBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to FTags.Count - 1 do
  begin
    if FTags[i].Edited then
    begin
      ShowMessage(FTags[i].Tag + '/' + FTags[i].Value);
      Break;
    end;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

// procedure TMainForm.CreateParams(var Params: TCreateParams);
// begin
// inherited;
//
// Params.ExStyle := Params.ExStyle and not WS_EX_APPWINDOW;
// Params.WndParent := Application.Handle;
// end;

procedure TMainForm.EditChange(Sender: TObject);
begin
  ApplyBtn.Enabled := True;
  FTags[TsEdit(Sender).Tag].Edited := True;
end;

procedure TMainForm.FileListClick(Sender: TObject);
begin
  if FileList.ItemIndex > -1 then
  begin
    GetFileInfo(FileList.ItemIndex);
  end;
end;

procedure TMainForm.FileListData(Sender: TObject; Item: TListItem);
begin
  if Item.Index < FFileItems.Count then
  begin
    Item.Caption := ExtractFileName(FFileItems[Item.Index].FullPath);
    Item.SubItems.Add(FFileItems[Item.Index].TagType);
    Item.SubItems.Add(FFileItems[Item.Index].Title);
    Item.SubItems.Add(FFileItems[Item.Index].Artist);
    Item.SubItems.Add(FFileItems[Item.Index].AlbumArtist);
    Item.SubItems.Add(FFileItems[Item.Index].Album);
    Item.SubItems.Add(FFileItems[Item.Index].Genre);
    Item.SubItems.Add(FFileItems[Item.Index].Track);
    Item.SubItems.Add(FFileItems[Item.Index].Comment);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not PipeClient1.Connect(2000, True) then
  begin
    ShowMessage('not ocnn');
  end;
  FTagReader := TTagReader.Create;
  FTagItems := TTagItems.Create;
  FTags := TGeneralTagList.Create;
  FDisplayTags := TGeneralTagList.Create;
  FId3v2TagFieldNames := TDictionary<string, string>.Create();
  FMp4TagFieldNames := TDictionary<string, string>.Create();
  LoadTagFielNames;
  sSkinManager1.SkinDirectory := ExtractFileDir(Application.ExeName) + '\skins\';
  FSettingsFile := TStringList.Create;
  if not MediaInfoDLL_Load(ExtractFileDir(Application.ExeName) + '\mediainfo.dll') then
  begin
    Application.MessageBox('Couldn''t load mediainfo.dll library.', 'Fatal Error', MB_ICONERROR);
    Application.Terminate;
  end;
  FFileItems := TFileItems.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  FTagReader.Free;
  for I := 0 to FTagItems.Count - 1 do
  begin
    if Assigned(FTagItems[i]) then
    begin
      FTagItems[i].Free;
    end;
  end;
  FTagItems.Free;
  for I := 0 to FTags.Count - 1 do
  begin
    FTags[i].Free;
  end;
  FTags.Free;
  for I := 0 to FDisplayTags.Count - 1 do
  begin
    FDisplayTags[i].Free;
  end;
  FDisplayTags.Free;
  for I := 0 to FFileItems.Count - 1 do
  begin
    FFileItems[i].Free;
  end;
  FFileItems.Free;

  FId3v2TagFieldNames.Free;
  FMp4TagFieldNames.Free;
  FSettingsFile.Free;
end;

procedure TMainForm.GetFileInfo(const FileIndex: integer);
begin
  TitleEdit.Text := '';
  ArtistEdit.Text := '';
  AlbumArtistEdit.Text := '';
  AlbumEdit.Text := '';
  TrackEdit.Text := '';
  DateEdit.Text := '';
  GenreList.Text := '';
  ComposerEdit.Text := '';
  CommentEdit.Text := '';
  with FFileItems[FileIndex] do
  begin
    TitleEdit.Text := Title;
    ArtistEdit.Text := Artist;
    AlbumArtistEdit.Text := AlbumArtist;
    AlbumEdit.Text := Album;
    TrackEdit.Text := Track;
    DateEdit.Text := '';
    GenreList.Text := Genre;
    ComposerEdit.Text := Composer;
    CommentEdit.Text := Comment;
  end;
  ApplyBtn.Enabled := False;
end;

procedure TMainForm.GetFileInfoForDisplay(const FileName: string);
var
  i: Integer;
  LFileItem: TFileItem;
  LTagDisplayName: string;
  LTags: TPlayItem;
begin
  if (FileExists(FileName)) then
  begin
    if not FTagReader.IsBusy then
    begin
      LTags := TPlayItem.Create;
      try
        LTags := FTagReader.ReadTagsForTagEditorList(FileName);
        LFileItem := TFileItem.Create;

        LFileItem.FullPath := FileName;
        LFileItem.Title := LTags.Title;
        LFileItem.Artist := LTags.Artist;
        LFileItem.Album := LTags.Album;
        LFileItem.AlbumArtist := LTags.AlbumArtist;
        LFileItem.Genre := LTags.Genre;
        LFileItem.Comment := LTags.Comment;
        LFileItem.Track := LTags.Track;
        LFileItem.Composer := LTags.Composer;
        LFileItem.Year := LTags.Date;

        FFileItems.Add(LFileItem);
      finally
        LTags.Free;
      end;
    end;
  end;
end;

procedure TMainForm.JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
var
  I: Integer;
begin
  for I := 0 to Value.Count - 1 do
  begin
    GetFileInfoForDisplay(Value[i]);
  end;
  FileList.Items.Count := FFileItems.Count;
  GetFileInfo(0);
end;

procedure TMainForm.LoadTagFielNames;
var
  LFile: TStringList;
  LLine: string;
  I: Integer;
  LPos: integer;
begin
  LFile := TStringList.Create;
  try
    // id3v1
    LFile.LoadFromFile(ExtractFileDir(Application.ExeName) + '\tagfields\id3v2.txt');
    if LFile.Count > 0 then
    begin
      for I := 0 to LFile.Count - 1 do
      begin
        LLine := LFile[i].Trim;
        LPos := Pos(';', LLine);
        FId3v2TagFieldNames.Add(LLine.Substring(0, LPos - 1), LLine.Substring(LPos));
      end;
    end;
    // mp4
    LFile.LoadFromFile(ExtractFileDir(Application.ExeName) + '\tagfields\mp4.txt', TEncoding.UTF8);
    if LFile.Count > 0 then
    begin
      for I := 0 to LFile.Count - 1 do
      begin
        LLine := LFile[i].Trim;
        LPos := Pos(';', LLine);
        FMp4TagFieldNames.Add(LLine.Substring(0, LPos - 1), LLine.Substring(LPos));
      end;
    end;
  finally
    LFile.Free;
  end;
end;

procedure TMainForm.PipeClient1PipeMessage(Sender: TObject; Pipe: HPIPE; Stream: TStream);
var
  Msg: String;
  LSkinName: string;
  LSettingsFile: TStringList;
  I: Integer;
begin
  SetLength(Msg, Stream.Size div SizeOf(WideChar));
  Stream.Position := 0;
  Stream.Read(Msg[1], Stream.Size);
  if Msg.StartsWith('File') then
  begin
    LSettingsFile := TStringList.Create;
    try
      LSettingsFile.LoadFromFile(Msg.Replace('File:', '', []), TEncoding.UTF8);
      for I := 0 to LSettingsFile.Count - 1 do
      begin
        GetFileInfoForDisplay(LSettingsFile[i]);
      end;
      FileList.Items.Count := FFileItems.Count;
      GetFileInfo(0);
    finally
      LSettingsFile.Free;
    end;
  end
  else if Msg.StartsWith('Skin') then
  begin
    LSkinName := Msg.Replace('Skin:', '', []);
    if LSkinName = 'none' then
    begin
      sSkinManager1.Active := False;
    end
    else
    begin
      sSkinManager1.Active := True;
      sSkinManager1.SkinName := LSkinName;
    end;
  end
  else if Msg.StartsWith('Hue') then
  begin
    sSkinManager1.HueOffset := Msg.Replace('Hue:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Brig') then
  begin
    sSkinManager1.Brightness := Msg.Replace('Brig:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Sat') then
  begin
    sSkinManager1.Saturation := Msg.Replace('Sat:', '', []).ToInteger;
  end
  else if Msg.StartsWith('Active') then
  begin
    Self.BringToFront;
  end
end;

procedure TMainForm.TitleEditChange(Sender: TObject);
begin
  ApplyBtn.Enabled := True;
end;

{ TTagItem }

constructor TTagItem.Create(const ParentControl: TsScrollBox; const _Index, PreviousBottom: Integer);
begin
  Panel := TsPanel.Create(nil);
  TagEdit := TsEdit.Create(nil);
  TagEdit.Tag := _Index;
  Panel.InsertControl(TagEdit);
  Panel.Align := alTop;
  Panel.Height := 45;
  Panel.Top := PreviousBottom;
  TagEdit.Anchors := [akLeft, akTop, akRight];
  TagEdit.BoundLabel.Active := True;
  TagEdit.BoundLabel.Layout := sclTopLeft;
  TagEdit.Top := 16;
  TagEdit.Left := 10;
  TagEdit.Width := Panel.Width - 40;
  Panel.BevelOuter := bvNone;
  Panel.BorderStyle := bsNone;
  // Panel.SkinData.SkinSection := 'PANEL_LOW';
end;

destructor TTagItem.Destroy;
begin

  inherited;
end;

end.
