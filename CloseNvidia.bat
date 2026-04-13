@echo off
taskkill /f /im "NVIDIA Overlay.exe" >nul 2>&1


if exist "%USERPROFILE%\OneDrive\Desktop" (
    set "DESKTOP_PATH=%USERPROFILE%\OneDrive\Desktop"
) else (
    set "DESKTOP_PATH=%USERPROFILE%\Desktop"
)

set "SHORTCUT_PATH=%DESKTOP_PATH%\KillNVIDIA.lnk"
set "SCRIPT_FULL_PATH=%~f0"
set "FOLDER_PATH=%~dp0"
set "ICON_PATH=%FOLDER_PATH%nvidia_icon.ico"

if not exist "%SHORTCUT_PATH%" (
    powershell -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%SHORTCUT_PATH%');$s.TargetPath='%SCRIPT_FULL_PATH%';$s.IconLocation='%ICON_PATH%';$s.Save()"
    if exist "%SHORTCUT_PATH%" (
        echo Desktop shortcut created successfully!
    ) else (
        echo [!] Failed to create shortcut. Check permissions.
    )
)

echo.
echo NVIDIA Overlay process terminated.
echo.
pause
