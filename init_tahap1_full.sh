#!/bin/bash

ROOT="lib"

echo "Membuat struktur folder dan file dasar proyek Flutter (beserta template kodenya)..."

FEATURES=(
  "beranda"
  "chat"
  "growth"
  "psy"
  "otak_kecil"
)

CORE_SUB=(
  "db"
  "ai"
  "common"
)

mkdir -p $ROOT

# Helper: ubah snake_case ke UpperCamelCase
to_camel_case() {
  local input="$1"
  local output=""
  IFS='_' read -ra parts <<< "$input"
  for part in "${parts[@]}"; do
    first_char=$(echo "${part:0:1}" | tr '[:lower:]' '[:upper:]')
    rest_chars="${part:1}"
    output="${output}${first_char}${rest_chars}"
  done
  echo "$output"
}

for f in "${FEATURES[@]}"; do
  FOLDER="$ROOT/features/$f"
  mkdir -p "$FOLDER"
  NAME_UC=$(to_camel_case "$f")

  # Page
  cat > "$FOLDER/${f}_page.dart" << EOL
import 'package:flutter/material.dart';

class ${NAME_UC}Page extends StatelessWidget {
  const ${NAME_UC}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$NAME_UC')),
      body: const Center(child: Text('Ini halaman $NAME_UC')),
    );
  }
}
EOL

  # State
  cat > "$FOLDER/${f}_state.dart" << EOL
class ${NAME_UC}State {
  // TODO: Add properties for $NAME_UC state
  const ${NAME_UC}State();
}
EOL

  # Model
  cat > "$FOLDER/${f}_model.dart" << EOL
class ${NAME_UC}Model {
  // TODO: Define data model for $NAME_UC
  const ${NAME_UC}Model();
}
EOL

done

# Otak Kecil: file ekstra
cat > $ROOT/features/otak_kecil/otak_kecil_engine.dart << EOL
class OtakKecilEngine {
  // TODO: Implement memory engine logic
}
EOL

cat > $ROOT/features/otak_kecil/memory_entry.dart << EOL
class MemoryEntry {
  final String id;
  final String type; // mood, journal, event, etc
  final DateTime timestamp;
  final String content;
  final List<String> tags;
  final Map<String, dynamic> context;
  final Map<String, dynamic>? aiGenerated;

  MemoryEntry({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.content,
    required this.tags,
    required this.context,
    this.aiGenerated,
  });
}
EOL

cat > $ROOT/features/otak_kecil/curated_cache.dart << EOL
class CuratedCache {
  // TODO: Implement cache structure for Otak Kecil
}
EOL

mkdir -p $ROOT/core
for c in "${CORE_SUB[@]}"; do
  mkdir -p $ROOT/core/$c
done

cat > $ROOT/core/db/local_db.dart << EOL
class LocalDb {
  // TODO: Implement local database service
}
EOL

cat > $ROOT/core/ai/ai_service.dart << EOL
class AiService {
  // TODO: Implement AI service wrapper
}
EOL

cat > $ROOT/core/common/app_theme.dart << EOL
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      );
}
EOL

cat > $ROOT/core/common/app_utils.dart << EOL
class AppUtils {
  // TODO: Add helper utilities here
}
EOL

cat > $ROOT/main.dart << EOL
import 'package:flutter/material.dart';
import 'features/beranda/beranda_page.dart';
import 'features/chat/chat_page.dart';
import 'features/growth/growth_page.dart';
import 'features/psy/psy_page.dart';
import 'features/otak_kecil/otak_kecil_page.dart';
import 'core/common/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otak Kecil App',
      theme: AppTheme.light,
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentIndex = 0;
  final _pages = const [
    BerandaPage(),
    ChatPage(),
    GrowthPage(),
    PsyPage(),
    OtakKecilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Growth"),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: "Psy"),
          BottomNavigationBarItem(icon: Icon(Icons.memory), label: "Otak Kecil"),
        ],
      ),
    );
  }
}
EOL

cat > README.md << EOL
# Otak Kecil App

Modular Flutter app structure for AI-powered personal assistant.

## Folder Structure

See \`docs/folder_structure.md\`.

## Features

- Modular, scalable, and extensible
- Memory Engine ("Otak Kecil")
- Growth, Chat, Psy modules
EOL

mkdir -p docs

cat > docs/data_model.md << EOL
# Data Model: MemoryEntry

\`\`\`dart
class MemoryEntry {
  final String id;
  final String type;
  final DateTime timestamp;
  final String content;
  final List<String> tags;
  final Map<String, dynamic> context;
  final Map<String, dynamic>? aiGenerated;
  // ...
}
\`\`\`
EOL

cat > docs/folder_structure.md << EOL
# Folder Structure

\`\`\`
lib/
  features/
    beranda/
    chat/
    growth/
    psy/
    otak_kecil/
  core/
    db/
    ai/
    common/
  main.dart
docs/
\`\`\`
EOL

echo "Struktur folder, file, dan kode template dasar berhasil dibuat!"
