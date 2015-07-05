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

unit UnitTagTypes;

interface

uses Classes, Generics.Collections;

type
  TGeneralTag = class
    Tag, Value: string;
    Edited: Boolean;
  end;

type
  TGeneralTagList = TList<TGeneralTag>;

type
  TCoverArtType = (none = 0, jpeg = 1, png = 2, bmp = 3, gif = 4);

type
  PTag = ^TTag;

  TTag = packed record
    Title: string;
    Artist: string;
    Album: string;
    Comment: string;
    Genre: string;
    Track: string;
    TrackTotal: string;
    Disc: string;
    DiscTotal: string;
    Year: string;
  end;

type
  TPlayItem = class
    FullFileName: string;
    DurationStr: string;
    Bitrate: string;
    Channels: string;
    Codec: string;
    SampleRate: string;
    Title: string;
    Artist: string;
    AlbumArtist: string;
    Album: string;
    PlayCount: integer;
    Stars: integer;
    Genre: string;
    Track: string;
    Comment: string;
    Composer: string;
    Date: string;
    StartPos: Integer;
    Duration: Integer;
    EndPos: Integer;
    constructor Create;
    destructor Destroy; override;
  end;

  TPlaylist = TList<TPlayItem>;
  TQueueList = TList<integer>;

implementation

{ TPlayListItem }

constructor TPlayItem.Create;
begin

end;

destructor TPlayItem.Destroy;
begin

end;

end.
