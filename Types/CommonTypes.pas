unit CommonTypes;

interface

uses
  Classes, System.Generics.Collections;

type
  TPlaybackType = (music = 0, radio = 1);

type
  TCurrentItemInfo = packed record
    // ItemIndex: integer;
    FullFileName: string;
    DurationBass: int64;
    DurationAsSecInt: Integer;
    InfoStr: string;
  end;

type
  TRadioRecordInfo = record
    FileName: string;
    Title: string;
    Artist: string;
  end;

implementation

end.

