object dmVendedor: TdmVendedor
  OldCreateOrder = False
  Height = 355
  Width = 502
  object qrClientesRCA: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      
        'SELECT CLI.codcli, CLI.cliente, CLI.fantasia, CLI.bloqueio, CLI.' +
        'codcliprinc,'
      '       CLI.enderent, CLI.bairroent, CLI.municent, CLI.estent,'
      '       CLI.codusur1, CLI.codusur2, CLI.codusur3,'
      
        '       CLI.codpraca, PRA.praca, CLI.codcob, COB.cobranca, CLI.co' +
        'dplpag, PAG.descricao PLANOPAG,'
      '       CLI.codrede, PRA.numregiao, ATI.codativ, ATI.ramo,'
      
        '       REPLACE(REPLACE(REPLACE(CLI.cgcent,'#39'/'#39','#39#39'),'#39'.'#39','#39#39'),'#39'-'#39','#39#39 +
        ') CNPJ, '
      
        '       (SELECT SUM(LIMCRED) FROM PCCLIENT WHERE CODCLIPRINC = CL' +
        'I.codcliprinc) LIMCRED,'
      '       '
      '       (SELECT SUM(VLATEND) '
      '          FROM PCPEDC, PCCLIENT  '
      '         WHERE PCPEDC.codcli = PCCLIENT.codcli'
      '           AND PCCLIENT.codcliprinc = CLI.codcliprinc '
      '           AND CONDVENDA = 1 '
      '           AND DTCANCEL IS NULL '
      '           AND POSICAO IN ('#39'L'#39','#39'M'#39') '
      '           AND CODFILIAL = :CODFILIAL) PEDABERTO,'
      '       '
      '       (SELECT SUM(VALOR) '
      '          FROM PCPREST, PCCLIENT '
      '         WHERE PCPREST.codcli = CLI.codcli '
      '           AND PCCLIENT.codcliprinc = CLI.codcliprinc'
      
        '           AND PCPREST.codcob NOT IN ('#39'DEVP'#39', '#39'DEVT'#39', '#39'BNF'#39', '#39'BN' +
        'FT'#39', '#39'BNFR'#39', '#39'BNTR'#39', '#39'BNRP'#39', '#39'CRED'#39','#39'DESD'#39')'
      '           AND DTPAG IS NULL '
      '           AND CODFILIAL = :CODFILIAL) VLABERTO,'
      '           '
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur1) SUPERV1,'
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur2) SUPERV2,'
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur3) SUPERV3    '
      '       '
      
        '  FROM PCCLIENT CLI, PCPRACA PRA, PCCOB COB, PCPLPAG PAG, PCATIV' +
        'I ATI  '
      ' WHERE 1 = 1'
      '   AND CLI.codpraca = PRA.codpraca'
      '   AND CLI.codcob = COB.codcob'
      '   AND CLI.codplpag = PAG.codplpag'
      '   AND CLI.codatv1 = ATI.codativ'
      
        '   AND ((CLI.codusur1 = :CODUSUR) OR (CLI.codusur2 = :CODUSUR) O' +
        'R (CLI.codusur3 = :CODUSUR))'
      ' UNION ALL'
      
        'SELECT CLI.codcli, CLI.cliente, CLI.fantasia, CLI.bloqueio, CLI.' +
        'codcliprinc,'
      '       CLI.enderent, CLI.bairroent, CLI.municent, CLI.estent,'
      '       CLI.codusur1, CLI.codusur2, CLI.codusur3,'
      
        '       CLI.codpraca, PRA.praca, CLI.codcob, COB.cobranca, CLI.co' +
        'dplpag, PAG.descricao PLANOPAG,'
      '       CLI.codrede, PRA.numregiao, ATI.codativ, ATI.ramo,'
      
        '       REPLACE(REPLACE(REPLACE(CLI.cgcent,'#39'/'#39','#39#39'),'#39'.'#39','#39#39'),'#39'-'#39','#39#39 +
        ') CNPJ, '
      
        '       (SELECT SUM(LIMCRED) FROM PCCLIENT WHERE CODCLIPRINC = CL' +
        'I.codcliprinc) LIMCRED,'
      '       '
      '       (SELECT SUM(VLATEND) '
      '          FROM PCPEDC, PCCLIENT  '
      '         WHERE PCPEDC.codcli = PCCLIENT.codcli'
      '           AND PCCLIENT.codcliprinc = CLI.codcliprinc '
      '           AND CONDVENDA = 1 '
      '           AND DTCANCEL IS NULL '
      '           AND POSICAO IN ('#39'L'#39','#39'M'#39') '
      '           AND CODFILIAL = :CODFILIAL) PEDABERTO,'
      '       '
      '       (SELECT SUM(VALOR) '
      '          FROM PCPREST, PCCLIENT '
      '         WHERE PCPREST.codcli = CLI.codcli '
      '           AND PCCLIENT.codcliprinc = CLI.codcliprinc'
      
        '           AND PCPREST.codcob NOT IN ('#39'DEVP'#39', '#39'DEVT'#39', '#39'BNF'#39', '#39'BN' +
        'FT'#39', '#39'BNFR'#39', '#39'BNTR'#39', '#39'BNRP'#39', '#39'CRED'#39','#39'DESD'#39')'
      '           AND DTPAG IS NULL '
      '           AND CODFILIAL = :CODFILIAL) VLABERTO,'
      '           '
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur1) SUPERV1,'
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur2) SUPERV2,'
      
        '       (SELECT PCUSUARI.codsupervisor FROM PCUSUARI WHERE PCUSUA' +
        'RI.codusur = CLI.codusur3) SUPERV3    '
      '       '
      
        '  FROM PCCLIENT CLI, PCPRACA PRA, PCCOB COB, PCPLPAG PAG, PCATIV' +
        'I ATI, PCUSURCLI USU   '
      ' WHERE 1 = 1'
      '   AND CLI.codpraca = PRA.codpraca'
      '   AND CLI.codcob = COB.codcob'
      '   AND CLI.codplpag = PAG.codplpag'
      '   AND CLI.codatv1 = ATI.codativ'
      '   AND CLI.codcli = USU.codcli'
      '   AND USU.codusur = :CODUSUR'
      '   AND USU.codusurpadrao = :CODFILIAL'
      ' ORDER BY CLIENTE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODFILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODUSUR'
        ParamType = ptUnknown
      end>
  end
end
