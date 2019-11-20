@echo off

REM creates a minimal JRE with only java.base
REM run 1-buildSeparate.cmd first to make this work!

RMDIR /Q/S output\my-jlink-image

jlink --module-path output\mlib ^
--add-modules java.base ^
--strip-debug ^
--compress 2 ^
--no-header-files ^
--no-man-pages ^
--output output/my-jlink-image ^