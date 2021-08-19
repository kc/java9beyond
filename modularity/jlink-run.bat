@echo off

REM run jlink-build.cmd first to make this work!

echo -------------- Running jlink image ------------------------------------
.\output\my-jlink-image\bin\java.exe -p .\output\mlib -m secondnamed/com.example.second.Second

REM or
REM echo -------------- Running jlink image with launcher ----------------------
REM .\output\my-jlink-image\bin\start.bat
