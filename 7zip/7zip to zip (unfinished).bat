@ECHO OFF

REM Decompress all 7z
"C:\Program Files\7-Zip\7z.exe" e *.7z -o 

for /d %%X in (*.*) do (

REM Compress all folders to zip
"C:\Program Files\7-Zip\7z.exe" a -tzip -mx=9 "%%X.zip" ".\%%X\*"

REM Delete folders
IF EXIST "%%X.zip" RMDIR [/S] [/Q] ".\%%X"

)

PAUSE
