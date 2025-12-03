# No npm in BackendAPI

This repository's BackendAPI is a Python FastAPI service. There is no Node.js or npm usage for the BackendAPI container.

Preview/Start override:
- Use: bash start.sh (from BackendAPI directory)
- Uvicorn: exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001

If any preview system attempts `npm run start:dev` or similar, it is misconfigured. The top-level preview.override.json enforces the correct command.
