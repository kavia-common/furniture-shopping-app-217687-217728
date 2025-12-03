from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import logging

# Configure basic logging for readiness/diagnostics
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("backendapi")

# PUBLIC_INTERFACE
def create_app() -> FastAPI:
    """Create and configure the FastAPI application."""
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

    # Log readiness once startup completes
    @app.on_event("startup")
    async def _on_startup():
        logger.info("BackendAPI FastAPI app started and ready to accept connections on port 3001")

    # PUBLIC_INTERFACE
    @app.get(
        "/",
        tags=["Health"],
        summary="Health Check",
        description="Simple liveness probe for the API service.",
        responses={200: {"description": "Service is healthy"}},
    )
    def health_check():
        """Return a simple healthy message indicating the service is alive."""
        return {"message": "Healthy"}

    return app


# Expose `app` for ASGI servers like uvicorn: uvicorn src.api.main:app --host 0.0.0.0 --port 3001
app = create_app()
