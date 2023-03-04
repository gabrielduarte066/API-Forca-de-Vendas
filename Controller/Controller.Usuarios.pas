unit Controller.Usuarios;

interface
uses Horse, System.JSON,System.SysUtils, DataSet.Serialize,REST.Types, REST.Json;
type TUsuarios = class
    private
    public
    procedure registry;
    procedure getUsuarios(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
    procedure getControleAcesso(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
    procedure consultaUsuarios;
    procedure consultaPermissao;
    function  criarArrayUsuariosJSON: TJSONArray;
    function  criarArrayPermissaoUsuariosJSON: TJSONArray;

end;
implementation

uses Model.Usuario,  System.Classes;

procedure TUsuarios.consultaUsuarios;
begin
     dmUsuario.qrUsuario.Close;
     dmUsuario.qrUsuario.Open;
end;
procedure TUsuarios.consultaPermissao;
begin

        dmUsuario.qrPermissaoUsuario.Close;
        dmUsuario.qrPermissaoUsuario.Open;


end;

function TUsuarios.criarArrayPermissaoUsuariosJSON: TJSONArray;
var
arrayPermissaoUsuarios : TJSONArray;
begin

  consultaPermissao;
              arrayPermissaoUsuarios := dmUsuario.qrPermissaoUsuario.TOJSONArray;
  Result :=  arrayPermissaoUsuarios;



end;

function TUsuarios.criarArrayUsuariosJSON: TJSONArray;
var
arrayUsuarios : TJSONArray;
begin
  consultaUsuarios;
  arrayUsuarios := dmUsuario.qrUsuario.TOJSONArray;
  Result :=  arrayUsuarios;
end;

procedure TUsuarios.getUsuarios(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
begin

  Res.Send(criarArrayUsuariosJSON).Status(200);

end;

procedure TUsuarios.getControleAcesso(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
begin
  Res.Send(criarArrayPermissaoUsuariosJSON).Status(200);
end;

procedure TUsuarios.registry;
begin
    THorse.Group.Prefix('v1').
    Get('/usuarios', getUsuarios);
    {teste versionando rota da API
    THorse.Group.Prefix('v2').
    Get('/usuarios', getUsuarios); }
    THorse.Group.Prefix('v1').
    Get('/controle-acessos', getControleAcesso);
end;

end.
