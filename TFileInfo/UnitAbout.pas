unit UnitAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winapi.ShellAPI;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  Close;
end;

procedure TAboutForm.Button2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZFWGU898KGWE4', nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutForm.Button4Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.ozok26.com/tflenfo-12', nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

end.

