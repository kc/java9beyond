@echo off
rmdir /Q /S output
mkdir output\classes

REM without intermediary jar; now the directoryname and modulename should match! hence first,second instead of -auto or -named
REM also, the sources root has to reside directly in the module directory

javac -d output/classes --module-source-path . -m first,second
java -p output/classes -m second/com.example.second.Second