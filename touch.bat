@echo off
setlocal enabledelayedexpansion

set pwd=%CD%

:loop
if "%~1"=="" goto endloop

set "arg=%~1"

:split
set "token="
for /f "tokens=1* delims=\ " %%a in ("!arg!") do (
    set "token=%%a"
    set "arg=%%b"
    if not defined arg (
        break > !token!
    ) else (
        mkdir !token!
        cd !token!
    )
    if defined arg goto split
)

shift
cd %pwd%
goto loop

:endloop