### 👉 [Live Demo (Click here to open simulation in browser)](https://anttieetukyha.github.io/cnc-tolerance-simulation/

# CNC Tolerance Monitor — Real-Time SPC Dashboard

A lightweight, zero-dependency web application that simulates a **CNC Turning Center** producing steel shafts and monitors part diameter tolerances in real time using **Statistical Process Control (SPC)** principles.

![Dashboard Preview](https://img.shields.io/badge/status-simulation-blue?style=flat-square) ![No Build](https://img.shields.io/badge/build-none%20required-green?style=flat-square) ![License](https://img.shields.io/badge/license-MIT-yellow?style=flat-square)

---

## What It Does

The dashboard simulates a CNC lathe machining steel shafts with a **nominal diameter of 50.000 mm**. Every **1.5 seconds**, a new part is produced with a diameter drawn from a Gaussian (normal) distribution. The measurement is plotted on a live chart and checked against specification limits:

| Parameter | Value |
|---|---|
| **Nominal Dimension** | 50.000 mm |
| **Upper Specification Limit (USL)** | 50.050 mm |
| **Lower Specification Limit (LSL)** | 49.950 mm |

Parts outside the USL/LSL range are flagged as **scrap**. The dashboard tracks:

- **Machine State** — Running or Stopped (with animated status indicator)
- **Total Parts** produced
- **Good Parts** (within tolerance)
- **Scrap Parts** (out of tolerance)
- **Real-Time Yield (%)** — good parts / total parts
- **Last Diameter** — most recent measurement with pass/fail colouring
- **Live Line Chart** — rolling window of the last 30 parts with Nominal, USL, and LSL reference lines

### Interactive Controls

| Button | Description |
|---|---|
| **Pause / Resume** | Stops or restarts the simulated production cycle |
| **Tool Wear: OFF / ON** | Simulates gradual tool degradation — the mean diameter drifts toward the USL over time, producing more scrap as the "tool" wears out |
| **Reset** | Clears all data and restarts the simulation from scratch |

---

## How to Run

### Option 1 — Double-click `index.html`

Open `index.html` directly in any modern browser. No server required.

> **Note:** Tailwind CSS and Chart.js are loaded from CDNs, so an internet connection is needed on first load (browsers will cache them afterwards).

### Option 2 — Local server (macOS)

Double-click **`start_server.command`**. It will:

1. Start a Python HTTP server on port **8000**
2. Automatically open `http://localhost:8000` in your default browser

To stop the server, press `Ctrl+C` in the terminal window.

### Option 3 — Local server (Windows)

Double-click **`start_server.bat`**. It will:

1. Start a Python HTTP server on port **8000**
2. Automatically open `http://localhost:8000` in your default browser

To stop the server, press `Ctrl+C` in the command prompt.

### Option 4 — Manual server

```bash
cd cnc_tolerance_monitor
python3 -m http.server 8000
```

Then open [http://localhost:8000](http://localhost:8000).

---

## Repository Structure

```
cnc_tolerance_monitor/
├── index.html            # Complete self-contained SPC dashboard (HTML + CSS + JS)
├── start_server.command  # macOS — double-click to launch local server
├── start_server.bat      # Windows — double-click to launch local server
├── agents.md             # AI agent instructions and project specification
└── README.md             # This file
```

---

## Technical Details

- **No database** — all data is generated client-side in JavaScript
- **No build step** — no `npm install`, no bundler, no transpiler
- **Single HTML file** — everything is in `index.html`
- **External libraries (CDN only):**
  - [Tailwind CSS](https://tailwindcss.com/) — utility-first styling with dark industrial theme
  - [Chart.js](https://www.chartjs.org/) — live-updating line chart
- **Gaussian distribution** — measurements use the Box-Muller transform for realistic normal-distribution sampling
- **Tool wear model** — when enabled, the mean shifts +0.002 mm per part toward USL with gradually increasing variance, simulating real-world cutter degradation

---

## Requirements

- A modern web browser (Chrome, Firefox, Safari, Edge)
- Python 3 (only if using the local server scripts)
- Internet connection (for CDN libraries on first load)
