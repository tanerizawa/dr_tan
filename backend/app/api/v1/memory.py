from fastapi import APIRouter
from pydantic import BaseModel
from app.models.memory import memory_db, Memory

class MemoryCreate(BaseModel):
    content: str

router = APIRouter()

@router.get("/", response_model=list[Memory])
async def list_memories():
    return memory_db.all()

@router.post("/", response_model=Memory)
async def create_memory(mem: MemoryCreate):
    return memory_db.create(mem.content)
