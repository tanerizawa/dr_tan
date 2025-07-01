from fastapi import APIRouter
from pydantic import BaseModel
from app.models.growth import growth_db, Growth

class GrowthCreate(BaseModel):
    progress: str

router = APIRouter()

@router.get("/", response_model=list[Growth])
async def list_growth():
    return growth_db.all()

@router.post("/", response_model=Growth)
async def create_growth(item: GrowthCreate):
    return growth_db.create(item.progress)
