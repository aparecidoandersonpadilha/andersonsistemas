unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Utilidades, Vcl.Buttons, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TEvKeyPress = procedure(Sender: TObject; var Key: Char) of object;
  TEvOnExit = procedure(Sender : TObject) of object;
  TfrmPrincipal = class(TForm)
    shpTG: TShape;
    shpTD: TShape;
    lbGAS: TLabel;
    lbDIESEL: TLabel;
    lbTANG: TLabel;
    lbTAND: TLabel;
    pnParametros: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edPrecoGasolina: TEdit;
    edPrecoDiesel: TEdit;
    Label12: TLabel;
    edAliquota: TEdit;
    btAbrirBombas: TButton;
    dtMovimento: TDateTimePicker;
    pnBG1: TPanel;
    imgBOMBAG1: TImage;
    lbBOMBAG1: TLabel;
    pnBG2: TPanel;
    lbBOMBAG2: TLabel;
    pnBD1: TPanel;
    lbBOMBAD1: TLabel;
    imgBombaD1: TImage;
    pnBD2: TPanel;
    lbBOMBAD2: TLabel;
    imgBOMBAD2: TImage;
    edLG1: TEdit;
    edPG1: TEdit;
    lbPrecoG1: TLabel;
    lbLitrosG1: TLabel;
    lbLitrosD1: TLabel;
    edLD1: TEdit;
    edPD1: TEdit;
    lbPrecoD1: TLabel;
    lbLitrosD2: TLabel;
    edLD2: TEdit;
    edPD2: TEdit;
    lbPrecoD2: TLabel;
    lbLitrosG2: TLabel;
    edLG2: TEdit;
    edPG2: TEdit;
    lbPrecoG2: TLabel;
    btBG1: TButton;
    btBD1: TButton;
    btBG2: TButton;
    btBD2: TButton;
    dtI: TDateTimePicker;
    dtF: TDateTimePicker;
    Label21: TLabel;
    Label22: TLabel;
    btListagem: TButton;
    btAgrupado: TBitBtn;
    Label1: TLabel;
    edTotalG1: TEdit;
    edTotalD1: TEdit;
    Label2: TLabel;
    edTotalG2: TEdit;
    Label3: TLabel;
    edTotalD2: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Panel2: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Panel4: TPanel;
    Label30: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    procedure btAbrirBombasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btBG1Click(Sender: TObject);
    procedure btBG2Click(Sender: TObject);
    procedure btBD1Click(Sender: TObject);
    procedure btBD2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btListagemClick(Sender: TObject);
    procedure btAgrupadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Utils : TUtil;

implementation

{$R *.dfm}

uses Helper_Str, uDM, uRelSimples, uRelAgrupado;

procedure TfrmPrincipal.btAgrupadoClick(Sender: TObject);
begin
 if dtI.Date <= dtF.Date  then
 begin
   //Seta Query / Detalhe para Relatorio Agrupado
   dm.qryRelAgrupado.Active := False;
   dm.qryRelAgrupado.ParamByName('VDATA').asDateTime := dtI.Date;
   dm.qryRelAgrupado.ParamByName('VDATAF').asDateTime := dtF.Date;
   dm.qryRelAgrupado.Active := True;

   //Seta Query / Totais para Relatorio Agrupado
   dm.qryRelAgrupadoTotais.Active := False;
   dm.qryRelAgrupadoTotais.ParamByName('VDATA').asDateTime := dtI.Date;
   dm.qryRelAgrupadoTotais.ParamByName('VDATAF').asDateTime := dtF.Date;
   dm.qryRelAgrupadoTotais.Active := True;

   //Dá refresh para atualizar dados
   try
     dm.qryRelAgrupado.Refresh;
     dm.qryRelAgrupadoTotais.Refresh;
   except

   end;

   //Cria formulario de Relatorio
   frmRelAgrupado := TfrmRelAgrupado.Create(Application);

   //Passa descrição de período
   frmRelAgrupado.lbPeriodo.Caption := 'De : '+DateToStr(dtI.Date) + ' à : '+DateToStr(dtF.Date);

   //Exibe em tela formato Modal;
   frmRelAgrupado.Rel.PreviewModal;

   //Libera formulario da Memoria;
   FreeAndNil(frmRelAgrupado);
 end;
end;

procedure TfrmPrincipal.btBD1Click(Sender: TObject);
var
  lRes : boolean;
begin
    //Helpers * Transforma Texto direto em StrCurr
    if edLD1.Text.ToCurrency<=0 then exit;

    //Recebe a function e passa os paramentros para function de gravação de Abastecimento
    lRes :=
    DM.fAppend(DtMovimento.date,
                'BOMBA D1',
                'DIESEL',
                edALiquota.Text.ToCurrency,
                edPD1.Text.ToCurrency,
                edLD1.Text.ToCurrency);
    if lRes then
    begin
      ShowMessage('GRAVADO COM SUCESSO !');
      edPD1.Text := edPrecoDiesel.Text;
      edLD1.Text := '0,000';
      edTotalD1.Text := '0,00';
    end else ShowMessage('FALHA NA GRAVAÇÃO !');

end;

procedure TfrmPrincipal.btBD2Click(Sender: TObject);
var
  lRes : boolean;
begin
    //Helpers * Transforma Texto direto em StrCurr
    if edLD2.Text.ToCurrency<=0 then exit;

    //Recebe a function e passa os paramentros para function de gravação de Abastecimento
    lRes :=
    DM.fAppend(DtMovimento.date,
                'BOMBA D2',
                'DIESEL',
                edALiquota.Text.ToCurrency,
                edPD2.Text.ToCurrency,
                edLD2.Text.ToCurrency);
    if lRes then
    begin
      ShowMessage('GRAVADO COM SUCESSO !');
      edPD2.Text := edPrecoDiesel.Text;
      edLD2.Text := '0,000';
      edTotalD2.Text := '0,00';
    end else ShowMessage('FALHA NA GRAVAÇÃO !');
end;

procedure TfrmPrincipal.btBG1Click(Sender: TObject);
var
  lRes : boolean;
begin
    //Helpers * Transforma Texto direto em StrCurr
    if edLG1.Text.ToCurrency<=0 then exit;

    //Recebe a function e passa os paramentros para function de gravação de Abastecimento
    lRes :=
    DM.fAppend(DtMovimento.date,
                'BOMBA G1',
                'GASOLINA',
                edALiquota.Text.ToCurrency,
                edPG1.Text.ToCurrency,
                edLG1.Text.ToCurrency);
    if lRes then
    begin
      ShowMessage('GRAVADO COM SUCESSO !');
      edPG1.Text := edPrecoGasolina.Text;
      edLG1.Text := '0,000';
      edTotalG1.Text := '0,00';
    end else ShowMessage('FALHA NA GRAVAÇÃO !');
end;

procedure TfrmPrincipal.btBG2Click(Sender: TObject);
var
  lRes : boolean;
begin
    //Helpers * Transforma Texto direto em StrCurr
    if edLG2.Text.ToCurrency<=0 then exit;

    //Recebe a function e passa os paramentros para function de gravação de Abastecimento
    lRes :=
    DM.fAppend(DtMovimento.date,
                'BOMBA G2',
                'GASOLINA',
                edALiquota.Text.ToCurrency,
                edPG2.Text.ToCurrency,
                edLG2.Text.ToCurrency);
    if lRes then
    begin
      ShowMessage('GRAVADO COM SUCESSO !');
      edPG2.Text := edPrecoGasolina.Text;
      edLG2.Text := '0,000';
      edTotalG2.Text := '0,00';
    end else ShowMessage('FALHA NA GRAVAÇÃO !');

end;

procedure TfrmPrincipal.btListagemClick(Sender: TObject);
begin
 if dtI.Date <= dtF.Date  then
 begin
   //Seta Query / Detalhe para Relatorio Simples
   dm.qryRelSimples.Active := False;
   dm.qryRelSimples.ParamByName('VDATA').asDateTime := dtI.Date;
   dm.qryRelSimples.ParamByName('VDATAF').asDateTime := dtF.Date;
   dm.qryRelSimples.Active := True;

   //Seta Query / Totais para Relatorio Simples
   dm.qryRelSimplesTotais.Active := False;
   dm.qryRelSimplesTotais.ParamByName('VDATA').asDateTime := dtI.Date;
   dm.qryRelSimplesTotais.ParamByName('VDATAF').asDateTime := dtF.Date;
   dm.qryRelSimplesTotais.Active := True;

   //Dá refresh para atualizar dados
   try
     dm.qryRelSimples.Refresh;
     dm.qryRelSimplesTotais.Refresh;
   except

   end;

   //Cria formulario de Relatorio
   frmRelSimples := TfrmRelSimples.Create(Application);

   //Passa descrição de periodo
   frmRelSimples.lbPeriodo.Caption := 'De : '+DateToStr(dtI.Date) + ' à : '+DateToStr(dtF.Date);

   //Exibe em tela formato Modal;
   frmRelSimples.Rel.PreviewModal;

   //Libera formulario da Memoria;
   FreeAndNil(frmRelSimples);

 end;
end;

procedure TfrmPrincipal.btAbrirBombasClick(Sender: TObject);
begin

    // Grava novos parametros;
    Utils.GravaParametros;

    //Passa para bombas preço dos combustiveis
    edPG1.Text := edPrecoGasolina.Text;
    edPG2.Text := edPrecoGasolina.Text;
    edPD1.Text := edPrecoDiesel.Text;
    edPD2.Text := edPrecoDiesel.Text;

    //habilita abastecimento
    pnBG1.Visible := True; pnBG2.Visible := True;
    pnBD1.Visible := True; pnBD2.Visible := True;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //Instancia Classe TUtil
  Utils := TUtil.Create;

  //Abre parametros da tabela Paramentros do Banco de dados;
  Utils.AbreParametros;

  //Inicia eventos OnExit e OnKeyPress;
  Utils.IniciaEventos;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //Seta datas para data atual
  dtMovimento.Date := date;
  dtI.Date := date;
  dtF.Date := Date;
end;




end.
