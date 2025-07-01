#!/bin/bash

ROOT="lib"

echo "Membuat struktur tambahan untuk Prototype UI, State Management, dan Local DB..."

# ------------------------
# UI: Widget dan Layout
# ------------------------
UI_FILES=(
  "features/beranda/beranda_widget.dart"
  "features/beranda/beranda_form.dart"
  "features/chat/chat_widget.dart"
  "features/chat/chat_form.dart"
  "features/growth/growth_widget.dart"
  "features/growth/growth_form.dart"
  "features/psy/psy_widget.dart"
  "features/psy/psy_form.dart"
  "features/otak_kecil/otak_kecil_widget.dart"
)

for file in "${UI_FILES[@]}"; do
  mkdir -p $ROOT/$(dirname $file)
  touch $ROOT/$file
done

# ------------------------
# State Management (Riverpod/Provider/Bloc)
# ------------------------
STATE_FILES=(
  "features/beranda/beranda_provider.dart"
  "features/chat/chat_provider.dart"
  "features/growth/growth_provider.dart"
  "features/psy/psy_provider.dart"
  "features/otak_kecil/otak_kecil_provider.dart"
)

for file in "${STATE_FILES[@]}"; do
  mkdir -p $ROOT/$(dirname $file)
  touch $ROOT/$file
done

# ------------------------
# Local Database (Hive/Sqflite) dan Service/Repository
# ------------------------
DB_FILES=(
  "core/db/hive_adapter.dart"
  "core/db/growth_repository.dart"
  "core/db/chat_repository.dart"
  "core/db/beranda_repository.dart"
  "core/db/psy_repository.dart"
  "features/otak_kecil/otak_kecil_service.dart"
)

for file in "${DB_FILES[@]}"; do
  mkdir -p $ROOT/$(dirname $file)
  touch $ROOT/$file
done

# ------------------------
# Dummy Otak Kecil Panel/Screen
# ------------------------
touch $ROOT/features/otak_kecil/otak_kecil_panel.dart

# ------------------------
# Dummy Main Page dengan Bottom Navigation
# ------------------------
touch $ROOT/main_page.dart
touch $ROOT/app_routes.dart

# ------------------------
# Dokumentasi Tahap 2
# ------------------------
mkdir -p docs
touch docs/tahap2_checklist.md

echo "Struktur prototype, state, dan db lokal untuk Tahap 2 berhasil dibuat!"
