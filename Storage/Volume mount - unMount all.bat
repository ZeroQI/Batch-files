@ECHO OFF
FOR /D %%x IN (C:\_MOUNT\*) DO MOUNTVOL "%%x" /D
FOR /D %%x IN (C:\_MOUNT\*) DO RD "%%x"
rem RD C:\_MOUNT
PAUSE
