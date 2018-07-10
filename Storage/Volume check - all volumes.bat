@ECHO OFF
REM *** Read all register DriveKey ***
FOR /F "tokens=2 delims={}" %%x IN ('MOUNTVOL') DO call :LOOP \\?\Volume{%%x}
PAUSE
GOTO END

:LOOP
ECHO ================================================================================
ECHO Volume: %1
CHKDSK.EXE /F /V %1
IF NOT ERRORLEVEL==0 ECHO 

:END
