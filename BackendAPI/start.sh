#!/usr/bin/env bash
set -euo pipefail

# Simple start script for local/preview environments.
# This service is Python/FastAPI only — there is NO npm usage or fallback here.

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

echo "[BackendAPI] Installing complete. Starting uvicorn on 0.0.0.0:3001 ..."
echo "[BackendAPI] Health endpoint will become ready at GET http://0.0.0.0:3001/"

# Launch the API via uvicorn, binding to 0.0.0.0:3001
# Use exec so the process PID is uvicorn (for proper signal handling)
exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001
