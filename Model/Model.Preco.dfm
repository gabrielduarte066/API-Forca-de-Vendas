object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 494
  Width = 609
  object qrPrecoProduto: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT DISTINCT(PCPRODUT.codprod) CODPROD,'
      '       PCPRODUT.descricao,'
      '       PCPRODUT.embalagem, PCPRODUT.qtunitcx, PCPRODUT.qtunit,'
      '       ROUND((PCEST.qtestger - PCEST.qtreserv),2) QTEST,'
      '       PCPRODUT.codauxiliar,'
      '       PCTRIBUT.peracrescismopf,'
      '       PCTABPR.perdescmaxtab,'
      '       NVL(PCTABPR.vlst,0) VLST,'
      '       NVL(PCTRIBUT.ivatab,0) IVATAB,'
      '       NVL(PCTRIBUT.aliqicms1tab,0) ALIQICMS1,'
      '       NVL(PCTRIBUT.aliqicms2tab,0) ALIQICMS2,'
      '       NVL(PCTRIBUT.aliqicmsfecp,0) FECP'
      '  FROM PCPRODUT, PCEST, PCTABPR, PCCLIENT, PCPRACA, PCTRIBUT'
      ' WHERE PCPRODUT.codprod = PCEST.codprod'
      '   AND PCPRODUT.codprod = PCTABPR.codprod       '
      '   AND PCCLIENT.codpraca = PCPRACA.codpraca'
      '   AND PCPRACA.numregiao = PCTABPR.numregiao'
      '   AND PCTABPR.codst = PCTRIBUT.codst'
      '   AND PCEST.codfilial = :CODFILIAL'
      '   AND PCCLIENT.codcli = :CODCLI'
      '   AND PCPRODUT.codprod = :CODPROD'
      ' ORDER BY PCPRODUT.descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPROD'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPROD'
        ParamType = ptUnknown
      end>
    object qrPrecoProdutoCODPROD: TIntegerField
      FieldName = 'CODPROD'
      ReadOnly = True
    end
    object qrPrecoProdutoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object qrPrecoProdutoEMBALAGEM: TWideStringField
      FieldName = 'EMBALAGEM'
      Required = True
      Size = 12
    end
    object qrPrecoProdutoQTUNITCX: TFloatField
      FieldName = 'QTUNITCX'
    end
    object qrPrecoProdutoQTUNIT: TFloatField
      FieldName = 'QTUNIT'
    end
    object qrPrecoProdutoQTEST: TFloatField
      FieldName = 'QTEST'
      ReadOnly = True
    end
    object qrPrecoProdutoCODAUXILIAR: TFloatField
      FieldName = 'CODAUXILIAR'
    end
    object qrPrecoProdutoPERACRESCISMOPF: TFloatField
      FieldName = 'PERACRESCISMOPF'
    end
    object qrPrecoProdutoPERDESCMAXTAB: TFloatField
      FieldName = 'PERDESCMAXTAB'
    end
    object qrPrecoProdutoVLST: TFloatField
      FieldName = 'VLST'
      ReadOnly = True
    end
    object qrPrecoProdutoIVATAB: TFloatField
      FieldName = 'IVATAB'
      ReadOnly = True
    end
    object qrPrecoProdutoALIQICMS1: TFloatField
      FieldName = 'ALIQICMS1'
      ReadOnly = True
    end
    object qrPrecoProdutoALIQICMS2: TFloatField
      FieldName = 'ALIQICMS2'
      ReadOnly = True
    end
    object qrPrecoProdutoFECP: TFloatField
      FieldName = 'FECP'
      ReadOnly = True
    end
  end
end
