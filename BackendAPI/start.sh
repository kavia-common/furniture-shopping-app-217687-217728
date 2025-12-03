#!/usr/bin/env bash
set -euo pipefail

# Simple start script for local/preview environments
# Ensures required packages are installed and then starts uvicorn on port 3001.

if ! command -v python &>/dev/null; then
  echo "Python is required to run the BackendAPI." >&2
  exit 1
fi

# Install dependencies if a virtual environment is not used; ignore cache for CI stability
pip install --no-cache-dir -r requirements.txt

# Launch the API
exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001
