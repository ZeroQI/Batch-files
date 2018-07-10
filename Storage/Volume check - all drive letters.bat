@ECHO OFF
FOR %%A in (E F G H I J K L M N O P Q R S T U V W X Y Z) DO call :LOOP %%A
PAUSE
GOTO END

:LOOP
IF NOT EXIST "%1:\" GOTO END
ECHO ================================================================================
ECHO Drive: %1:
CHKDSK.EXE /F %1:
IF ERRORLEVEL==0 ECHO 

:END
