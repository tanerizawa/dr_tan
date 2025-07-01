import 'memory_entry.dart';

class CuratedCache {
  final List<MemoryEntry> curated = [];

  void add(MemoryEntry m) => curated.insert(0, m);

  List<MemoryEntry> getAll() => List.from(curated);

  void clear() => curated.clear();
}
