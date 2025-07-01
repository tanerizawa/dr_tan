#!/bin/bash

# Nama root folder, bisa diubah
ROOT="lib"

echo "Membuat struktur folder dan file dasar proyek Flutter..."

# FEATURES & SUBFOLDER
FEATURES=(
  "beranda"
  "chat"
  "growth"
  "psy"
  "otak_kecil"
)

# Core folder & sub
CORE_SUB=(
  "db"
  "ai"
  "common"
)

# Buat root lib/
mkdir -p $ROOT

# Buat folder dan file fitur utama
for f in "${FEATURES[@]}"; do
  mkdir -p $ROOT/features/$f
  touch $ROOT/features/$f/${f}_page.dart
  touch $ROOT/features/$f/${f}_state.dart
  touch $ROOT/features/$f/${f}_model.dart
done

# Otak Kecil: file ekstra
touch $ROOT/features/otak_kecil/otak_kecil_engine.dart
touch $ROOT/features/otak_kecil/memory_entry.dart
touch $ROOT/features/otak_kecil/curated_cache.dart

# Core utilitas
mkdir -p $ROOT/core
for c in "${CORE_SUB[@]}"; do
  mkdir -p $ROOT/core/$c
done

# File core umum
touch $ROOT/core/db/local_db.dart
touch $ROOT/core/ai/ai_service.dart
touch $ROOT/core/common/app_theme.dart
touch $ROOT/core/common/app_utils.dart

# Main entry
touch $ROOT/main.dart

# README dan dokumentasi skema
touch README.md
mkdir -p docs
touch docs/data_model.md
touch docs/folder_structure.md

echo "Struktur folder dan file dasar berhasil dibuat!"
