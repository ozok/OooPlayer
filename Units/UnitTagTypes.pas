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

unit UnitTagTypes;

interface

uses Classes;

type
  TPlayListItem = class
    FullFileName: string;
    DurationStr: string;
    Bitrate: string;
    Channels: string;
    Codec: string;
    SampleRate: string;
    Title: string;
    Artist: string;
    Album: string;
    PlayCount: integer;
    Stars: integer;
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TPlayListItem }

constructor TPlayListItem.Create;
begin

end;

destructor TPlayListItem.Destroy;
begin

end;

end.
