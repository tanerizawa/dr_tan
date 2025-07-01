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
