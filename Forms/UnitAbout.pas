unit UnitAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellAPI;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TAboutForm.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TAboutForm.Button2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://sourceforge.net/projects/oooplayer/', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TAboutForm.Label3Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://sbstnblnd.deviantart.com/art/Plateau-0-2-391110900', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.Label4Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://un4seen.com/', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.Label5Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://3delite.hu/', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.Label6Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://mediaarea.net/en/MediaInfo', nil, nil, SW_NORMAL);
end;

end.
