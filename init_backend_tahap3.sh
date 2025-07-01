#!/bin/bash

ROOT="backend"

echo "Membuat struktur backend FastAPI modular untuk Tahap 3..."

# Struktur utama
mkdir -p $ROOT/app/api/v1
mkdir -p $ROOT/app/models
mkdir -p $ROOT/app/schemas
mkdir -p $ROOT/app/services
mkdir -p $ROOT/app/db
mkdir -p $ROOT/app/core
mkdir -p $ROOT/app/utils
mkdir -p $ROOT/scripts
mkdir -p $ROOT/migrations/versions
mkdir -p $ROOT/tests
mkdir -p $ROOT/docs

# File FastAPI app utama
touch $ROOT/app/main.py
touch $ROOT/app/api/v1/__init__.py
touch $ROOT/app/api/v1/api.py
touch $ROOT/app/api/v1/memory.py
touch $ROOT/app/api/v1/tag.py
touch $ROOT/app/api/v1/user.py
touch $ROOT/app/api/v1/insight.py
touch $ROOT/app/api/v1/admin.py
touch $ROOT/app/api/v1/otakkecil.py
touch $ROOT/app/api/v1/sync.py

# Models (ORM/db entity)
touch $ROOT/app/models/__init__.py
touch $ROOT/app/models/memory.py
touch $ROOT/app/models/tag.py
touch $ROOT/app/models/user.py
touch $ROOT/app/models/insight.py
touch $ROOT/app/models/milestone.py

# Schemas (Pydantic)
touch $ROOT/app/schemas/__init__.py
touch $ROOT/app/schemas/memory.py
touch $ROOT/app/schemas/tag.py
touch $ROOT/app/schemas/user.py
touch $ROOT/app/schemas/insight.py
touch $ROOT/app/schemas/milestone.py

# Services / logic
touch $ROOT/app/services/__init__.py
touch $ROOT/app/services/memory_service.py
touch $ROOT/app/services/tag_service.py
touch $ROOT/app/services/user_service.py
touch $ROOT/app/services/insight_service.py
touch $ROOT/app/services/otakkecil_engine.py
touch $ROOT/app/services/sync_service.py

# DB connection/config/migration
touch $ROOT/app/db/__init__.py
touch $ROOT/app/db/session.py
touch $ROOT/app/db/base.py
touch $ROOT/app/db/crud.py
touch $ROOT/app/db/init_db.py

# Core config
touch $ROOT/app/core/__init__.py
touch $ROOT/app/core/config.py
touch $ROOT/app/core/security.py

# Utils
touch $ROOT/app/utils/__init__.py
touch $ROOT/app/utils/logger.py

# Migration, scripts, test, docs
touch $ROOT/scripts/seed_db.py
touch $ROOT/scripts/create_admin.py
touch $ROOT/migrations/env.py
touch $ROOT/requirements.txt
touch $ROOT/.env.example
touch $ROOT/docker-compose.yml
touch $ROOT/alembic.ini
touch $ROOT/README.md
touch $ROOT/docs/architecture.md
touch $ROOT/docs/api_doc.md

# Unit test
touch $ROOT/tests/__init__.py
touch $ROOT/tests/test_memory.py
touch $ROOT/tests/test_tag.py
touch $ROOT/tests/test_user.py
touch $ROOT/tests/test_otakkecil.py

echo "Struktur backend FastAPI Tahap 3 berhasil dibuat!"
