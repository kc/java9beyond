REM classic style without module-info.java but with dependency and therefore -cp needed
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
javac -d output/classes -cp output\mlib\first.jar @sources.txt rem now with -cp
jar -c -f output/mlib/second.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

echo Running in the classpath ----------------------
java -cp output\mlib\first.jar;output\mlib\second.jar com.example.second.Second rem now with -cp

REM -d examines metadata of module graph
jar -f output\mlib\first.jar -d 
jar -f output\mlib\second.jar -d 

echo Running in the modulepath using automatic module name -------
java -p output\mlib -m second/com.example.second.Second

REM when running classic jar in the modulepath, jar becomes module with automatic name