unit Playlist;

interface

uses
  Classes, Generics.Collections;

type
  TPlaylistFile = class
    Name, PlaylistFile: string;
    CurrentItemIndex: integer;
  end;

  TPlaylistFiles = TList<TPlaylistFile>;

implementation

end.


