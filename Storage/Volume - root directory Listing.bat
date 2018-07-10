@ECHO OFF

FOR %%A in (D E F G H I J K L M N O P Q R S T U V W X Y Z) DO CALL :X %%A
PAUSE
GOTO END

:X
IF NOT EXIST %1:\ GOTO END

REM *** Put label in LABEL variable ***
LABEL %1:< label.txt | LMOD SET LABEL=[$8] >%TEMP%\TEMP.BAT
CALL %TEMP%\TEMP.BAT

REM *** Create CSV file with label and drive letter on top ***
ECHO "%X: %LABEL%">"%LABEL%.CSV"
DIR /B /AD-H %1:\>>"%LABEL%.CSV"

ECHO "%X: %LABEL%"     >"%LABEL%_[sorted by date].CSV"
DIR /B /AD-H /O-D %1:\>>"%LABEL%_[sorted by date].CSV"

:END
