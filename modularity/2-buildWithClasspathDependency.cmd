@echo off
REM classic style without module-info.java but with dependency and therefore -cp needed
rmdir /Q /S output\mlib
mkdir output\mlib

mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/first.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes -cp output\mlib\first.jar @sources.txt
jar -c -f output/mlib/secondauto.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

echo -------------- Running in the classpath ------------------------------------
java -cp output\mlib\first.jar;output\mlib\secondauto.jar com.example.second.Second 

echo -------------  Running in the modulepath using automatic module name -------
java -p output\mlib -m secondauto/com.example.second.Second

REM when running classic jar in the modulepath, jar becomes module with automatic name == jar name
REM for java.exe prefix main class with automatic module name

REM -d examines metadata of module graph (2b)
echo --- Module data of first is: ---
jar -f output\mlib\first.jar -d 
echo --- Module data of second is: ---
jar -f output\mlib\secondauto.jar -d 