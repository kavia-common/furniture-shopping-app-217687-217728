# No npm here

This BackendAPI is a Python FastAPI service. There is no Node.js or npm usage.
Start commands:
- uvicorn src.api.main:app --host 0.0.0.0 --port 3001
- bash start.sh

If your environment strips executable bits from scripts, run:
- bash ensure_exec.sh
to mark start.sh as executable.

Procfile is also provided for platforms that support it.
