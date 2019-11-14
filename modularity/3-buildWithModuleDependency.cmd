REM module sources with module-info.java and dependency and therefore -p instead of -cp
@echo off
rmdir /Q /S output
mkdir output\mlib

mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes -p output\mlib\first.jar @sources.txt rem now with -p (=module path)
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt


java -p output\mlib -m secondmodulename/com.example.second.Second rem with -p; all jar names can be omitted :-); prefix main class with module name
REM with intermediary jar; the directoryname and modulename do not have to match; hence secondmodulename instead of second (recompile with thesecond in module-info)