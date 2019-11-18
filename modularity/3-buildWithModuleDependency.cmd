@echo off
REM sources with module-info.java (start without requires/exports) and dependency and therefore p instead of cp at javac and java
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
javac -d output/classes -p output\mlib\first.jar @sources.txt
jar -c -f output/mlib/secondauto.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM with -p all jar names can be omitted :-); prefix main class with (named) module name
java -p output\mlib -m secondmodule/com.example.second.Second 
REM with intermediary jar; the directoryname and modulename do not have to match; hence secondmodule instead of secondauto (recompile with secondmodule in module-info)