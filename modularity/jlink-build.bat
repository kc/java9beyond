@echo off

REM creates a minimal JRE with only java.base
REM run 3-....cmd first to make this work!

RMDIR /Q/S output\my-jlink-image

jlink --module-path output\mlib ^
--add-modules java.base,firstnamed,secondnamed ^
--output output/my-jlink-image
REM with additional options:
REM --launcher start=secondnamed/com.example.second.Second ^
REM --compress 2 ^
REM --verbose ^
REM --strip-debug ^
REM --no-header-files ^
REM --no-man-pages

