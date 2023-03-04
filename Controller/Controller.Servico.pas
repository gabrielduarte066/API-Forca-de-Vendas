unit Controller.Servico;

interface
   type TServico = class
       private
       public
       function  DataHora() : string;
       procedure StartServer();
       procedure StopServer();
   end;

implementation
uses Horse,
     Horse.Etag,
     Horse.Jhonson,
     Controller.Usuarios,
     System.SysUtils, Controller.Clientes, Controller.Produtos;

{ Servico }

function TServico.DataHora : string;
begin
  if THorse.IsRunning then
  begin
    Result := 'Serviço Iniciado: '+ FormatDateTime('dd dddd mmmm yyyy',Date) +' Hora: ' + TimeToStr(Time);
  end;
end;


procedure TServico.StartServer;
var ldataHora : string;
usuarios : TUsuarios;
clientes : TClientes;
produtos : TProdutos;
begin
usuarios  := TUsuarios.Create;
clientes  := TClientes.Create;
produtos  := TProdutos.Create;

try
  if not THorse.IsRunning then
    begin
      THorse.Use(Jhonson())
      .Use(Etag);
      //ROTAS
      usuarios.registry;
      clientes.registry;
      produtos.registry;
      THorse.Listen(9000);
    end;
finally
    FreeAndNil(usuarios);
    FreeAndNil(clientes);
    FreeAndNil(produtos);
end;
end;

procedure TServico.StopServer;
begin
   if THorse.IsRunning = True then
    begin
      THorse.StopListen;
    end;
end;

end.
