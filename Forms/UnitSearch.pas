{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
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

unit UnitSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Generics.Collections, StrUtils, Vcl.Menus,
  sCheckBox, sListView, sButton, sLabel, sSkinProvider;

type
  TSearchType = (stmusic = 0, stradio = 1);

type
  TSearchForm = class(TForm)
    QueryEdit: TLabeledEdit;
    SearchBtn: TsButton;
    ResultsList: TsListView;
    ResultsLbl: TsLabel;
    ListMenu: TPopupMenu;
    A1: TMenuItem;
    chkCloseOnPlayBtn: TsCheckBox;
    sSkinProvider1: TsSkinProvider;
    procedure FormResize(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ResultsListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ResultsListDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QueryEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure QueryEditMouseEnter(Sender: TObject);
  private
    { Private declarations }
    FResultsList: TList<Integer>;
  public
    { Public declarations }
    SearchType: TSearchType;
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TSearchForm.A1Click(Sender: TObject);
var
  LItem: TListItem;
  LItemIndex: integer;
begin
  if SearchType = stmusic then
  begin
    if ResultsList.ItemIndex > -1 then
    begin
      LItemIndex := FResultsList[ResultsList.ItemIndex];
      with MainForm do
      begin
        // add if not already in the queue
        if not FQueuedItems.Contains(LItemIndex) then
        begin
          // add to queue list
          FQueuedItems.Add(LItemIndex);
          PlayList.Invalidate;
          // add to queue list
          LItem := QueueList.Items.Add;
          LItem.Caption := FPlaylists[FSelectedPlaylistIndex][LItemIndex].Artist + ' - ' + FPlaylists[FSelectedPlaylistIndex][LItemIndex].Album + ' - ' + FPlaylists[FSelectedPlaylistIndex]
            [LItemIndex].Title;
          LItem.SubItems.Add(FPlaylists[FSelectedPlaylistIndex][LItemIndex].DurationStr);
        end;
      end;
    end;
  end;
end;

procedure TSearchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FResultsList.Clear;
  ResultsList.Items.Clear;
  QueryEdit.Clear;
  ResultsLbl.Caption := '';
  MainForm.Enabled := True;
end;

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  FResultsList := TList<Integer>.Create;
end;

procedure TSearchForm.FormDestroy(Sender: TObject);
begin
  FResultsList.Free;
end;

procedure TSearchForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Self.Close;
  end;
end;

procedure TSearchForm.FormResize(Sender: TObject);
begin
  ResultsList.Columns[0].Width := ResultsList.ClientWidth - ResultsList.Columns[1].Width - 20;
end;

procedure TSearchForm.FormShow(Sender: TObject);
begin
  BringToFront;
  FocusControl(QueryEdit);
  SetFocus;
end;

procedure TSearchForm.QueryEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SearchBtnClick(Self);
  end;
end;

procedure TSearchForm.QueryEditMouseEnter(Sender: TObject);
begin
  if Self.Enabled and Self.Visible then
    Self.FocusControl(QueryEdit);
end;

procedure TSearchForm.ResultsListClick(Sender: TObject);
begin
  case SearchType of
    stmusic:
      if ResultsList.ItemIndex > -1 then
      begin
        MainForm.ScrollToItem(FResultsList[ResultsList.ItemIndex]);
      end;
    stradio:
      begin
        if (ResultsList.ItemIndex < MainForm.FRadioStations.Count) and (ResultsList.ItemIndex > -1) then
        begin
          MainForm.RadioList.Items[FResultsList[ResultsList.ItemIndex]].MakeVisible(False);
          MainForm.RadioList.ItemIndex := -1;
          MainForm.RadioList.ItemIndex := FResultsList[ResultsList.ItemIndex];
        end;
      end;
  end;
end;

procedure TSearchForm.ResultsListDblClick(Sender: TObject);
var
  LItemIndex: integer;
begin
  if ResultsList.ItemIndex > -1 then
  begin
    case SearchType of
      stmusic:
        begin
          LItemIndex := FResultsList[ResultsList.ItemIndex];
          with MainForm do
          begin
            PositionTimer.Enabled := False;
            FPlayer.Stop;
            PlayItem(LItemIndex);
            if chkCloseOnPlayBtn.Checked then
            begin
              Self.Close;
            end;
          end;
        end;
      stradio:
        begin
          LItemIndex := FResultsList[ResultsList.ItemIndex];
          with MainForm do
          begin
            StopRadio;
            MainForm.FCurrentRadioIndex := LItemIndex;
            PlayRadio(FRadioStations[LItemIndex].URL);
            if chkCloseOnPlayBtn.Checked then
            begin
              Self.Close;
            end;
          end;
        end;
    end;
  end;
end;

procedure TSearchForm.SearchBtnClick(Sender: TObject);
var
  LQuery: string;
  i: integer;
  LListItem: TListItem;
begin
  if Length(QueryEdit.Text) > 0 then
  begin
    LQuery := Trim(QueryEdit.Text);
    FResultsList.Clear;
    ResultsList.Items.Clear;
    ResultsLbl.Caption := '';
    ResultsList.Items.BeginUpdate;
    try
      case SearchType of
        stmusic:
          begin
            for I := 0 to MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex].Count - 1 do
            begin
              Application.ProcessMessages;
              if ContainsText(MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Title, LQuery) or ContainsText(MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Artist, LQuery) or
                ContainsText(MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Album, LQuery) or ContainsText(MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].FullFileName, LQuery) then
              begin
                FResultsList.Add(i);

                LListItem := ResultsList.Items.Add;
                LListItem.Caption := MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Artist + ' - ' + MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Album + ' - ' +
                  MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].Title;
                LListItem.SubItems.Add(MainForm.FPlaylists[MainForm.FSelectedPlaylistIndex][i].DurationStr);
              end;
            end;
          end;
        stradio:
          begin
            for I := 0 to MainForm.FRadioStations.Count - 1 do
            begin
              Application.ProcessMessages;
              if ContainsText(MainForm.FRadioStations[i].Name, LQuery) or ContainsText(MainForm.FRadioStations[i].URL, LQuery) then
              begin
                FResultsList.Add(i);

                LListItem := ResultsList.Items.Add;
                LListItem.Caption := MainForm.FRadioStations[i].Name + ' - ' + MainForm.FRadioStations[i].URL;
                LListItem.SubItems.Add('00:00:00.000');
              end;
            end;
          end;
      end;
    finally
      ResultsList.Items.EndUpdate;
      ResultsLbl.Caption := '  Found: ' + FloatToStr(FResultsList.Count);
    end;
  end;
end;

end.
