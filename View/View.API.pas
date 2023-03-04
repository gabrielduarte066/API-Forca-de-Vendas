unit View.API;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON, DataSet.Serialize,REST.Types, REST.Json,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Opes1: TMenuItem;
    Help1: TMenuItem;
    Sair1: TMenuItem;
    LogUsuarios1: TMenuItem;
    Sobre1: TMenuItem;
    Doc1: TMenuItem;
    Servio1: TMenuItem;
    Start1: TMenuItem;
    Stop1: TMenuItem;
    lblInfo: TLabel;
    srv: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Controller.Servico;

procedure TForm1.FormCreate(Sender: TObject);
var servico : TServico;
begin
     servico := TServico.Create;
     try
     servico.StartServer;
     lblInfo.Caption := servico.DataHora;
     srv.Caption := 'Servi�o Ativo';
     StatusBar1.Panels[0].Text := 'copyright � 2023 - T.I Garra Food Solutions';
     StatusBar1.Panels[2].Text := 'Vers�o 1.0.0';
     finally
        FreeAndNil(servico);
     end;

end;

procedure TForm1.Start1Click(Sender: TObject);
var servico : TServico;
begin
     servico := TServico.Create;
     try
       servico.StartServer;
       srv.Font.Color := clGreen;
       lblInfo.Caption := servico.DataHora;
       srv.Caption := 'Servi�o Ativo';
     finally
        FreeAndNil(servico);
     end;
end;

procedure TForm1.Stop1Click(Sender: TObject);
var servico : TServico;
begin
       servico.StopServer;
       srv.Font.Color := clRed;
       srv.Caption := 'Servi�o Parado';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[1].Text := TimeToStr(now);
end;

end.
