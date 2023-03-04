unit Controller.ProcessarFila;

interface

uses
  Controller.FilaRequest, DataSet.Serialize,REST.Types, System.Classes, Horse,System.JSON;
type
  TRequestProcessor = class(TThread)
  private
    FRequestQueue: TRequestQueue;
  protected
    procedure Execute; override;
  public
    constructor Create(ARequestQueue: TRequestQueue);
    procedure registry;
    procedure getUsuarios(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
    procedure consultaUsuarios;
    function criarArrayUsuariosJSON: TJSONArray;
  end;
implementation

uses
   Controller.Usuarios, Model.Usuario;
procedure TRequestProcessor.consultaUsuarios;
begin
     dmUsuario.qrUsuario.Close;
     dmUsuario.qrUsuario.Open;
end;

constructor TRequestProcessor.Create(ARequestQueue: TRequestQueue);
begin
  inherited Create(True);
  FRequestQueue := ARequestQueue;
end;

function TRequestProcessor.criarArrayUsuariosJSON: TJSONArray;
var
arrayUsuarios : TJSONArray;
begin
  consultaUsuarios;
  arrayUsuarios := dmUsuario.qrUsuario.TOJSONArray;
  Result :=  arrayUsuarios;
end;

procedure TRequestProcessor.Execute;
var
  Request: TJSONObject;
  usuarios : TUsuarios;
begin
  while not Terminated do
  begin
    Request := FRequestQueue.Dequeue;
    if Assigned(Request) then
    begin
      try
        // Processar a solicita��o aqui
      finally
        Request.Free;
        usuarios.Free;
      end;
    end
    else
      Sleep(1000); // Esperar por novas solicita��es na fila
  end;
end;

procedure TRequestProcessor.getUsuarios(Req: THorseRequest; Res: THorseResponse;
  Next: Tproc);
var JSONrecebido : TJSONArray;
    RequestQueue: TRequestQueue;
begin
     RequestQueue := TRequestQueue.Create;
  try
    // Adicione uma nova solicita��o � fila
    RequestQueue.Enqueue(TJSONObject.Create);
    JSONrecebido := criarArrayUsuariosJSON;
     Res.Send<TJSONArray>(JSONrecebido).Status(200);
    // ...
  finally
    RequestQueue.Free;
  end;

end;

procedure TRequestProcessor.registry;
begin
    THorse.Get('/usuarios', getUsuarios);
end;

end.
