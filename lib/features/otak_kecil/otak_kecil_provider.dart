import 'package:flutter/material.dart';
import 'memory_entry.dart';

class OtakKecilProvider with ChangeNotifier {
  final List<MemoryEntry> memories = [];

  void addMemory(MemoryEntry m) {
    memories.insert(0, m);
    notifyListeners();
  }

  void clearAll() {
    memories.clear();
    notifyListeners();
  }

  List<MemoryEntry> filterByDate(DateTime start, DateTime end) {
    return memories
        .where((m) => !m.timestamp.isBefore(start) && !m.timestamp.isAfter(end))
        .toList();
  }

  List<MemoryEntry> filterByMood(int min, int max) {
    return memories
        .where((m) =>
            m.moodScore != null &&
            m.moodScore! >= min &&
            m.moodScore! <= max)
        .toList();
  }
}
