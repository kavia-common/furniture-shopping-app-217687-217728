# No npm here

This BackendAPI is a Python FastAPI service. There is no Node.js or npm usage.

Start commands (choose one):
- bash start.sh   # preferred for preview/dev environments
- bash run.sh     # fallback single-entrypoint if your runner expects one file
- uvicorn src.api.main:app --host 0.0.0.0 --port 3001  # direct start
- Procfile: `web: uvicorn src.api.main:app --host 0.0.0.0 --port 3001`

If your environment strips executable bits from scripts, run:
- bash ensure_exec.sh
to mark start.sh as executable.

Notes:
- There is no fallback to npm. If anything tries to call npm here, it is misconfigured.
- Service binds on port 3001 and exposes FastAPI app at `src.api.main:app`.
- Health endpoint: GET / should return 200 with `{"message":"Healthy"}`.
