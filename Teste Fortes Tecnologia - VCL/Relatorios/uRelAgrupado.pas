unit uRelAgrupado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrmRelAgrupado = class(TForm)
    Rel: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    lbPeriodo: TRLLabel;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw16: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand4: TRLBand;
    RLDraw19: TRLDraw;
    RLLabel12: TRLLabel;
    dsDetalhe: TDataSource;
    RLDBText10: TRLDBText;
    dsTotais: TDataSource;
    RLDraw2: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw8: TRLDraw;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAgrupado: TfrmRelAgrupado;

implementation

{$R *.dfm}

uses uDM;

end.
