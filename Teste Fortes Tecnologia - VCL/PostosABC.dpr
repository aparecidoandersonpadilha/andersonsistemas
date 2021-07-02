program PostosABC;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Helper_Str in 'units\Helper_Str.pas',
  uDM in 'DM\uDM.pas' {DM: TDataModule},
  Utilidades in 'units\Utilidades.pas',
  uRelAgrupado in 'Relatorios\uRelAgrupado.pas' {frmRelAgrupado},
  uRelSimples in 'Relatorios\uRelSimples.pas' {frmRelSimples};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PostosABC';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
