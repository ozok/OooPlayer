unit Radiolist;

interface

uses
  Classes, Generics.Collections;

type
  TRadioStation = packed record
    Name: string;
    URL: Ansistring;
    Web: string;
  end;

  TRadioList = TList<TRadioStation>;

implementation

end.


