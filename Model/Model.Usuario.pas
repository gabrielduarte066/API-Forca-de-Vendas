unit Model.Usuario;

interface
uses
       System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZDataset,Model.Conexao;



type
  TdmUsuario = class(TDataModule)
    qrUsuario: TZReadOnlyQuery;
    qrPermissaoUsuario: TZReadOnlyQuery;
    qrPermissaoUsuarioCODUSUARIO: TIntegerField;
    qrPermissaoUsuarioCODCONTROLE: TIntegerField;
    qrUsuarioMATRICULA: TIntegerField;
    qrUsuarioNOME: TWideStringField;
    qrUsuarioCODUSUR: TSmallintField;
    qrUsuarioCODSUPERVISOR: TSmallintField;
    qrUsuarioCODFILIAL: TWideStringField;
    qrUsuarioUSUARIOBD: TWideStringField;
    qrUsuarioSENHA: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}


{$R *.dfm}

end.
