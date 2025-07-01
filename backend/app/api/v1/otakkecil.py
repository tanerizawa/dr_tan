from fastapi import APIRouter
from app.services.otakkecil_engine import get_insight_from_journal

router = APIRouter()

@router.post("/insight/")
async def generate_insight(journal: dict):
    content = journal.get("content")
    insight = await get_insight_from_journal(content)
    return {"insight": insight}
