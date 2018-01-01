unit JsonSerializer;

interface

uses
  Generics.Collections, Classes, System.SysUtils, Winapi.Messages, Constants, REST.Json;
             
type
  TJsonSerializer = class
  private
  public
    class function Serialize(const Obj: TObject): string;
    class function Deserialize(const JsonStr: string): TObject;
  end;
  
implementation

{ TJsonSerializer }

class function TJsonSerializer.Deserialize(const JsonStr: string): TObject;
begin
  try
    Result := TJson.JsonToObject<TObject>(JsonStr);
  except
    on E: Exception do
    begin
      Result := nil;
    end;
  end;
end;

class function TJsonSerializer.Serialize(const Obj: TObject): string;
begin
  try
    Result := TJson.ObjectToJsonString(Obj);
  except
    on E: Exception do
    begin
      Result := '';
    end;
  end;
end;

end.

