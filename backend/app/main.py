from fastapi import FastAPI
from app.api.v1.api import router as api_v1_router

app = FastAPI(title="Dr Tan API")

app.include_router(api_v1_router, prefix="/api/v1")

@app.get("/")
async def read_root():
    return {"message": "ok"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
