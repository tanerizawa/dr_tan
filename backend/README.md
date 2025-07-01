# Backend API

This backend provides a very small FastAPI application that exposes a few in-memory endpoints. It can be used by the mobile app to store and retrieve simple data during development.

## Running locally

Install dependencies and run the server:

```bash
pip install fastapi uvicorn
uvicorn app.main:app --reload
```

The API will be available at `http://localhost:8000`.

## Example requests

Add a memory:

```bash
curl -X POST http://localhost:8000/api/v1/memory \
  -H "Content-Type: application/json" \
  -d '{"content": "My first memory"}'
```

Get all memories:

```bash
curl http://localhost:8000/api/v1/memory
```

Add a growth progress entry:

```bash
curl -X POST http://localhost:8000/api/v1/growth \
  -H "Content-Type: application/json" \
  -d '{"progress": "Did some exercise"}'
```

Get growth data:

```bash
curl http://localhost:8000/api/v1/growth
```
