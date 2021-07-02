object frmRelAgrupado: TfrmRelAgrupado
  Left = 0
  Top = 0
  Caption = 'frmRelAgrupado'
  ClientHeight = 461
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
        Caption = 'Relat'#243'rio Agrupado'
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
        Top = 1
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
      object RLLabel5: TRLLabel
        Left = 71
        Top = 1
        Width = 111
        Height = 16
        Alignment = taCenter
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 191
        Top = 1
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
      object RLLabel10: TRLLabel
        Left = 283
        Top = 1
        Width = 132
        Height = 16
        Alignment = taCenter
        Caption = 'Valor Total'
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
      object RLDraw8: TRLDraw
        Left = 421
        Top = 1
        Width = 1
        Height = 18
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 159
      Width = 718
      Height = 20
      object RLDraw10: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 21
      end
      object RLDraw11: TRLDraw
        Left = 64
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
      object RLDraw16: TRLDraw
        Left = 421
        Top = 1
        Width = 1
        Height = 20
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 2
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
      object RLDBText3: TRLDBText
        Left = 71
        Top = 2
        Width = 111
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
        Left = 191
        Top = 2
        Width = 82
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
      object RLDBText8: TRLDBText
        Left = 283
        Top = 2
        Width = 132
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'VALORTOTAL'
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
      Top = 179
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
        Left = 161
        Top = 1
        Width = 114
        Height = 14
        Caption = 'Somat'#243'ria Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 283
        Top = 2
        Width = 132
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'SUM'
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
    DataSet = DM.qryRelAgrupado
    Left = 80
    Top = 24
  end
  object dsTotais: TDataSource
    DataSet = DM.qryRelAgrupadoTotais
    Left = 80
    Top = 80
  end
end
