@ECHO OFF
for /d %%X in (*.*) do "C:\Program Files\7-Zip\7z.exe" a -tzip -mx=9 "%%X.zip" ".\%%X\*"
PAUSE
