unit Controller.Token;

interface
uses Horse, System.JSON,System.SysUtils, DataSet.Serialize,REST.Types, REST.Json,JOSE.Core.JWT,JOSE.Core.Builder;
var
arrayUsuarios : TJSONArray;
procedure Registry;
implementation

uses Model.Usuario;

procedure GerarToken(Req: THorseRequest; Res: THorseResponse; Next: Tproc);
var  LToken : TJWT;
     LCompactToken : string;
begin
     LToken := TJWT.Create;
     try
        //Token Claim
        LToken.Claims.Issuer := 'Garra Food Solutions';
        LToken.Claims.Subject := 'GABRIEL';
        LToken.Claims.Expiration := now+1;

        //Outros Claims
        LToken.Claims.SetClaimOfType<string>('nome','Gabriel');
        LToken.Claims.SetClaimOfType<boolean>('TI',True);

        //Assinatura e compactar formato
        LCompactToken := TJOSE.SHA256CompactToken('1997',LToken);
        Res.Send(LCompactToken);
     finally
        LToken.Free;
     end;

end;

procedure Registry;
begin
    THorse.Get('/login', GerarToken);
    //arrayUsuarios.Free;
    //dmUsuario.qrUsuario.Close;
end;
end.
