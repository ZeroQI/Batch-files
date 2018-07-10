@ECHO OFF
IF NOT "%1"=="" GOTO LOOP
SET OUTPUT=.
copy lmod.com \lmod.com
REM lmod doesn't run under easyphp directory due to my config
DEL /Q *.csv
FOR %%A in (E F G H I J K L M N O P Q R S T U V W X Y Z) DO CALL %0 %%A
PAUSE
GOTO END

:LOOP
IF NOT EXIST "%1:\" GOTO END
REM *** Get LABEL variable *** with XP Label, $8 in french, $6 in english ***
ECHO.

type label.txt | LABEL %1: | \LMOD.COM SET LABEL=[$6:24]>%TEMP%\TEMP.BAT
DIR /B /AD-H /O-D %1:\|FIND /C /V "\r"|\LMOD SET Y=[]>>%TEMP%\TEMP.BAT
CALL %TEMP%\TEMP.BAT

REM *** If less than 9 directories, parse directory recursively not only root ***
SET S=
IF "%Y%"=="0" GOTO END
IF "%Y%"=="1" SET S=/S
IF "%Y%"=="2" SET S=/S
IF "%Y%"=="3" SET S=/S
IF "%Y%"=="4" SET S=/S
IF "%Y%"=="5" SET S=/S
IF "%Y%"=="6" SET S=/S
IF "%Y%"=="7" SET S=/S
IF "%Y%"=="8" SET S=/S

SET FILE=(%1) %LABEL%.csv
ECHO.
ECHO Generate "%FILE%" with parameter "DIR /B /AD-H %S% %1:\"
DIR /B /AD-H %S% %1:\>"%OUTPUT%\%FILE%"
SET Z=%ERRORLEVEL%
IF "%Z%"=="1" ECHO [Drive %1:] "%LABEL%" has no directories, skipping
IF "%Z%"=="1" GOTO END
IF "%Z%"=="0" GOTO END

ECHO "%LABEL%" has errors, lauching "CHKDSK /F %1:", press enter
PAUSE
CHKDSK /F %1:
CALL %0 %1

:END
