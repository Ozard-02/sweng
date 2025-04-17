@echo off
echo Converting SVG files to PDF using Inkscape...
echo.

set FOLDER=./
if not exist "%FOLDER%" (
    echo Error: Folder %FOLDER% not found!
    exit /b 1
)

for %%f in ("%FOLDER%\*.svg") do (
    echo Converting %%~nxf to PDF...
    inkscape --export-filename="%FOLDER%\%%~nf.pdf" "%%f"
    if errorlevel 1 (
        echo Error converting %%~nxf
    ) else (
        echo Successfully converted %%~nxf to %%~nf.pdf
    )
)

echo.
echo Conversion complete!
pause