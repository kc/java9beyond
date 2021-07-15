@echo off

REM run 1-buildSeparate.cmd first to make this work!
cd output/mlib
jdeps --generate-module-info . first.jar
cd ../..
