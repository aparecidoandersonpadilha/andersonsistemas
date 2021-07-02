unit uDM;

interface

uses
  Vcl.Forms,System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  System.IniFiles, VCL.Dialogs;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryParametros: TFDQuery;
    qryParametrosPAR_ID: TIntegerField;
    qryParametrosPAR_ALIQUOTA: TFMTBCDField;
    qryParametrosPAR_PRECOGASOLINA: TFMTBCDField;
    qryParametrosPAR_PRECODIESEL: TFMTBCDField;
    FDTransaction1: TFDTransaction;
    qryRelSimples: TFDQuery;
    qryRelSimplesMOV_ALIQUOTA: TFMTBCDField;
    qryRelSimplesMOV_DATA: TDateField;
    qryRelSimplesMOV_HORA: TTimeField;
    qryRelSimplesMOV_BOMBA: TStringField;
    qryRelSimplesMOV_COMBUSTIVEL: TStringField;
    qryRelSimplesMOV_LITROS: TFMTBCDField;
    qryRelSimplesMOV_VALORCOMB: TFMTBCDField;
    qryRelSimplesMOV_VALORTOTAL: TFMTBCDField;
    qryRelSimplesMOV_IMPOSTO: TFMTBCDField;
    qryRelSimplesTotais: TFDQuery;
    qryRelSimplesTotaisSOMATORIA: TFMTBCDField;
    qryRelAgrupado: TFDQuery;
    qryRelAgrupadoTotais: TFDQuery;
    qryRelAgrupadoMOV_DATA: TDateField;
    qryRelAgrupadoMOV_COMBUSTIVEL: TStringField;
    qryRelAgrupadoMOV_BOMBA: TStringField;
    qryRelAgrupadoTotaisSUM: TFMTBCDField;
    qryRelAgrupadoLITROS: TFMTBCDField;
    qryRelAgrupadoVALORTOTAL: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function fAppend(data : TDate;bomba,combustivel : string;aliquota,preco,litros:real) : boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  lIniConf : TIniFile;
  lCaminho : string;
begin
  // Ao criar DataModulo, faz a leitura do caminho do banco do Config.INI

  //Verifica se existe arquivo
  if FileExists(ExtractFilePath(Application.ExeName)+'Config.ini') then
  begin
    lIniConf := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
    lCaminho := lIniConf.ReadString('SGBD','CAMINHO','');
    FDConn.Params.Database := lCaminho + 'BDPOSTOSABC.FDB';
    FDConn.Params.DriverID := 'FB';
    FDConn.Params.AddPair('Port','3050');
    FDConn.Params.AddPair('Protocol','ipTCPIP');
    FDConn.Params.UserName := 'SYSDBA';
    FDConn.Params.Password := 'masterkey';
    try
      FDConn.Connected := True;
    except
       on e: exception do
       begin
         ShowMessage('Erro ao abrir Parametros : '+#13 +e.message);
         FDConn.Connected := False;
         Application.Terminate;
       end;
    end;
    FDConn.Connected := False;

  //Caso não exista, cria e seta no diretorio do application.exe, e coloca na pasta SGBD, o caminho
  end else begin
    lIniConf := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
    lIniConf.WriteString('SGBD','CAMINHO',ExtractFilePath(Application.ExeName)+'SGBD\');
    FDConn.Params.Database := ExtractFilePath(Application.ExeName)+'\SGBD\BDPOSTOSABC.FDB';
    FDConn.Params.DriverID := 'FB';
    FDConn.Params.AddPair('Port','3050');
    FDConn.Params.AddPair('Protocol','ipTCPIP');
    FDConn.Params.UserName := 'SYSDBA';
    FDConn.Params.Password := 'masterkey';
    try
      FDConn.Connected := True;
      FDConn.Connected := False;
    except
      on z:Exception do
      begin
        ShowMessage('Erro ao abrir Parametros : '+#13 +z.message);
        FDConn.Connected := False;
        Application.Terminate;
      end;
    end;
  end;
end;

function TDM.fAppend(data : TDate;bomba,combustivel : string;aliquota,preco,litros:real) : boolean;
var
  qryAppend : TFDQuery;
  vValorTotal,vValorImposto : real;
begin
  //Funcao para gravar abastecimento de diesel ou gasolina, vindo da bomba
  try
    FDConn.StartTransaction;
    Result := True;
    qryAppend := TFDQuery.Create(nil);
    qryAppend.Connection := FDConn;
    qryAppend.SQL.Text := 'INSERT INTO MOVIMENTO (MOV_DATA,MOV_HORA,MOV_BOMBA,MOV_COMBUSTIVEL,MOV_ALIQUOTA,'+
            'MOV_LITROS,MOV_VALORCOMB,MOV_VALORTOTAL,MOV_IMPOSTO) VALUES ('+
            ':VMOV_DATA,'+
            ':VMOV_HORA,'+
            ':VMOV_BOMBA,'+
            ':VMOV_COMBUSTIVEL,'+
            ':VMOV_ALIQUOTA,'+
            ':VMOV_LITROS,'+
            ':VMOV_VALORCOMB,'+
            ':VMOV_VALORTOTAL,'+
            ':VMOV_IMPOSTO)';
    qryAppend.ParamByName('VMOV_DATA').AsDateTime := data;
    qryAppend.ParamByName('VMOV_HORA').AsDateTime := time;
    qryAppend.ParamByName('VMOV_BOMBA').AsString := bomba;
    qryAppend.ParamByName('VMOV_COMBUSTIVEL').AsString := combustivel;
    qryAppend.ParamByName('VMOV_ALIQUOTA').AsFloat := aliquota;
    qryAppend.ParamByName('VMOV_VALORCOMB').AsFloat := preco;
    qryAppend.ParamByName('VMOV_LITROS').AsFloat := litros;
    vValorTotal := preco*litros; // corrigido : Estava somando aliquota,foi retirado
    vValorImposto :=
      ((preco*litros)*aliquota)/100; // manteve : faz a soma do imposto e grava.
    qryAppend.ParamByName('VMOV_VALORTOTAL').AsFloat := vValorTotal;
    qryAppend.ParamByName('VMOV_IMPOSTO').AsFloat := vValorImposto;
    qryAppend.ExecSQL;
    FDConn.Commit;
  except
    FDConn.Rollback;
    Result := False;
    qryAppend.Active := False;
    FreeAndNil(qryAppend);
  end;

end;

end.
