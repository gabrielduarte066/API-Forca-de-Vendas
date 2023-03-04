unit Model.Produto;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZDataset;

type
  TdmProduto = class(TDataModule)
    qrProdutos: TZReadOnlyQuery;
    qrDesc561: TZReadOnlyQuery;
    qrDesc561PERCDESC: TFloatField;
    qrMaxPreco: TZReadOnlyQuery;
    qrMaxPrecoVALOR: TWideStringField;
    qrPlanoPag: TZReadOnlyQuery;
    qrPlanoPagCODPLPAG: TSmallintField;
    qrPlanoPagDESCRICAO: TWideStringField;
    qrPlanoPagVLMINPEDIDO: TFloatField;
    qrPlanoPagNUMITENSMINIMO: TSmallintField;
    qrPlanoPagPERTXFIM: TFloatField;
    qrPlanoPagNUMPR: TFloatField;
    qrPlanoPagPERTXFIM_1: TFloatField;
    qrProdutosCODPROD: TIntegerField;
    qrProdutosDESCRICAO: TWideStringField;
    qrProdutosEMBALAGEM: TWideStringField;
    qrProdutosUNIDADE: TWideStringField;
    qrProdutosCODEPTO: TIntegerField;
    qrProdutosCODSEC: TIntegerField;
    qrProdutosQTUNIT: TFloatField;
    qrProdutosOBS: TWideStringField;
    qrProdutosQTUNITCX: TFloatField;
    qrProdutosREVENDA: TWideStringField;
    qrProdutosDTEXCLUSAO: TDateTimeField;
    qrProdutosOBS2: TWideStringField;
    qrProdutosNBM: TWideStringField;
    qrProdutosQTEST: TFloatField;
    qrProdutosQTESTGER: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Model.Conexao;

{$R *.dfm}

end.
