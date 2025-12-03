# furniture-shopping-app-217687-217728

Containers:
- BackendAPI (FastAPI) — start with:
  - `uvicorn src.api.main:app --host 0.0.0.0 --port 3001`
  - or `bash start.sh` (run from the BackendAPI directory)
  - Procfile also available for platforms that support it

Preview/Start:
- This repository includes preview.yaml, kavia.json, and preview.override.json to ensure the preview system runs `bash start.sh` from the BackendAPI directory and binds to port 3001, with health check on `/`. There is no npm usage for BackendAPI.