unit UnitRadioInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI;

type
  TRadioInfoForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NameLabel: TLabel;
    WebLabel: TLabel;
    StreamLabel: TLabel;
    Button1: TButton;
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
