#!/usr/bin/env bash
set -euo pipefail

# Simple start script for local/preview environments
# Ensures required packages are installed and then starts uvicorn on port 3001.
# Note: There is no npm usage in this service.

# Make sure the script remains executable even if exec bit is stripped in some environments
chmod +x "$0" || true

if ! command -v python &>/dev/null; then
  echo "Python is required to run the BackendAPI." >&2
  exit 1
fi

# Prefer pip from the same python executable
PY_BIN="$(command -v python)"
PIP_BIN="${PY_BIN%python}pip" || true
if ! command -v "$PIP_BIN" &>/dev/null; then
  PIP_BIN="pip"
fi

# Install dependencies; ignore cache for CI stability
"$PIP_BIN" install --no-cache-dir -r requirements.txt

# Launch the API via uvicorn, binding to 0.0.0.0:3001
exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001
