#!/usr/bin/env bash
# Fallback single-entry script for environments that expect a single executable.
# This simply delegates to start.sh and ensures proper signal handling via exec.
set -euo pipefail

echo "[BackendAPI] run.sh invoked. Working directory: $(pwd)"

# Ensure start.sh is executable and present
if [ ! -f "start.sh" ]; then
  echo "start.sh not found in $(pwd). Ensure you are running from BackendAPI directory." >&2
  exit 1
fi

chmod +x start.sh || true

# Exec to replace the shell with the app process (proper PID, signals)
exec bash start.sh
