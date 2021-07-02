unit Utilidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
   TUtil = class
     public
       function fDevolveFloat(Sender : TEdit) : String;
       procedure IniciaEventos;
       procedure FormatCalc(Sender : TObject);
       procedure AbreParametros;
       procedure GravaParametros;
       procedure EventKeyPress(Sender: TObject; var Key: Char);
       procedure EventOnExit(Sender : TObject);
   end;

implementation

uses uDM, uPrincipal, Helper_Str;


procedure TUtil.GravaParametros;
begin
    //Verifica se campos estão corretos para gravar nos parametros;
    if (frmPrincipal.edPrecoGasolina.Text.ToCurrency <= 0) or
    (frmPrincipal.edPrecoDiesel.Text.ToCurrency <= 0) or
    (frmPrincipal.edAliquota.Text.ToCurrency <= 0) then begin
        frmPrincipal.pnBG1.Visible := False; frmPrincipal.pnBG2.Visible := False;
        frmPrincipal.pnBD1.Visible := False; frmPrincipal.pnBD2.Visible := False;
        ShowMessage('Verifique os Valores !');
        exit;
     end;

    // Grava os paramentros no banco
    try
      DM.FDConn.StartTransaction;
      DM.qryParametros.Active := True;
      if DM.qryParametros.RecordCount >0 then
         DM.qryParametros.Edit
      else DM.qryParametros.Append;
      DM.qryParametrosPAR_PRECOGASOLINA.asCurrency := frmPrincipal.edPrecoGasolina.Text.ToCurrency;
      DM.qryParametrosPAR_PRECODIESEL.asCurrency := frmPrincipal.edPrecoDiesel.Text.ToCurrency;
      DM.qryParametrosPAR_ALIQUOTA.asCurrency := frmPrincipal.edAliquota.Text.ToCurrency;
      DM.qryParametros.Post;
      DM.FDConn.Commit;
      DM.qryParametros.Active := False;
    except
      DM.qryParametros.Active := False;
      DM.FDConn.RollBack;
    end;
end;


procedure TUtil.AbreParametros;
begin
  //Abre e lê os parâmetros do banco de dados, e deixa em tela no Formulario : FrmPrincipal.
  try
    DM.qryParametros.Active := False;
    DM.qryParametros.Active := True;
    DM.qryParametros.Refresh;
    if DM.qryParametros.RecordCount>0 then
    begin
      frmPrincipal.edPrecoGasolina.Text := DM.qryParametrosPAR_PRECOGASOLINA.asString;
      frmPrincipal.edPrecoDiesel.Text := DM.qryParametrosPAR_PRECODIESEL.asString;
      frmPrincipal.edAliquota.Text := DM.qryParametrosPAR_ALIQUOTA.asString;
    end;
    DM.qryParametros.Active := False;
  except
    on E:Exception do
      ShowMessage('Erro ao carregar parâmetros : '+#13+e.message);
  end;
end;

procedure TUtil.IniciaEventos;
var
  x : integer;
begin
  //Rtti para passar em todos os Edits e fazer uma Formatação para Decimal com duas Casas decimais
  for x := 0 to frmPrincipal.ComponentCount -1 do
  begin
    if (frmPrincipal.Components[x] is TEdit) then
    begin
      TEdit(frmPrincipal.Components[x]).OnKeyPress := EventKeyPress;
      TEdit(frmPrincipal.Components[x]).OnExit := EventOnExit;
    end;
  end;
end;

procedure TUtil.FormatCalc(Sender : TObject);
begin
  TEdit(Sender).Text := fDevolveFloat(TEdit(Sender));
  frmPrincipal.edTotalG1.Text := FormatFloat('#0.00',
    (frmPrincipal.edLG1.Text.ToCurrency * frmPrincipal.edPrecoGasolina.Text.ToCurrency));
  frmPrincipal.edTotalG2.Text := FormatFloat('#0.00',
     (frmPrincipal.edLG2.Text.ToCurrency * frmPrincipal.edPrecoGasolina.Text.ToCurrency));
  frmPrincipal.edTotalD1.Text := FormatFloat('#0.00',
     (frmPrincipal.edLD1.Text.ToCurrency * frmPrincipal.edPrecoDiesel.Text.ToCurrency));
  frmPrincipal.edTotalD2.Text := FormatFloat('#0.00',
     (frmPrincipal.edLD2.Text.ToCurrency * frmPrincipal.edPrecoDiesel.Text.ToCurrency));
end;

procedure TUtil.EventKeyPress(Sender: TObject; var Key: Char);
begin
   //Para aceitar somente numeros e decimais
  if not (key in ['0'..'9',',',#8,#13]) then
    Key := #0;
end;

procedure TUtil.EventOnExit(Sender: TObject);
begin
     Utils.FormatCalc(Sender);
end;

function TUtil.fDevolveFloat(Sender : TEdit) : string;
var
  x : integer;
  b : boolean;
  Value : PChar;
  Res : string;
  cond : boolean;
begin
  //Le o Texto do Edit, e retira mais de uma virgula( ',' ), para não dar erro de conversão
  b := false;
  Res := '';
  Value := PChar(TEdit(Sender).Text);
  for x := 0 to Length(Value)-1 do
  begin
      if (Value[x]<>',') then
        Res := Res + Value[x];
      if (Value[x]=',') and not b then
      begin
        Res := Res + Value[x];
        b := true;
      end;
  end;
  //Verifica se são Edits de Litros
  cond := ((Sender.Name='edLG1') or
       (Sender.Name='edLG2') or
       (Sender.Name='edLD1') or
       (Sender.Name='edLD2'));
  if cond then
  begin
    if  (Res<>'')  then
    begin
       Result :=FormatFloat('#0.000',StrtoFloat(Res));
       exit;
    end else begin
       Result := '0,000';
       exit;
    end;
  end else if (Res<>'') and not cond then
  begin
    Result := FormatFloat('#0.00',StrToFloat(Res));
    exit;
  end else if (Res='') and not cond then
     Result := '0,00';
end;


end.
