@echo off
rmdir /Q /S output
mkdir output\mlib

REM build first ----------------------------
mkdir output\classes
REM list all source files in a txt-file:
dir /s /B first\*.java > sources.txt
REM compile  the source files from the txt-file:
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM build second ----------------------------
mkdir output\classes
REM list all source files in a txt-file:
dir /s /B second\*.java > sources.txt
REM compile  the source files from the txt-file:
javac -d output/classes @sources.txt
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

java -cp output\mlib\first.jar;output\mlib\second.jar com.example.second.Second