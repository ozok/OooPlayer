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
unit UnitImageResize;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, Jpeg, Graphics, madGraphics, PNGImage;

type
  TImageResizer = class(TObject)
  private
    FSourcePath: string;
    FDestPath: string;
  public
    constructor Create;
    destructor Destroy; override;

    function ResizeJpgEx(const inFile, outFile: string): Boolean;
    function ResizeJpgStream(const inFile: TStream; const TmpFile: string): Boolean;
    function ResizePNGEx(const inFile, outFile: string): Boolean;
    function ResizePngStream(const inFile: TStream; const TmpFile: string): Boolean;
    procedure Resize;
  end;

const
  IMG_SIZE = 300;

implementation

{ TImageResizer }

constructor TImageResizer.Create;
begin

end;

destructor TImageResizer.Destroy;
begin
  inherited;
end;

procedure TImageResizer.Resize;
var
  LExt: string;
begin
  if FileExists(FSourcePath) then
  begin
    // external cover art
    LExt := LowerCase(ExtractFileExt(FSourcePath));
    if (LExt = '.jpeg') or (LExt = '.jpg') then
    begin
      ResizeJpgEx(FSourcePath, FDestPath)
    end;
  end;
end;

function TImageResizer.ResizeJpgEx(const inFile, outFile: string): Boolean;
var
  LJpeg: TJPEGImage;
  LBMP: TBitmap;
  LJpegBMP: TBitmap;
  LOutJpeg: TJPEGImage;
begin
  Result := FileExists(inFile);

  LJpeg := TJPEGImage.Create;
  LBMP := TBitmap.Create;
  LJpegBMP := TBitmap.Create;
  try
    // try to load jpg from file
    try
      LJpeg.LoadFromFile(inFile);
    except
      Result := False;
      Exit;
    end;
    // output bitmap
    LBMP.PixelFormat := pf24bit;
    LBMP.Width := IMG_SIZE;
    LBMP.Height := Round(IMG_SIZE * (LJpeg.Height / LJpeg.Width));
    // bitmap to hold data from jpeg
    LJpegBMP.PixelFormat := pf24bit;
    LJpegBMP.Width := LJpeg.Width;
    LJpegBMP.Height :=LJpeg.Height;
    LJpegBMP.Assign(LJpeg);

    try
      StretchBitmap(LJpegBMP, LBMP, nil, nil, sqVeryHigh);
    except
      Result := False;
      Exit;
    end;

    LOutJpeg := TJPEGImage.Create;
    try
      LOutJpeg.Assign(LBMP);
      try
        LOutJpeg.SaveToFile(outFile);
      except
        Result := False;
        Exit;
      end;
    finally
      LOutJpeg.Free;
    end;
  finally
    LJpeg.Free;
    LBMP.Free;
    LJpegBMP.Free;
  end;
end;

function TImageResizer.ResizeJpgStream(const inFile: TStream; const TmpFile: string): Boolean;
var
  LJpeg: TJPEGImage;
  LBMP: TBitmap;
  LJpegBMP: TBitmap;
  LOutJpeg: TJPEGImage;
begin
  LJpeg := TJPEGImage.Create;
  LBMP := TBitmap.Create;
  LJpegBMP := TBitmap.Create;
  Result := inFile.Size <> 0;
  try
    // try to load jpg
    try
      LJpeg.LoadFromStream(inFile);
    except
      Exit;
    end;
    // output bitmap
    LBMP.PixelFormat := pf24bit;
    LBMP.Width := IMG_SIZE;
    LBMP.Height := Round(IMG_SIZE * (LJpeg.Height / LJpeg.Width));
    // bitmap to hold data from jpeg
    LJpegBMP.PixelFormat := pf24bit;
    LJpegBMP.Width := LJpeg.Width;
    LJpegBMP.Height :=LJpeg.Height;
    LJpegBMP.Assign(LJpeg);

    try
      StretchBitmap(LJpegBMP, LBMP, nil, nil, sqVeryHigh);
    except
      Exit;
    end;

    LOutJpeg := TJPEGImage.Create;
    try
      LOutJpeg.Assign(LBMP);
      LOutJpeg.JPEGNeeded;
      LOutJpeg.CompressionQuality := 75;
      LOutJpeg.Compress;
      try
        LOutJpeg.SaveToFile(TmpFile);
      except
        Exit;
      end;
    finally
      LOutJpeg.Free;
    end;
  finally
    LJpeg.Free;
    LBMP.Free;
    LJpegBMP.Free;
  end;
end;

function TImageResizer.ResizePNGEx(const inFile, outFile: string): Boolean;
var
  LPng: TPngImage;
  LBMP: TBitmap;
  LPngBMP: TBitmap;
  LOutPng: TPngImage;
begin
  Result := FileExists(inFile);

  LPng := TPngImage.Create;
  LBMP := TBitmap.Create;
  LPngBMP := TBitmap.Create;
  try
    // try to load png from file
    try
      LPng.LoadFromFile(inFile);
    except
      Result := False;
      Exit;
    end;
    // output bitmap
    LBMP.PixelFormat := pf24bit;
    LBMP.Width := IMG_SIZE;
    LBMP.Height := Round(IMG_SIZE * (LPng.Height / LPng.Width));
    // bitmap to hold data from png
    LPngBMP.PixelFormat := pf24bit;
    LPngBMP.Width := LPng.Width;
    LPngBMP.Height := LPng.Height;
    LPngBMP.Assign(LPng);

    try
      StretchBitmap(LPngBMP, LBMP, nil, nil, sqVeryHigh);
    except
      Result := False;
      Exit;
    end;

    LOutPng := TPngImage.Create;
    try
      LOutPng.Assign(LBMP);
      try
        LOutPng.SaveToFile(outFile);
      except
        Result := False;
        Exit;
      end;
    finally
      LOutPng.Free;
    end;
  finally
    LPng.Free;
    LBMP.Free;
    LPngBMP.Free;
  end;
end;

function TImageResizer.ResizePngStream(const inFile: TStream; const TmpFile: string): Boolean;
var
  LPng: TPngImage;
  LBMP: TBitmap;
  LPngBMP: TBitmap;
  LOutPng: TPngImage;
begin
  LPng := TPngImage.Create;
  LBMP := TBitmap.Create;
  LPngBMP := TBitmap.Create;
  Result := inFile.Size <> 0;
  try
    // try to load jpg
    try
      LPng.LoadFromStream(inFile);
    except
      Exit;
    end;
    // output bitmap
    LBMP.PixelFormat := pf24bit;
    LBMP.Width := IMG_SIZE;
    LBMP.Height := Round(IMG_SIZE * (LPng.Height / LPng.Width));
    // bitmap to hold data from jpeg
    LPngBMP.PixelFormat := pf24bit;
    LPngBMP.Width := LPng.Width;
    LPngBMP.Height := LPng.Height;
    LPngBMP.Assign(LPng);
    try
      StretchBitmap(LPngBMP, LBMP, nil, nil, sqVeryHigh);
    except
      Exit;
    end;

    LOutPng := TPngImage.Create;
    try
      LOutPng.Assign(LBMP);
      try
        LOutPng.SaveToFile(TmpFile);
      except
        Exit;
      end;
    finally
      LOutPng.Free;
    end;
  finally
    LPng.Free;
    LBMP.Free;
    LPngBMP.Free;
  end;
end;

end.
