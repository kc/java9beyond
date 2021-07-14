@echo off
REM sources with module-info.java (start without requires/exports) and dependency and therefore p instead of cp at javac and java
rmdir /Q /S output\mlib
mkdir output\mlib

REM compile and build first
mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM compile and build second with first on the modulepath
mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes -p output\mlib\first.jar @sources.txt
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

echo -------------- Running in the modulepath ------------------------------------
REM with -p all jar names can be omitted :-); prefix main class with (named) module name
java -p output\mlib -m secondnamed/com.example.second.Second
