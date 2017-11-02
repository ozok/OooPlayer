unit spectrum_vis;
{
  Spectrum Visualyzation by Alessandro Cappellozza
  version 0.8 05/2002
  http://digilander.iol.it/Kappe/audioobject

  Revision by Okan Özcan
  +23.11.2010 01:40 : Added Destructor in order to prevent memory leaks.
  : Added VisilBitmap and BackgroundImage for resize operations
  +28.04.2011 03:12 : with...do stuff
}

interface

uses
  Windows, Dialogs, Graphics, SysUtils, CommonTypes, Classes, VisTypes;

type
  TSpectrum = class(TObject)
  private
    VisBuff: TBitmap;
    BackBmp: TBitmap;
    BkgColor: TColor;
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
    destructor Destroy(); override;
    procedure Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer);
    procedure SetBackGround(Active: Boolean; BkgCanvas: TGraphic);
    property BackColor: TColor read BkgColor write BkgColor;
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
    /// /////////////////////////////////////////////////////////
    property BackgroundImage: TBitmap read BackBmp write BackBmp;
    property VisilBitmap: TBitmap read VisBuff write VisBuff;
  end;

var
  Spectrum: TSpectrum;

implementation

constructor TSpectrum.Create(Width, Height: Integer);
begin
  VisBuff := TBitmap.Create;
  BackBmp := TBitmap.Create;

  VisBuff.Width := Width;
  VisBuff.Height := Height;
  BackBmp.Width := Width;
  BackBmp.Height := Height;

  BkgColor := clBlack;
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
  BackBmp.Canvas.Draw(0, 0, BkgCanvas);
end;

// Okan Özcan
// I added this code in order
// to prevent memory leaks
destructor TSpectrum.Destroy;
begin

  FreeAndNil(VisBuff);
  FreeAndNil(BackBmp);

end;

procedure TSpectrum.Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer);
var
  i, YPos: LongInt;
  YVal: Single;
  LColWidth: Integer;
begin

  if FrmClear then
  begin

    // clear previous?
    with VisBuff.Canvas do
    begin
      Pen.Color := BkgColor;
      Brush.Color := BkgColor;
      Rectangle(0, 0, VisBuff.Width, VisBuff.Height);

      // draw background?
      if UseBkg then
      begin
        CopyRect(Rect(0, 0, BackBmp.Width, BackBmp.Height), BackBmp.Canvas, Rect(0, 0, BackBmp.Width, BackBmp.Height));
      end;

    end;

  end;

  VisBuff.Canvas.Pen.Color := PenColor;
  // for i := 0 to 128 do
  for i := 0 to 64 do
  begin
    YVal := Abs(FFTData[(i * DrawRes) + 5]);
    YPos := Trunc((YVal) * 500);

    if YPos > Height then
    begin
      YPos := SpecHeight;
    end;

    if YPos >= FFTPeacks[i] then
    begin
      FFTPeacks[i] := YPos
    end
    else
    begin
      FFTPeacks[i] := FFTPeacks[i] - PeakFall;
    end;

    if YPos >= FFTFallOff[i] then
    begin
      FFTFallOff[i] := YPos
    end
    else
    begin
      FFTFallOff[i] := FFTFallOff[i] - LineFall;
    end;

    if (VisBuff.Height - FFTPeacks[i]) > VisBuff.Height then
    begin
      FFTPeacks[i] := 0;
    end;

    if (VisBuff.Height - FFTFallOff[i]) > VisBuff.Height then
    begin
      FFTFallOff[i] := 0;
    end;

    case DrawType of
      0:
        begin

          with VisBuff.Canvas do
          begin
            MoveTo(X + i, Y + VisBuff.Height);
            LineTo(X + i, Y + VisBuff.Height - FFTFallOff[i]);
          end;

          if ShowPeak then
          begin
            VisBuff.Canvas.Pixels[X + i, Y + VisBuff.Height - FFTPeacks[i]] := Pen;
          end;

        end;

      1:
        begin
          LColWidth := i * (ColWidth + 1);

          with VisBuff.Canvas do
          begin

            if ShowPeak then
            begin
              Pen.Color := PeakColor;
            end;

            if ShowPeak then
            begin
              MoveTo(X + LColWidth, Y + VisBuff.Height - FFTPeacks[i]);
            end;

            if ShowPeak then
            begin
              LineTo(X + LColWidth + ColWidth, Y + VisBuff.Height - FFTPeacks[i]);
            end;

            Pen.Color := PenColor;
            Brush.Color := PenColor;
            Rectangle(X + LColWidth, Y + VisBuff.Height - FFTFallOff[i], X + LColWidth + ColWidth, Y + VisBuff.Height);
          end;

        end;
    end;

  end;

  BitBlt(HWND, 0, 0, VisBuff.Width, VisBuff.Height, VisBuff.Canvas.Handle, 0, 0, srccopy);
end;

end.

