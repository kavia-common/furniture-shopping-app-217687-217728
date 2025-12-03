# BackendAPI Preview Diagnostics

- Working directory should be: BackendAPI
- Effective preview/start command should be: bash start.sh
- If your preview runner insists on npm, a local npm shim is provided:
  - package.json scripts.start -> bash start.sh
  - This still runs uvicorn on 0.0.0.0:3001

What start.sh does:
1) Prints working directory and effective command
2) Installs requirements.txt
3) Verifies FastAPI and src.api.main:app import
4) Execs uvicorn: `exec uvicorn src.api.main:app --host 0.0.0.0 --port 3001`

Health:
- GET / returns 200 with {"message": "Healthy"}
- Use tools/health_check.sh to validate locally: `bash tools/health_check.sh`
