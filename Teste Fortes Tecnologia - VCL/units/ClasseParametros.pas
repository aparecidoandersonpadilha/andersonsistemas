unit ClasseParametros;

interface

uses
  System.SysUtils, System.Types, System.Classes;

type
  TParametros = Class
  private
    FPrecoGasolina: real;
    FPrecoDiesel: real;
    FAliquota: real;
    procedure SetAliquota(const Value: real);
    procedure SetPrecoDiesel(const Value: real);
    procedure SetPrecoGasolina(const Value: real);
    public
      property Aliquota : real read FAliquota write SetAliquota;
      property PrecoGasolina : real read FPrecoGasolina write SetPrecoGasolina;
      property PrecoDiesel : real read FPrecoDiesel write SetPrecoDiesel;
  End;

  TBomba = Class
  private
    FIDBomba: integer;
    FCombustivel: string;
    procedure SetCombustivel(const Value: string);
    procedure SetIDBomba(const Value: integer);
    public
      property IDBomba : integer read FIDBomba write SetIDBomba;
      property Combustivel : string read FCombustivel write SetCombustivel;
  End;

implementation

{ TParametros }

procedure TParametros.SetAliquota(const Value: real);
begin
  FAliquota := Value;
end;

procedure TParametros.SetPrecoDiesel(const Value: real);
begin
  FPrecoDiesel := Value;
end;

procedure TParametros.SetPrecoGasolina(const Value: real);
begin
  FPrecoGasolina := Value;
end;

{ TBombas }

procedure TBomba.SetCombustivel(const Value: string);
begin
  FCombustivel := Value;
end;

procedure TBomba.SetIDBomba(const Value: integer);
begin
  FIDBomba := Value;
end;

end.
