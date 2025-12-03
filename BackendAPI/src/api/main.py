from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Furniture Shopping Backend API",
    description="Backend API providing services for the furniture shopping mobile app.",
    version="0.1.0",
    openapi_tags=[{"name": "Health", "description": "Service health and diagnostics"}],
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# PUBLIC_INTERFACE
@app.get(
    "/",
    tags=["Health"],
    summary="Health Check",
    description="Simple liveness probe for the API service.",
)
def health_check():
    """Return a simple healthy message indicating the service is alive."""
    return {"message": "Healthy"}
