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

unit UnitTagReader;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitTagTypes,
  WMATagLibrary, APEv2Library, MP4TagLibrary,
  FlacTagLibrary, ID3v2Library, ID3v1Library, OggVorbisAndOpusTagLibrary,
  WAVTagLibrary;

type
  TTagType = (id3v2 = 0, id3v1 = 1, flac = 3, ape = 4, wma = 5, mp4 = 6, ogg = 7, wav = 8);

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
    FTagType: TTagType;

    function ConvertFrameID2String(FrameID: TFrameID): String;
    function AtomNameToString(ID: TAtomName): String;
  public
    property PicStream: TStream read FPicStream;
    property PicType: TCoverArtType read FPicType;
    property IsBusy: Boolean read FIsBusy;
    property TagType: TTagType read FTagType;

    constructor Create;
    destructor Destroy(); override;

    function ReadTags(const FileName: string): TPlayItem;
    function ReadTags2(const FileName: string): TGeneralTagList;
    function ReadTagsForTagEditorList(const FileName: string): TPlayItem;
    procedure ReadArtwork(const FileName: string);
    procedure ClearArtwork;
  end;

implementation

{ TTagReader }

function TTagReader.AtomNameToString(ID: TAtomName): String;
begin
  Result := Char(ID[0]) + Char(ID[1]) + Char(ID[2]) + Char(ID[3]);
end;

procedure TTagReader.ClearArtwork;
begin
  FPicType := none;
end;

function TTagReader.ConvertFrameID2String(FrameID: TFrameID): String;
begin
  Result := Char(FrameID[0]) + Char(FrameID[1]) + Char(FrameID[2]) + Char(FrameID[3]);
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
          for I := 0 to Length(FAPETag.Frames) - 1 do
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

function TTagReader.ReadTags(const FileName: string): TPlayItem;
begin
  FIsBusy := True;
  Result := TPlayItem.Create;
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

function TTagReader.ReadTags2(const FileName: string): TGeneralTagList;
var
  I: Integer;
  LGeneralTag: TGeneralTag;
begin
  FIsBusy := True;
  try
    Result := TGeneralTagList.Create;
    LGeneralTag := TGeneralTag.Create;
    if FID3v2Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v2Tag.Loaded then
      begin
        FTagType := id3v2;
        for I := 0 to FID3v2Tag.FrameCount - 1 do
        begin
          LGeneralTag := TGeneralTag.Create;
          LGeneralTag.Tag := ConvertFrameID2String(FID3v2Tag.Frames[i].ID);
          LGeneralTag.Value := FID3v2Tag.GetUnicodeText(ConvertFrameID2String(FID3v2Tag.Frames[i].ID));
          LGeneralTag.Edited := False;
          if (LGeneralTag.Tag <> 'PRIV') and (LGeneralTag.Tag <> 'TXXX') and (LGeneralTag.Tag <> 'APIC') then
          begin
            Result.Add(LGeneralTag);
          end;
        end;
      end;
    end
    else if FID3v1Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v1Tag.Loaded then
      begin
        FTagType := id3v1;
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Title';
        LGeneralTag.Value := FID3v1Tag.Title;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Artist';
        LGeneralTag.Value := FID3v1Tag.Artist;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Album';
        LGeneralTag.Value := FID3v1Tag.Album;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Comment';
        LGeneralTag.Value := FID3v1Tag.Comment;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Genre';
        LGeneralTag.Value := FID3v1Tag.Genre;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Track';
        LGeneralTag.Value := FID3v1Tag.TrackString;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
        LGeneralTag := TGeneralTag.Create;
        LGeneralTag.Tag := 'Year';
        LGeneralTag.Value := FID3v1Tag.Year;
        LGeneralTag.Edited := False;
        Result.Add(LGeneralTag);
      end;
    end
    else if FMP4Tag.LoadFromFile(FileName) = 0 then
    begin
      if FMP4Tag.Loaded then
      begin
        FTagType := mp4;
        for I := 0 to Length(FMP4Tag.Atoms) - 1 do
        begin
          LGeneralTag := TGeneralTag.Create;
          LGeneralTag.Tag := AtomNameToString(FMP4Tag.Atoms[i].ID);
          LGeneralTag.Value := FMP4Tag.GetText(FMP4Tag.Atoms[i].ID);
          LGeneralTag.Edited := False;
          if (LGeneralTag.Tag <> '----') and (LGeneralTag.Tag <> 'covr') then
          begin
            Result.Add(LGeneralTag);
          end;
        end;
      end;
    end
    else if FAPETag.LoadFromFile(FileName) = 0 then
    begin
      if FAPETag.Loaded then
      begin
        FTagType := ape;
        for I := 0 to Length(FAPETag.Frames) - 1 do
        begin
          if FAPETag.Frames[i].Format = ffApeText then
          begin
            LGeneralTag := TGeneralTag.Create;
            LGeneralTag.Tag := FAPETag.Frames[i].Name;
            LGeneralTag.Value := FAPETag.ReadFrameByNameAsText(FAPETag.Frames[i].Name);
            LGeneralTag.Edited := False;
            if not ContainsStr(LGeneralTag.Tag.ToLower, 'replay') then
            begin
              Result.Add(LGeneralTag);
            end;
          end;
        end;
      end;
    end
    else if FFLACTag.LoadFromFile(FileName) = 0 then
    begin
      if FFLACTag.Loaded then
      begin
        FTagType := flac;
        for I := 0 to Length(FFLACTag.Tags) - 1 do
        begin
          if FFLACTag.Tags[i].Format = vcfText then
          begin
            LGeneralTag := TGeneralTag.Create;
            LGeneralTag.Tag := FFLACTag.Tags[i].Name;
            LGeneralTag.Value := FFLACTag.ReadFrameByNameAsText(FFLACTag.Tags[i].Name);
            LGeneralTag.Edited := False;
            if not ContainsStr(LGeneralTag.Tag.ToLower, 'replay') then
            begin
              Result.Add(LGeneralTag);
            end;
          end;
        end;
      end;
    end
    else if FOPUSTag.LoadFromFile(FileName) = 0 then
    begin
      if FOPUSTag.Loaded then
      begin
        FTagType := ogg;
        with Result do
        begin
          for I := 0 to Length(FOPUSTag.Frames) - 1 do
          begin
            if FOPUSTag.Frames[i].Format = otffText then
            begin
              LGeneralTag := TGeneralTag.Create;
              LGeneralTag.Tag := FOPUSTag.Frames[i].Name;
              LGeneralTag.Value := FOPUSTag.ReadFrameByNameAsText(FOPUSTag.Frames[i].Name);
              LGeneralTag.Edited := False;
              if not ContainsStr(LGeneralTag.Tag.ToLower, 'replay') then
              begin
                Result.Add(LGeneralTag);
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
        FTagType := wma;
        for I := 0 to Length(FWMATag.Frames) - 1 do
        begin
          if FWMATag.Frames[i].Format <> WMT_TYPE_BINARY then
          begin
            LGeneralTag := TGeneralTag.Create;
            LGeneralTag.Tag := FWMATag.Frames[i].Name;
            LGeneralTag.Value := FWMATag.ReadFrameByNameAsText(FWMATag.Frames[i].Name);
            LGeneralTag.Edited := False;
            Result.Add(LGeneralTag);
          end;
        end;
      end;
    end
    else if FWAVTag.LoadFromFile(FileName) = 0 then
    begin
      if FWAVTag.Loaded then
      begin
        FTagType := wav;
        for I := 0 to Length(FWMATag.Frames) - 1 do
        begin
          if FWAVTag.Frames[i].Format = ffText then
          begin
            LGeneralTag := TGeneralTag.Create;
            LGeneralTag.Tag := FWAVTag.Frames[i].Name;
            LGeneralTag.Value := FWAVTag.ReadFrameByNameAsText(FWAVTag.Frames[i].Name);
            LGeneralTag.Edited := False;
            Result.Add(LGeneralTag);
          end;
        end;
      end;
    end;
  finally
    FIsBusy := False;
  end;
end;

function TTagReader.ReadTagsForTagEditorList(const FileName: string): TPlayItem;
begin
  FIsBusy := True;
  Result := TPlayItem.Create;
  try
    if FID3v2Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v2Tag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FID3v2Tag.GetUnicodeText('TIT2');
          Artist := FID3v2Tag.GetUnicodeText('TPE1');
          Album := FID3v2Tag.GetUnicodeText('TALB');
          AlbumArtist := FID3v2Tag.GetUnicodeText('TPE2');
          Genre := FID3v2Tag.GetUnicodeText('TCON');
          Track := FID3v2Tag.GetUnicodeText('TRCK');
          Comment := FID3v2Tag.GetUnicodeText('COMM');
          Composer := FID3v2Tag.GetUnicodeText('TCOM');
          Date := FID3v2Tag.GetUnicodeText('TYER');
        end;
      end;
    end
    else if FID3v1Tag.LoadFromFile(FileName) = 0 then
    begin
      if FID3v1Tag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FID3v1Tag.Title;
          Artist := FID3v1Tag.Artist;
          Album := FID3v1Tag.Album;
          AlbumArtist := FID3v1Tag.Artist;
          Genre := FID3v1Tag.Genre;
          Track := FID3v1Tag.TrackString;
          Comment := FID3v1Tag.Comment;
          Date := FID3v1Tag.Year;
        end;
      end;
    end
    else if FMP4Tag.LoadFromFile(FileName) = 0 then
    begin
      if FMP4Tag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FMP4Tag.GetText('©nam');
          Artist := FMP4Tag.GetText('©ART');
          Album := FMP4Tag.GetText('©alb');
          AlbumArtist := FMP4Tag.GetText('aART');
          Genre := FMP4Tag.GetGenre;
          Track := FMP4Tag.GetTrack.ToString;
          Comment := FMP4Tag.GetText('©cmt');
          Composer := FMP4Tag.GetText('©wrt');
          Date := FMP4Tag.GetText('©day');
          // artwork
        end;
      end;
    end
    else if FAPETag.LoadFromFile(FileName) = 0 then
    begin
      if FAPETag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FAPETag.ReadFrameByNameAsText('Title');
          Artist := FAPETag.ReadFrameByNameAsText('Artist');
          Album := FAPETag.ReadFrameByNameAsText('Album');
          AlbumArtist := FAPETag.ReadFrameByNameAsText('AlbumArtist');
          Genre := FAPETag.ReadFrameByNameAsText('Genre');
          Track := FAPETag.ReadFrameByNameAsText('Track');
          Comment := FAPETag.ReadFrameByNameAsText('Comment');
          Composer := FAPETag.ReadFrameByNameAsText('Composer');
          Date := FAPETag.ReadFrameByNameAsText('Year');
        end;
      end;
    end
    else if FFLACTag.LoadFromFile(FileName) = 0 then
    begin
      if FFLACTag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FFLACTag.ReadFrameByNameAsText('TITLE');
          Artist := FFLACTag.ReadFrameByNameAsText('ARTIST');
          Album := FFLACTag.ReadFrameByNameAsText('ALBUM');
          AlbumArtist := FFLACTag.ReadFrameByNameAsText('ALBUMARTIST');
          Genre := FFLACTag.ReadFrameByNameAsText('GENRE');
          Track := FFLACTag.ReadFrameByNameAsText('TRACKNUMBER');
          Comment := FFLACTag.ReadFrameByNameAsText('COMMENT');
          Composer := FFLACTag.ReadFrameByNameAsText('COMPOSER');
          Date := FFLACTag.ReadFrameByNameAsText('YEAR');
        end;
      end;
    end
    else if FOPUSTag.LoadFromFile(FileName) = 0 then
    begin
      if FOPUSTag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FOPUSTag.ReadFrameByNameAsText('TITLE');
          Artist := FOPUSTag.ReadFrameByNameAsText('ARTIST');
          Album := FOPUSTag.ReadFrameByNameAsText('ALBUM');
          AlbumArtist := FOPUSTag.ReadFrameByNameAsText('ALBUMARTIST');
          Genre := FOPUSTag.ReadFrameByNameAsText('GENRE');
          Track := FOPUSTag.ReadFrameByNameAsText('TRACKNUMBER');
          Comment := FOPUSTag.ReadFrameByNameAsText('COMMENT');
          Composer := FOPUSTag.ReadFrameByNameAsText('COMPOSER');
          Date := FOPUSTag.ReadFrameByNameAsText('YEAR');
        end;
      end;
    end
    else if FWMATag.LoadFromFile(FileName) = 0 then
    begin
      if FWMATag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FWMATag.ReadFrameByNameAsText(g_wszWMTitle);
          Artist := FWMATag.ReadFrameByNameAsText(g_wszWMAuthor);
          Album := FWMATag.ReadFrameByNameAsText(g_wszWMAlbumTitle);
          AlbumArtist := FWMATag.ReadFrameByNameAsText(g_wszWMAlbumArtist);
          Genre := FWMATag.ReadFrameByNameAsText(g_wszWMGenre);
          Track := FWMATag.ReadFrameByNameAsText(g_wszWMTrackNumber);
          Comment := FWMATag.ReadFrameByNameAsText(g_wszWMDescription);
          Composer := FWMATag.ReadFrameByNameAsText(g_wszWMComposer);
          Date := FWMATag.ReadFrameByNameAsText(g_wszWMYear);
        end;
      end;
    end
    else if FWAVTag.LoadFromFile(FileName) = 0 then
    begin
      if FWAVTag.Loaded then
      begin
        FTagType := id3v2;
        with Result do
        begin
          Title := FWAVTag.ReadFrameByNameAsText('INAM');
          Artist := FWAVTag.ReadFrameByNameAsText('IART');
          Album := FWAVTag.ReadFrameByNameAsText('IPRD');
          AlbumArtist := FWAVTag.ReadFrameByNameAsText('IART');
          Genre := FWAVTag.ReadFrameByNameAsText('IGNR');
          Track := FWAVTag.ReadFrameByNameAsText('ITRK');
          Comment := FWAVTag.ReadFrameByNameAsText('ICMT');
          Composer := FWAVTag.ReadFrameByNameAsText('ICOM');
          Date := FWAVTag.ReadFrameByNameAsText('ICRD');
        end;
      end;
    end;
  finally
    FIsBusy := False;
  end;
end;

end.
