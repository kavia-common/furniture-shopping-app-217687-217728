#!/usr/bin/env bash
set -euo pipefail

# Simple start script for local/preview environments
# Ensures required packages are installed and then starts uvicorn on port 3001.

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

# Launch the API
exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001
