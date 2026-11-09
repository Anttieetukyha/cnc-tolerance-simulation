# Agent Instructions (`agents.md`)

## Project Overview
This project is a lightweight, real-time manufacturing simulation web application. It simulates a single CNC Turning Center producing steel shafts and monitors part diameter tolerances in real time using Statistical Process Control (SPC) principles.

## Technical Constraints & Architecture
1. **Zero Database Dependency:** Do NOT use PostgreSQL, SQLite, or any external database. All telemetry and tolerance data must be generated dynamically on the client side using JavaScript.
2. **Single-File Portability:** The application must work directly by double-clicking `index.html` or via a zero-dependency local server script (`python -m http.server`).
3. **External Libraries:** Use CDN links only (Chart.js for live graphing, Tailwind CSS for styling). Do not require `npm install` or build steps.

## Simulation Logic Requirements
- **Machine:** CNC Lathe (Shaft Diameter Machining).
- **Nominal Dimension:** 50.000 mm.
- **Upper Specification Limit (USL):** 50.050 mm.
- **Lower Specification Limit (LSL):** 49.950 mm.
- **Data Generation:** Generate a new part measurement every 1.5 seconds using a normal (Gaussian) distribution centered around the nominal value, with an optional toggle to simulate tool wear (gradual drift towards USL) or random anomalies.

## UI/UX Guidelines
- Industrial dark-mode dashboard aesthetic.
- Live status indicators: Machine State (Running/Stopped), Total Parts, Good Parts, Scrap Parts (Out of Tolerance), and Real-Time Yield (%).
- Live updating line chart displaying the last 30 parts alongside horizontal reference lines for Nominal, USL, and LSL.
