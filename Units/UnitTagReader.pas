{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
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

unit UnitTagReader;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitTagTypes, WMATagLibrary, APEv2Library, MP4TagLibrary,
  FlacTagLibrary, ID3v2Library, ID3v1Library, OggVorbisAndOpusTagLibrary, WAVTagLibrary;

type
  TTagReader = class(TObject)
  private
    FWMATag: TWMATag;
    FAPETag: TAPEv2Tag;
    FID3v2Tag: TID3v2Tag;
    FID3v1Tag: TID3v1Tag;
    FFLACTag: TFlacTag;
    FMP4Tag: TMP4Tag;
    FOPUSTag: TOpusTag;
    FWAVTag: TWAVTag;
    FPicStream: TStream;
    FPicType: TCoverArtType;
    FIsBusy: Boolean;
  public
    property PicStream: TStream read FPicStream;
    property PicType: TCoverArtType read FPicType;
    property IsBusy: Boolean read FIsBusy;

    constructor Create;
    destructor Destroy(); override;

    function ReadTags(const FileName: string): TPlayListItem;
    procedure ReadArtwork(const FileName: string);
    procedure ClearArtwork;
  end;

implementation

{ TTagReader }

procedure TTagReader.ClearArtwork;
begin
  FPicType := none;
end;

constructor TTagReader.Create;
begin
  inherited Create;

  FWMATag := TWMATag.Create;
  FAPETag := TAPEv2Tag.Create;
  FID3v2Tag := TID3v2Tag.Create;
  FID3v1Tag := TID3v1Tag.Create;
  FFLACTag := TFlacTag.Create;
  FMP4Tag := TMP4Tag.Create;
  FOPUSTag := TOpusTag.Create;
  FWAVTag := TWAVTag.Create;
  FPicStream := TMemoryStream.Create;
  FIsBusy := False;
end;

destructor TTagReader.Destroy;
begin
  inherited Destroy;
  FWMATag.Free;
  FAPETag.Free;
  FID3v2Tag.Free;
  FID3v1Tag.Free;
  FFLACTag.Free;
  FMP4Tag.Free;
  FOPUSTag.Free;
  FWAVTag.Free;
  try
    FPicStream.Free;
  except

  end;
  // FPicStream.Free;
end;

procedure TTagReader.ReadArtwork(const FileName: string);
var
  Str1: string;
  Int: integer;
  i: integer;
  LMP4CoverType: Word;
  LID3Mime: string;
  LID3Index: integer;
  LID3Found: Boolean;
  LFlacTagCoverArt: TFlacTagCoverArtInfo;
  LApePicFormat: TAPEv2PictureFormat;
  LOggCoverFormat: TOpusVorbisCoverArtInfo;
  LOggIndex: integer;
  LWMACoverType: Byte;
begin
  FIsBusy := True;
  try
    FPicType := none;
    try
      FPicStream.Seek(0, soBeginning);
      FPicStream.Size := 0;
    except
      on E: Exception do
    end;

    if FID3v2Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v2Tag.Loaded then
      begin
        LID3Index := FID3v2Tag.FrameExists('APIC');
        if LID3Index > 0 then
        begin
          LID3Found := FID3v2Tag.GetUnicodeCoverPictureStream(LID3Index, FPicStream, LID3Mime, Str1, Int);
          if LID3Found and (FPicStream.Size > 0) then
          begin
            FPicStream.Seek(0, soBeginning);
            LID3Mime := LowerCase(LID3Mime);
            if (LID3Mime = 'image/jpeg') or (LID3Mime = 'image/jpg') then
            begin
              FPicType := jpeg;
            end
            else if (LID3Mime = 'image/png') then
            begin
              FPicType := png;
            end
            else if (LID3Mime = 'image/bmp') then
            begin
              FPicType := bmp;
            end;
          end;
        end;
      end;
    end
    else if FID3v1Tag.LoadFromFile(FileName) = 0 then
    begin
      // no cover
    end
    else if FMP4Tag.LoadFromFile(FileName) = 0 then
    begin
      if FMP4Tag.Loaded then
      begin
        if FMP4Tag.CoverArtCount > 0 then
        begin
          for I := 0 to FMP4Tag.Count - 1 do
          begin
            if IsSameAtomName(FMP4Tag.Atoms[i].ID, 'covr') then
            begin
              FMP4Tag.Atoms[i].Datas[0].Data.Seek(0, soBeginning);
              FMP4Tag.Atoms[i].Datas[0].Data.Read(LMP4CoverType, 2);
              if LMP4CoverType = MAGIC_JPG then
              begin
                FPicType := jpeg;
              end
              else if LMP4CoverType = MAGIC_PNG then
              begin
                FPicType := png;
              end;
              FMP4Tag.Atoms[i].Datas[0].Data.Seek(0, soBeginning);
              FPicStream := FMP4Tag.Atoms[i].Datas[0].Data;
              Break;
            end;
          end;
        end;
      end;
    end
    else if FAPETag.LoadFromFile(FileName) = 0 then
    begin
      if FAPETag.Loaded then
      begin
        if FAPETag.CoverArtCount > 0 then
        begin
          for I := 0 to FAPETag.FrameCount - 1 do
          begin
            if FAPETag.Frames[i].Format = ffBinary then
            begin
              if FAPETag.GetCoverArtFromFrame(i, FPicStream, LApePicFormat, Str1) then
              begin
                case LApePicFormat of
                  pfUnknown:
                    FPicType := none;
                  pfJPEG:
                    FPicType := jpeg;
                  pfPNG:
                    FPicType := png;
                  pfBMP:
                    FPicType := bmp;
                  pfGIF:
                    FPicType := gif;
                end;
              end;
            end;
          end;
        end;
      end;
    end
    else if FFLACTag.LoadFromFile(FileName) = 0 then
    begin
      if FFLACTag.Loaded then
      begin
        if FFLACTag.CoverArtCount > 0 then
        begin
          if FFLACTag.GetCoverArt(0, FPicStream, LFlacTagCoverArt) then
          begin
            if (LowerCase(LFlacTagCoverArt.MIMEType) = 'image/jpeg') or (LowerCase(LFlacTagCoverArt.MIMEType) = 'image/jpg') then
            begin
              FPicType := jpeg;
            end
            else if (LowerCase(LFlacTagCoverArt.MIMEType) = 'image/png') then
            begin
              FPicType := png;
            end
            else if (LowerCase(LFlacTagCoverArt.MIMEType) = 'image/bmp') then
            begin
              FPicType := bmp;
            end;
          end;
        end;
      end;
    end
    else if FOPUSTag.LoadFromFile(FileName) = 0 then
    begin
      if FOPUSTag.Loaded then
      begin
        if FOPUSTag.CoverArtCount > 0 then
        begin
          LOggIndex := FOPUSTag.FrameExists(OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE);
          if LOggIndex > -1 then
          begin
            if FOPUSTag.GetCoverArtFromFrame(LOggIndex, FPicStream, LOggCoverFormat) then
            begin
              if (LowerCase(LOggCoverFormat.MIMEType) = 'image/jpeg') or (LowerCase(LOggCoverFormat.MIMEType) = 'image/jpg') then
              begin
                FPicType := jpeg;
              end
              else if (LowerCase(LOggCoverFormat.MIMEType) = 'image/png') then
              begin
                FPicType := png;
              end
              else if (LowerCase(LOggCoverFormat.MIMEType) = 'image/bmp') then
              begin
                FPicType := bmp;
              end;
            end;
          end;
        end;
      end;
    end
    else if FWMATag.LoadFromFile(FileName) = 0 then
    begin
      if FWMATag.Loaded then
      begin
        if FWMATag.CoverArtCount > 0 then
        begin
          for I := 0 to FWMATag.Count - 1 do
          begin
            if FWMATag.Frames[i].Name = g_wszWMPicture then
            begin
              if FWMATag.GetCoverArtFromFrame(i, FPicStream, LID3Mime, LWMACoverType, Str1) then
              begin
                LID3Mime := LowerCase(LID3Mime);
                if (LID3Mime = 'image/jpeg') or (LID3Mime = 'image/jpg') then
                begin
                  FPicType := jpeg;
                end
                else if (LID3Mime = 'image/png') then
                begin
                  FPicType := png;
                end
                else if (LID3Mime = 'image/bmp') then
                begin
                  FPicType := bmp;
                end;
              end;
              Break;
            end;
          end;
        end;
      end;
    end
    else if FWAVTag.LoadFromFile(FileName) = 0 then
    begin
      if FWAVTag.Loaded then
      begin

      end;
    end;
  finally
    if FPicStream <> nil then
    begin
      try
        if FPicStream.Size > 0 then
        begin
          FPicStream.Seek(0, soBeginning);
        end;
      except

      end;
    end;
    FIsBusy := False;
  end;
end;

function TTagReader.ReadTags(const FileName: string): TPlayListItem;
begin
  FIsBusy := True;
  Result := TPlayListItem.Create;
  try
    if FID3v2Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v2Tag.Loaded then
      begin
        with Result do
        begin
          Title := FID3v2Tag.GetUnicodeText('TIT2');
          Artist := FID3v2Tag.GetUnicodeText('TPE1');
          Album := FID3v2Tag.GetUnicodeText('TALB');
        end;
      end;
    end
    else if FID3v1Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v1Tag.Loaded then
      begin
        with Result do
        begin
          Title := FID3v1Tag.Title;
          Artist := FID3v1Tag.Artist;
          Album := FID3v1Tag.Album;
        end;
      end;
    end
    else if FMP4Tag.LoadFromFile(FileName) = 0 then
    begin
      if FMP4Tag.Loaded then
      begin
        with Result do
        begin
          Title := FMP4Tag.GetText('©nam');
          Artist := FMP4Tag.GetText('©ART');
          Album := FMP4Tag.GetText('©alb');
          // artwork
        end;
      end;
    end
    else if FAPETag.LoadFromFile(FileName) = 0 then
    begin
      if FAPETag.Loaded then
      begin
        with Result do
        begin
          Title := FAPETag.ReadFrameByNameAsText('Title');
          Artist := FAPETag.ReadFrameByNameAsText('Artist');
          Album := FAPETag.ReadFrameByNameAsText('Album');
        end;
      end;
    end
    else if FFLACTag.LoadFromFile(FileName) = 0 then
    begin
      if FFLACTag.Loaded then
      begin
        with Result do
        begin
          Title := FFLACTag.ReadFrameByNameAsText('TITLE');
          Artist := FFLACTag.ReadFrameByNameAsText('ARTIST');
          Album := FFLACTag.ReadFrameByNameAsText('ALBUM');
        end;
      end;
    end
    else if FOPUSTag.LoadFromFile(FileName) = 0 then
    begin
      if FOPUSTag.Loaded then
      begin
        with Result do
        begin
          Title := FOPUSTag.ReadFrameByNameAsText('TITLE');
          Artist := FOPUSTag.ReadFrameByNameAsText('ARTIST');
          Album := FOPUSTag.ReadFrameByNameAsText('ALBUM');
        end;
      end;
    end
    else if FWMATag.LoadFromFile(FileName) = 0 then
    begin
      if FWMATag.Loaded then
      begin
        with Result do
        begin
          Title := FWMATag.ReadFrameByNameAsText(g_wszWMTitle);
          Artist := FWMATag.ReadFrameByNameAsText(g_wszWMAuthor);
          Album := FWMATag.ReadFrameByNameAsText(g_wszWMAlbumTitle);
        end;
      end;
    end
    else if FWAVTag.LoadFromFile(FileName) = 0 then
    begin
      if FWAVTag.Loaded then
      begin
        with Result do
        begin
          Title := FWAVTag.ReadFrameByNameAsText('INAM');
          Artist := FWAVTag.ReadFrameByNameAsText('IART');
          Album := FWAVTag.ReadFrameByNameAsText('IPRD');
        end;
      end;
    end;
  finally
    FIsBusy := False;
  end;
end;

end.
