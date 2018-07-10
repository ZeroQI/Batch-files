@ECHO OFF
for /d %%X in (*.*) do "C:\Program Files\7-Zip\7z.exe" a -t7z -m9=lzma2 -mx -mmt2 "%%X.7z" ".\%%X\*"
PAUSE
