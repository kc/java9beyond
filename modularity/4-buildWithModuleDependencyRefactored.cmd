@echo off
rmdir /Q /S output
mkdir output\classes

REM javac -d output/classes --module-source-path first;second -m thefirst,thesecond
REM java -p output/classes -m thesecond/com.example.second.Second

javac -d output/classes/first --module-source-path first -m thefirst
jar -c -f output/mlib/first.jar -C output/classes .
javac -d output/classes/second --module-source-path second -m thesecond
jar -c -f output/mlib/second.jar -C output/classes .

java -p output/classes -m thesecond/com.example.second.Second

rmdir /Q /S output