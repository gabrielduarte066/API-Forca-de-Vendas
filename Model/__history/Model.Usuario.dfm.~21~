object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 188
  Width = 344
  object qrUsuario: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      
        'SELECT EMP.matricula, EMP.nome, USU.codusur, USU.codsupervisor, ' +
        'USU.codfilial,'
      
        '       UPPER(EMP.usuariobd) USUARIOBD, UPPER(DECRYPT(SENHABD, EM' +
        'P.usuariobd)) SENHA'
      '  FROM PCEMPR EMP, PCUSUARI USU'
      ' WHERE EMP.codusur = USU.codusur'
      '   AND EMP.dtdemissao IS NULL'
      '   AND USU.dttermino IS NULL')
    Params = <>
    Left = 40
    Top = 24
    object qrUsuarioMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
      Required = True
    end
    object qrUsuarioNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object qrUsuarioCODUSUR: TSmallintField
      FieldName = 'CODUSUR'
      Required = True
    end
    object qrUsuarioCODSUPERVISOR: TSmallintField
      FieldName = 'CODSUPERVISOR'
      Required = True
    end
    object qrUsuarioCODFILIAL: TWideStringField
      FieldName = 'CODFILIAL'
      Size = 2
    end
    object qrUsuarioUSUARIOBD: TWideStringField
      FieldName = 'USUARIOBD'
      ReadOnly = True
      Size = 15
    end
    object qrUsuarioSENHA: TWideStringField
      FieldName = 'SENHA'
      ReadOnly = True
      Size = 4000
    end
  end
  object qrPermissaoUsuario: TZReadOnlyQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT I.codusuario, I.codcontrole'
      '  FROM PCCONTROI I '
      ' WHERE I.acesso = '#39'S'#39
      '   AND I.codrotina = 10000')
    Params = <>
    Left = 120
    Top = 24
    object qrPermissaoUsuarioCODUSUARIO: TIntegerField
      FieldName = 'CODUSUARIO'
      Required = True
    end
    object qrPermissaoUsuarioCODCONTROLE: TIntegerField
      FieldName = 'CODCONTROLE'
      Required = True
    end
  end
end
