object frmRelSimples: TfrmRelSimples
  Left = 0
  Top = 0
  Caption = 'frmRelSimples'
  ClientHeight = 361
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Rel: TRLReport
    Left = 8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dsDetalhe
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 102
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel1: TRLLabel
        Left = 1
        Top = 1
        Width = 716
        Height = 40
        Align = faTop
        Alignment = taCenter
        Caption = 'POSTOS ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 1
        Top = 41
        Width = 716
        Height = 40
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Listagem Simples'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPeriodo: TRLLabel
        Left = 1
        Top = 81
        Width = 716
        Height = 19
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Listagem Simples'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 140
      Width = 718
      Height = 19
      BandType = btColumnHeader
      object RLDraw1: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 20
      end
      object RLLabel3: TRLLabel
        Left = 3
        Top = 2
        Width = 33
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 77
        Top = 2
        Width = 34
        Height = 16
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 131
        Top = 1
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 192
        Top = 2
        Width = 82
        Height = 16
        Caption = 'Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 293
        Top = 2
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 370
        Top = 2
        Width = 39
        Height = 16
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 443
        Top = 2
        Width = 57
        Height = 16
        Caption = 'Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 631
        Top = 2
        Width = 74
        Height = 16
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 523
        Top = 2
        Width = 95
        Height = 16
        Caption = 'Valor Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw2: TRLDraw
        Left = 64
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw3: TRLDraw
        Left = 124
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw4: TRLDraw
        Left = 188
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw5: TRLDraw
        Left = 276
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw6: TRLDraw
        Left = 351
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw7: TRLDraw
        Left = 428
        Top = 0
        Width = 0
        Height = 20
      end
      object RLDraw8: TRLDraw
        Left = 516
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw9: TRLDraw
        Left = 620
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw20: TRLDraw
        Left = 429
        Top = -1
        Width = 0
        Height = 20
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 159
      Width = 718
      Height = 19
      object RLDraw10: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 20
      end
      object RLDraw11: TRLDraw
        Left = 64
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw12: TRLDraw
        Left = 124
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw13: TRLDraw
        Left = 188
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw14: TRLDraw
        Left = 276
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw15: TRLDraw
        Left = 351
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw16: TRLDraw
        Left = 428
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw17: TRLDraw
        Left = 516
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDraw18: TRLDraw
        Left = 620
        Top = 0
        Width = 1
        Height = 20
      end
      object RLDBText1: TRLDBText
        Left = 5
        Top = 4
        Width = 58
        Height = 13
        Alignment = taCenter
        DataField = 'MOV_DATA'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 68
        Top = 4
        Width = 54
        Height = 13
        Alignment = taCenter
        DataField = 'MOV_HORA'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 129
        Top = 4
        Width = 56
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_BOMBA'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 195
        Top = 4
        Width = 76
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_COMBUSTIVEL'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 289
        Top = 5
        Width = 56
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_VALORCOMB'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 361
        Top = 4
        Width = 56
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_LITROS'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 444
        Top = 4
        Width = 56
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_ALIQUOTA'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 624
        Top = 4
        Width = 92
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_VALORTOTAL'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 526
        Top = 3
        Width = 88
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOV_IMPOSTO'
        DataSource = dsDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 178
      Width = 718
      Height = 19
      BandType = btColumnFooter
      object RLDraw19: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 19
      end
      object RLLabel12: TRLLabel
        Left = 504
        Top = 1
        Width = 114
        Height = 16
        Caption = 'Somat'#243'ria Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 624
        Top = 3
        Width = 94
        Height = 13
        Alignment = taCenter
        DataField = 'SOMATORIA'
        DataSource = dsTotais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
  object dsDetalhe: TDataSource
    DataSet = DM.qryRelSimples
    Left = 80
    Top = 24
  end
  object dsTotais: TDataSource
    DataSet = DM.qryRelSimplesTotais
    Left = 80
    Top = 80
  end
end
