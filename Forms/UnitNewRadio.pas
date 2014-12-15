unit UnitNewRadio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  sButton, sSkinProvider;

type
  TNewRadioForm = class(TForm)
    NameEdit: TLabeledEdit;
    WebEdit: TLabeledEdit;
    StreamEdit: TLabeledEdit;
    Button1: TsButton;
    Button2: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RadioCategory: string;
    Portable: Boolean;
  end;

var
  NewRadioForm: TNewRadioForm;

implementation

{$R *.dfm}

uses UnitMain;

procedure TNewRadioForm.Button1Click(Sender: TObject);
var
  LStreamWriter: TStreamWriter;
begin
  if Length(NameEdit.Text) > 0 then
  begin
    if Length(StreamEdit.Text) > 0 then
    begin
      if Length(WebEdit.Text) > 0 then
      begin
        if not Portable then
        begin
          LStreamWriter := TStreamWriter.Create(MainForm.FAppDataFolder + '\' + RadioCategory + '.txt', True);
        end
        else
        begin
          LStreamWriter := TStreamWriter.Create(ExtractFileDir(Application.ExeName) + '\Radios\' + RadioCategory + '.txt', True);
        end;
        try
          LStreamWriter.WriteLine(NameEdit.Text + ';' + WebEdit.Text + ';' + StreamEdit.Text);
        finally
          LStreamWriter.Close;
          LStreamWriter.Free;
        end;
        Self.Close;
        MainForm.ReloadRadioCategory;
        if MainForm.FCurrentRadioIndex > -1 then
        begin
          if MainForm.RadioList.Items.Count > MainForm.FCurrentRadioIndex then
          begin
            MainForm.RadioList.Items[MainForm.FCurrentRadioIndex].MakeVisible(False);
          end;
        end;
        MainForm.RadioList.Invalidate;
      end
      else
      begin
        Application.MessageBox('Please enter web page.', 'Error', MB_ICONERROR);
      end;
    end
    else
    begin
      Application.MessageBox('Please enter stream link.', 'Error', MB_ICONERROR);
    end;
  end
  else
  begin
    Application.MessageBox('Please enter radio name.', 'Error', MB_ICONERROR);
  end;
end;

procedure TNewRadioForm.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TNewRadioForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  MainForm.BringToFront;
end;

procedure TNewRadioForm.FormShow(Sender: TObject);
begin
  // reset
  NameEdit.Clear;
  WebEdit.Clear;
  StreamEdit.Clear;
end;

end.
