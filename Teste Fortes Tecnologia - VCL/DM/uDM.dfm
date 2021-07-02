object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 290
  Width = 380
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 64
    Top = 88
  end
  object qryParametros: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM PARAMETROS')
    Left = 200
    Top = 24
    object qryParametrosPAR_ID: TIntegerField
      FieldName = 'PAR_ID'
      Origin = 'PAR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParametrosPAR_ALIQUOTA: TFMTBCDField
      FieldName = 'PAR_ALIQUOTA'
      Origin = 'PAR_ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object qryParametrosPAR_PRECOGASOLINA: TFMTBCDField
      FieldName = 'PAR_PRECOGASOLINA'
      Origin = 'PAR_PRECOGASOLINA'
      Precision = 18
      Size = 2
    end
    object qryParametrosPAR_PRECODIESEL: TFMTBCDField
      FieldName = 'PAR_PRECODIESEL'
      Origin = 'PAR_PRECODIESEL'
      Precision = 18
      Size = 2
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConn
    Left = 64
    Top = 152
  end
  object qryRelSimples: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      'MOV2.MOV_ALIQUOTA,'
      'MOV2.MOV_DATA,MOV2.MOV_HORA,MOV2.MOV_BOMBA,'
      'MOV2.MOV_COMBUSTIVEL,MOV2.MOV_LITROS,'
      'MOV2.MOV_VALORCOMB,MOV2.MOV_VALORTOTAL,MOV2.MOV_IMPOSTO'
      'FROM MOVIMENTO AS MOV2'
      'WHERE ((MOV2.MOV_DATA>=:VDATA) AND '
      '(MOV2.MOV_DATA<=:VDATAF))'
      '')
    Left = 304
    Top = 24
    ParamData = <
      item
        Name = 'VDATA'
        DataType = ftDate
        ParamType = ptInput
        Value = '01/07/2021'
      end
      item
        Name = 'VDATAF'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelSimplesMOV_ALIQUOTA: TFMTBCDField
      FieldName = 'MOV_ALIQUOTA'
      Origin = 'MOV_ALIQUOTA'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object qryRelSimplesMOV_DATA: TDateField
      FieldName = 'MOV_DATA'
      Origin = 'MOV_DATA'
    end
    object qryRelSimplesMOV_HORA: TTimeField
      FieldName = 'MOV_HORA'
      Origin = 'MOV_HORA'
    end
    object qryRelSimplesMOV_BOMBA: TStringField
      FieldName = 'MOV_BOMBA'
      Origin = 'MOV_BOMBA'
      Size = 50
    end
    object qryRelSimplesMOV_COMBUSTIVEL: TStringField
      FieldName = 'MOV_COMBUSTIVEL'
      Origin = 'MOV_COMBUSTIVEL'
    end
    object qryRelSimplesMOV_LITROS: TFMTBCDField
      FieldName = 'MOV_LITROS'
      Origin = 'MOV_LITROS'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object qryRelSimplesMOV_VALORCOMB: TFMTBCDField
      FieldName = 'MOV_VALORCOMB'
      Origin = 'MOV_VALORCOMB'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryRelSimplesMOV_VALORTOTAL: TFMTBCDField
      FieldName = 'MOV_VALORTOTAL'
      Origin = 'MOV_VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryRelSimplesMOV_IMPOSTO: TFMTBCDField
      FieldName = 'MOV_IMPOSTO'
      Origin = 'MOV_IMPOSTO'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qryRelSimplesTotais: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT SUM(MOV_VALORTOTAL)SOMATORIA  FROM MOVIMENTO WHERE'
      '( (MOV_DATA>=:VDATA) AND (MOV_DATA<=:VDATAF))')
    Left = 304
    Top = 80
    ParamData = <
      item
        Name = 'VDATA'
        DataType = ftDate
        ParamType = ptInput
        Value = '01/07/2021'
      end
      item
        Name = 'VDATAF'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelSimplesTotaisSOMATORIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SOMATORIA'
      Origin = 'SOMATORIA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qryRelAgrupado: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      'MOV2.MOV_DATA,'
      'MOV2.MOV_COMBUSTIVEL,'
      'MOV2.MOV_BOMBA,'
      'SUM(MOV2.MOV_LITROS)LITROS,'
      'SUM(MOV2.MOV_VALORTOTAL)VALORTOTAL'
      'FROM MOVIMENTO AS MOV2'
      'WHERE ((MOV2.MOV_DATA>=:VDATA) AND '
      '(MOV2.MOV_DATA<=:VDATAF))'
      'GROUP BY '
      'MOV2.MOV_DATA,'
      'MOV2.MOV_COMBUSTIVEL,'
      'MOV2.MOV_BOMBA'
      'ORDER BY'
      'MOV2.MOV_DATA,'
      'MOV2.MOV_COMBUSTIVEL'
      ''
      '')
    Left = 304
    Top = 152
    ParamData = <
      item
        Name = 'VDATA'
        DataType = ftDate
        ParamType = ptInput
        Value = '01/07/2021'
      end
      item
        Name = 'VDATAF'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelAgrupadoMOV_DATA: TDateField
      FieldName = 'MOV_DATA'
      Origin = 'MOV_DATA'
    end
    object qryRelAgrupadoMOV_COMBUSTIVEL: TStringField
      FieldName = 'MOV_COMBUSTIVEL'
      Origin = 'MOV_COMBUSTIVEL'
    end
    object qryRelAgrupadoMOV_BOMBA: TStringField
      FieldName = 'MOV_BOMBA'
      Origin = 'MOV_BOMBA'
      Size = 50
    end
    object qryRelAgrupadoLITROS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LITROS'
      Origin = 'LITROS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object qryRelAgrupadoVALORTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qryRelAgrupadoTotais: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT SUM(MOV1.MOV_VALORTOTAL) FROM MOVIMENTO AS MOV1 '
      'WHERE '
      '((MOV1.MOV_DATA>=:VDATA) AND (MOV1.MOV_DATA<=:VDATAF))')
    Left = 304
    Top = 208
    ParamData = <
      item
        Name = 'VDATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VDATAF'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelAgrupadoTotaisSUM: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SUM'
      Origin = '"SUM"'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
