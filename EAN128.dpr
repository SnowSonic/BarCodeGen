program EAN128;
// https://en.wikipedia.org/wiki/GS1-128

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, StrUtils, uZintBarcode, VCL.Graphics;

begin
  try
    if (ParamCount < 2) then
    begin
      Writeln('Using: EAN128 <CODE> <FILENAME>');
      ExitCode := 1;
    end
    else
    begin
      var BC := TZintBarcode.Create;
      try
        BC.BarcodeType := tBARCODE_EAN128;
        BC.Data := ParamStr(1).Replace('(', '[').Replace(')', ']');
        var bmp := TBitmap.Create;
        try
          BC.GetBarcode(bmp);
          bmp.SaveToFile(ParamStr(2));
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
