@echo off
REM -d examines metadata of module graph
echo --- Module data of first is: ---
jar -f output\mlib\firstauto.jar -d
echo --- Module data of second is: ---
jar -f output\mlib\secondauto.jar -d
