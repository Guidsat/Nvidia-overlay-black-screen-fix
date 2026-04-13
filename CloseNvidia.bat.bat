@echo off
taskkill /f /im "NVIDIA Overlay.exe"


set "SHORTCUT_PATH=%USERPROFILE%\Desktop\KillNVIDIA.lnk"

if not exist "%SHORTCUT_PATH%" (
    set "SCRIPT_FULL_PATH=%~f0"
    set "FOLDER_PATH=%~dp0"
    set "ICON_PATH=%FOLDER_PATH%nvidia_icon.ico"
    
    powershell -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%SHORTCUT_PATH%');$s.TargetPath='%SCRIPT_FULL_PATH%';$s.IconLocation='%ICON_PATH%';$s.Save()"
    
    echo Desktop shortcut created successfully.
)

echo NVIDIA Overlay closed.
pause