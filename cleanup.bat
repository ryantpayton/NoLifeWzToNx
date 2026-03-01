@echo off
echo Cleaning up build artifacts...
if exist .vs rmdir /s /q .vs
if exist .history rmdir /s /q .history
if exist x64 rmdir /s /q x64
if exist x86 rmdir /s /q x86
if exist NoLifeWzToNx.vcxproj.user del /q NoLifeWzToNx.vcxproj.user
if exist NoLifeWzToNx.log del /q NoLifeWzToNx.log
echo Done!
pause
