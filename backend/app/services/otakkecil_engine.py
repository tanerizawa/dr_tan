from app.services.openrouter_service import query_openrouter

async def get_insight_from_journal(journal_content: str):
    messages = [
        {"role": "system", "content": "You are an empathetic assistant that analyzes user journals and summarizes their mood, main topics, and suggests a relevant tag."},
        {"role": "user", "content": f"Analyze this journal: {journal_content}"},
    ]
    ai_result = await query_openrouter(messages, model="gpt-4", max_tokens=256)
    insight_text = ai_result["choices"][0]["message"]["content"]
    return insight_text
