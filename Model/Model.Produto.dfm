object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 355
  Width = 505
  object qrProdutos: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      
        ' SELECT PCPRODUT.CODPROD ,PCPRODUT.DESCRICAO ,PCPRODUT.EMBALAGEM' +
        ' ,PCPRODUT.UNIDADE ,PCPRODUT.CODEPTO ,PCPRODUT.CODSEC ,'
      
        ' PCPRODUT.QTUNIT,PCPRODUT.OBS,PCPRODUT.QTUNITCX,PCPRODUT.REVENDA' +
        ',PCPRODUT.DTEXCLUSAO,PCPRODUT.OBS2 ,PCPRODUT.NBM,'
      ' PCEST.QTEST,PCEST.QTESTGER  FROM PCPRODUT, PCEST  '
      ' WHERE PCPRODUT.CODPROD  = PCEST.CODPROD '
      ' AND PCEST.QTESTGER > 0'
      ' AND PCPRODUT.ENVIARFORCAVENDAS = '#39'S'#39)
    Params = <>
    Left = 56
    Top = 32
    object qrProdutosCODPROD: TIntegerField
      FieldName = 'CODPROD'
      Required = True
    end
    object qrProdutosDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object qrProdutosEMBALAGEM: TWideStringField
      FieldName = 'EMBALAGEM'
      Required = True
      Size = 12
    end
    object qrProdutosUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object qrProdutosCODEPTO: TIntegerField
      FieldName = 'CODEPTO'
      Required = True
    end
    object qrProdutosCODSEC: TIntegerField
      FieldName = 'CODSEC'
      Required = True
    end
    object qrProdutosQTUNIT: TFloatField
      FieldName = 'QTUNIT'
    end
    object qrProdutosOBS: TWideStringField
      FieldName = 'OBS'
      Size = 2
    end
    object qrProdutosQTUNITCX: TFloatField
      FieldName = 'QTUNITCX'
    end
    object qrProdutosREVENDA: TWideStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object qrProdutosDTEXCLUSAO: TDateTimeField
      FieldName = 'DTEXCLUSAO'
    end
    object qrProdutosOBS2: TWideStringField
      FieldName = 'OBS2'
      Size = 2
    end
    object qrProdutosNBM: TWideStringField
      FieldName = 'NBM'
      Size = 15
    end
    object qrProdutosQTEST: TFloatField
      FieldName = 'QTEST'
    end
    object qrProdutosQTESTGER: TFloatField
      FieldName = 'QTESTGER'
    end
  end
  object qrDesc561: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT MAX(PERCDESC) PERCDESC'
      '  FROM PCDESCONTO,'
      
        '       (SELECT CODEPTO, CODSEC, CODFORNEC, CODPRODPRINC FROM PCP' +
        'RODUT WHERE CODPROD = :CODPROD1) PRODUT,'
      
        '       (SELECT CODSUPERVISOR FROM PCUSUARI WHERE CODUSUR = :CODU' +
        'SUR) SUPERV,'
      
        '       (SELECT PCPRACA.codpraca, PCPRACA.numregiao, PCCLIENT.cod' +
        'rede FROM PCPRACA, PCCLIENT WHERE PCPRACA.codpraca = PCCLIENT.co' +
        'dpraca AND PCCLIENT.codcli = :CODCLI) CLIENT'
      ' WHERE CODFILIAL = :CODFILIAL'
      '   AND :DATA BETWEEN DTINICIO AND DTFIM'
      
        '   AND (( PCDESCONTO.CODEPTO = PRODUT.CODEPTO ) OR ( PCDESCONTO.' +
        'CODEPTO IS NULL ))'
      
        '   AND (( PCDESCONTO.CODCLI = :CODCLI2 ) OR ( PCDESCONTO.CODCLI ' +
        'IS NULL ))'
      
        '   AND (( PCDESCONTO.CODSEC  = PRODUT.CODSEC) OR ( PCDESCONTO.CO' +
        'DSEC IS NULL ))'
      
        '   AND (( PCDESCONTO.CODPROD = :CODPROD2 ) OR ( PCDESCONTO.CODPR' +
        'OD IS NULL ))'
      
        '   AND (( PCDESCONTO.CODUSUR = :CODUSUR2 ) OR ( PCDESCONTO.CODUS' +
        'UR IS NULL ))'
      
        '   AND (( PCDESCONTO.CODSUPERVISOR = SUPERV.CODSUPERVISOR ) OR (' +
        ' PCDESCONTO.CODSUPERVISOR IS NULL ))'
      
        '   AND (( PCDESCONTO.CODFORNEC = PRODUT.CODFORNEC ) OR ( PCDESCO' +
        'NTO.CODFORNEC IS NULL ))'
      
        '   AND (( PCDESCONTO.NUMREGIAO = CLIENT.NUMREGIAO ) OR ( PCDESCO' +
        'NTO.NUMREGIAO IS NULL ))'
      
        '   AND (( PCDESCONTO.CODPRACA = CLIENT.CODPRACA ) OR ( PCDESCONT' +
        'O.CODPRACA IS NULL ))'
      
        '   AND (( PCDESCONTO.CODREDE = CLIENT.CODREDE ) OR ( PCDESCONTO.' +
        'CODREDE IS NULL ))'
      
        '   AND (( PCDESCONTO.CODPRODPRINC = PRODUT.CODPRODPRINC ) OR ( P' +
        'CDESCONTO.CODPRODPRINC IS NULL ))'
      
        '   AND ((PCDESCONTO.CODPLPAG = :CODPLPAG) OR (PCDESCONTO.CODPLPA' +
        'G IS NULL))')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODPROD1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPROD2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPLPAG'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPROD1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPROD2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPLPAG'
        ParamType = ptUnknown
      end>
    object qrDesc561PERCDESC: TFloatField
      FieldName = 'PERCDESC'
      ReadOnly = True
    end
  end
  object qrMaxPreco: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT REPLACE(PCPARAMFILIAL.valor, '#39'.'#39','#39','#39')valor'
      'FROM PCPARAMFILIAL'
      'WHERE PCPARAMFILIAL.nome LIKE '#39'CON_PERMAXVENDA'#39
      'AND CODFILIAL = 99')
    Params = <>
    Left = 240
    Top = 32
    object qrMaxPrecoVALOR: TWideStringField
      FieldName = 'VALOR'
      Size = 1000
    end
  end
  object qrPlanoPag: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT PCPLPAG.codplpag,'
      '       PCPLPAG.descricao,'
      '       PCPLPAG.vlminpedido,'
      '       PCPLPAG.numitensminimo,'
      '       PCPLPAG.pertxfim,'
      '       PCPLPAG.numpr,'
      '       PCPLPAG.pertxfim'
      '  FROM PCPLPAG'
      ' WHERE PCPLPAG.tipoprazo <> '#39'I'#39
      
        '   AND PCPLPAG.numdias <= (SELECT PCPLPAG.numdias FROM PCPLPAG, ' +
        'PCCLIENT'
      
        '                            WHERE PCPLPAG.codplpag = PCCLIENT.co' +
        'dplpag'
      '                              AND PCCLIENT.codcli = :CODCLI)'
      ''
      ' ORDER BY PCPLPAG.codplpag')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
    object qrPlanoPagCODPLPAG: TSmallintField
      FieldName = 'CODPLPAG'
      Required = True
    end
    object qrPlanoPagDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qrPlanoPagVLMINPEDIDO: TFloatField
      FieldName = 'VLMINPEDIDO'
    end
    object qrPlanoPagNUMITENSMINIMO: TSmallintField
      FieldName = 'NUMITENSMINIMO'
    end
    object qrPlanoPagPERTXFIM: TFloatField
      FieldName = 'PERTXFIM'
    end
    object qrPlanoPagNUMPR: TFloatField
      FieldName = 'NUMPR'
    end
    object qrPlanoPagPERTXFIM_1: TFloatField
      FieldName = 'PERTXFIM_1'
    end
  end
end
