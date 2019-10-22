@Echo off
set data=M728_12345678;2019-10-08;2019-10-09;00:00
set outfile=u
Setlocal EnableDelayedExpansion
rem ean128 %data% %outfile%.bmp
rem for /F "" %%i in (z.txt) do zint -o %outfile%%%i.png -b %%i -d %data%
for /F "" %%i in (z.txt) do ean128 %%i %data% %outfile%%%i.bmp