unit Model.Preco;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZDataset;

type
  TDataModule2 = class(TDataModule)
    qrPrecoProduto: TZReadOnlyQuery;
    qrPrecoProdutoCODPROD: TIntegerField;
    qrPrecoProdutoDESCRICAO: TWideStringField;
    qrPrecoProdutoEMBALAGEM: TWideStringField;
    qrPrecoProdutoQTUNITCX: TFloatField;
    qrPrecoProdutoQTUNIT: TFloatField;
    qrPrecoProdutoQTEST: TFloatField;
    qrPrecoProdutoCODAUXILIAR: TFloatField;
    qrPrecoProdutoPERACRESCISMOPF: TFloatField;
    qrPrecoProdutoPERDESCMAXTAB: TFloatField;
    qrPrecoProdutoVLST: TFloatField;
    qrPrecoProdutoIVATAB: TFloatField;
    qrPrecoProdutoALIQICMS1: TFloatField;
    qrPrecoProdutoALIQICMS2: TFloatField;
    qrPrecoProdutoFECP: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Model.Conexao;

{$R *.dfm}

end.
