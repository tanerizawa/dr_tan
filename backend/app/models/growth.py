from datetime import datetime
from typing import List
from pydantic import BaseModel

class Growth(BaseModel):
    id: int
    progress: str
    created_at: datetime

class GrowthDB:
    def __init__(self):
        self._data: List[Growth] = []
        self._id = 1

    def all(self) -> List[Growth]:
        return self._data

    def create(self, progress: str) -> Growth:
        growth = Growth(id=self._id, progress=progress, created_at=datetime.utcnow())
        self._id += 1
        self._data.append(growth)
        return growth

growth_db = GrowthDB()
