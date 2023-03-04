program App;

uses
  Vcl.Forms,
  Controller.Usuarios in 'Controller\Controller.Usuarios.pas',
  Model.Usuario in 'Model\Model.Usuario.pas' {dmUsuario: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  View.API in 'View\View.API.pas' {Form1},
  Model.Conexao in 'Model\Model.Conexao.pas' {dmConexao: TDataModule},
  Controller.Servico in 'Controller\Controller.Servico.pas',
  Controller.Clientes in 'Controller\Controller.Clientes.pas',
  Model.Clientes in 'Model\Model.Clientes.pas' {dmVendedor: TDataModule},
  Model.Produto in 'Model\Model.Produto.pas' {dmProduto: TDataModule},
  Controller.Produtos in 'Controller\Controller.Produtos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:=true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmVendedor, dmVendedor);
  Application.CreateForm(TdmProduto, dmProduto);
  Application.Run;
end.
