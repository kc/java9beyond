@echo off
rmdir /Q /S output\classes
mkdir output\classes

REM without intermediary jar;
REM now the module name should the match directory name
REM rename the module name in module-info accordingly
REM also, the sources root has to reside directly in the module directory

javac -d output/classes --module-source-path . -m first,second
java -p output/classes -m second/com.example.second.Second
