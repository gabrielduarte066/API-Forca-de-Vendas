unit Controller.FilaRequest;

interface

uses
  System.Classes, System.JSON, System.Generics.Collections;
type
  TRequestQueue = class
  private
    FQueue: TThreadList<TJSONObject>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Enqueue(ARequest: TJSONObject);
    function Dequeue: TJSONObject;
  end;
implementation

constructor TRequestQueue.Create;
begin
  FQueue := TThreadList<TJSONObject>.Create;
end;

destructor TRequestQueue.Destroy;
begin
  FQueue.Free;
  inherited;
end;

procedure TRequestQueue.Enqueue(ARequest: TJSONObject);
begin
  FQueue.Add(ARequest);
end;

function TRequestQueue.Dequeue: TJSONObject;
var
  List: TList<TJSONObject>;
begin
  List := FQueue.LockList;
  try
    if List.Count > 0 then
    begin
      Result := List[0];
      List.Delete(0);
    end
    else
      Result := nil;
  finally
    FQueue.UnlockList;
  end;
end;


end.
