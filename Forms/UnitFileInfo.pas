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

unit UnitFileInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, 
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, 
  Vcl.ComCtrls, MediaInfoDll, sButton, sTreeView, sPageControl, sSkinProvider,
  sListView, UnitTagReader, UnitTagTypes, Generics.Collections;

type
  TInfoForm = class(TForm)
    PageControl1: TsPageControl;
    TabSheet2: TsTabSheet;
    Button1: TsButton;
    InfoList: TsTreeView;
    sSkinProvider1: TsSkinProvider;
    sTabSheet1: TsTabSheet;
    TagsList: TsListView;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TagsListResize(Sender: TObject);
  private
    { Private declarations }
    FTagReader: TTagReader;
  public
    { Public declarations }
    procedure GetFileInfo(const FileName: string);
  end;

implementation

{$R *.dfm}

uses UnitMain;

procedure TInfoForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TInfoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  InfoList.Items.Clear;
end;

procedure TInfoForm.FormCreate(Sender: TObject);
begin
  FTagReader := TTagReader.Create;
end;

procedure TInfoForm.FormDestroy(Sender: TObject);
begin
  FTagReader.Free;
end;

procedure TInfoForm.FormShow(Sender: TObject);
begin
  InfoList.Items.Clear;
  with MainForm do
  begin
    GetFileInfo(FPlaylists[FSelectedPlaylistIndex][PlayList.ItemIndex].FullFileName);
  end;
end;

procedure TInfoForm.GetFileInfo(const FileName: string);
var
  MediaInfoHandle: Cardinal;
  i: Integer;
  DotPos: Integer;
  Line: string;
  NewNode: TTreeNode;
  LTmpList: TStringList;
  LTags: TGeneralTagList;
  LItem: TListItem;
begin
  if (FileExists(FileName)) then
  begin
    LTmpList := TStringList.Create;
    try
      // New handle for mediainfo
      MediaInfoHandle := MediaInfo_New();
      if MediaInfoHandle <> 0 then
      begin
        try
          // Open a file in complete mode
          MediaInfo_Open(MediaInfoHandle, PWideChar(FileName));
          MediaInfo_Option(0, 'Complete', '');

          LTmpList.Text := string(MediaInfo_Inform(MediaInfoHandle, 0));
          if LTmpList.Count > 0 then
          begin
            for I := 0 to LTmpList.Count - 1 do
            begin
              Application.ProcessMessages;

              Line := LTmpList.Strings[i];
              DotPos := Pos(':', Line);
              if DotPos > 0 then
              begin
                InfoList.Items.AddChild(NewNode, Trim(Copy(Line, 1, DotPos - 1)) + ':' + Copy(Line, DotPos + 1, Length(Line)));
                NewNode.Expand(True);
              end
              else
              begin
                if Length(Line) > 0 then
                begin
                  NewNode := InfoList.Items.AddChild(nil, Line);
                  NewNode.Expand(True);
                end;
              end;
            end;
          end;
        finally
          MediaInfo_Close(MediaInfoHandle);
        end;

        if not FTagReader.IsBusy then
        begin
          LTags := FTagReader.ReadTags2(FileName);
          TagsList.Items.Clear;
          for I := 0 to LTags.Count-1 do
          begin
            LItem := TagsList.Items.Add;
            LItem.Caption := LTags[i].Tag;
            Litem.SubItems.Add(LTags[i].Value);
          end;
        end;
      end;
    finally
      LTmpList.Free;
    end;
  end;
end;

procedure TInfoForm.TagsListResize(Sender: TObject);begin
  TagsList.Columns[0].Width := 150;
  TagsList.Columns[1].Width := TagsList.ClientWidth - 170;
end;

end.