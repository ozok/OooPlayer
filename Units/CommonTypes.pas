unit CommonTypes;
{ CommonTypes by Alessandro Cappellozza
  version 0.8 02/2002
  http://digilander.Libero.it/Kappe/audioobject
}

interface

uses
  Windows, Dialogs, Forms, Controls, StdCtrls, Classes, ExtCtrls, SysUtils;

type
  TWaveData = array[0..2048] of DWORD;

type
  TFFTData = array[0..512] of Single;

implementation

end.

