# BackendAPI - FastAPI Service

This service is a FastAPI backend for the Furniture Shopping App.

## Run (local/preview)

- Port: 3001
- Entrypoint module: `src.api.main:app`

### Start with uvicorn (recommended)
```bash
uvicorn src.api.main:app --host 0.0.0.0 --port 3001
```

### Start via Procfile (if supported)
Procfile included:
```
web: uvicorn src.api.main:app --host 0.0.0.0 --port 3001
```

### Start via script
```bash
bash start.sh
```

Preview override:
- A top-level preview.override.json is included to force `bash start.sh` in environments that auto-detect Node/npm. Ensure your orchestrator supports this override.

Note: There is no Node/npm usage in this backend. Do not run npm start here. If your environment attempts to run npm, it is misconfigured—ensure it runs `bash start.sh` or `uvicorn ...` directly.

## Dependencies

Pinned dependencies are in `requirements.txt` and include:
- fastapi
- uvicorn[standard]
- pydantic
- starlette
- CORS middleware and supporting libs

## Health
Root endpoint `/` returns a JSON health response:
```json
{ "message": "Healthy" }
```
