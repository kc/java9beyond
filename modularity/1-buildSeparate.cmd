@echo off
REM classic style sources without module-info.java
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
javac -d output/classes @sources.txt
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

echo -------------- Running in the classpath ------------------------------------
java -cp output\mlib\second.jar com.example.second.Second