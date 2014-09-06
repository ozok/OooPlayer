// ********************************************************************************************************************************
// *                                                                                                                              *
// *     MP4 Tag Library 1.0.21.37 © 3delite 2012-2014                                                                            *
// *     See MP4 Tag Library ReadMe.txt for details                                                                               *
// *                                                                                                                              *
// * Two licenses are available for commercial usage of this component:                                                           *
// * Shareware License: €50                                                                                                       *
// * Commercial License: €250                                                                                                     *
// *                                                                                                                              *
// *     http://www.shareit.com/product.html?productid=300548330                                                                  *
// *                                                                                                                              *
// * Using the component in free programs is free.                                                                                *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/MP4TagLibrary.html                                         *
// *                                                                                                                              *
// * There is also an ID3v2 Library available at:                                                                                 *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/id3v2library.html                                          *
// *                                                                                                                              *
// * and also an APEv2 Library available at:                                                                                      *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/APEv2Library.html                                          *
// *                                                                                                                              *
// * and also an Ogg Vorbis and Opus Tag Library available at:                                                                    *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/OpusTagLibrary.html                                        *
// *                                                                                                                              *
// * a Flac Tag Library available at:                                                                                             *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/FlacTagLibrary.html                                        *
// *                                                                                                                              *
// * an WMA Tag Library available at:                                                                                             *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/WMATagLibrary.html                                         *
// *                                                                                                                              *
// * a WAV Tag Library available at:                                                                                              *
// *                                                                                                                              *
// *     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/WAVTagLibrary.html                                         *
// *                                                                                                                              *
// * For other Delphi components see the home page:                                                                               *
// *                                                                                                                              *
// *     http://www.3delite.hu/                                                                                                   *
// *                                                                                                                              *
// * If you have any questions or enquiries please mail: 3delite@3delite.hu                                                       *
// *                                                                                                                              *
// * Good coding! :)                                                                                                              *
// * 3delite                                                                                                                      *
// ********************************************************************************************************************************

unit MP4TagLibrary;

interface

{$IFDEF IOS}
{$DEFINE ID3V2L_MOBILE}
{$ENDIF}
{$IFDEF ANDROID}
{$DEFINE ID3V2L_MOBILE}
{$ENDIF}

Uses
  SysUtils,
  Classes;

Const
  MP4TAGLIBRARY_SUCCESS = 0;
  MP4TAGLIBRARY_ERROR = $FFFF;
  MP4TAGLIBRARY_ERROR_NO_TAG_FOUND = 1;
  MP4TAGLIBRARY_ERROR_EMPTY_TAG = 2;
  MP4TAGLIBRARY_ERROR_EMPTY_FRAMES = 3;
  MP4TAGLIBRARY_ERROR_OPENING_FILE = 4;
  MP4TAGLIBRARY_ERROR_READING_FILE = 5;
  MP4TAGLIBRARY_ERROR_WRITING_FILE = 6;
  MP4TAGLIBRARY_ERROR_DOESNT_FIT = 7;
  MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_VERSION = 8;
  MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT = 9;
  MP4TAGLIBRARY_ERROR_NEED_EXCLUSIVE_ACCESS = 10;
  MP4TAGLIBRARY_ERROR_UPDATE_stco = 11;
  MP4TAGLIBRARY_ERROR_UPDATE_co64 = 12;

Const
  MP4TAGLIBRARY_DEFAULT_PADDING_SIZE = 4096 - 8;

const
  ID3Genres: Array [0 .. 148] of String = (
    { The following genres are defined in ID3v1 }
    '', 'Blues', 'Classic Rock', 'Country', 'Dance', 'Disco', 'Funk', 'Grunge', 'Hip-Hop', 'Jazz', 'Metal', 'New Age', 'Oldies', 'Other', { <= 12 Default }
    'Pop', 'R&B', 'Rap', 'Reggae', 'Rock', 'Techno', 'Industrial', 'Alternative', 'Ska', 'Death Metal', 'Pranks', 'Soundtrack', 'Euro-Techno', 'Ambient', 'Trip-Hop', 'Vocal', 'Jazz+Funk', 'Fusion', 'Trance', 'Classical', 'Instrumental',
    'Acid', 'House', 'Game', 'Sound Clip', 'Gospel', 'Noise', 'AlternRock', 'Bass', 'Soul', 'Punk', 'Space', 'Meditative', 'Instrumental Pop', 'Instrumental Rock', 'Ethnic', 'Gothic', 'Darkwave', 'Techno-Industrial', 'Electronic',
    'Pop-Folk', 'Eurodance', 'Dream', 'Southern Rock', 'Comedy', 'Cult', 'Gangsta', 'Top 40', 'Christian Rap', 'Pop/Funk', 'Jungle', 'Native American', 'Cabaret', 'New Wave', 'Psychedelic',
    // = 'Psychadelic' in ID3 docs, 'Psychedelic' in winamp.
    'Rave', 'Showtunes', 'Trailer', 'Lo-Fi', 'Tribal', 'Acid Punk', 'Acid Jazz', 'Polka', 'Retro', 'Musical', 'Rock & Roll', 'Hard Rock',
    { The following genres are Winamp extensions }
    'Folk', 'Folk-Rock', 'National Folk', 'Swing', 'Fast Fusion', 'Bebob', 'Latin', 'Revival', 'Celtic', 'Bluegrass', 'Avantgarde', 'Gothic Rock', 'Progressive Rock', 'Psychedelic Rock', 'Symphonic Rock', 'Slow Rock', 'Big Band', 'Chorus',
    'Easy Listening', 'Acoustic', 'Humour', 'Speech', 'Chanson', 'Opera', 'Chamber Music', 'Sonata', 'Symphony', 'Booty Bass', 'Primus', 'Porn Groove', 'Satire', 'Slow Jam', 'Club', 'Tango', 'Samba', 'Folklore', 'Ballad', 'Power Ballad',
    'Rhythmic Soul', 'Freestyle', 'Duet', 'Punk Rock', 'Drum Solo', 'A capella', // A Capella
    'Euro-House', 'Dance Hall',
    { winamp ?? genres }
    'Goa', 'Drum & Bass', 'Club-House', 'Hardcore', 'Terror', 'Indie', 'BritPop', 'Negerpunk', 'Polsk Punk', 'Beat', 'Christian Gangsta Rap', 'Heavy Metal', 'Black Metal', 'Crossover', 'Contemporary Christian', 'Christian Rock',
    { winamp 1.91 genres }
    'Merengue', 'Salsa', 'Trash Metal',
    { winamp 1.92 genres }
    'Anime', 'JPop', 'SynthPop');

Const
  MAGIC_PNG = $5089; // * Little endian form
  MAGIC_JPG = $D8FF; // * Little endian form
  MAGIC_GIF = $4947; // * Little endian form
  MAGIC_BMP = $4D42; // * Little endian form

type
  DWord = Cardinal;

type
  TAtomName = Array [0 .. 3] of Byte;

type
  TMP4Atom = class;

  TMP4Atommean = class
    Data: TMemoryStream;
    Parent: TMP4Atom;
    // Index: Integer;
    Constructor Create;
    Destructor Destroy; override;
    // function GetAsText: String;
    // function SetAsText(Text: String): Boolean;
    procedure Clear;
    function Write(MP4Stream: TStream): Boolean;
    function Assign(MP4Atommean: TMP4Atommean): Boolean;
  end;

  TMP4Atomname = class
    Data: TMemoryStream;
    Parent: TMP4Atom;
    // Index: Integer;
    Constructor Create;
    Destructor Destroy; override;
    // function GetAsText: String;
    // function SetAsText(Text: String): Boolean;
    procedure Clear;
    function Write(MP4Stream: TStream): Boolean;
    function Assign(MP4Atomname: TMP4Atomname): Boolean;
  end;

  TMP4AtomData = class
    // Size: DWord;
    Data: TMemoryStream;
    DataType: DWord;
    Reserved: DWord;
    Parent: TMP4Atom;
    Index: Integer;
    Constructor Create;
    Destructor Destroy; override;
    function GetAsText: String;
    function GetAsInteger: Int64;
    function GetAsInteger8: Byte;
    function GetAsInteger16: Word;
    function GetAsInteger32: DWord;
    function GetAsInteger48(var LowDWord: DWord; HighWord: Word): Int64;
    function GetAsInteger64(var LowDWord, HighDWord: DWord): Int64;
    function GetAsBool: Boolean;
    function SetAsText(Text: String): Boolean;
    function SetAsInteger8(Value: Byte): Boolean;
    function SetAsInteger16(Value: Word): Boolean;
    function SetAsInteger32(Value: DWord): Boolean;
    function SetAsInteger48(Value: Int64): Boolean; overload;
    function SetAsInteger48(LowDWord: DWord; HighWord: Word): Boolean; overload;
    function SetAsInteger64(Value: Int64): Boolean; overload;
    function SetAsInteger64(LowDWord, HighDWord: DWord): Boolean; overload;
    function SetAsBool(Value: Boolean): Boolean;
    procedure Clear;
    function Write(MP4Stream: TStream): Boolean;
    function Delete: Boolean;
    function Assign(MP4AtomData: TMP4AtomData): Boolean;
  end;

  TMP4Tag = class;

  TMP4Atom = class
    ID: TAtomName;
    Size: DWord;
    mean: TMP4Atommean;
    name: TMP4Atomname;
    Datas: Array of TMP4AtomData;
    Flags: DWord;
    Parent: TMP4Tag;
    Index: Integer;
    Constructor Create;
    Destructor Destroy; override;
    function AddData: TMP4AtomData;
    function GetAsText: String;
    function GetAsInteger: Int64;
    function GetAsInteger8: Byte;
    function GetAsInteger16: Word;
    function GetAsInteger32: DWord;
    function GetAsInteger48(var LowDWord: DWord; HiWord: Word): Int64;
    function GetAsInteger64(var LowDWord, HiDWord: DWord): Int64;
    function GetAsBool: Boolean;
    function SetAsText(Text: String): Boolean;
    function SetAsInteger8(Value: Byte): Boolean;
    function SetAsInteger16(Value: Word): Boolean;
    function SetAsInteger32(Value: DWord): Boolean;
    function SetAsInteger48(Value: Int64): Boolean; overload;
    function SetAsInteger48(LowDWord: DWord; HiWord: Word): Boolean; overload;
    function SetAsInteger64(Value: Int64): Boolean; overload;
    function SetAsInteger64(LowDWord, HiDWord: DWord): Boolean; overload;
    function SetAsBool(Value: Boolean): Boolean;
    function Count: Integer;
    procedure Clear;
    function CalculateAtomSize: Cardinal;
    function Write(MP4Stream: TStream): Boolean;
    procedure Delete;
    function DeleteData(Index: Integer): Boolean;
    function Deletemean: Boolean;
    function Deletename: Boolean;
    procedure CompactAtomDataList;
    function Assign(MP4Atom: TMP4Atom): Boolean;
  end;

  TMP4Tag = class
  private
  public
    FileName: String;
    Loaded: Boolean;
    Size: Cardinal;
    Atoms: Array of TMP4Atom;
    Version: Byte;
    Flags: DWord;
    PaddingToWrite: Cardinal;
    UTF8Encoding: TEncoding;
    Constructor Create;
    Destructor Destroy; override;
    function LoadFromFile(FileName: String): Integer;
    function SaveToFile(FileName: String): Integer;
    function AddAtom(AtomName: TAtomName): TMP4Atom; overload;
    function AddAtom(AtomName: String): TMP4Atom; overload;
    function ReadAtom(MP4Stream: TFileStream; var MP4Atom: TMP4Atom): Boolean;
    function ReadAtomData(MP4Stream: TFileStream; var MP4AtomData: TMP4AtomData): Boolean;
    function Count: Integer;
    function CoverArtCount: Integer;
    procedure Clear;
    function DeleteAtom(Index: Integer): Boolean; overload;
    function DeleteAtom(AtomName: TAtomName): Boolean; overload;
    function DeleteAtom(AtomName: String): Boolean; overload;
    procedure CompactAtomList;
    function CalculateSize: UInt64;
    function FindAtom(AtomName: TAtomName): TMP4Atom; overload;
    function FindAtom(AtomName: String): TMP4Atom; overload;
    function GetText(AtomName: TAtomName): String; overload;
    function GetText(AtomName: String): String; overload;
    function GetInteger(AtomName: TAtomName): Int64; overload;
    function GetInteger(AtomName: String): Int64; overload;
    function GetInteger8(AtomName: TAtomName): Byte; overload;
    function GetInteger8(AtomName: String): Byte; overload;
    function GetInteger16(AtomName: TAtomName): Word; overload;
    function GetInteger16(AtomName: String): Word; overload;
    function GetInteger32(AtomName: TAtomName): DWord; overload;
    function GetInteger32(AtomName: String): DWord; overload;
    function GetInteger48(AtomName: TAtomName; var LowDWord: DWord; HiWord: Word): Int64; overload;
    function GetInteger48(AtomName: String; var LowDWord: DWord; HiWord: Word): Int64; overload;
    function GetInteger64(AtomName: TAtomName; var LowDWord, HiDWord: DWord): Int64; overload;
    function GetInteger64(AtomName: String; var LowDWord, HiDWord: DWord): Int64; overload;
    function GetBool(AtomName: TAtomName): Boolean; overload;
    function GetBool(AtomName: String): Boolean; overload;
    function SetText(AtomName: TAtomName; Text: String): Boolean; overload;
    function SetText(AtomName: String; Text: String): Boolean; overload;
    function SetInteger8(AtomName: TAtomName; Value: Byte): Boolean; overload;
    function SetInteger8(AtomName: String; Value: Byte): Boolean; overload;
    function SetInteger16(AtomName: TAtomName; Value: Word): Boolean; overload;
    function SetInteger16(AtomName: String; Value: Word): Boolean; overload;
    function SetInteger32(AtomName: TAtomName; Value: DWord): Boolean; overload;
    function SetInteger32(AtomName: String; Value: DWord): Boolean; overload;
    function SetInteger48(AtomName: TAtomName; Value: Int64): Boolean; overload;
    function SetInteger48(AtomName: String; Value: Int64): Boolean; overload;
    function SetInteger48(AtomName: TAtomName; LowDWord: DWord; HighWord: Word): Boolean; overload;
    function SetInteger48(AtomName: String; LowDWord: DWord; HighWord: Word): Boolean; overload;
    function SetInteger64(AtomName: TAtomName; Value: Int64): Boolean; overload;
    function SetInteger64(AtomName: TAtomName; LowDWord, HighDWord: DWord): Boolean; overload;
    function SetInteger64(AtomName: String; Value: Int64): Boolean; overload;
    function SetInteger64(AtomName: String; LowDWord, HighDWord: DWord): Boolean; overload;
    function SetBool(AtomName: TAtomName; Value: Boolean): Boolean; overload;
    function SetBool(AtomName: String; Value: Boolean): Boolean; overload;
    function GetMediaType: String;
    function SetMediaType(Media: String): Boolean;
    function GetTrack: Word;
    function GetTotalTracks: Word;
    function GetDisc: Word;
    function GetTotalDiscs: Word;
    function SetTrack(Track: Word; TotalTracks: Word): Boolean;
    function SetDisc(Disc: Word; TotalDiscs: Word): Boolean;
    function GetGenre: String;
    function SetGenre(Genre: String): Boolean;
    function GetPurchaseCountry: String;
    function SetPurchaseCountry(Country: String): Boolean;
    function Assign(MP4Tag: TMP4Tag): Boolean;
    function GetMultipleValues(AtomName: TAtomName; List: TStrings): Boolean; overload;
    function GetMultipleValues(AtomName: String; List: TStrings): Boolean; overload;
    procedure SetMultipleValues(AtomName: TAtomName; List: TStrings); overload;
    procedure SetMultipleValues(AtomName: String; List: TStrings); overload;
  end;

function ReadAtomHeader(MP4Stream: TFileStream; var AtomName: TAtomName; var AtomSize: Int64): Boolean;
function WriteAtomHeader(MP4Stream: TFileStream; AtomName: TAtomName; AtomSize: Int64): Boolean; overload;
function WriteAtomHeader(MP4Stream: TFileStream; AtomName: String; AtomSize: Int64): Boolean; overload;
function WritePadding(MP4Stream: TStream; PaddingSize: Integer): Integer;
function MP4mdatAtomLocation(MP4Stream: TFileStream): Int64;
function MP4UpdatestcoAtom(MP4Stream: TFileStream; Offset: Integer): Boolean;
function MP4Updateco64Atom(MP4Stream: TFileStream; Offset: Int64): Boolean;

function RemoveMP4TagFromFile(FileName: String; KeepPadding: Boolean): Integer;

function ReverseBytes16(ASmallInt: SmallInt): SmallInt; inline;
function ReverseBytes32(Value: Cardinal): Cardinal; inline;
function ReverseBytes64(const aVal: Int64): Int64; inline;

function MakeInt64(LowDWord, HiDWord: DWord): Int64; inline;
function LowDWordOfInt64(Value: Int64): Cardinal; inline;
function HighDWordOfInt64(Value: Int64): Cardinal; inline;

function LoWord(L: DWord): Word; inline;
function HiWord(L: DWord): Word; inline;

// procedure AnsiStringToPAnsiChar(const Source: String; Dest: PChar; const MaxLength: Integer);

function GenreToIndex(Genre: String): Integer;

function IsSameAtomName(ID: TAtomName; name: String): Boolean; overload;
function IsSameAtomName(ID1: TAtomName; ID2: TAtomName): Boolean; overload;

function StringToAtomName(name: String; var ID: TAtomName): Boolean;
function AtomNameToString(ID: TAtomName): String;

function MP4TagErrorCode2String(ErrorCode: Integer): String;

implementation

{$IFDEF POSIX}

Uses
  Posix.UniStd;
// Posix.StdIO;
{$ENDIF}

var
  MP4AtomDataID: TAtomName;
  MP4AtommeanID: TAtomName;
  MP4AtomnameID: TAtomName;

function ReverseBytes32(Value: Cardinal): Cardinal;
begin
  Result := (Value SHR 24) OR (Value SHL 24) OR ((Value AND $00FF0000) SHR 8) OR ((Value AND $0000FF00) SHL 8);
end;

function ReverseBytes64(const aVal: Int64): Int64; inline;
begin
  Int64Rec(Result).Bytes[0] := Int64Rec(aVal).Bytes[7];
  Int64Rec(Result).Bytes[1] := Int64Rec(aVal).Bytes[6];
  Int64Rec(Result).Bytes[2] := Int64Rec(aVal).Bytes[5];
  Int64Rec(Result).Bytes[3] := Int64Rec(aVal).Bytes[4];
  Int64Rec(Result).Bytes[4] := Int64Rec(aVal).Bytes[3];
  Int64Rec(Result).Bytes[5] := Int64Rec(aVal).Bytes[2];
  Int64Rec(Result).Bytes[6] := Int64Rec(aVal).Bytes[1];
  Int64Rec(Result).Bytes[7] := Int64Rec(aVal).Bytes[0];
end;

function ReverseBytes16(ASmallInt: SmallInt): SmallInt;
begin
  Result := Swap(ASmallInt);
end;

function MakeInt64(LowDWord, HiDWord: DWord): Int64;
begin
  Result := LowDWord OR (Int64(HiDWord) SHL 32);
end;

function LowDWordOfInt64(Value: Int64): Cardinal;
begin
  Result := (Value SHL 32) SHR 32;
end;

function HighDWordOfInt64(Value: Int64): Cardinal;
begin
  Result := Value SHR 32;
end;

function Min(const B1, B2: Integer): Integer;
begin
  if B1 < B2 then
  begin
    Result := B1
  end
  else
  begin
    Result := B2;
  end;
end;

{
  procedure AnsiStringToPAnsiChar(const Source: String; Dest: PChar; const MaxLength: Integer);
  begin
  Move(PChar(Source)^, Dest^, Min(MaxLength, Length(Source)));
  end;
}

function LoWord(L: DWord): Word;
begin
  Result := L;
end;

function HiWord(L: DWord): Word;
begin
  Result := L SHR 16;
end;

Constructor TMP4Atommean.Create;
begin
  Inherited;
  Data := TMemoryStream.Create;
end;

Destructor TMP4Atommean.Destroy;
begin
  FreeAndNil(Data);
  Inherited;
end;

procedure TMP4Atommean.Clear;
begin
  Data.Clear;
end;

function TMP4Atommean.Write(MP4Stream: TStream): Boolean;
var
  AtomSizeLE: DWord;
begin
  Result := False;
  try
    if Data.Size > 0 then
    begin
      AtomSizeLE := ReverseBytes32(Data.Size + 8);
      MP4Stream.Write(AtomSizeLE, 4);
      MP4Stream.Write(MP4AtommeanID, 4);
      Data.Seek(0, soBeginning);
      MP4Stream.CopyFrom(Data, Data.Size);
      Data.Seek(0, soBeginning);
      Result := True;
    end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Atommean.Assign(MP4Atommean: TMP4Atommean): Boolean;
begin
  Clear;
  if MP4Atommean <> nil then
  begin
    MP4Atommean.Data.Seek(0, soBeginning);
    Data.CopyFrom(MP4Atommean.Data, MP4Atommean.Data.Size);
    MP4Atommean.Data.Seek(0, soBeginning);
  end;
  Result := True;
end;

Constructor TMP4Atomname.Create;
begin
  Inherited;
  Data := TMemoryStream.Create;
end;

Destructor TMP4Atomname.Destroy;
begin
  FreeAndNil(Data);
  Inherited;
end;

procedure TMP4Atomname.Clear;
begin
  Data.Clear;
end;

function TMP4Atomname.Write(MP4Stream: TStream): Boolean;
var
  AtomSizeLE: DWord;
begin
  Result := False;
  try
    if Data.Size > 0 then
    begin
      AtomSizeLE := ReverseBytes32(Data.Size + 8);
      MP4Stream.Write(AtomSizeLE, 4);
      MP4Stream.Write(MP4AtomnameID, 4);
      Data.Seek(0, soBeginning);
      MP4Stream.CopyFrom(Data, Data.Size);
      Data.Seek(0, soBeginning);
      Result := True;
    end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Atomname.Assign(MP4Atomname: TMP4Atomname): Boolean;
begin
  Clear;
  if MP4Atomname <> nil then
  begin
    MP4Atomname.Data.Seek(0, soBeginning);
    Data.CopyFrom(MP4Atomname.Data, MP4Atomname.Data.Size);
    MP4Atomname.Data.Seek(0, soBeginning);
  end;
  Result := True;
end;

Constructor TMP4AtomData.Create;
begin
  Inherited;
  Data := TMemoryStream.Create;
end;

Destructor TMP4AtomData.Destroy;
begin
  FreeAndNil(Data);
  Inherited;
end;

function TMP4AtomData.GetAsText: String;
var
  i: Integer;
  DataByte: Byte;
  Bytes: TBytes;
begin
  Result := '';
  if DataType <> 1 then
  begin
    Exit;
  end;
  Data.Seek(0, soBeginning);
  SetLength(Bytes, Data.Size);
  for i := 0 to Data.Size - 1 do
  begin
    Data.Read(DataByte, 1);
    Bytes[i] := DataByte;
  end;
  Data.Seek(0, soBeginning);
  Result := Parent.Parent.UTF8Encoding.GetString(Bytes);
end;

function TMP4AtomData.GetAsInteger: Int64;
var
  LowDWord: DWord;
  HighDWord: DWord;
  HighWord: Word;
begin
  Result := 0;
  LowDWord := 0;
  HighDWord := 0;
  HighWord := 0;
  case Data.Size of
    1:
      Result := GetAsInteger8;
    2:
      Result := GetAsInteger16;
    4:
      Result := GetAsInteger32;
    6:
      Result := GetAsInteger48(LowDWord, HighWord);
    8:
      Result := GetAsInteger64(LowDWord, HighDWord);
  end;
end;

function TMP4AtomData.GetAsInteger8: Byte;
begin
  Result := 0;
  if (DataType <> 0) AND (DataType <> 21) then
  begin
    Exit;
  end;
  Data.Seek(0, soBeginning);
  Result := 0;
  Data.Read(Result, 1);
  Data.Seek(0, soBeginning);
end;

function TMP4AtomData.GetAsInteger16: Word;
begin
  Result := 0;
  if (DataType <> 0) AND (DataType <> 21) then
  begin
    Exit;
  end;
  Result := 0;
  Data.Seek(0, soBeginning);
  Data.Read(Result, 2);
  Data.Seek(0, soBeginning);
  Result := ReverseBytes16(Result);
end;

function TMP4AtomData.GetAsInteger32: DWord;
begin
  Result := 0;
  if (DataType <> 0) AND (DataType <> 21) then
  begin
    Exit;
  end;
  Result := 0;
  Data.Seek(0, soBeginning);
  Data.Read(Result, 4);
  Data.Seek(0, soBeginning);
  if Data.Size = 4 then
  begin
    Result := ReverseBytes32(Result);
  end;
end;

function TMP4AtomData.GetAsInteger48(var LowDWord: DWord; HighWord: Word): Int64;
begin
  Result := -1;
  LowDWord := 0;
  HighWord := 0;
  if (DataType <> 0) AND (DataType <> 21) then
  begin
    Exit;
  end;
  Data.Seek(0, soBeginning);
  Data.Read(HighWord, 2);
  Data.Read(LowDWord, 4);
  Data.Seek(0, soBeginning);
  HighWord := ReverseBytes16(HighWord);
  LowDWord := ReverseBytes32(LowDWord);
  Result := MakeInt64(LowDWord, HighWord);
end;

function TMP4AtomData.GetAsInteger64(var LowDWord, HighDWord: DWord): Int64;
begin
  Result := -1;
  LowDWord := 0;
  HighDWord := 0;
  if (DataType <> 0) AND (DataType <> 21) then
  begin
    Exit;
  end;
  Result := 0;
  Data.Seek(0, soBeginning);
  Data.Read(Result, 8);
  Data.Seek(0, soBeginning);
  Result := ReverseBytes64(Result);
  HighDWord := HighDWordOfInt64(Result);
  LowDWord := LowDWordOfInt64(Result);
end;

function TMP4AtomData.GetAsBool: Boolean;
var
  Value: Byte;
begin
  Value := GetAsInteger8;
  if Value = 0 then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

function TMP4AtomData.SetAsText(Text: String): Boolean;
var
  Bytes: TBytes;
begin
  Bytes := Parent.Parent.UTF8Encoding.GetBytes(Text);
  Data.Clear;
  Data.Write(Bytes[0], Length(Bytes));
  Data.Seek(0, soBeginning);
  DataType := 1;
  Result := True;
end;

function TMP4AtomData.SetAsInteger8(Value: Byte): Boolean;
begin
  DataType := 0;
  Data.Clear;
  Data.Write(Value, 1);
  Data.Seek(0, soBeginning);
  Result := True;
end;

function TMP4AtomData.SetAsInteger16(Value: Word): Boolean;
begin
  DataType := 0;
  Data.Clear;
  Value := ReverseBytes16(Value);
  Data.Write(Value, 2);
  Data.Seek(0, soBeginning);
  Result := True;
end;

function TMP4AtomData.SetAsInteger32(Value: DWord): Boolean;
begin
  DataType := 0;
  Data.Clear;
  Value := ReverseBytes32(Value);
  Data.Write(Value, 4);
  Data.Seek(0, soBeginning);
  Result := True;
end;

function TMP4AtomData.SetAsInteger48(Value: Int64): Boolean;
var
  LowDWord: DWord;
  HiWord: Word;
begin
  LowDWord := LowDWordOfInt64(Value);
  HiWord := HighDWordOfInt64(Value);
  Result := SetAsInteger48(LowDWord, HiWord);
end;

function TMP4AtomData.SetAsInteger48(LowDWord: DWord; HighWord: Word): Boolean;
begin
  DataType := 0;
  Data.Clear;
  LowDWord := ReverseBytes32(LowDWord);
  HighWord := ReverseBytes16(HighWord);
  Data.Write(HighWord, 2);
  Data.Write(LowDWord, 4);
  Data.Seek(0, soBeginning);
  Result := True;
end;

function TMP4AtomData.SetAsInteger64(Value: Int64): Boolean;
var
  LowDWord: DWord;
  HighDWord: DWord;
begin
  LowDWord := LowDWordOfInt64(Value);
  HighDWord := HighDWordOfInt64(Value);
  Result := SetAsInteger64(LowDWord, HighDWord);
end;

function TMP4AtomData.SetAsInteger64(LowDWord, HighDWord: DWord): Boolean;
var
  DataLE: UInt64;
  Value: UInt64;
begin
  DataType := 0;
  Data.Clear;
  Value := HighDWord;
  Value := Value SHL 32;
  Value := Value OR LowDWord;
  DataLE := ReverseBytes64(Value);
  Data.Write(DataLE, 8);
  Data.Seek(0, soBeginning);
  Result := True;
end;

function TMP4AtomData.SetAsBool(Value: Boolean): Boolean;
var
  Data: Byte;
begin
  Data := Byte(Value);
  Result := SetAsInteger8(Data);
end;

procedure TMP4AtomData.Clear;
begin
  DataType := 0;
  Data.Clear;
end;

function TMP4AtomData.Delete: Boolean;
begin
  Result := Parent.DeleteData(Self.Index);
end;

function TMP4AtomData.Assign(MP4AtomData: TMP4AtomData): Boolean;
begin
  Clear;
  if MP4AtomData <> nil then
  begin
    DataType := MP4AtomData.DataType;
    Reserved := MP4AtomData.Reserved;
    MP4AtomData.Data.Seek(0, soBeginning);
    Data.CopyFrom(MP4AtomData.Data, MP4AtomData.Data.Size);
    MP4AtomData.Data.Seek(0, soBeginning);
  end;
  Result := True;
end;

function TMP4AtomData.Write(MP4Stream: TStream): Boolean;
var
  AtomSizeLE: DWord;
  DataTypeLE: DWord;
begin
  Result := False;
  try
    // if Data.Size > 0 then begin
    AtomSizeLE := ReverseBytes32(Data.Size + 16);
    MP4Stream.Write(AtomSizeLE, 4);
    MP4Stream.Write(MP4AtomDataID, 4);
    DataTypeLE := ReverseBytes32(DataType);
    MP4Stream.Write(DataTypeLE, 4);
    MP4Stream.Write(Reserved, 4);
    Data.Seek(0, soBeginning);
    MP4Stream.CopyFrom(Data, Data.Size);
    Data.Seek(0, soBeginning);
    Result := True;
    // end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

Constructor TMP4Atom.Create;
begin
  Inherited;
  mean := TMP4Atommean.Create;
  name := TMP4Atomname.Create;
end;

Destructor TMP4Atom.Destroy;
begin
  FreeAndNil(mean);
  FreeAndNil(name);
  FillChar(ID, SizeOf(ID), 0);
  Inherited;
end;

function TMP4Atom.GetAsText: String;
var
  Value: Int64;
begin
  Result := '';
  if Datas[0].DataType = 1 then
  begin
    Result := Datas[0].GetAsText;
  end
  else
  begin
    Value := Datas[0].GetAsInteger;
    if Value <> -1 then
    begin
      Result := IntToStr(Value);
    end;
  end;
end;

function TMP4Atom.GetAsInteger: Int64;
begin
  Result := Datas[0].GetAsInteger;
end;

function TMP4Atom.GetAsInteger8: Byte;
begin
  Result := Datas[0].GetAsInteger8;
end;

function TMP4Atom.GetAsInteger16: Word;
begin
  Result := Datas[0].GetAsInteger16;
end;

function TMP4Atom.GetAsInteger32: DWord;
begin
  Result := Datas[0].GetAsInteger32;
end;

function TMP4Atom.GetAsInteger48(var LowDWord: DWord; HiWord: Word): Int64;
begin
  Result := Datas[0].GetAsInteger48(LowDWord, HiWord);
end;

function TMP4Atom.GetAsInteger64(var LowDWord, HiDWord: DWord): Int64;
begin
  Result := Datas[0].GetAsInteger64(LowDWord, HiDWord);
end;

function TMP4Atom.GetAsBool: Boolean;
begin
  Result := Datas[0].GetAsBool;
end;

function TMP4Atom.SetAsText(Text: String): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsText(Text);
end;

function TMP4Atom.SetAsInteger8(Value: Byte): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger8(Value);
end;

function TMP4Atom.SetAsInteger16(Value: Word): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger16(Value);
end;

function TMP4Atom.SetAsInteger32(Value: DWord): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger32(Value);
end;

function TMP4Atom.SetAsInteger48(Value: Int64): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger48(Value);
end;

function TMP4Atom.SetAsInteger48(LowDWord: DWord; HiWord: Word): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger48(LowDWord, HiWord);
end;

function TMP4Atom.SetAsInteger64(Value: Int64): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger64(Value);
end;

function TMP4Atom.SetAsInteger64(LowDWord, HiDWord: DWord): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsInteger64(LowDWord, HiDWord);
end;

function TMP4Atom.SetAsBool(Value: Boolean): Boolean;
begin
  if Count = 0 then
  begin
    AddData;
  end;
  Result := Datas[0].SetAsBool(Value);
end;

function TMP4Atom.AddData: TMP4AtomData;
begin
  Result := nil;
  try
    SetLength(Datas, Length(Datas) + 1);
    Datas[Length(Datas) - 1] := TMP4AtomData.Create;
    Datas[Length(Datas) - 1].Parent := Self;
    Datas[Length(Datas) - 1].Index := Length(Datas) - 1;
    Result := Datas[Length(Datas) - 1];
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Atom.Count;
begin
  Result := Length(Datas);
end;

procedure TMP4Atom.Clear;
var
  i: Integer;
begin
  for i := 0 to Length(Datas) - 1 do
  begin
    Datas[i].Clear;
    FreeAndNil(Datas[i]);
  end;
  SetLength(Datas, 0);
  mean.Clear;
  name.Clear;
end;

function TMP4Atom.CalculateAtomSize: Cardinal;
var
  i: Integer;
begin
  Result := 0;
  if mean.Data.Size > 0 then
  begin
    Result := Result + mean.Data.Size + 8;
  end;
  if name.Data.Size > 0 then
  begin
    Result := Result + name.Data.Size + 8;
  end;
  for i := 0 to Length(Datas) - 1 do
  begin
    // if Datas[i].Data.Size > 0 then begin
    Result := Result + Datas[i].Data.Size + 16;
    // end;
  end;
  Result := Result + 8;
end;

function TMP4Atom.Write(MP4Stream: TStream): Boolean;
var
  AtomSizeLE: DWord;
  i: Integer;
begin
  Result := False;
  try
    AtomSizeLE := ReverseBytes32(CalculateAtomSize);
    // if AtomSizeLE > 0 then begin
    MP4Stream.Write(AtomSizeLE, 4);
    MP4Stream.Write(ID, 4);
    if mean.Data.Size > 0 then
    begin
      mean.Write(MP4Stream);
    end;
    if name.Data.Size > 0 then
    begin
      name.Write(MP4Stream);
    end;
    for i := 0 to Count - 1 do
    begin
      Datas[i].Write(MP4Stream);
    end;
    Result := True;
    // end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

procedure TMP4Atom.Delete;
begin
  Parent.DeleteAtom(Self.Index);
end;

function TMP4Atom.DeleteData(Index: Integer): Boolean;
begin
  Result := False;
  if (Index >= Length(Datas)) OR (Index < 0) then
  begin
    Exit;
  end;
  FreeAndNil(Datas[Index]);
  CompactAtomDataList;
  Result := True;
end;

function TMP4Atom.Deletemean: Boolean;
begin
  mean.Clear;
  Result := True;
end;

function TMP4Atom.Deletename: Boolean;
begin
  name.Clear;
  Result := True;
end;

procedure TMP4Atom.CompactAtomDataList;
var
  i: Integer;
  Compacted: Boolean;
begin
  Compacted := False;
  if Datas[Length(Datas) - 1] = nil then
  begin
    Compacted := True;
  end
  else
  begin
    for i := 0 to Length(Datas) - 2 do
    begin
      if Datas[i] = nil then
      begin
        Datas[i] := Datas[i + 1];
        Datas[i].Index := i;
        Datas[i + 1] := nil;
        Compacted := True;
      end;
    end;
  end;
  if Compacted then
  begin
    SetLength(Datas, Length(Datas) - 1);
  end;
end;

function TMP4Atom.Assign(MP4Atom: TMP4Atom): Boolean;
var
  i: Integer;
begin
  Clear;
  if MP4Atom <> nil then
  begin
    ID := MP4Atom.ID;
    Flags := MP4Atom.Flags;
    for i := 0 to MP4Atom.Count - 1 do
    begin
      AddData.Assign(MP4Atom.Datas[i]);
    end;
    mean.Assign(MP4Atom.mean);
    name.Assign(MP4Atom.name);
  end;
  Result := True;
end;

Constructor TMP4Tag.Create;
begin
  Inherited;
  UTF8Encoding := TEncoding.UTF8;
  Clear;
  PaddingToWrite := MP4TAGLIBRARY_DEFAULT_PADDING_SIZE
end;

Destructor TMP4Tag.Destroy;
begin
  Clear;
  Inherited;
end;

function TMP4Tag.LoadFromFile(FileName: String): Integer;
var
  MP4Stream: TFileStream;
  AtomName: TAtomName;
  AtomSize: Int64;
  ilstAtomSize: Int64;
  ilstAtomPosition: Int64;
  NewAtom: TMP4Atom;
  moovAtomSize: Int64;
begin
  Clear;
  Self.Loaded := False;
  Self.FileName := FileName;
  try
    MP4Stream := TFileStream.Create(FileName, fmOpenRead OR fmShareDenyWrite);
  except
    Result := MP4TAGLIBRARY_ERROR_OPENING_FILE;
    Exit;
  end;
  try
    try
      Result := MP4TAGLIBRARY_ERROR_NO_TAG_FOUND;
      ReadAtomHeader(MP4Stream, AtomName, AtomSize);
      if NOT IsSameAtomName(AtomName, 'ftyp') then
      begin
        Result := MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT;
        Exit;
      end;
      MP4Stream.Seek(AtomSize - 8, soCurrent);
      repeat
        ReadAtomHeader(MP4Stream, AtomName, moovAtomSize);
        if IsSameAtomName(AtomName, 'moov') then
        begin
          repeat
            ReadAtomHeader(MP4Stream, AtomName, AtomSize);
            if IsSameAtomName(AtomName, 'udta') then
            begin
              repeat
                ReadAtomHeader(MP4Stream, AtomName, AtomSize);
                if IsSameAtomName(AtomName, 'meta') then
                begin
                  MP4Stream.Read(Version, 1);
                  MP4Stream.Read(Flags, 3);
                  repeat
                    ReadAtomHeader(MP4Stream, AtomName, ilstAtomSize);
                    if IsSameAtomName(AtomName, 'ilst') then
                    begin
                      ilstAtomPosition := MP4Stream.Position - 8;
                      while MP4Stream.Position < ilstAtomPosition + ilstAtomSize do
                      begin
                        NewAtom := AddAtom('');
                        ReadAtom(MP4Stream, NewAtom);
                        Result := MP4TAGLIBRARY_SUCCESS;
                        Self.Loaded := True;
                      end;
                      // Break;
                      Exit;
                    end
                    else
                    begin
                      if ilstAtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(ilstAtomSize - 16, soCurrent);
                      end
                      else
                      begin
                        MP4Stream.Seek(ilstAtomSize - 8, soCurrent);
                      end;
                    end;
                  until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position + ilstAtomSize >= MP4Stream.Size);
                end
                else
                begin
                  if AtomSize > High(Cardinal) then
                  begin
                    MP4Stream.Seek(AtomSize - 16, soCurrent);
                  end
                  else
                  begin
                    MP4Stream.Seek(AtomSize - 8, soCurrent);
                  end;
                end;
              until MP4Stream.Position >= MP4Stream.Size;
            end
            else
            begin
              if AtomSize > High(Cardinal) then
              begin
                MP4Stream.Seek(AtomSize - 16, soCurrent);
              end
              else
              begin
                MP4Stream.Seek(AtomSize - 8, soCurrent);
              end;
            end;
          until MP4Stream.Position >= MP4Stream.Size;
        end
        else
        begin
          if moovAtomSize > High(Cardinal) then
          begin
            MP4Stream.Seek(moovAtomSize - 16, soCurrent);
          end
          else
          begin
            MP4Stream.Seek(moovAtomSize - 8, soCurrent);
          end;
        end;
      until (MP4Stream.Position >= MP4Stream.Size) OR (moovAtomSize = 0);
    except
      Result := MP4TAGLIBRARY_ERROR_READING_FILE
    end;
  finally
    FreeAndNil(MP4Stream);
  end;
end;

function ReadAtomHeader(MP4Stream: TFileStream; var AtomName: TAtomName; var AtomSize: Int64): Boolean;
begin
  Result := False;
  try
    FillChar(AtomName, SizeOf(AtomName), 0);
    AtomSize := 0;
    MP4Stream.Read(AtomSize, 4);
    MP4Stream.Read(AtomName, 4);
    AtomSize := ReverseBytes32(AtomSize);
    // * 64 bit
    if AtomSize = 1 then
    begin
      MP4Stream.Read(AtomSize, 8);
      AtomSize := ReverseBytes64(AtomSize);
    end;
    Result := True;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function WriteAtomHeader(MP4Stream: TFileStream; AtomName: TAtomName; AtomSize: Int64): Boolean;
var
  AtomSizeLE: DWord;
  AtomSize64: UInt64;
begin
  Result := False;
  try
    // * 32 bit
    if AtomSize <= High(Cardinal) then
    begin
      AtomSizeLE := ReverseBytes32(AtomSize);
      MP4Stream.Write(AtomSizeLE, 4);
      MP4Stream.Write(AtomName, 4);
      // * 64 bit
    end
    else
    begin
      AtomSizeLE := ReverseBytes32(1);
      MP4Stream.Write(AtomSizeLE, 4);
      MP4Stream.Write(AtomName, 4);
      AtomSize64 := ReverseBytes64(AtomSize);
      MP4Stream.Write(AtomSize64, 8);
    end;
    Result := True;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function WriteAtomHeader(MP4Stream: TFileStream; AtomName: String; AtomSize: Int64): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := WriteAtomHeader(MP4Stream, AtomID, AtomSize);
end;

function TMP4Tag.ReadAtom(MP4Stream: TFileStream; var MP4Atom: TMP4Atom): Boolean;
var
  AtomSize: DWord;
  AtomName: TAtomName;
  AtomData: TMP4AtomData;
  AtomPosition: Int64;
begin
  Result := False;
  try
    MP4Stream.Read(AtomSize, 4);
    MP4Stream.Read(AtomName, 4);
    MP4Atom.Size := ReverseBytes32(AtomSize);
    MP4Atom.ID := AtomName;
    AtomPosition := MP4Stream.Position - 8;
    while MP4Stream.Position < AtomPosition + MP4Atom.Size do
    begin
      MP4Stream.Read(AtomSize, 4);
      MP4Stream.Read(AtomName, 4);
      AtomSize := ReverseBytes32(AtomSize);
      if IsSameAtomName(AtomName, 'mean') then
      begin
        if AtomSize > 8 then
        begin
          MP4Atom.mean.Data.CopyFrom(MP4Stream, AtomSize - 8);
        end;
      end
      else
      begin
        if IsSameAtomName(AtomName, 'name') then
        begin
          if AtomSize > 8 then
          begin
            MP4Atom.name.Data.CopyFrom(MP4Stream, AtomSize - 8);
          end;
        end
        else
        begin
          if IsSameAtomName(AtomName, 'data') then
          begin
            MP4Stream.Seek(-8, soCurrent);
            AtomData := MP4Atom.AddData;
            ReadAtomData(MP4Stream, AtomData);
          end
          else
          begin
            MP4Stream.Seek(AtomSize - 8, soCurrent);
          end;
        end;
      end;
      Result := True;
    end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Tag.ReadAtomData(MP4Stream: TFileStream; var MP4AtomData: TMP4AtomData): Boolean;
var
  AtomSize: DWord;
  AtomName: TAtomName;
  DataType: DWord;
begin
  Result := False;
  try
    MP4Stream.Read(AtomSize, 4);
    MP4Stream.Read(AtomName, 4);
    AtomSize := ReverseBytes32(AtomSize);
    if IsSameAtomName(AtomName, 'data') then
    begin
      MP4Stream.Read(DataType, 4);
      MP4AtomData.DataType := ReverseBytes32(DataType);
      MP4Stream.Read(MP4AtomData.Reserved, 4);
      if AtomSize > 16 then
      begin
        MP4AtomData.Data.CopyFrom(MP4Stream, AtomSize - 16);
        MP4AtomData.Data.Seek(0, soBeginning);
      end;
      Result := True;
    end
    else
    begin
      MP4Stream.Seek(AtomSize - 16, soCurrent);
    end;
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Tag.AddAtom(AtomName: TAtomName): TMP4Atom;
begin
  Result := nil;
  try
    SetLength(Atoms, Length(Atoms) + 1);
    Atoms[Length(Atoms) - 1] := TMP4Atom.Create;
    Atoms[Length(Atoms) - 1].ID := AtomName;
    Atoms[Length(Atoms) - 1].Parent := Self;
    Atoms[Length(Atoms) - 1].Index := Length(Atoms) - 1;
    Result := Atoms[Length(Atoms) - 1];
  except
    On E: exception do
    begin
      // *
    end;
  end;
end;

function TMP4Tag.AddAtom(AtomName: String): TMP4Atom;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := AddAtom(AtomID);
end;

function TMP4Tag.Count: Integer;
begin
  Result := Length(Atoms);
end;

procedure TMP4Tag.Clear;
var
  i: Integer;
begin
  for i := 0 to Length(Atoms) - 1 do
  begin
    Atoms[i].Clear;
    FreeAndNil(Atoms[i]);
  end;
  SetLength(Atoms, 0);
  Version := 0;
  Flags := 0;
end;

function TMP4Tag.DeleteAtom(Index: Integer): Boolean;
begin
  Result := False;
  if (Index >= Length(Atoms)) OR (Index < 0) then
  begin
    Exit;
  end;
  FreeAndNil(Atoms[Index]);
  CompactAtomList;
  Result := True;
end;

function TMP4Tag.DeleteAtom(AtomName: TAtomName): Boolean;
var
  Atom: TMP4Atom;
begin
  Result := False;
  Atom := FindAtom(AtomName);
  if Assigned(Atom) then
  begin
    Atom.Delete;
    Result := True;
  end;
end;

function TMP4Tag.DeleteAtom(AtomName: String): Boolean;
var
  ID: TAtomName;
begin
  StringToAtomName(AtomName, ID);
  Result := DeleteAtom(ID);
end;

procedure TMP4Tag.CompactAtomList;
var
  i: Integer;
  Compacted: Boolean;
begin
  Compacted := False;
  if Atoms[Length(Atoms) - 1] = nil then
  begin
    Compacted := True;
  end
  else
  begin
    for i := 0 to Length(Atoms) - 2 do
    begin
      if Atoms[i] = nil then
      begin
        Atoms[i] := Atoms[i + 1];
        Atoms[i].Index := i;
        Atoms[i + 1] := nil;
        Compacted := True;
      end;
    end;
  end;
  if Compacted then
  begin
    SetLength(Atoms, Length(Atoms) - 1);
  end;
end;

function TMP4Tag.CalculateSize: UInt64;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Atoms[i].CalculateAtomSize;
  end;
  if Result > 0 then
  begin
    Inc(Result, 8);
  end;
  if Result > High(Cardinal) then
  begin
    Inc(Result, 8);
  end;
end;

function TMP4Tag.SaveToFile(FileName: String): Integer;
var
  MP4Stream: TFileStream;
  AtomName: TAtomName;
  AtomSize: Int64;
  moovAtomSize: Int64;
  moovAtomPosition: Int64;
  udtaAtomSize: Int64;
  udtaAtomPosition: Int64;
  metaAtomSize: Int64;
  metaAtomPosition: Int64;
  freeAtomSize: Int64;
  ilstAtomSize: Int64;
  ilstAtomPosition: Int64;
  NewmoovAtomSize: Int64;
  NewudtaAtomSize: Int64;
  NewmetaAtomSize: Int64;
  NewilstAtomSize: Int64;
  ilstAtomFound: Boolean;
  metaAtomFound: Boolean;
  udtaAtomFound: Boolean;
  i: Integer;
  NewTagSize: Cardinal;
  Version: Byte;
  Flags: DWord;
  StreamRest: TFileStream;
  moovAtomRest: TFileStream;
  udtaAtomRest: TFileStream;
  metaAtomRest: TFileStream;
  StreamRestFileName: String;
  moovAtomRestFileName: String;
  udtaAtomRestFileName: String;
  metaAtomRestFileName: String;
  PaddingToWrite: Integer;
  NeedToUpdateRootAtoms: Boolean;
  freeAtomWasRootAtom: Boolean;
  mdatPreviousLocation: Int64;
  mdatNewLocation: Int64;
  NewAtomHeaderSize: Integer;
  CreateNewmetaAtom: Boolean;
  CreateNewudtaAtom: Boolean;
  metaAtomWas32bit: Boolean;
  udtaAtomWas32bit: Boolean;
  moovAtomWas32bit: Boolean;
begin
  NewTagSize := CalculateSize;
  if NewTagSize = 0 then
  begin
    Result := MP4TAGLIBRARY_ERROR_EMPTY_TAG;
    Exit;
  end;
  Self.Loaded := False;
  Self.FileName := FileName;
  Version := 0;
  Flags := 0;
  moovAtomSize := 0;
  moovAtomPosition := 0;
  udtaAtomSize := 0;
  udtaAtomPosition := 0;
  metaAtomSize := 0;
  metaAtomPosition := 0;
  freeAtomSize := 0;
  ilstAtomSize := 0;
  ilstAtomPosition := 0;
  NewAtomHeaderSize := 0;
  NeedToUpdateRootAtoms := False;
  freeAtomWasRootAtom := False;
  ilstAtomFound := False;
  metaAtomFound := False;
  udtaAtomFound := False;
  CreateNewmetaAtom := False;
  CreateNewudtaAtom := False;
  metaAtomWas32bit := False;
  udtaAtomWas32bit := False;
  moovAtomWas32bit := False;
  try
    if NOT FileExists(FileName) then
    begin
      MP4Stream := TFileStream.Create(FileName, fmCreate OR fmShareDenyWrite);
    end
    else
    begin
      MP4Stream := TFileStream.Create(FileName, fmOpenReadWrite OR fmShareDenyWrite);
    end;
  except
    Result := MP4TAGLIBRARY_ERROR_OPENING_FILE;
    Exit;
  end;
  try
    StreamRestFileName := ChangeFileExt(FileName, '.rest');
    moovAtomRestFileName := ChangeFileExt(FileName, '.moovAtomRest');
    udtaAtomRestFileName := ChangeFileExt(FileName, '.udtaAtomRest');
    metaAtomRestFileName := ChangeFileExt(FileName, '.metaAtomRest');
    StreamRest := TFileStream.Create(StreamRestFileName, fmCreate);
    moovAtomRest := TFileStream.Create(moovAtomRestFileName, fmCreate);
    udtaAtomRest := TFileStream.Create(udtaAtomRestFileName, fmCreate);
    metaAtomRest := TFileStream.Create(metaAtomRestFileName, fmCreate);
    MP4Stream.Seek(0, soBeginning);
    mdatPreviousLocation := MP4mdatAtomLocation(MP4Stream);
    MP4Stream.Seek(0, soBeginning);
    repeat
      ReadAtomHeader(MP4Stream, AtomName, AtomSize);
      if IsSameAtomName(AtomName, 'moov') then
      begin
        moovAtomSize := AtomSize;
        if moovAtomSize > High(Cardinal) then
        begin
          moovAtomPosition := MP4Stream.Position - 16;
        end
        else
        begin
          moovAtomPosition := MP4Stream.Position - 8;
        end;
        MP4Stream.Seek(moovAtomPosition + moovAtomSize, soBeginning);
        ReadAtomHeader(MP4Stream, AtomName, AtomSize);
        if IsSameAtomName(AtomName, 'free') then
        begin
          freeAtomSize := AtomSize;
          // freeAtomPosition := MP4Stream.Position - 8;
          if moovAtomPosition + moovAtomSize < MP4Stream.Size then
          begin
            MP4Stream.Seek(moovAtomPosition + moovAtomSize + freeAtomSize, soBeginning);
            StreamRest.CopyFrom(MP4Stream, MP4Stream.Size - (moovAtomPosition + moovAtomSize + freeAtomSize));
            if moovAtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
            end
            else
            begin
              MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
            end;
          end;
          NeedToUpdateRootAtoms := True;
          freeAtomWasRootAtom := True;
        end
        else
        begin
          if moovAtomPosition + moovAtomSize < MP4Stream.Size then
          begin
            MP4Stream.Seek(moovAtomPosition + moovAtomSize, soBeginning);
            StreamRest.CopyFrom(MP4Stream, MP4Stream.Size - (moovAtomPosition + moovAtomSize));
            if moovAtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
            end
            else
            begin
              MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
            end;
          end;
        end;
        if moovAtomSize > High(Cardinal) then
        begin
          MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
        end
        else
        begin
          MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
        end;
        repeat
          ReadAtomHeader(MP4Stream, AtomName, AtomSize);
          if IsSameAtomName(AtomName, 'udta') then
          begin
            udtaAtomFound := True;
            udtaAtomSize := AtomSize;
            if udtaAtomSize > High(Cardinal) then
            begin
              udtaAtomPosition := MP4Stream.Position - 16;
            end
            else
            begin
              udtaAtomPosition := MP4Stream.Position - 8;
            end;
            if udtaAtomPosition + udtaAtomSize < moovAtomPosition + moovAtomSize then
            begin
              MP4Stream.Seek(udtaAtomPosition + udtaAtomSize, soBeginning);
              moovAtomRest.CopyFrom(MP4Stream, (moovAtomPosition + moovAtomSize) - (udtaAtomPosition + udtaAtomSize));
              if udtaAtomSize > High(Cardinal) then
              begin
                MP4Stream.Seek(udtaAtomPosition + 16, soBeginning);
              end
              else
              begin
                MP4Stream.Seek(udtaAtomPosition + 8, soBeginning);
              end;
            end;
            repeat
              ReadAtomHeader(MP4Stream, AtomName, AtomSize);
              if IsSameAtomName(AtomName, 'meta') then
              begin
                metaAtomFound := True;
                metaAtomSize := AtomSize;
                if metaAtomSize > High(Cardinal) then
                begin
                  metaAtomPosition := MP4Stream.Position - 16;
                end
                else
                begin
                  metaAtomPosition := MP4Stream.Position - 8;
                end;
                if metaAtomPosition + metaAtomSize < udtaAtomPosition + udtaAtomSize then
                begin
                  MP4Stream.Seek(metaAtomPosition + metaAtomSize, soBeginning);
                  udtaAtomRest.CopyFrom(MP4Stream, (udtaAtomPosition + udtaAtomSize) - (metaAtomPosition + metaAtomSize));
                  if metaAtomSize > High(Cardinal) then
                  begin
                    MP4Stream.Seek(metaAtomPosition + 16, soBeginning);
                  end
                  else
                  begin
                    MP4Stream.Seek(metaAtomPosition + 8, soBeginning);
                  end;
                end;
                MP4Stream.Read(Version, 1);
                MP4Stream.Read(Flags, 3);
                repeat
                  ReadAtomHeader(MP4Stream, AtomName, AtomSize);
                  if IsSameAtomName(AtomName, 'ilst') then
                  begin
                    ilstAtomFound := True;
                    ilstAtomSize := AtomSize;
                    if ilstAtomSize > High(Cardinal) then
                    begin
                      ilstAtomPosition := MP4Stream.Position - 16;
                    end
                    else
                    begin
                      ilstAtomPosition := MP4Stream.Position - 8;
                    end;
                    if ilstAtomPosition + ilstAtomSize < metaAtomPosition + metaAtomSize then
                    begin
                      MP4Stream.Seek(ilstAtomPosition + ilstAtomSize, soBeginning);
                      metaAtomRest.CopyFrom(MP4Stream, (metaAtomPosition + metaAtomSize) - (ilstAtomPosition + ilstAtomSize));
                      MP4Stream.Seek(ilstAtomPosition + ilstAtomSize, soBeginning);
                      AtomSize := 0;
                    end;
                    MP4Stream.Seek(ilstAtomPosition + ilstAtomSize, soBeginning);
                  end
                  else
                  begin
                    if (IsSameAtomName(AtomName, 'free')) AND (NOT NeedToUpdateRootAtoms) AND (NOT freeAtomWasRootAtom) then
                    begin
                      NeedToUpdateRootAtoms := False;
                      freeAtomWasRootAtom := False;
                      freeAtomSize := freeAtomSize + AtomSize;
                      // freeAtomPosition := MP4Stream.Position - 8;
                      if freeAtomSize = metaAtomRest.Size then
                      begin
                        metaAtomRest.Size := 0;
                      end;
                      if AtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(MP4Stream.Position - 16 + AtomSize, soBeginning);
                      end
                      else
                      begin
                        MP4Stream.Seek(MP4Stream.Position - 8 + AtomSize, soBeginning);
                      end;
                    end
                    else
                    begin
                      if NOT ilstAtomFound then
                      begin
                        if AtomSize > High(Cardinal) then
                        begin
                          ilstAtomPosition := MP4Stream.Position - 16 + AtomSize;
                        end
                        else
                        begin
                          ilstAtomPosition := MP4Stream.Position - 8 + AtomSize;
                        end;
                      end;
                      if AtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(AtomSize - 16, soCurrent);
                      end
                      else
                      begin
                        MP4Stream.Seek(AtomSize - 8, soCurrent);
                      end;
                    end;
                  end;
                until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= metaAtomPosition + metaAtomSize);
              end
              else
              begin
                // * Could fail for unknown new atoms after the moov atom
                if (NOT metaAtomFound) AND (NOT IsSameAtomName(AtomName, 'free')) AND (NOT IsSameAtomName(AtomName, 'mdat')) then
                begin
                  if AtomSize > High(Cardinal) then
                  begin
                    metaAtomPosition := MP4Stream.Position - 16 + AtomSize;
                  end
                  else
                  begin
                    metaAtomPosition := MP4Stream.Position - 8 + AtomSize;
                  end;
                end;
                if AtomSize > High(Cardinal) then
                begin
                  MP4Stream.Seek(AtomSize - 16, soCurrent);
                end
                else
                begin
                  MP4Stream.Seek(AtomSize - 8, soCurrent);
                end;
              end;
            until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= udtaAtomPosition + udtaAtomSize);
          end
          else
          begin
            // * Could fail for unknown new atoms
            if (NOT udtaAtomFound)
            // AND (AtomName <> 'mdat')
            then
            begin
              if AtomSize > High(Cardinal) then
              begin
                udtaAtomPosition := MP4Stream.Position - 16 + AtomSize;
              end
              else
              begin
                udtaAtomPosition := MP4Stream.Position - 8 + AtomSize;
              end;
            end;
            if AtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(AtomSize - 16, soCurrent);
            end
            else
            begin
              MP4Stream.Seek(AtomSize - 8, soCurrent);
            end;
          end;
        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= moovAtomPosition + moovAtomSize);
      end
      else
      begin
        if AtomSize > High(Cardinal) then
        begin
          MP4Stream.Seek(AtomSize - 16, soCurrent);
        end
        else
        begin
          MP4Stream.Seek(AtomSize - 8, soCurrent);
        end;
      end;
    until (MP4Stream.Position >= MP4Stream.Size) OR (AtomSize = 0);
    NewilstAtomSize := NewTagSize;
    if (NewTagSize <= ilstAtomSize + (freeAtomSize - 8))
    // * Compact check here
      AND (NOT((ilstAtomSize + (freeAtomSize - 8)) - NewTagSize > Self.PaddingToWrite)) AND (NOT NeedToUpdateRootAtoms) then
    begin
      PaddingToWrite := (ilstAtomSize + (freeAtomSize - 8)) - NewTagSize;
    end
    else
    begin
      PaddingToWrite := Self.PaddingToWrite;
      if freeAtomWasRootAtom then
      begin
        freeAtomSize := 0;
      end;
      // * When creating new file
      if MP4Stream.Size = 0 then
      begin
        WriteAtomHeader(MP4Stream, 'ftyp', 8);
        moovAtomPosition := 8;
        udtaAtomPosition := 16;
        metaAtomPosition := 24;
        ilstAtomPosition := 32 + 4;
      end;
      if metaAtomSize = 0 then
      begin
        CreateNewmetaAtom := True;
        metaAtomSize := 8 + 4;
      end;
      if udtaAtomSize = 0 then
      begin
        CreateNewudtaAtom := True;
        udtaAtomSize := 8;
      end;
      if moovAtomSize = 0 then
      begin
        moovAtomSize := 8;
      end;
      if metaAtomSize <= High(Cardinal) then
      begin
        metaAtomWas32bit := True;
      end;
      NewmetaAtomSize := (metaAtomSize - ilstAtomSize - freeAtomSize) + NewilstAtomSize + PaddingToWrite + 8;
      if (NewmetaAtomSize > High(Cardinal)) AND metaAtomWas32bit then
      begin
        Inc(NewmetaAtomSize, 8);
      end;
      if udtaAtomSize <= High(Cardinal) then
      begin
        udtaAtomWas32bit := True;
      end;
      NewudtaAtomSize := (udtaAtomSize - ilstAtomSize - freeAtomSize) + NewilstAtomSize + PaddingToWrite + 8;
      if CreateNewmetaAtom then
      begin
        Inc(NewudtaAtomSize, 8 + 4);
      end;
      if metaAtomWas32bit AND (NewmetaAtomSize > High(Cardinal)) then
      begin
        Inc(NewudtaAtomSize, 8);
      end;
      if (NewudtaAtomSize > High(Cardinal)) AND udtaAtomWas32bit then
      begin
        Inc(NewudtaAtomSize, 8);
      end;
      if moovAtomSize <= High(Cardinal) then
      begin
        moovAtomWas32bit := True;
      end;
      NewmoovAtomSize := (moovAtomSize - ilstAtomSize - freeAtomSize) + NewilstAtomSize + PaddingToWrite + 8;
      if CreateNewmetaAtom then
      begin
        Inc(NewmoovAtomSize, 8 + 4);
      end;
      if CreateNewudtaAtom then
      begin
        Inc(NewmoovAtomSize, 8);
      end;
      if metaAtomWas32bit AND (NewmetaAtomSize > High(Cardinal)) then
      begin
        Inc(NewmoovAtomSize, 8);
      end;
      if udtaAtomWas32bit AND (NewudtaAtomSize > High(Cardinal)) then
      begin
        Inc(NewmoovAtomSize, 8);
      end;
      if (NewmoovAtomSize > High(Cardinal)) AND moovAtomWas32bit then
      begin
        Inc(NewmoovAtomSize, 8);
      end;
      MP4Stream.Seek(moovAtomPosition, soBeginning);
      // * Write moov
      WriteAtomHeader(MP4Stream, 'moov', NewmoovAtomSize);
      if udtaAtomPosition > 0 then
      begin
        MP4Stream.Seek(udtaAtomPosition, soBeginning);
      end
      else
      begin
        MP4Stream.Seek(moovAtomPosition + moovAtomSize, soBeginning);
      end;
      // * Write udta
      udtaAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'udta', NewudtaAtomSize);
      if metaAtomPosition > 0 then
      begin
        MP4Stream.Seek(metaAtomPosition, soBeginning);
      end
      else
      begin
        MP4Stream.Seek(udtaAtomPosition + 8, soBeginning);
      end;
      // * Write meta
      WriteAtomHeader(MP4Stream, 'meta', NewmetaAtomSize);
      // * TODO: Reverse bytes ?
      MP4Stream.Write(Self.Version, 1);
      MP4Stream.Write(Self.Flags, 3);
    end;
    if ilstAtomPosition > 0 then
    begin
      MP4Stream.Seek(ilstAtomPosition, soBeginning);
    end;
    WriteAtomHeader(MP4Stream, 'ilst', NewilstAtomSize);
    for i := 0 to Count - 1 do
    begin
      Atoms[i].Write(MP4Stream);
    end;
    if PaddingToWrite > 0 then
    begin
      freeAtomSize := PaddingToWrite + 8;
      // freeAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'free', freeAtomSize);
      WritePadding(MP4Stream, PaddingToWrite);
    end;
    metaAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(metaAtomRest, metaAtomRest.Size);
    udtaAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(udtaAtomRest, udtaAtomRest.Size);
    moovAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(moovAtomRest, moovAtomRest.Size);
    StreamRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(StreamRest, StreamRest.Size);
    MP4Stream.Size := MP4Stream.Position;
    MP4Stream.Seek(0, soBeginning);
    mdatNewLocation := MP4mdatAtomLocation(MP4Stream);
    MP4Stream.Seek(0, soBeginning);
    if mdatNewLocation - mdatPreviousLocation <> 0 then
    begin
      MP4Stream.Seek(0, soBeginning);
      if NOT MP4UpdatestcoAtom(MP4Stream, mdatNewLocation - mdatPreviousLocation) then
      begin
        Result := MP4TAGLIBRARY_ERROR_UPDATE_stco;
        Exit;
      end;
      MP4Stream.Seek(0, soBeginning);
      if NOT MP4Updateco64Atom(MP4Stream, mdatNewLocation - mdatPreviousLocation) then
      begin
        Result := MP4TAGLIBRARY_ERROR_UPDATE_co64;
        Exit;
      end;
    end;
    Result := MP4TAGLIBRARY_SUCCESS;
  finally
    FreeAndNil(StreamRest);
    FreeAndNil(moovAtomRest);
    FreeAndNil(udtaAtomRest);
    FreeAndNil(metaAtomRest);
    FreeAndNil(MP4Stream);
    DeleteFile(StreamRestFileName);
    DeleteFile(moovAtomRestFileName);
    DeleteFile(udtaAtomRestFileName);
    DeleteFile(metaAtomRestFileName);
  end;
end;

function TMP4Tag.FindAtom(AtomName: TAtomName): TMP4Atom;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if IsSameAtomName(Atoms[i].ID, AtomName) then
    begin
      Result := Atoms[i];
      Exit;
    end;
  end;
end;

function TMP4Tag.FindAtom(AtomName: String): TMP4Atom;
var
  ID: TAtomName;
begin
  StringToAtomName(AtomName, ID);
  Result := FindAtom(ID);
end;

function TMP4Tag.CoverArtCount: Integer;
begin
  Result := 0;
  if Assigned(FindAtom('covr')) then
  begin
    Result := Length(FindAtom('covr').Datas);
  end;
end;

function TMP4Tag.GetText(AtomName: TAtomName): String;
var
  MP4Atom: TMP4Atom;
begin
  Result := '';
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsText;
  end;
end;

function TMP4Tag.GetText(AtomName: String): String;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetText(AtomID);
end;

function TMP4Tag.GetInteger(AtomName: TAtomName): Int64;
var
  MP4Atom: TMP4Atom;
begin
  Result := 0;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger;
  end;
end;

function TMP4Tag.GetInteger(AtomName: String): Int64;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger(AtomID);
end;

function TMP4Tag.GetInteger8(AtomName: TAtomName): Byte;
var
  MP4Atom: TMP4Atom;
begin
  Result := 0;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger8;
  end;
end;

function TMP4Tag.GetInteger8(AtomName: String): Byte;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger8(AtomID);
end;

function TMP4Tag.GetInteger16(AtomName: TAtomName): Word;
var
  MP4Atom: TMP4Atom;
begin
  Result := 0;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger16;
  end;
end;

function TMP4Tag.GetInteger16(AtomName: String): Word;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger16(AtomID);
end;

function TMP4Tag.GetInteger32(AtomName: TAtomName): DWord;
var
  MP4Atom: TMP4Atom;
begin
  Result := 0;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger32;
  end;
end;

function TMP4Tag.GetInteger32(AtomName: String): DWord;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger32(AtomID);
end;

function TMP4Tag.GetInteger48(AtomName: TAtomName; var LowDWord: DWord; HiWord: Word): Int64;
var
  MP4Atom: TMP4Atom;
begin
  Result := -1;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger48(LowDWord, HiWord);
  end;
end;

function TMP4Tag.GetInteger48(AtomName: String; var LowDWord: DWord; HiWord: Word): Int64;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger48(AtomID, LowDWord, HiWord);
end;

function TMP4Tag.GetInteger64(AtomName: TAtomName; var LowDWord, HiDWord: DWord): Int64;
var
  MP4Atom: TMP4Atom;
begin
  Result := -1;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsInteger64(LowDWord, HiDWord);
  end;
end;

function TMP4Tag.GetInteger64(AtomName: String; var LowDWord, HiDWord: DWord): Int64;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetInteger64(AtomID, LowDWord, HiDWord);
end;

function TMP4Tag.GetBool(AtomName: TAtomName): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  Result := False;
  MP4Atom := FindAtom(AtomName);
  if Assigned(MP4Atom) then
  begin
    Result := MP4Atom.GetAsBool;
  end;
end;

function TMP4Tag.GetBool(AtomName: String): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := GetBool(AtomID);
end;

function TMP4Tag.SetText(AtomName: TAtomName; Text: String): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if Text <> '' then
  begin
    if NOT Assigned(MP4Atom) then
    begin
      MP4Atom := AddAtom(AtomName);
    end;
    Result := MP4Atom.SetAsText(Text);
  end
  else
  begin
    if Assigned(MP4Atom) then
    begin
      DeleteAtom(MP4Atom.Index);
    end;
    Result := True;
  end;
end;

function TMP4Tag.SetText(AtomName: String; Text: String): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetText(AtomID, Text);
end;

function TMP4Tag.SetInteger8(AtomName: TAtomName; Value: Byte): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger8(Value);
end;

function TMP4Tag.SetInteger8(AtomName: String; Value: Byte): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger8(AtomID, Value);
end;

function TMP4Tag.SetInteger16(AtomName: TAtomName; Value: Word): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger16(Value);
end;

function TMP4Tag.SetInteger16(AtomName: String; Value: Word): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger16(AtomID, Value);
end;

function TMP4Tag.SetInteger32(AtomName: TAtomName; Value: DWord): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger32(Value);
end;

function TMP4Tag.SetInteger32(AtomName: String; Value: DWord): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger32(AtomID, Value);
end;

function TMP4Tag.SetInteger48(AtomName: TAtomName; Value: Int64): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger48(Value);
end;

function TMP4Tag.SetInteger48(AtomName: String; Value: Int64): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger48(AtomID, Value);
end;

function TMP4Tag.SetInteger48(AtomName: TAtomName; LowDWord: DWord; HighWord: Word): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger48(LowDWord, HighWord);
end;

function TMP4Tag.SetInteger48(AtomName: String; LowDWord: DWord; HighWord: Word): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger48(AtomID, LowDWord, HighWord);
end;

function TMP4Tag.SetInteger64(AtomName: TAtomName; Value: Int64): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger64(Value);
end;

function TMP4Tag.SetInteger64(AtomName: String; Value: Int64): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger64(AtomID, Value);
end;

function TMP4Tag.SetInteger64(AtomName: TAtomName; LowDWord, HighDWord: DWord): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsInteger64(LowDWord, HighDWord);
end;

function TMP4Tag.SetInteger64(AtomName: String; LowDWord, HighDWord: DWord): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetInteger64(AtomID, LowDWord, HighDWord);
end;

function TMP4Tag.SetBool(AtomName: TAtomName; Value: Boolean): Boolean;
var
  MP4Atom: TMP4Atom;
begin
  MP4Atom := FindAtom(AtomName);
  if NOT Assigned(MP4Atom) then
  begin
    MP4Atom := AddAtom(AtomName);
  end;
  Result := MP4Atom.SetAsBool(Value);
end;

function TMP4Tag.SetBool(AtomName: String; Value: Boolean): Boolean;
var
  AtomID: TAtomName;
begin
  StringToAtomName(AtomName, AtomID);
  Result := SetBool(AtomID, Value);
end;

function TMP4Tag.GetMediaType: String;
var
  Value: Integer;
begin
  Result := '';
  if FindAtom('stik') <> nil then
  begin
    Value := GetInteger16('stik');
    if Value <> -1 then
    begin
      case Value of
        0:
          Result := 'Movie';
        1:
          Result := 'Music';
        2:
          Result := 'Audiobook';
        6:
          Result := 'Music Video';
        9:
          Result := 'Movie';
        10:
          Result := 'TV Show';
        11:
          Result := 'Booklet';
        14:
          Result := 'Ringtone';
      end;
    end;
  end;
end;

function TMP4Tag.GetMultipleValues(AtomName: String; List: TStrings): Boolean;
var
  ID: TAtomName;
begin
  StringToAtomName(AtomName, ID);
  Result := GetMultipleValues(ID, List);
end;

function TMP4Tag.GetMultipleValues(AtomName: TAtomName; List: TStrings): Boolean;
var
  i: Integer;
begin
  List.Clear;
  for i := 0 to Count - 1 do
  begin
    if IsSameAtomName(Atoms[i].ID, AtomName) then
    begin
      List.add(Atoms[i].GetAsText);
    end;
  end;
  Result := List.Count > 0;
end;

function TMP4Tag.SetMediaType(Media: String): Boolean;
begin
  Result := False;
  if Media = 'Movie' then
  begin
    Result := SetInteger16('stik', 9);
  end;
  if Media = 'Music' then
  begin
    Result := SetInteger16('stik', 1);
  end;
  if Media = 'Audiobook' then
  begin
    Result := SetInteger16('stik', 2);
  end;
  if Media = 'Music Video' then
  begin
    Result := SetInteger16('stik', 6);
  end;
  if Media = 'TV Show' then
  begin
    Result := SetInteger16('stik', 10);
  end;
  if Media = 'Booklet' then
  begin
    Result := SetInteger16('stik', 11);
  end;
  if Media = 'Ringtone' then
  begin
    Result := SetInteger16('stik', 14);
  end;
end;

procedure TMP4Tag.SetMultipleValues(AtomName: String; List: TStrings);
var
  ID: TAtomName;
begin
  StringToAtomName(AtomName, ID);
  SetMultipleValues(ID, List);
end;

procedure TMP4Tag.SetMultipleValues(AtomName: TAtomName; List: TStrings);
var
  i: Integer;
begin
  for i := Count - 1 downto 0 do
  begin
    if IsSameAtomName(Atoms[i].ID, AtomName) then
    begin
      DeleteAtom(i);
    end;
  end;
  for i := 0 to List.Count - 1 do
  begin
    AddAtom(AtomName).SetAsText(List[i]);
  end;
end;

function TMP4Tag.GetTrack: Word;
var
  LowDWord: DWord;
  HighWord: Word;
begin
  Result := 0;
  LowDWord := 0;
  HighWord := 0;
  if GetInteger48('trkn', LowDWord, HighWord) > -1 then
  begin
    GetInteger48('trkn', LowDWord, HighWord);
    Result := HiWord(LowDWord);
  end;
end;

function TMP4Tag.GetTotalTracks: Word;
var
  LowDWord: DWord;
  HighWord: Word;
begin
  Result := 0;
  LowDWord := 0;
  HighWord := 0;
  if GetInteger48('trkn', LowDWord, HighWord) > -1 then
  begin
    GetInteger48('trkn', LowDWord, HighWord);
    Result := LoWord(LowDWord);
  end;
end;

function TMP4Tag.GetDisc: Word;
var
  LowDWord: DWord;
  HighWord: Word;
begin
  Result := 0;
  LowDWord := 0;
  HighWord := 0;
  if GetInteger48('disk', LowDWord, HighWord) > -1 then
  begin
    GetInteger48('disk', LowDWord, HighWord);
    Result := HiWord(LowDWord);
  end;
end;

function TMP4Tag.GetTotalDiscs: Word;
var
  LowDWord: DWord;
  HighWord: Word;
begin
  Result := 0;
  LowDWord := 0;
  HighWord := 0;
  if GetInteger48('disk', LowDWord, HighWord) > -1 then
  begin
    GetInteger48('disk', LowDWord, HighWord);
    Result := LoWord(LowDWord);
  end;
end;

function TMP4Tag.SetTrack(Track: Word; TotalTracks: Word): Boolean;
var
  LowDWord: DWord;
  HighDWord: DWord;
  Atom: TMP4Atom;
begin
  if (Track = 0) AND (TotalTracks = 0) then
  begin
    Atom := FindAtom('trkn');
    if Assigned(Atom) then
    begin
      DeleteAtom(Atom.Index);
    end;
    Result := True;
  end
  else
  begin
    LowDWord := TotalTracks SHL 16;
    HighDWord := Track;
    Result := SetInteger64('trkn', LowDWord, HighDWord);
  end;
end;

function TMP4Tag.SetDisc(Disc: Word; TotalDiscs: Word): Boolean;
var
  Value: DWord;
  Atom: TMP4Atom;
begin
  if (Disc = 0) AND (TotalDiscs = 0) then
  begin
    Atom := FindAtom('disk');
    if Assigned(Atom) then
    begin
      DeleteAtom(Atom.Index);
    end;
    Result := True;
  end
  else
  begin
    Value := (Disc SHL 16) + TotalDiscs;
    Result := SetInteger48('disk', Value, 0);
  end;
end;

function WritePadding(MP4Stream: TStream; PaddingSize: Integer): Integer;
var
  i: Integer;
  Data: Byte;
begin
  try
    Data := $00;
    for i := 0 to PaddingSize - 1 do
    begin
      MP4Stream.Write(Data, 1);
    end;
    Result := MP4TAGLIBRARY_SUCCESS;
  except
    Result := MP4TAGLIBRARY_ERROR_WRITING_FILE;
  end;
end;

function RemoveMP4TagFromFile(FileName: String; KeepPadding: Boolean): Integer;
var
  MP4Stream: TFileStream;
  AtomName: TAtomName;
  AtomSize: Int64;
  moovAtomSize: Int64;
  moovAtomPosition: Int64;
  udtaAtomSize: Int64;
  udtaAtomPosition: Int64;
  metaAtomSize: Int64;
  metaAtomPosition: Int64;
  freeAtomSize: Int64;
  ilstAtomSize: Int64;
  ilstAtomPosition: Int64;
  Version: Byte;
  Flags: DWord;
  StreamRestFileName: String;
  moovAtomRestFileName: String;
  udtaAtomRestFileName: String;
  metaAtomRestFileName: String;
  StreamRest: TFileStream;
  moovAtomRest: TFileStream;
  udtaAtomRest: TFileStream;
  metaAtomRest: TFileStream;
  PaddingToWrite: Integer;
  mdatPreviousLocation: Int64;
  mdatNewLocation: Int64;
  freeAtomWasRootAtom: Boolean;
  RootAtomSize: Int64;
  metaAtomWas64bit: Boolean;
  udtaAtomWas64bit: Boolean;
  moovAtomWas64bit: Boolean;
begin
  Version := 0;
  Flags := 0;
  moovAtomSize := 0;
  moovAtomPosition := 0;
  udtaAtomSize := 0;
  udtaAtomPosition := 0;
  metaAtomSize := 0;
  metaAtomPosition := 0;
  freeAtomSize := 0;
  ilstAtomSize := 0;
  ilstAtomPosition := 0;
  freeAtomWasRootAtom := False;
  metaAtomWas64bit := False;
  udtaAtomWas64bit := False;
  moovAtomWas64bit := False;
  try
    if NOT FileExists(FileName) then
    begin
      Result := MP4TAGLIBRARY_ERROR_OPENING_FILE;
      Exit;
    end
    else
    begin
      MP4Stream := TFileStream.Create(FileName, fmOpenReadWrite OR fmShareDenyWrite);
    end;
  except
    Result := MP4TAGLIBRARY_ERROR_OPENING_FILE;
    Exit;
  end;
  try
    ReadAtomHeader(MP4Stream, AtomName, RootAtomSize);
    if NOT IsSameAtomName(AtomName, 'ftyp') then
    begin
      Result := MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT;
      Exit;
    end;
    MP4Stream.Seek(0, soBeginning);
    mdatPreviousLocation := MP4mdatAtomLocation(MP4Stream);
    MP4Stream.Seek(0, soBeginning);
    StreamRestFileName := ChangeFileExt(FileName, '.rest');
    moovAtomRestFileName := ChangeFileExt(FileName, '.moovAtomRest');
    udtaAtomRestFileName := ChangeFileExt(FileName, '.udtaAtomRest');
    metaAtomRestFileName := ChangeFileExt(FileName, '.metaAtomRest');
    StreamRest := TFileStream.Create(StreamRestFileName, fmCreate);
    moovAtomRest := TFileStream.Create(moovAtomRestFileName, fmCreate);
    udtaAtomRest := TFileStream.Create(udtaAtomRestFileName, fmCreate);
    metaAtomRest := TFileStream.Create(metaAtomRestFileName, fmCreate);
    repeat
      ReadAtomHeader(MP4Stream, AtomName, RootAtomSize);
      if IsSameAtomName(AtomName, 'moov') then
      begin
        moovAtomSize := RootAtomSize;
        if moovAtomSize > High(Cardinal) then
        begin
          moovAtomPosition := MP4Stream.Position - 16;
        end
        else
        begin
          moovAtomPosition := MP4Stream.Position - 8;
        end;
        MP4Stream.Seek(moovAtomPosition + moovAtomSize, soBeginning);
        ReadAtomHeader(MP4Stream, AtomName, AtomSize);
        if IsSameAtomName(AtomName, 'free') then
        begin
          freeAtomSize := AtomSize;
          // freeAtomPosition := MP4Stream.Position - 8;
          if (moovAtomPosition + moovAtomSize < MP4Stream.Size) AND (MP4Stream.Size - (moovAtomPosition + moovAtomSize + freeAtomSize) > 0) then
          begin
            MP4Stream.Seek(moovAtomPosition + moovAtomSize + freeAtomSize, soBeginning);
            StreamRest.CopyFrom(MP4Stream, MP4Stream.Size - (moovAtomPosition + moovAtomSize + freeAtomSize));
            if moovAtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
            end
            else
            begin
              MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
            end;
          end;
          freeAtomSize := 0;
          freeAtomWasRootAtom := True;
        end
        else
        begin
          if moovAtomPosition + moovAtomSize < MP4Stream.Size then
          begin
            MP4Stream.Seek(moovAtomPosition + moovAtomSize, soBeginning);
            StreamRest.CopyFrom(MP4Stream, MP4Stream.Size - (moovAtomPosition + moovAtomSize));
            if moovAtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
            end
            else
            begin
              MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
            end;
          end;
        end;
        if moovAtomSize > High(Cardinal) then
        begin
          MP4Stream.Seek(moovAtomPosition + 16, soBeginning);
        end
        else
        begin
          MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
        end;
        repeat
          ReadAtomHeader(MP4Stream, AtomName, AtomSize);
          if IsSameAtomName(AtomName, 'udta') then
          begin
            udtaAtomSize := AtomSize;
            if udtaAtomSize > High(Cardinal) then
            begin
              udtaAtomPosition := MP4Stream.Position - 16;
            end
            else
            begin
              udtaAtomPosition := MP4Stream.Position - 8;
            end;
            if udtaAtomPosition + udtaAtomSize < moovAtomPosition + moovAtomSize then
            begin
              MP4Stream.Seek(udtaAtomPosition + udtaAtomSize, soBeginning);
              moovAtomRest.CopyFrom(MP4Stream, (moovAtomPosition + moovAtomSize) - (udtaAtomPosition + udtaAtomSize));
              if udtaAtomSize > High(Cardinal) then
              begin
                MP4Stream.Seek(udtaAtomPosition + 16, soBeginning);
              end
              else
              begin
                MP4Stream.Seek(udtaAtomPosition + 8, soBeginning);
              end;
            end;
            repeat
              ReadAtomHeader(MP4Stream, AtomName, AtomSize);
              if IsSameAtomName(AtomName, 'meta') then
              begin
                metaAtomSize := AtomSize;
                if metaAtomSize > High(Cardinal) then
                begin
                  metaAtomPosition := MP4Stream.Position - 16;
                end
                else
                begin
                  metaAtomPosition := MP4Stream.Position - 8;
                end;
                if metaAtomPosition + metaAtomSize < udtaAtomPosition + udtaAtomSize then
                begin
                  MP4Stream.Seek(metaAtomPosition + metaAtomSize, soBeginning);
                  udtaAtomRest.CopyFrom(MP4Stream, (udtaAtomPosition + udtaAtomSize) - (metaAtomPosition + metaAtomSize));
                  if metaAtomSize > High(Cardinal) then
                  begin
                    MP4Stream.Seek(metaAtomPosition + 16, soBeginning);
                  end
                  else
                  begin
                    MP4Stream.Seek(metaAtomPosition + 8, soBeginning);
                  end;
                end;
                MP4Stream.Read(Version, 1);
                MP4Stream.Read(Flags, 3);
                repeat
                  ReadAtomHeader(MP4Stream, AtomName, AtomSize);
                  if IsSameAtomName(AtomName, 'ilst') then
                  begin
                    ilstAtomSize := AtomSize;
                    if ilstAtomSize > High(Cardinal) then
                    begin
                      ilstAtomPosition := MP4Stream.Position - 16;
                    end
                    else
                    begin
                      ilstAtomPosition := MP4Stream.Position - 8;
                    end;
                    if ilstAtomPosition + ilstAtomSize < metaAtomPosition + metaAtomSize then
                    begin
                      MP4Stream.Seek(ilstAtomPosition + ilstAtomSize, soBeginning);
                      metaAtomRest.CopyFrom(MP4Stream, (metaAtomPosition + metaAtomSize) - (ilstAtomPosition + ilstAtomSize));
                      MP4Stream.Seek(ilstAtomPosition + ilstAtomSize, soBeginning);
                      AtomSize := 0;
                    end
                    else
                    begin
                      if AtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(AtomSize - 16, soCurrent);
                      end
                      else
                      begin
                        MP4Stream.Seek(AtomSize - 8, soCurrent);
                      end;
                    end;
                  end
                  else
                  begin
                    if IsSameAtomName(AtomName, 'free') then
                    begin
                      freeAtomSize := freeAtomSize + AtomSize;
                      // freeAtomPosition := MP4Stream.Position - 8;
                      if freeAtomSize = metaAtomRest.Size then
                      begin
                        metaAtomRest.Size := 0;
                      end;
                      if AtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(MP4Stream.Position - 16 + AtomSize, soBeginning);
                      end
                      else
                      begin
                        MP4Stream.Seek(MP4Stream.Position - 8 + AtomSize, soBeginning);
                      end;
                    end
                    else
                    begin
                      if AtomSize > High(Cardinal) then
                      begin
                        MP4Stream.Seek(AtomSize - 16, soCurrent);
                      end
                      else
                      begin
                        MP4Stream.Seek(AtomSize - 8, soCurrent);
                      end;
                    end;
                  end;
                until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= metaAtomPosition + metaAtomSize);
              end
              else
              begin
                if AtomSize > High(Cardinal) then
                begin
                  MP4Stream.Seek(AtomSize - 16, soCurrent);
                end
                else
                begin
                  MP4Stream.Seek(AtomSize - 8, soCurrent);
                end;
              end;
            until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= udtaAtomPosition + udtaAtomSize);
          end
          else
          begin
            if AtomSize > High(Cardinal) then
            begin
              MP4Stream.Seek(AtomSize - 16, soCurrent);
            end
            else
            begin
              MP4Stream.Seek(AtomSize - 8, soCurrent);
            end;
          end;
        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= moovAtomPosition + moovAtomSize);
      end
      else
      begin
        if IsSameAtomName(AtomName, 'free') then
        begin
          freeAtomSize := RootAtomSize;
        end;
        if RootAtomSize > High(Cardinal) then
        begin
          MP4Stream.Seek(RootAtomSize - 16, soCurrent);
        end
        else
        begin
          MP4Stream.Seek(RootAtomSize - 8, soCurrent);
        end;
      end;
    until (MP4Stream.Position >= MP4Stream.Size) OR (RootAtomSize = 0);
    if ilstAtomSize = 0 then
    begin
      Result := MP4TAGLIBRARY_ERROR_NO_TAG_FOUND;
      Exit;
    end;
    if freeAtomWasRootAtom then
    begin
      freeAtomSize := 0;
    end;
    if KeepPadding then
    begin
      PaddingToWrite := (ilstAtomSize + (freeAtomSize - 8));
    end
    else
    begin
      PaddingToWrite := 0;
      MP4Stream.Seek(moovAtomPosition, soBeginning);
      if metaAtomSize > High(Cardinal) then
      begin
        metaAtomWas64bit := True;
      end;
      metaAtomSize := (metaAtomSize - ilstAtomSize - freeAtomSize);
      if (metaAtomSize <= High(Cardinal)) AND metaAtomWas64bit then
      begin
        Dec(metaAtomSize, 8);
      end;
      if udtaAtomSize > High(Cardinal) then
      begin
        udtaAtomWas64bit := True;
      end;
      udtaAtomSize := (udtaAtomSize - ilstAtomSize - freeAtomSize);
      if (metaAtomSize <= High(Cardinal)) AND metaAtomWas64bit then
      begin
        Dec(udtaAtomSize, 8);
      end;
      if (udtaAtomSize <= High(Cardinal)) AND udtaAtomWas64bit then
      begin
        Dec(udtaAtomSize, 8);
      end;
      if moovAtomSize > High(Cardinal) then
      begin
        moovAtomWas64bit := True;
      end;
      moovAtomSize := (moovAtomSize - ilstAtomSize - freeAtomSize { - 8 } );
      if (metaAtomSize <= High(Cardinal)) AND metaAtomWas64bit then
      begin
        Dec(moovAtomSize, 8);
      end;
      if (udtaAtomSize <= High(Cardinal)) AND udtaAtomWas64bit then
      begin
        Dec(moovAtomSize, 8);
      end;
      if (moovAtomSize <= High(Cardinal)) AND moovAtomWas64bit then
      begin
        Dec(moovAtomSize, 8);
      end;
      moovAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'moov', moovAtomSize);
      if udtaAtomPosition > 0 then
      begin
        MP4Stream.Seek(udtaAtomPosition, soBeginning);
      end
      else
      begin
        MP4Stream.Seek(moovAtomPosition + 8, soBeginning);
      end;
      udtaAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'udta', udtaAtomSize);
      if metaAtomPosition > 0 then
      begin
        MP4Stream.Seek(metaAtomPosition, soBeginning);
      end
      else
      begin
        MP4Stream.Seek(udtaAtomPosition + 8, soBeginning);
      end;
      // metaAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'meta', metaAtomSize);
      // * TODO: Reverse bytes ?
      MP4Stream.Write(Version, 1);
      MP4Stream.Write(Flags, 3);
      MP4Stream.Seek(metaAtomSize - 8 - 4, soCurrent);
    end;
    if PaddingToWrite > 0 then
    begin
      MP4Stream.Seek(ilstAtomPosition, soBeginning);
      freeAtomSize := PaddingToWrite + 8;
      // freeAtomPosition := MP4Stream.Position;
      WriteAtomHeader(MP4Stream, 'free', freeAtomSize);
      WritePadding(MP4Stream, PaddingToWrite);
    end;
    metaAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(metaAtomRest, metaAtomRest.Size);
    udtaAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(udtaAtomRest, udtaAtomRest.Size);
    moovAtomRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(moovAtomRest, moovAtomRest.Size);
    StreamRest.Seek(0, soBeginning);
    MP4Stream.CopyFrom(StreamRest, StreamRest.Size);
    MP4Stream.Size := MP4Stream.Position;
    MP4Stream.Seek(0, soBeginning);
    mdatNewLocation := MP4mdatAtomLocation(MP4Stream);
    MP4Stream.Seek(0, soBeginning);
    if mdatNewLocation - mdatPreviousLocation <> 0 then
    begin
      MP4Stream.Seek(0, soBeginning);
      if NOT MP4UpdatestcoAtom(MP4Stream, mdatNewLocation - mdatPreviousLocation) then
      begin
        Result := MP4TAGLIBRARY_ERROR_UPDATE_stco;
        Exit;
      end;
    end;
    Result := MP4TAGLIBRARY_SUCCESS;
  finally
    FreeAndNil(StreamRest);
    FreeAndNil(moovAtomRest);
    FreeAndNil(udtaAtomRest);
    FreeAndNil(metaAtomRest);
    FreeAndNil(MP4Stream);
    DeleteFile(StreamRestFileName);
    DeleteFile(moovAtomRestFileName);
    DeleteFile(udtaAtomRestFileName);
    DeleteFile(metaAtomRestFileName);
  end;
end;

function MP4mdatAtomLocation(MP4Stream: TFileStream): Int64;
var
  AtomName: TAtomName;
  AtomSize: Int64;
begin
  Result := -1;
  try
    repeat
      ReadAtomHeader(MP4Stream, AtomName, AtomSize);
      if IsSameAtomName(AtomName, 'mdat') then
      begin
        Result := MP4Stream.Position - 8;
        Exit;
      end
      else
      begin
        MP4Stream.Seek(AtomSize - 8, soCurrent);
      end;
    until MP4Stream.Position >= MP4Stream.Size;
  except
    Result := -1;
  end;
end;

function MP4UpdatestcoAtom(MP4Stream: TFileStream; Offset: Integer): Boolean;
var
  AtomName: TAtomName;
  // AtomSize: Int64;
  moovAtomSize: Int64;
  moovAtomPosition: Int64;
  trakAtomSize: Int64;
  trakAtomPosition: Int64;
  mdiaAtomSize: Int64;
  mdiaAtomPosition: Int64;
  minfAtomSize: Int64;
  minfAtomPosition: Int64;
  stblAtomSize: Int64;
  stblAtomPosition: Int64;
  stcoAtomSize: Int64;
  stcoAtomPosition: Int64;
  Version: Byte;
  Flags: DWord;
  NumberOfOffsets: Int64;
  OffsetValue: Integer; // DWord;
  i: Integer;
begin
  Result := True;
  try
    Version := 0;
    Flags := 0;
    NumberOfOffsets := 0;
    repeat
      ReadAtomHeader(MP4Stream, AtomName, moovAtomSize);
      if IsSameAtomName(AtomName, 'moov') then
      begin
        moovAtomPosition := MP4Stream.Position - 8;
        repeat
          ReadAtomHeader(MP4Stream, AtomName, trakAtomSize);
          if IsSameAtomName(AtomName, 'trak') then
          begin
            trakAtomPosition := MP4Stream.Position - 8;
            repeat
              ReadAtomHeader(MP4Stream, AtomName, mdiaAtomSize);
              if IsSameAtomName(AtomName, 'mdia') then
              begin
                mdiaAtomPosition := MP4Stream.Position - 8;
                repeat
                  ReadAtomHeader(MP4Stream, AtomName, minfAtomSize);
                  if IsSameAtomName(AtomName, 'minf') then
                  begin
                    minfAtomPosition := MP4Stream.Position - 8;
                    repeat
                      ReadAtomHeader(MP4Stream, AtomName, stblAtomSize);
                      if IsSameAtomName(AtomName, 'stbl') then
                      begin
                        stblAtomPosition := MP4Stream.Position - 8;
                        repeat
                          ReadAtomHeader(MP4Stream, AtomName, stcoAtomSize);
                          if IsSameAtomName(AtomName, 'stco') then
                          begin
                            Result := False;
                            stcoAtomPosition := MP4Stream.Position - 8;
                            MP4Stream.Read(Version, 1);
                            MP4Stream.Read(Flags, 3);
                            MP4Stream.Read(NumberOfOffsets, 4);
                            NumberOfOffsets := ReverseBytes32(NumberOfOffsets);
                            i := 0;
                            while MP4Stream.Position < stcoAtomPosition + stcoAtomSize do
                            begin
                              MP4Stream.Read(OffsetValue, 4);
                              OffsetValue := ReverseBytes32(OffsetValue);
                              OffsetValue := OffsetValue + Offset;
                              OffsetValue := ReverseBytes32(OffsetValue);
                              MP4Stream.Seek(-4, soCurrent);
                              MP4Stream.Write(OffsetValue, 4);
                              Inc(i);
                            end;
                            if i = NumberOfOffsets then
                            begin
                              Result := True;
                            end;
                          end
                          else
                          begin
                            MP4Stream.Seek(stcoAtomSize - 8, soCurrent);
                          end;
                        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= stblAtomPosition + stblAtomSize);
                      end
                      else
                      begin
                        MP4Stream.Seek(stblAtomSize - 8, soCurrent);
                      end;
                    until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= minfAtomPosition + minfAtomSize);
                  end
                  else
                  begin
                    MP4Stream.Seek(minfAtomSize - 8, soCurrent);
                  end;
                until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= mdiaAtomPosition + mdiaAtomSize);
              end
              else
              begin
                MP4Stream.Seek(mdiaAtomSize - 8, soCurrent);
              end;
            until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= trakAtomPosition + trakAtomSize);
          end
          else
          begin
            MP4Stream.Seek(trakAtomSize - 8, soCurrent);
          end;
        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= moovAtomPosition + moovAtomSize);
      end
      else
      begin
        MP4Stream.Seek(moovAtomSize - 8, soCurrent);
      end;
    until (MP4Stream.Position >= MP4Stream.Size) OR (moovAtomSize = 0);
  except
    Result := False;
  end;
end;

function MP4Updateco64Atom(MP4Stream: TFileStream; Offset: Int64): Boolean;
var
  AtomName: TAtomName;
  // AtomSize: Int64;
  moovAtomSize: Int64;
  moovAtomPosition: Int64;
  trakAtomSize: Int64;
  trakAtomPosition: Int64;
  mdiaAtomSize: Int64;
  mdiaAtomPosition: Int64;
  minfAtomSize: Int64;
  minfAtomPosition: Int64;
  stblAtomSize: Int64;
  stblAtomPosition: Int64;
  co64AtomSize: Int64;
  co64AtomPosition: Int64;
  Version: Byte;
  Flags: DWord;
  NumberOfOffsets: Int64;
  OffsetValue: UInt64; // DWord;
  i: Integer;
begin
  Result := True;
  try
    Version := 0;
    Flags := 0;
    NumberOfOffsets := 0;
    repeat
      ReadAtomHeader(MP4Stream, AtomName, moovAtomSize);
      if IsSameAtomName(AtomName, 'moov') then
      begin
        moovAtomPosition := MP4Stream.Position - 8;
        repeat
          ReadAtomHeader(MP4Stream, AtomName, trakAtomSize);
          if IsSameAtomName(AtomName, 'trak') then
          begin
            trakAtomPosition := MP4Stream.Position - 8;
            repeat
              ReadAtomHeader(MP4Stream, AtomName, mdiaAtomSize);
              if IsSameAtomName(AtomName, 'mdia') then
              begin
                mdiaAtomPosition := MP4Stream.Position - 8;
                repeat
                  ReadAtomHeader(MP4Stream, AtomName, minfAtomSize);
                  if IsSameAtomName(AtomName, 'minf') then
                  begin
                    minfAtomPosition := MP4Stream.Position - 8;
                    repeat
                      ReadAtomHeader(MP4Stream, AtomName, stblAtomSize);
                      if IsSameAtomName(AtomName, 'stbl') then
                      begin
                        stblAtomPosition := MP4Stream.Position - 8;
                        repeat
                          ReadAtomHeader(MP4Stream, AtomName, co64AtomSize);
                          if IsSameAtomName(AtomName, 'co64') then
                          begin
                            Result := False;
                            co64AtomPosition := MP4Stream.Position - 8;
                            MP4Stream.Read(Version, 1);
                            MP4Stream.Read(Flags, 3);
                            MP4Stream.Read(NumberOfOffsets, 4);
                            NumberOfOffsets := ReverseBytes32(NumberOfOffsets);
                            i := 0;
                            while MP4Stream.Position < co64AtomPosition + co64AtomSize do
                            begin
                              MP4Stream.Read(OffsetValue, 8);
                              OffsetValue := ReverseBytes64(OffsetValue);
                              OffsetValue := OffsetValue + Offset;
                              OffsetValue := ReverseBytes64(OffsetValue);
                              MP4Stream.Seek(-8, soCurrent);
                              MP4Stream.Write(OffsetValue, 8);
                              Inc(i);
                            end;
                            if i = NumberOfOffsets then
                            begin
                              Result := True;
                            end;
                          end
                          else
                          begin
                            MP4Stream.Seek(co64AtomSize - 8, soCurrent);
                          end;
                        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= stblAtomPosition + stblAtomSize);
                      end
                      else
                      begin
                        MP4Stream.Seek(stblAtomSize - 8, soCurrent);
                      end;
                    until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= minfAtomPosition + minfAtomSize);
                  end
                  else
                  begin
                    MP4Stream.Seek(minfAtomSize - 8, soCurrent);
                  end;
                until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= mdiaAtomPosition + mdiaAtomSize);
              end
              else
              begin
                MP4Stream.Seek(mdiaAtomSize - 8, soCurrent);
              end;
            until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= trakAtomPosition + trakAtomSize);
          end
          else
          begin
            MP4Stream.Seek(trakAtomSize - 8, soCurrent);
          end;
        until (MP4Stream.Position >= MP4Stream.Size) OR (MP4Stream.Position >= moovAtomPosition + moovAtomSize);
      end
      else
      begin
        MP4Stream.Seek(moovAtomSize - 8, soCurrent);
      end;
    until (MP4Stream.Position >= MP4Stream.Size) OR (moovAtomSize = 0);
  except
    Result := False;
  end;
end;

function GenreToIndex(Genre: String): Integer;
var
  i: Integer;
  GenreText: String;
begin
  Result := -1;
  GenreText := UpperCase(Genre);
  for i := 0 to Length(ID3Genres) - 1 do
  begin
    if UpperCase(ID3Genres[i]) = GenreText then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TMP4Tag.GetGenre: String;
begin
  Result := ID3Genres[GetInteger16('gnre')];
  if Result = '' then
  begin
    Result := GetText('©gen');
  end;
end;

function TMP4Tag.SetGenre(Genre: String): Boolean;
var
  GenreIndex: Integer;
begin
  GenreIndex := GenreToIndex(Genre);
  if GenreIndex > -1 then
  begin
    Result := SetInteger16('gnre', GenreIndex);
  end
  else
  begin
    Result := SetText('©gen', Genre);
  end;
end;

function TMP4Tag.GetPurchaseCountry: String;
var
  Value: Integer;
begin
  Result := '';
  Value := GetInteger('sfID');
  case Value of
    143460:
      Result := 'Australia';
    143445:
      Result := 'Austria';
    143446:
      Result := 'Belgium';
    143455:
      Result := 'Canada';
    143458:
      Result := 'Denmark';
    143447:
      Result := 'Finland';
    143442:
      Result := 'France';
    143443:
      Result := 'Germany';
    143448:
      Result := 'Greece';
    143449:
      Result := 'Ireland';
    143450:
      Result := 'Italy';
    143462:
      Result := 'Japan';
    143451:
      Result := 'Luxembourg';
    143452:
      Result := 'Netherlands';
    143461:
      Result := 'New Zealand';
    143457:
      Result := 'Norway';
    143453:
      Result := 'Portugal';
    143454:
      Result := 'Spain';
    143456:
      Result := 'Sweden';
    143459:
      Result := 'Switzerland';
    143444:
      Result := 'United Kingdom';
    143441:
      Result := 'United States';
  else
    begin
      if Value <> 0 then
      begin
        Result := IntToStr(Value);
      end;
    end;
  end;
end;

function TMP4Tag.SetPurchaseCountry(Country: String): Boolean;
var
  Value: Integer;
begin
  Value := 0;
  if Country = 'Australia' then
  begin
    Value := 143460;
  end;
  if Country = 'Austria' then
  begin
    Value := 143445;
  end;
  if Country = 'Belgium' then
  begin
    Value := 143446;
  end;
  if Country = 'Canada' then
  begin
    Value := 143455;
  end;
  if Country = 'Denmark' then
  begin
    Value := 143458;
  end;
  if Country = 'Finland' then
  begin
    Value := 143447;
  end;
  if Country = 'France' then
  begin
    Value := 143442;
  end;
  if Country = 'Germany' then
  begin
    Value := 143443;
  end;
  if Country = 'Greece' then
  begin
    Value := 143448;
  end;
  if Country = 'Ireland' then
  begin
    Value := 143449;
  end;
  if Country = 'Italy' then
  begin
    Value := 143450;
  end;
  if Country = 'Japan' then
  begin
    Value := 143462;
  end;
  if Country = 'Luxembourg' then
  begin
    Value := 143451;
  end;
  if Country = 'Netherlands' then
  begin
    Value := 143452;
  end;
  if Country = 'New Zealand' then
  begin
    Value := 143461;
  end;
  if Country = 'Norway' then
  begin
    Value := 143457;
  end;
  if Country = 'Portugal' then
  begin
    Value := 143453;
  end;
  if Country = 'Spain' then
  begin
    Value := 143454;
  end;
  if Country = 'Sweden' then
  begin
    Value := 143456;
  end;
  if Country = 'Switzerland' then
  begin
    Value := 143459;
  end;
  if Country = 'United Kingdom' then
  begin
    Value := 143444;
  end;
  if Country = 'United States' then
  begin
    Value := 143441;
  end;
  if Value = 0 then
  begin
    Value := StrToIntDef(Country, 0);
  end;
  Result := SetInteger32('sfID', Value);
end;

function TMP4Tag.Assign(MP4Tag: TMP4Tag): Boolean;
var
  i: Integer;
begin
  Clear;
  if MP4Tag <> nil then
  begin
    FileName := MP4Tag.FileName;
    Loaded := MP4Tag.Loaded;
    Version := MP4Tag.Version;
    Flags := MP4Tag.Flags;
    PaddingToWrite := MP4Tag.PaddingToWrite;
    for i := 0 to MP4Tag.Count - 1 do
    begin
      AddAtom(MP4Tag.Atoms[i].ID).Assign(MP4Tag.Atoms[i]);
    end;
  end;
  Result := True;
end;

function IsSameAtomName(ID: TAtomName; name: String): Boolean;
begin
{$IFDEF ID3V2L_MOBILE}
  if (ID[0] = Ord(Name[0])) AND (ID[1] = Ord(Name[1])) AND (ID[2] = Ord(Name[2])) AND (ID[3] = Ord(Name[3]))
{$ELSE}
  if (ID[0] = Ord(Name[1])) AND (ID[1] = Ord(Name[2])) AND (ID[2] = Ord(Name[3])) AND (ID[3] = Ord(Name[4]))
{$ENDIF}
  then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function IsSameAtomName(ID1: TAtomName; ID2: TAtomName): Boolean;
begin
  if (ID1[0] = ID2[0]) AND (ID1[1] = ID2[1]) AND (ID1[2] = ID2[2]) AND (ID1[3] = ID2[3]) then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function StringToAtomName(name: String; var ID: TAtomName): Boolean;
begin
  FillChar(ID, SizeOf(ID), 0);
{$IFDEF ID3V2L_MOBILE}
  if Length(Name) > 0 then
  begin
    ID[0] := Ord(Name[0]);
  end;
  if Length(Name) > 1 then
  begin
    ID[1] := Ord(Name[1]);
  end;
  if Length(Name) > 2 then
  begin
    ID[2] := Ord(Name[2]);
  end;
  if Length(Name) > 3 then
  begin
    ID[3] := Ord(Name[3]);
  end;
{$ELSE}
  if Length(Name) > 0 then
  begin
    ID[0] := Ord(Name[1]);
  end;
  if Length(Name) > 1 then
  begin
    ID[1] := Ord(Name[2]);
  end;
  if Length(Name) > 2 then
  begin
    ID[2] := Ord(Name[3]);
  end;
  if Length(Name) > 3 then
  begin
    ID[3] := Ord(Name[4]);
  end;
{$ENDIF}
  Result := True;
end;

function AtomNameToString(ID: TAtomName): String;
begin
  Result := Char(ID[0]) + Char(ID[1]) + Char(ID[2]) + Char(ID[3]);
end;

function MP4TagErrorCode2String(ErrorCode: Integer): String;
begin
  Result := 'Unknown error code.';
  case ErrorCode of
    MP4TAGLIBRARY_SUCCESS:
      Result := 'Success.';
    MP4TAGLIBRARY_ERROR:
      Result := 'Unknown error occured.';
    MP4TAGLIBRARY_ERROR_NO_TAG_FOUND:
      Result := 'No MP4 tag found.';
    MP4TAGLIBRARY_ERROR_EMPTY_TAG:
      Result := 'MP4 tag is empty.';
    MP4TAGLIBRARY_ERROR_EMPTY_FRAMES:
      Result := 'MP4 tag contains only empty frames.';
    MP4TAGLIBRARY_ERROR_OPENING_FILE:
      Result := 'Error opening file.';
    MP4TAGLIBRARY_ERROR_READING_FILE:
      Result := 'Error reading file.';
    MP4TAGLIBRARY_ERROR_WRITING_FILE:
      Result := 'Error writing file.';
    MP4TAGLIBRARY_ERROR_DOESNT_FIT:
      Result := 'Error: MP4 tag doesn''t fit into the file.';
    MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_VERSION:
      Result := 'Error: not supported MP4 version.';
    MP4TAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT:
      Result := 'Error: not supported file format.';
    MP4TAGLIBRARY_ERROR_NEED_EXCLUSIVE_ACCESS:
      Result := 'Error: file is locked. Need exclusive access to write MP4 tag to this file.';
    MP4TAGLIBRARY_ERROR_UPDATE_stco:
      Result := 'Error: updating MP4 ''stco'' atom.';
    MP4TAGLIBRARY_ERROR_UPDATE_co64:
      Result := 'Error: updating MP4 ''co64'' atom.';
  end;
end;

Initialization

  MP4AtomDataID[0] := Ord('d');
MP4AtomDataID[1] := Ord('a');
MP4AtomDataID[2] := Ord('t');
MP4AtomDataID[3] := Ord('a');

MP4AtommeanID[0] := Ord('m');
MP4AtommeanID[1] := Ord('e');
MP4AtommeanID[2] := Ord('a');
MP4AtommeanID[3] := Ord('n');

MP4AtomnameID[0] := Ord('n');
MP4AtomnameID[1] := Ord('a');
MP4AtomnameID[2] := Ord('m');
MP4AtomnameID[3] := Ord('e');

end.
