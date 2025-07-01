from fastapi import APIRouter

from .memory import router as memory_router
from .growth import router as growth_router
from .otakkecil import router as otakkecil_router

router = APIRouter()
router.include_router(memory_router, prefix="/memory", tags=["memory"])
router.include_router(growth_router, prefix="/growth", tags=["growth"])
router.include_router(otakkecil_router, prefix="/otakkecil", tags=["otakkecil"])
