@echo off
rmdir /Q /S output
mkdir output\mlib

REM with intermediary jar; now the directoryname and modulename do not have to match

mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes -p output\mlib\first.jar @sources.txt
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

java -p output\mlib -m thesecond/com.example.second.Second