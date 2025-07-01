#!/bin/bash

ROOT="lib"

echo "Membuat struktur file & folder untuk UI/UX Advanced & Growth Visual..."

# 1. Growth Panel & Visualisasi
mkdir -p $ROOT/features/growth/visual
touch $ROOT/features/growth/growth_panel.dart
touch $ROOT/features/growth/visual/growth_tree_widget.dart
touch $ROOT/features/growth/visual/heatmap_mood_widget.dart
touch $ROOT/features/growth/visual/milestone_chart_widget.dart
touch $ROOT/features/growth/visual/memory_timeline_widget.dart

# 2. Otak Kecil Visual & Insight Panel
mkdir -p $ROOT/features/otak_kecil/visual
touch $ROOT/features/otak_kecil/otak_kecil_panel.dart
touch $ROOT/features/otak_kecil/visual/insight_carousel_widget.dart
touch $ROOT/features/otak_kecil/visual/flashback_widget.dart
touch $ROOT/features/otak_kecil/visual/memory_cloud_widget.dart

# 3. Greeting & Notifikasi Personal
mkdir -p $ROOT/features/chat/greeting
touch $ROOT/features/chat/greeting/greeting_widget.dart
touch $ROOT/features/chat/greeting/greeting_service.dart
touch $ROOT/features/chat/greeting/notification_service.dart

# 4. Dynamic Tag & Adaptive Form Input
mkdir -p $ROOT/features/beranda/input
touch $ROOT/features/beranda/input/dynamic_tag_suggestion.dart
touch $ROOT/features/beranda/input/adaptive_journal_form.dart

# 5. Feedback Loop & User Feedback
mkdir -p $ROOT/features/feedback
touch $ROOT/features/feedback/feedback_form_widget.dart
touch $ROOT/features/feedback/feedback_service.dart
touch $ROOT/features/feedback/insight_rating_widget.dart

# 6. Dokumentasi Checklist & UX Test
mkdir -p docs
touch docs/tahap5_checklist.md
touch docs/ux_feedback_log.md

echo "Struktur UI/UX Growth & Advanced berhasil dibuat!"
