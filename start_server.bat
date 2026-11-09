@echo off
title CNC Tolerance Monitor — Local Server
echo.
echo  ╔══════════════════════════════════════════════╗
echo  ║   CNC Tolerance Monitor — SPC Dashboard      ║
echo  ║   Starting local server on port 8000...       ║
echo  ╚══════════════════════════════════════════════╝
echo.
echo  Open your browser at:  http://localhost:8000
echo  Press Ctrl+C to stop the server.
echo.

cd /d "%~dp0"
start http://localhost:8000
python -m http.server 8000
pause
