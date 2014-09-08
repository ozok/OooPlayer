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
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Generics.Collections, StrUtils;

type
  TSearchForm = class(TForm)
    QueryEdit: TLabeledEdit;
    SearchBtn: TButton;
    ResultsList: TListView;
    ResultsLbl: TLabel;
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
  private
    { Private declarations }
    FResultsList: TList<Integer>;
  public
    { Public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.dfm}

uses UnitMain;

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

procedure TSearchForm.ResultsListClick(Sender: TObject);
begin
  if ResultsList.ItemIndex > -1 then
  begin
    MainForm.ScrollToItem(FResultsList[ResultsList.ItemIndex]);
  end;
end;

procedure TSearchForm.ResultsListDblClick(Sender: TObject);
var
  LItemIndex: integer;
begin
  if ResultsList.ItemIndex > -1 then
  begin
    LItemIndex := FResultsList[ResultsList.ItemIndex];
    with MainForm do
    begin
      PositionTimer.Enabled := False;
      if (FCurrentItemInfo.ItemIndex > -1) and (FCurrentItemInfo.ItemIndex < FPlayListItems.Count) then
      begin
        PlayList.Items[FCurrentItemInfo.ItemIndex].StateIndex := -1;
      end;
      FPlayer.Stop;
      PlayItem(LItemIndex);
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
      for I := 0 to MainForm.FPlayListItems.Count - 1 do
      begin
        Application.ProcessMessages;
        if ContainsText(MainForm.FPlayListItems[i].Title, LQuery) or ContainsText(MainForm.FPlayListItems[i].Artist, LQuery) or ContainsText(MainForm.FPlayListItems[i].Album, LQuery) or
          ContainsText(MainForm.FPlayListItems[i].FullFileName, LQuery) then
        begin
          FResultsList.Add(i);

          LListItem := ResultsList.Items.Add;
          LListItem.Caption := MainForm.FPlayListItems[i].Artist + ' - ' + MainForm.FPlayListItems[i].Album + ' - ' + MainForm.FPlayListItems[i].Title;
          LListItem.SubItems.Add(MainForm.FPlayListItems[i].DurationStr);
        end;
      end;
    finally
      ResultsList.Items.EndUpdate;
      ResultsLbl.Caption := '  Found: ' + FloatToStr(FResultsList.Count);
    end;
  end;
end;

end.

