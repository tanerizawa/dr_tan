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
}
