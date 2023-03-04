unit Controller.Produtos;

interface
uses Horse, System.JSON,System.SysUtils, DataSet.Serialize,REST.Types, REST.Json;
type TProdutos = class
  private
  public
  procedure registry;
  procedure getProdutos(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
  procedure consultaProdutos;
  function  criarArrayProdutosJSON: TJSONArray;
end;

implementation

uses Model.Produto, System.Classes;


procedure TProdutos.consultaProdutos;
begin
    dmProduto.qrProdutos.Close;
    dmProduto.qrProdutos.Open;
end;

function TProdutos.criarArrayProdutosJSON: TJSONArray;
var
arrayProdutos : TJSONArray;
begin
     consultaProdutos;
     arrayProdutos := dmProduto.qrProdutos.TOJSONArray();
     Result := arrayProdutos;
end;

procedure TProdutos.getProdutos(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
begin
    Res.Send(criarArrayProdutosJSON).Status(200);
end;

procedure TProdutos.Registry;
begin
    THorse.Group.Prefix('v1').
    Get('/produtos', getProdutos);
end;

end.
