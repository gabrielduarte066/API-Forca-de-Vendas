unit Controller.Clientes;

interface
uses Horse, System.JSON,System.SysUtils, DataSet.Serialize,REST.Types, REST.Json;
type TClientes = class
     private
     public
     procedure registry;
     procedure getClientesRcas(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
     procedure consultaClientes(codusur,codfilial: integer);
     function  criarArrayClientesJSON:TJsonArray;
end;

implementation


uses Model.Clientes;


procedure TClientes.consultaClientes(codusur,codfilial: integer);
begin
    dmVendedor.qrClientesRCA.Close;
    dmVendedor.qrClientesRCA.Params.ParamByName('CODUSUR').Value := codusur;
    dmVendedor.qrClientesRCA.Params.ParamByName('CODFILIAL').Value := codfilial;
    dmVendedor.qrClientesRCA.Open;
end;

function TClientes.criarArrayClientesJSON: TJsonArray;
var
arrayClientes : TJSONArray;
begin
  arrayClientes :=  dmVendedor.qrClientesRCA.ToJSONArray;
  Result :=  arrayClientes;
end;

procedure TClientes.getClientesRcas(Req: THorseRequest; Res: THorseResponse;
  Next: Tproc);
begin
    consultaClientes(Req.Params['codusur'].ToInteger,Req.Params['codfilial'].ToInteger);
    Res.Send(criarArrayClientesJSON).Status(200);
end;

procedure TClientes.registry;
begin
    THorse.Group.Prefix('v1').
    Get('/clientes-rcas/:codusur/:codfilial',getClientesRcas);
end;


end.
