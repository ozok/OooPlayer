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
unit UnitRadioInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, 
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI,
  sButton, sLabel, sSkinProvider;

type
  TRadioInfoForm = class(TForm)
    Label1: TsLabel;
    Label2: TsLabel;
    Label3: TsLabel;
    NameLabel: TsLabel;
    WebLabel: TsLabel;
    StreamLabel: TsLabel;
    Button1: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WebLabelClick(Sender: TObject);
    procedure StreamLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitMain;

procedure TRadioInfoForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TRadioInfoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRadioInfoForm.FormShow(Sender: TObject);
begin
  NameLabel.Caption := MainForm.FRadioStations[MainForm.RadioList.ItemIndex].Name;
  WebLabel.Caption := MainForm.FRadioStations[MainForm.RadioList.ItemIndex].Web;
  StreamLabel.Caption := MainForm.FRadioStations[MainForm.RadioList.ItemIndex].URL;
end;

procedure TRadioInfoForm.StreamLabelClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(StreamLabel.Caption), nil, nil, SW_SHOWNORMAL);
end;

procedure TRadioInfoForm.WebLabelClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(WebLabel.Caption), nil, nil, SW_SHOWNORMAL);
end;

end.