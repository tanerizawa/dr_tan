#!/bin/bash

ROOT="backend/app"

echo "Menambahkan file & folder integrasi OpenRouter AI ke backend..."

# Buat folder jika belum ada
mkdir -p $ROOT/services
mkdir -p $ROOT/core
mkdir -p $ROOT/api/v1

# 1. Service OpenRouter
cat > $ROOT/services/openrouter_service.py << EOF
import httpx
from app.core.config import settings

async def query_openrouter(messages, model="gpt-3.5-turbo", max_tokens=512, temperature=0.7):
    headers = {
        "Authorization": f"Bearer {settings.OPENROUTER_API_KEY}",
        "Content-Type": "application/json"
    }
    data = {
        "model": model,
        "messages": messages,
        "max_tokens": max_tokens,
        "temperature": temperature,
    }
    async with httpx.AsyncClient() as client:
        response = await client.post(settings.OPENROUTER_API_URL, json=data, headers=headers)
        response.raise_for_status()
        return response.json()
EOF

# 2. Update core config (jika belum ada)
cat > $ROOT/core/config.py << EOF
import os

class Settings:
    OPENROUTER_API_KEY: str = os.getenv("OPENROUTER_API_KEY", "")
    OPENROUTER_API_URL: str = "https://openrouter.ai/api/v1/chat/completions"

settings = Settings()
EOF

# 3. Otak Kecil Engine: fungsi insight dari jurnal
cat > $ROOT/services/otakkecil_engine.py << EOF
from app.services.openrouter_service import query_openrouter

async def get_insight_from_journal(journal_content: str):
    messages = [
        {"role": "system", "content": "You are an empathetic assistant that analyzes user journals and summarizes their mood, main topics, and suggests a relevant tag."},
        {"role": "user", "content": f"Analyze this journal: {journal_content}"},
    ]
    ai_result = await query_openrouter(messages, model="gpt-4", max_tokens=256)
    insight_text = ai_result["choices"][0]["message"]["content"]
    return insight_text
EOF

# 4. Endpoint Otak Kecil untuk insight
cat > $ROOT/api/v1/otakkecil.py << EOF
from fastapi import APIRouter
from app.services.otakkecil_engine import get_insight_from_journal

router = APIRouter()

@router.post("/insight/")
async def generate_insight(journal: dict):
    content = journal.get("content")
    insight = await get_insight_from_journal(content)
    return {"insight": insight}
EOF

# 5. Update .env.example (buat jika belum ada)
ENV_PATH="backend/.env.example"
if [ ! -f $ENV_PATH ]; then
  echo "OPENROUTER_API_KEY=your_openrouter_key_here" > $ENV_PATH
else
  grep -qxF 'OPENROUTER_API_KEY=your_openrouter_key_here' $ENV_PATH || echo 'OPENROUTER_API_KEY=your_openrouter_key_here' >> $ENV_PATH
fi

echo "Integrasi OpenRouter AI: file & endpoint Otak Kecil siap!"
echo "- Edit dan sesuaikan file jika sudah punya file sebelumnya."
echo "- Pastikan environment variable OPENROUTER_API_KEY sudah diisi."

