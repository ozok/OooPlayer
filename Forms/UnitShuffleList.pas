unit UnitShuffleList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TShuffleListForm = class(TForm)
    ShuffleList: TListView;
    ShuffleCountLabel: TLabel;
    procedure ShuffleListData(Sender: TObject; Item: TListItem);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ShuffleListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ShuffleListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShuffleListForm: TShuffleListForm;

implementation

{$R *.dfm}

uses
  UnitMain;

procedure TShuffleListForm.FormResize(Sender: TObject);
begin
  try
    ShuffleList.Columns[0].Width := ShuffleList.ClientWidth - ShuffleList.Columns[1].Width - 20;
  except
    on E: Exception do
    begin

    end;
  end;
end;

procedure TShuffleListForm.FormShow(Sender: TObject);
begin
  ShuffleList.Items.Count := MainForm.FShuffleIndexes.Count;
  ShuffleCountLabel.Caption := FloatToStr(ShuffleList.Items.Count) + ' songs in shuffle list';
  if MainForm.FShuffleIndex > -1 then
  begin
    ShuffleList.Items[MainForm.FShuffleIndex].MakeVisible(False);
  end;
end;

procedure TShuffleListForm.ShuffleListAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if Item.Index = MainForm.FShuffleIndex then
  begin
    Sender.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    Sender.Canvas.Font.Style := [];
  end;
end;

procedure TShuffleListForm.ShuffleListData(Sender: TObject; Item: TListItem);
var
  LSongIndex: integer;
begin
  if Item.Index < MainForm.FShuffleIndexes.Count then
  begin
    LSongIndex := MainForm.FShuffleIndexes[Item.Index];
    with MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][LSongIndex] do
    begin
      Item.Caption := Artist + ' - ' + Album + ' - ' + Title;
      Item.SubItems.Add(DurationStr)
    end;
  end;
end;

procedure TShuffleListForm.ShuffleListDblClick(Sender: TObject);
begin
  if ShuffleList.ItemIndex > -1 then
  begin
    with MainForm do
    begin
      FShuffleIndex := ShuffleList.ItemIndex;

      try
        ShuffleList.Refresh;
      except
        on E: Exception do
        begin

        end;
      end;

      PositionTimer.Enabled := False;
      ProgressTimer.Enabled := PositionTimer.Enabled;

      try
        if FShuffleIndex < FShuffleIndexes.Count then
        begin
          if FShuffleIndexes[FShuffleIndex] < FPlaylists[FSelectedPlaylistIndex].Count then
          begin
            PlayItem(FShuffleIndexes[FShuffleIndex]);
            PlayItemUIUpdate;
            ShuffleList.Items[ShuffleList.ItemIndex].Update;
          end;
        end;
      finally
        PositionTimer.Enabled := True;
        ProgressTimer.Enabled := PositionTimer.Enabled;
        ShuffleList.Update;
      end;
    end;
  end;
end;

end.

