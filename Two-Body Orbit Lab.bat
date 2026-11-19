@echo off
rem Opens the simulator in its own window (no browser tabs or address bar).
setlocal
set "PAGE=%~dp0two-body-orbit-lab.html"
if not exist "%PAGE%" (
  echo Could not find two-body-orbit-lab.html next to this launcher.
  pause
  exit /b 1
)
set "URL=file:///%PAGE:\=/%"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" >/dev/null 2>nul
if not errorlevel 1 (
  start "" msedge --app="%URL%" --window-size=1360,1000
  exit /b 0
)
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >/dev/null 2>nul
if not errorlevel 1 (
  start "" chrome --app="%URL%" --window-size=1360,1000
  exit /b 0
)
start "" "%PAGE%"
