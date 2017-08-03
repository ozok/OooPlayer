unit UnitProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TProgressForm = class(TForm)
    StateLabel: TLabel;
    MsgLabel: TLabel;
    AbortBtn: TButton;
    ProgressBar1: TProgressBar;
    procedure AbortBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.dfm}

uses
  UnitMain;

procedure TProgressForm.AbortBtnClick(Sender: TObject);
begin
  if MainForm.MusicSearch.Searching then
  begin
    MainForm.MusicSearch.Abort;
  end;
  MainForm.FStopAddFiles := True;
end;

end.

