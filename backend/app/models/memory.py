from datetime import datetime
from typing import List
from pydantic import BaseModel

class Memory(BaseModel):
    id: int
    content: str
    timestamp: datetime

class MemoryDB:
    def __init__(self):
        self._data: List[Memory] = []
        self._id = 1

    def all(self) -> List[Memory]:
        return self._data

    def create(self, content: str) -> Memory:
        memory = Memory(id=self._id, content=content, timestamp=datetime.utcnow())
        self._id += 1
        self._data.append(memory)
        return memory

memory_db = MemoryDB()
