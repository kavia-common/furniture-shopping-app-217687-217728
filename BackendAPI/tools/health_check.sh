#!/usr/bin/env bash
# Simple health check script to verify the BackendAPI is listening on port 3001 and GET / returns 200.
set -euo pipefail

URL="${1:-http://127.0.0.1:3001/}"
echo "[BackendAPI][health_check] Checking ${URL} ..."
STATUS=$(python - <<PY
import sys
import http.client
import urllib.parse

u = urllib.parse.urlparse(sys.argv[1] if len(sys.argv) > 1 else "${URL}")
conn = http.client.HTTPConnection(u.hostname, u.port or 80, timeout=3)
conn.request("GET", u.path or "/")
res = conn.getresponse()
print(res.status)
PY
"${URL}")

echo "[BackendAPI][health_check] Status code: ${STATUS}"
if [ "${STATUS}" != "200" ]; then
  echo "[BackendAPI][health_check] ERROR: Expected 200" >&2
  exit 1
fi
echo "[BackendAPI][health_check] OK"
