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

unit UnitTagWriter;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitTagTypes, WMATagLibrary, APEv2Library, MP4TagLibrary,
  FlacTagLibrary, ID3v2Library, ID3v1Library, OggVorbisAndOpusTagLibrary, WAVTagLibrary, Dialogs;

type
  TTagWriter = class(TObject)
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
    procedure FWriteTags(const FileName: string; const Tags: PTag; const EncoderIndex: integer);
    procedure FWriteArtwork(const OutputFileName: string; const SourceFileName: string; const EncoderIndex: integer);
    procedure ReadCover(const FileName: string);
  public
    constructor Create;
    destructor Destroy(); override;

    procedure WriteTags(const FileName: string; const Tags: PTag; const EncoderIndex: integer; const SourceFile: string);
  end;

implementation

uses UnitLog;

{ TTagWriter }

constructor TTagWriter.Create;
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
end;

destructor TTagWriter.Destroy;
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
    on E: Exception do
  end;
end;

procedure TTagWriter.FWriteArtwork(const OutputFileName, SourceFileName: string; const EncoderIndex: integer);
var
  LFrameIndex: integer;
  LMIME: string;
  LOpusVorbisCoverArtInfo: TOpusVorbisCoverArtInfo;
  LFlacTagCoverArtInfo: TFlacTagCoverArtInfo;
begin
  ReadCover(SourceFileName);
  if FPicType <> none then
  begin
    case FPicType of
      none:
        LMIME := '';
      jpeg:
        LMIME := 'image/jpeg';
      png:
        LMIME := 'image/png';
      bmp:
        LMIME := 'image/bmp';
      gif:
        LMIME := 'image/gif';
    end;
    case EncoderIndex of
      0: // mp3
        begin
          if FID3v2Tag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FID3v2Tag.Loaded then
            begin
              LFrameIndex := FID3v2Tag.AddFrame('APIC');
              if not FID3v2Tag.SetUnicodeCoverPictureFromStream(LFrameIndex, 'Cover', FPicStream, LMIME, 3) then
              begin
                //
              end;
              try
                FID3v2Tag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      1: // aac
        begin
          if FMP4Tag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FMP4Tag.Loaded then
            begin
              FMP4Tag.AddAtom('covr').AddData.Data.LoadFromStream(FPicStream);
              try
                FMP4Tag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      2: // ogg
        begin
          if FOPUSTag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FOPUSTag.Loaded then
            begin
              with LOpusVorbisCoverArtInfo do
              begin
                PictureType := 3;
                MIMEType := LMIME;
                Description := 'Cover art';
                Width := 500;
                Height := 500;
                ColorDepth := 24;
                NoOfColors := 0;
              end;
              FOPUSTag.AddCoverArtFrame(FPicStream, LOpusVorbisCoverArtInfo);
              try
                FOPUSTag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      3: // opus
        begin
          if FOPUSTag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FOPUSTag.Loaded then
            begin
              with LOpusVorbisCoverArtInfo do
              begin
                PictureType := 3;
                MIMEType := LMIME;
                Description := 'Cover art';
                Width := 500;
                Height := 500;
                ColorDepth := 24;
                NoOfColors := 0;
              end;
              FOPUSTag.AddCoverArtFrame(FPicStream, LOpusVorbisCoverArtInfo);
              try
                FOPUSTag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      4: // wma2
        begin
          if FWMATag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FWMATag.Loaded then
            begin
              LFrameIndex := FWMATag.AddFrame(g_wszWMPicture).Index;
              FWMATag.SetCoverArtFrame(LFrameIndex, FPicStream, LMIME, 3, 'Cover art');
              try
                FWMATag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      5: // flac
        begin
          if FFLACTag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FFLACTag.Loaded then
            begin
              LFrameIndex := FFLACTag.AddMetaDataCoverArt(nil, 0);
              with LFlacTagCoverArtInfo do
              begin
                PictureType := 3;
                MIMEType := LMIME;
                Description := 'Cover art';
                Width := 500;
                Height := 500;
                ColorDepth := 24;
                NoOfColors := 0;
              end;
              FFLACTag.SetCoverArt(LFrameIndex, FPicStream, LFlacTagCoverArtInfo);
              try
                FFLACTag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      6: // alac
        begin
          if FMP4Tag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FMP4Tag.Loaded then
            begin
              FMP4Tag.FindAtom('covr').AddData.Data.LoadFromStream(FPicStream);
              try
                FMP4Tag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      7: // wavpack
        begin
          if FAPETag.LoadFromFile(OutputFileName) = 0 then
          begin
            if FAPETag.Loaded then
            begin
              FAPETag.AddCoverArtFrame('Cover art', FPicStream, 'Cover art');
              try
                FAPETag.SaveToFile(OutputFileName);
              except
                on E: Exception do
                begin
                  LogForm.LogList.Lines.Add('Unable to write artwork to ' + ExtractFileName(OutputFileName));
                  if not LogForm.Visible then
                  begin
                    LogForm.Show;
                  end;
                end;
              end;
            end;
          end
        end;
      8: // wav
        begin

        end;
    end;
  end;
end;

procedure TTagWriter.FWriteTags(const FileName: string; const Tags: PTag; const EncoderIndex: integer);
var
  str2: string;
  lid: TLanguageID;
begin
  case EncoderIndex of
    0: // mp3
      begin
        with Tags^ do
        begin
          FID3v2Tag.SetUnicodeText('TIT2', Title);
          FID3v2Tag.SetUnicodeText('TPE1', Artist);
          FID3v2Tag.SetUnicodeText('TALB', Album);
          FID3v2Tag.SetUnicodeComment('TCON', Comment, lid, str2);
          FID3v2Tag.SetUnicodeText('TCON', Genre);
          FID3v2Tag.SetUnicodeText('TRCK', Track);
          FID3v2Tag.SetUnicodeText('TALB', TrackTotal);
          FID3v2Tag.SetUnicodeText('TPOS', Disc);
          FID3v2Tag.SetUnicodeText('TPOS', DiscTotal);
          FID3v2Tag.SetUnicodeText('TYER', Year);
        end;
      end;
    1: // aac
      begin
        with Tags^ do
        begin
          FMP4Tag.SetText('©nam', Title);
          FMP4Tag.SetText('©ART', Artist);
          FMP4Tag.SetText('©alb', Album);
          FMP4Tag.SetText('©cmt', Comment);
          FMP4Tag.SetGenre(Genre);
          FMP4Tag.SetTrack(StrToInt(Track), StrToInt(TrackTotal));
          FMP4Tag.SetDisc(StrToInt(Disc), StrToInt(DiscTotal));
          FMP4Tag.SetText('©day', Year);
        end;
        FMP4Tag.SaveToFile(FileName);
      end;
    2: // ogg
      begin
        with Tags^ do
        begin
          FOPUSTag.AddTextFrame('TITLE', Title);
          FOPUSTag.AddTextFrame('ARTIST', Artist);
          FOPUSTag.AddTextFrame('GENRE', Genre);
          FOPUSTag.AddTextFrame('DATE', Year);
          FOPUSTag.AddTextFrame('ALBUM', Album);
          FOPUSTag.AddTextFrame('COMMENT', Comment);
          FOPUSTag.AddTextFrame('TOTALTRACKS', TrackTotal);
          FOPUSTag.AddTextFrame('DISCNUMBER', Disc);
          FOPUSTag.AddTextFrame('DISCTOTAL', DiscTotal);
          FOPUSTag.AddTextFrame('TRACKNUMBER', Track);
        end;
        FOPUSTag.SaveToFile(FileName);
      end;
    3: // opus
      begin
        with Tags^ do
        begin
          FOPUSTag.AddTextFrame('TITLE', Title);
          FOPUSTag.AddTextFrame('ARTIST', Artist);
          FOPUSTag.AddTextFrame('GENRE', Genre);
          FOPUSTag.AddTextFrame('DATE', Year);
          FOPUSTag.AddTextFrame('ALBUM', Album);
          FOPUSTag.AddTextFrame('COMMENT', Comment);
          FOPUSTag.AddTextFrame('TOTALTRACKS', TrackTotal);
          FOPUSTag.AddTextFrame('DISCNUMBER', Disc);
          FOPUSTag.AddTextFrame('DISCTOTAL', DiscTotal);
          FOPUSTag.AddTextFrame('TRACKNUMBER', Track);
        end;
        FOPUSTag.SaveToFile(FileName);
      end;
    4: // wma2
      begin
        with Tags^ do
        begin
          FWMATag.SetTextFrameText(g_wszWMTitle, Title);
          FWMATag.SetTextFrameText(g_wszWMAuthor, Artist);
          FWMATag.SetTextFrameText(g_wszWMAlbumTitle, Album);
          FWMATag.SetTextFrameText(g_wszWMDescription, Comment);
          FWMATag.SetTextFrameText(g_wszWMGenre, Genre);
          FWMATag.SetTextFrameText(g_wszWMTrackNumber, Track);
          FWMATag.SetTextFrameText(g_wszWMTrack, TrackTotal);
          FWMATag.SetTextFrameText(g_wszWMYear, Year);
        end;
        FWMATag.SaveToFile(FileName);
      end;
    5: // flac
      begin
        with Tags^ do
        begin
          FFLACTag.AddTextTag('TITLE', Title);
          FFLACTag.AddTextTag('ARTIST', Artist);
          FFLACTag.AddTextTag('GENRE', Genre);
          FFLACTag.AddTextTag('DATE', Year);
          FFLACTag.AddTextTag('ALBUM', Album);
          FFLACTag.AddTextTag('COMMENT', Comment);
          FFLACTag.AddTextTag('TOTALTRACKS', TrackTotal);
          FFLACTag.AddTextTag('DISCNUMBER', Disc);
          FFLACTag.AddTextTag('DISCTOTAL', DiscTotal);
          FFLACTag.AddTextTag('TRACKNUMBER', Track);
        end;
        FFLACTag.SaveToFile(FileName);
      end;
    6: // alac
      begin
        with Tags^ do
        begin
          FMP4Tag.SetText('©nam', Title);
          FMP4Tag.SetText('©ART', Artist);
          FMP4Tag.SetText('©alb', Album);
          FMP4Tag.SetText('©cmt', Comment);
          FMP4Tag.SetGenre(Genre);
          FMP4Tag.SetTrack(StrToInt(Track), StrToInt(TrackTotal));
          FMP4Tag.SetDisc(StrToInt(Disc), StrToInt(DiscTotal));
          FMP4Tag.SetText('©day', Year);
        end;
        FMP4Tag.SaveToFile(FileName);
      end;
    7: // wavpack
      begin
        with Tags^ do
        begin
          FAPETag.AddFrame('Title').SetAsText(Title);
          FAPETag.AddFrame('Artist').SetAsText(Artist);
          FAPETag.AddFrame('Album').SetAsText(Album);
          FAPETag.AddFrame('Comment').SetAsText(Comment);
          FAPETag.AddFrame('Genre').SetAsText(Genre);
          FAPETag.AddFrame('Track').SetAsText(Track);
          FAPETag.AddFrame('TrackTotal').SetAsText(TrackTotal);
          FAPETag.AddFrame('DISCNUMBER').SetAsText(Disc);
          FAPETag.AddFrame('DiscTotal').SetAsText(DiscTotal);
          FAPETag.AddFrame('Year').SetAsText(Year);
        end;
        FAPETag.SaveToFile(FileName);
      end;
    8: // wav
      begin
        with Tags^ do
        begin
          FWAVTag.AddTextFrame('TITLE', Title);
          FWAVTag.AddTextFrame('ARTIST', Artist);
          FWAVTag.AddTextFrame('GENRE', Genre);
          FWAVTag.AddTextFrame('DATE', Year);
          FWAVTag.AddTextFrame('ALBUM', Album);
          FWAVTag.AddTextFrame('COMMENT', Comment);
          FWAVTag.AddTextFrame('TOTALTRACKS', TrackTotal);
          FWAVTag.AddTextFrame('DISCNUMBER', Disc);
          FWAVTag.AddTextFrame('DISCTOTAL', DiscTotal);
          FWAVTag.AddTextFrame('TRACKNUMBER', Track);
        end;
        FWAVTag.SaveToFile(FileName);
      end;
  end;
end;

procedure TTagWriter.ReadCover(const FileName: string);
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
  FPicType := none;

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
end;

procedure TTagWriter.WriteTags(const FileName: string; const Tags: PTag; const EncoderIndex: integer; const SourceFile: string);
begin
  FWriteTags(FileName, Tags, EncoderIndex);
end;

end.
