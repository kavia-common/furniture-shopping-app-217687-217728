#!/usr/bin/env bash
set -euo pipefail

# Ensure we are in the BackendAPI working directory
echo "[BackendAPI] Working directory: $(pwd)"
echo "[BackendAPI] start.sh path: $0"

# Make sure the script remains executable even if exec bit is stripped in some environments
chmod +x "$0" || true

# Ensure Python tooling is available
if ! command -v python &>/dev/null; then
  echo "[BackendAPI] ERROR: Python is required to run the BackendAPI." >&2
  exit 1
fi

# Prefer pip from the same python executable
PY_BIN="$(command -v python)"
PIP_BIN="${PY_BIN%python}pip" || true
if ! command -v "$PIP_BIN" &>/dev/null; then
  PIP_BIN="pip"
fi

# Install dependencies; ignore cache for CI stability
echo "[BackendAPI] Installing Python requirements from requirements.txt ..."
"$PIP_BIN" install --no-cache-dir -r requirements.txt

# Verify imports before starting
echo "[BackendAPI] Verifying FastAPI and app import ..."
python - <<'PY'
import importlib, sys
try:
    import fastapi  # noqa: F401
except Exception as e:
    print(f"[BackendAPI][ERROR] FastAPI import failed: {e}", file=sys.stderr)
    raise
try:
    mod = importlib.import_module("src.api.main")
    assert hasattr(mod, "app"), "src.api.main must define 'app'"
except Exception as e:
    print(f"[BackendAPI][ERROR] Importing src.api.main failed: {e}", file=sys.stderr)
    raise
print("[BackendAPI] Import verification OK.")
PY

echo "[BackendAPI] Starting uvicorn on 0.0.0.0:3001 ..."
# Use exec so the process PID is uvicorn (for proper signal handling)
exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001
