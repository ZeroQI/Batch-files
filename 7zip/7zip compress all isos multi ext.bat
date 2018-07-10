@ECHO OFF
REM set $PATH="K:\FOD-FDC\TSG\HOLDING\ROTATE\OSU-090344\Vol_4_complete\"
REM pushd %$path%
REM UFD PATH
for %%X in (*.iso) do "C:\Program Files\7-Zip\7z.exe" a "%%X.7z" "%%~nX.iso" "%%~nX.MDS" -t7z -m9=lzma2 -mx -mmt2
REM popd
