unit Helper_Str;

//CLASSE HELPER PARA FAZER CAST AUTOMATICO NO TEXT.TOCURRENCY.
interface

uses

  Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, System.StrUtils,  Winapi.Windows, System.SysUtils;

type
  TCaptionHelper = record helper for TCaption
  public
    function ToCurrency : Currency;
  end;

implementation


function TCaptionHelper.ToCurrency : Currency;
begin
  Result := StrToCurr(Self);
end;


end.
