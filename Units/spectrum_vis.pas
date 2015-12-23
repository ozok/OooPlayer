unit spectrum_vis;
{ Spectrum Visualyzation by Alessandro Cappellozza
  version 0.8 05/2002
  http://digilander.iol.it/Kappe/audioobject
}

interface

uses
  Windows, Dialogs, Graphics, SysUtils, CommonTypes, Classes;

type
  TSpectrum = class(TObject)
  private
    FVisBuffer: TBitmap;
    FBackgroundBitmap: TBitmap;
    FBackgroundColor: TColor;
    SpecHeight: Integer;
    PenColor: TColor;
    PeakColor: TColor;
    DrawType: Integer;
    DrawRes: Integer;
    FrmClear: Boolean;
    UseBkg: Boolean;
    PeakFall: Integer;
    LineFall: Integer;
    ColWidth: Integer;
    ShowPeak: Boolean;
    FFTPeacks: array[0..128] of Integer;
    FFTFallOff: array[0..128] of Integer;
  public
    constructor Create(Width, Height: Integer);
    procedure Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer);
    procedure SetBackGround(Active: Boolean; BkgCanvas: TGraphic);
    property BackColor: TColor read FBackgroundColor write FBackgroundColor;
    property Height: Integer read SpecHeight write SpecHeight;
    property Width: Integer read ColWidth write ColWidth;
    property Pen: TColor read PenColor write PenColor;
    property Peak: TColor read PeakColor write PeakColor;
    property Mode: Integer read DrawType write DrawType;
    property Res: Integer read DrawRes write DrawRes;
    property FrameClear: Boolean read FrmClear write FrmClear;
    property PeakFallOff: Integer read PeakFall write PeakFall;
    property LineFallOff: Integer read LineFall write LineFall;
    property DrawPeak: Boolean read ShowPeak write ShowPeak;
  end;

var
  Spectrum: TSpectrum;

implementation

constructor TSpectrum.Create(Width, Height: Integer);
begin
  FVisBuffer := TBitmap.Create;
  FBackgroundBitmap := TBitmap.Create;

  FVisBuffer.Width := Width;
  FVisBuffer.Height := Height;
  FBackgroundBitmap.Width := Width;
  FBackgroundBitmap.Height := Height;

  FBackgroundColor := clBtnFace;
  SpecHeight := 100;
  PenColor := clWhite;
  PeakColor := clYellow;
  DrawType := 0;
  DrawRes := 1;
  FrmClear := True;
  UseBkg := False;
  PeakFall := 1;
  LineFall := 3;
  ColWidth := 5;
  ShowPeak := True;
end;

procedure TSpectrum.SetBackGround(Active: Boolean; BkgCanvas: TGraphic);
begin
  UseBkg := Active;
  FBackgroundBitmap.Canvas.Draw(0, 0, BkgCanvas);
end;

procedure TSpectrum.Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer);
var
  i, YPos: LongInt;
  YVal: Single;
begin

  if FrmClear then
  begin
    FVisBuffer.Canvas.Pen.Color := FBackgroundColor;
    FVisBuffer.Canvas.Brush.Color := FBackgroundColor;
    FVisBuffer.Canvas.Rectangle(0, 0, FVisBuffer.Width, FVisBuffer.Height);
    if UseBkg then
      FVisBuffer.Canvas.CopyRect(Rect(0, 0, FBackgroundBitmap.Width, FBackgroundBitmap.Height), FBackgroundBitmap.Canvas, Rect(0, 0, FBackgroundBitmap.Width, FBackgroundBitmap.Height));
  end;

  FVisBuffer.Canvas.Pen.Color := PenColor;
  for i := 0 to 128 do
  begin
    YVal := Abs(FFTData[(i * DrawRes) + 5]);
    if i < 20 then
    begin
    YPos := Trunc((YVal) * 450);
    end
    else
    begin
    YPos := Trunc((YVal) * 550);
    end;
    if YPos > Height then
      YPos := SpecHeight;

    if YPos >= FFTPeacks[i] then
      FFTPeacks[i] := YPos
    else
      FFTPeacks[i] := FFTPeacks[i] - PeakFall;

    if YPos >= FFTFallOff[i] then
      FFTFallOff[i] := YPos
    else
      FFTFallOff[i] := FFTFallOff[i] - LineFall;

    if (FVisBuffer.Height - FFTPeacks[i]) > FVisBuffer.Height then
      FFTPeacks[i] := 0;
    if (FVisBuffer.Height - FFTFallOff[i]) > FVisBuffer.Height then
      FFTFallOff[i] := 0;

    case DrawType of
      0:
        begin
          FVisBuffer.Canvas.MoveTo(X + i, Y + FVisBuffer.Height);
          FVisBuffer.Canvas.LineTo(X + i, Y + FVisBuffer.Height - FFTFallOff[i]);
          if ShowPeak then
            FVisBuffer.Canvas.Pixels[X + i, Y + FVisBuffer.Height - FFTPeacks[i]] := Pen;
        end;

      1:
        begin
          if ShowPeak then
            FVisBuffer.Canvas.Pen.Color := PeakColor;
          if ShowPeak then
            FVisBuffer.Canvas.MoveTo(X + i * (ColWidth + 1), Y + FVisBuffer.Height - FFTPeacks[i]);
          if ShowPeak then
            FVisBuffer.Canvas.LineTo(X + i * (ColWidth + 1) + ColWidth, Y + FVisBuffer.Height - FFTPeacks[i]);

          FVisBuffer.Canvas.Pen.Color := PenColor;
          FVisBuffer.Canvas.Brush.Color := PenColor;
          FVisBuffer.Canvas.Rectangle(X + i * (ColWidth + 1), Y + FVisBuffer.Height - FFTFallOff[i], X + i * (ColWidth + 1) + ColWidth, Y + FVisBuffer.Height);
        end;
    end;
  end;

  BitBlt(HWND, 0, 0, FVisBuffer.Width, FVisBuffer.Height, FVisBuffer.Canvas.Handle, 0, 0, srccopy)
end;

end.

