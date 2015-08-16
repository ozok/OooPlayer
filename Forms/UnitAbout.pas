unit UnitAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, ShellAPI, sButton, sLabel, sSkinProvider;

type
  TAboutForm = class(TForm)
    Label1: TsLabel;
    Image1: TImage;
    Label2: TsLabel;
    Label3: TsLabel;
    Button1: TsButton;
    Button2: TsButton;
    Label4: TsLabel;
    Label5: TsLabel;
    Label6: TsLabel;
    sSkinProvider1: TsSkinProvider;
    sLabelFX1: TsLabelFX;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
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
  ShellExecute(Handle, 'open', 'http://www.oooplayer.sourceforge.net/', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  Self.Color := MainForm.Color;
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

procedure TAboutForm.sLabel1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/pylast/pylast', nil, nil, SW_NORMAL);
end;

procedure TAboutForm.sLabel2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.alphaskins.com/index.php', nil, nil, SW_NORMAL);
end;

end.
