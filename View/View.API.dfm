object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'API Sigar - For'#231'a de Vendas'
  ClientHeight = 315
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInfo: TLabel
    Left = 8
    Top = 128
    Width = 6
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = '@MS UI Gothic'
    Font.Style = []
    ParentFont = False
  end
  object srv: TLabel
    Left = 8
    Top = 40
    Width = 7
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = '@MS UI Gothic'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 296
    Width = 549
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end
      item
        Width = 300
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 48
    Top = 8
  end
  object MainMenu: TMainMenu
    Left = 184
    Top = 48
    object File1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Servio1: TMenuItem
      Caption = 'Servi'#231'o'
      object Start1: TMenuItem
        Caption = 'Start'
        OnClick = Start1Click
      end
      object Stop1: TMenuItem
        Caption = 'Stop'
        OnClick = Stop1Click
      end
    end
    object Opes1: TMenuItem
      Caption = 'Retaguarda'
      object LogUsuarios1: TMenuItem
        Caption = 'Retorno'
      end
    end
    object Help1: TMenuItem
      Caption = 'Ajuda'
      object Doc1: TMenuItem
        Caption = 'Documenta'#231#227'o'
      end
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
end
