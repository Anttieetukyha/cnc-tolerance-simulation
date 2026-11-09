#!/bin/bash
# CNC Tolerance Monitor — Local Server (macOS)

echo ""
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║   CNC Tolerance Monitor — SPC Dashboard      ║"
echo "  ║   Starting local server on port 8000...       ║"
echo "  ╚══════════════════════════════════════════════╝"
echo ""
echo "  Open your browser at:  http://localhost:8000"
echo "  Press Ctrl+C to stop the server."
echo ""

cd "$(dirname "$0")"
open "http://localhost:8000"
python3 -m http.server 8000
