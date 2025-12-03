#!/usr/bin/env bash
# Utility to ensure start.sh is executable for environments that ignore git exec bits.
set -euo pipefail
chmod +x start.sh
echo "start.sh is now executable"
