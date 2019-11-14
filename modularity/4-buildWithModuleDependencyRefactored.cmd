@echo off
rmdir /Q /S output
mkdir output\classes

REM now without intermediary jar; now the directoryname and modulename should match!
REM also, the sources root has to reside directly in the module directory

javac -d output/classes --module-source-path . -m first,second
java -p output/classes -m second/com.example.second.Second