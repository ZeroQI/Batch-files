@ECHO OFF
FOR %%A in (E F G H I J K L M N O P Q R S T U V W X Y Z) DO CALL :LOOP %%A
PAUSE
GOTO END

:LOOP
IF NOT EXIST "%1:\" GOTO END

REM *** Put label in LABEL variable ***
IF NOT EXIST \lmod.com copy lmod.com \lmod.com
LABEL %1:< label.txt | \LMOD SET LABEL=[$6:15] >%TEMP%\TEMP.BAT
CALL %TEMP%\TEMP.BAT
ECHO.

REM *** Mount all partitions ***
IF "%LABEL%"=="Removable Disk" GOTO END
IF NOT EXIST "C:\_MOUNT"         MD "C:\_MOUNT"
IF NOT EXIST "C:\_MOUNT\%LABEL%" MD "C:\_MOUNT\%LABEL%"
ECHO.

REM *** Read actual register DriveKey of volume ***
rem SET DKEY=?
rem FOR /F "delims=" %%x IN ('MOUNTVOL %1: /L') DO SET DKEY=%%x
rem IF "%DKEY%"=="?" GOTO END
rem ECHO.

rem MOUNTVOL "C:\_MOUNT\%LABEL%" %DKEY%
rem echo MOUNTVOL "C:\_MOUNT\%LABEL%" %DKEY%
rem ECHO.
:END
