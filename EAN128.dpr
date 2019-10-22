program EAN128;
// https://en.wikipedia.org/wiki/GS1-128
// https://sourceforge.net/projects/zint/
// https://www.terryburton.co.uk/barcodewriter/generator/
// http://www.barcode-generator.org/
// https://www.tec-it.com/en/support/knowbase/barcode-overview/linear/Default.aspx#EAN128%20/%20GS1-128
// https://barcode.tec-it.com/ru/Code128?data=M728_12345678%3B2019-10-08%3B2019-10-09%3B00%3A00
// https://www.nicelabel.com/ru/free-barcode-generator

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, StrUtils, uZintBarcode, VCL.Graphics;

begin
  try
    if (ParamCount < 3) then
    begin
      Writeln('Using: EAN128 <CODETYPE> <CODE> <FILENAME>');
      ExitCode := 1;
    end
    else
    begin
      var BC := TZintBarcode.Create;
      try
        BC.BarcodeType := TZBType(StrToIntDef(ParamStr(1), 0));
        BC.OutputOptions := [tBARCODE_NO_ASCII];
        BC.Data := ParamStr(2).Replace('(', '[').Replace(')', ']');
        var bmp := TBitmap.Create;
        try
          BC.GetBarcode(bmp);
          bmp.SaveToFile(ParamStr(3));
        finally
          bmp.Free;
        end;
      finally
        BC.Free;
      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
