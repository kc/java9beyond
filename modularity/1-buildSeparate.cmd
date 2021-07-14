@echo off
REM classic style sources without module-info.java
rmdir /Q /S output\mlib
mkdir output\mlib

REM compile and build first
mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM compile and build second
mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM when running a classic jar in the classpath with java 9+ this is still possible
echo -------------- Running in the classpath ------------------------------------
java -cp output\mlib\second.jar com.example.second.Second
