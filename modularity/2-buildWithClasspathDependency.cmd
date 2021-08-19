@echo off
REM classic style without module-info.java but with dependency and therefore -cp needed
rmdir /Q /S output\mlib
mkdir output\mlib

REM compile and build first
mkdir output\classes
dir /s /B first\*.java > sources.txt
javac -d output/classes @sources.txt
jar -c -f output/mlib/firstauto.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM compile and build second with first on the classpath
mkdir output\classes
dir /s /B second\*.java > sources.txt
javac -d output/classes -cp output\mlib\firstauto.jar @sources.txt
jar -c -f output/mlib/secondauto.jar -C output/classes .
rmdir /Q /S output\classes
del sources.txt

REM when running classic dependent jars in the classpath with -cp, jars live in one happy family module called unnamed
echo -------------- Running in the classpath ------------------------------------
java -cp output\mlib\firstauto.jar;output\mlib\secondauto.jar com.example.second.Second

REM when running classic dependent jars in the modulepath with -p, jar becomes an automatic module with name == jar name
REM prefix main class with (automatic) module name
REM with -p, you don't have to list all the jars anymore, just provide the path
echo -------------  Running in the modulepath using automatic module name -------
java -p output\mlib -m secondauto/com.example.second.Second

REM when combined, classpath jars live in unnamed, module path classic jars live in a (automatic) module
echo -------------  Running first in the classpath and second in the modulepath  -------
move output\mlib\firstauto.jar output
java -cp output\firstauto.jar -p output\mlib -m secondauto/com.example.second.Second
move output\firstauto.jar output\mlib
