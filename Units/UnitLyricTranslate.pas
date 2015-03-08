unit UnitLyricTranslate;

interface

uses System.Classes, IdBaseComponent, IdThreadComponent, StrUtils, SysUtils, IdThread, JvComponentBase,
  JvUrlListGrabber, JvUrlGrabbers, JvTypes, Rest.Utils, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerStream, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, System.Types, dialogs, ClipBrd;

type
  TTranslatorState = (tsIdle = 0, tsWorking = 1, tsDone = 2, tsError = 3);

type
  TLyricTranslator = class
  private
    FThread: TIdThreadComponent;
    FPageDownloader: TIdHTTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    FStatus: TTranslatorState;
    FSource: TStringList;

    procedure WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure ThreadRun(Sender: TIdThreadComponent);
    procedure ThreadStopped(Sender: TIdThreadComponent);
    procedure ThreadTerminate(Sender: TIdThreadComponent);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Translate(const Source: TStrings);
  end;

implementation

const
  DETECT_LANG_URL = 'https://translate.yandex.net/api/v1.5/tr.json/detect?key=trnsl.1.1.20150304T151501Z.eeb7e79b7e605869.cab4e31878da485eb6b455138ef31a5b10f7458e&text=';
  TRANSLATE_URL = 'https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20150304T151501Z.eeb7e79b7e605869.cab4e31878da485eb6b455138ef31a5b10f7458e&lang=%s-%s&text=';

  { TLyricTranslator }

constructor TLyricTranslator.Create;
begin
  FThread := TIdThreadComponent.Create;
  FThread.Priority := tpIdle;
  FThread.StopMode := smTerminate;
  FThread.OnRun := ThreadRun;
  FThread.OnStopped := ThreadStopped;
  FThread.OnTerminate := ThreadTerminate;
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FPageDownloader := TIdHTTP.Create(nil);
  with FPageDownloader do
  begin
    OnWorkBegin := WorkBegin;
    OnWork := Work;
    IOHandler := FSSLHandler;
    Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0';
  end;

  FStatus := tsIdle;
  FSource := TStringList.Create;
end;

destructor TLyricTranslator.Destroy;
begin
  FSource.Free;
  inherited;
end;

procedure TLyricTranslator.ThreadRun(Sender: TIdThreadComponent);
const
  LANG_STR = '"lang":"';
var
  LJSON: string;
  LPos: integer;
  LLangName: string;
  LTranslatedJSON: string;
  I: Integer;
begin
  try
    LJSON := FPageDownloader.Get(DETECT_LANG_URL + FSource[0].Replace(' ', '+', [rfReplaceAll]));
    LJSON := LJSON.Trim;
    if LJSON.StartsWith('{"code":200,') then
    begin
      LPos := Pos(LANG_STR, LJSON);
      if LPos > 0 then
      begin
        LLangName := LJSON.Substring(LPos + Length(LANG_STR) - 1).Replace('"', '').Replace('}', '');
        if LLangName.Length = 2 then
        begin
          try
          for I := 0 to FSource.Count-1 do
          begin
//            FSource[i] := FSource[i] + '\n';
          end;
            LTranslatedJSON := FPageDownloader.Get(URIEncode(Format(TRANSLATE_URL + FSource.Text, [LLangName, 'tr'])));
          except
            on E: Exception do
            begin
            ShowMessage(LTranslatedJSON);
            Clipboard.AsText :=  Format(TRANSLATE_URL + FSource.Text, [LLangName, 'tr'])
            end;
          end;
        end
        else
        begin
          FStatus := tsError;
        end;
      end
      else
      begin
        FStatus := tsError;
      end;
    end
    else
    begin
      FStatus := tsError;
    end;
  except
    on E: Exception do
    begin
      FStatus := tsError;
      // todo: remove this line
      ShowMessage(E.Message);
    end;
  end;
  try
    FThread.Terminate;
  except

  end;
end;

procedure TLyricTranslator.ThreadStopped(Sender: TIdThreadComponent);
begin
  FStatus := tsDone;
end;

procedure TLyricTranslator.ThreadTerminate(Sender: TIdThreadComponent);
begin
  FStatus := tsDone;
end;

procedure TLyricTranslator.Translate(const Source: TStrings);
begin
  if Source.Count > 0 then
  begin
    FSource.Clear;
    FSource.AddStrings(Source);
    FStatus := tsWorking;
    FThread.Start;
  end
  else
  begin
    FStatus := tsError;
  end;
end;

procedure TLyricTranslator.Work(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin

end;

procedure TLyricTranslator.WorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FStatus := tsWorking;
end;

end.
