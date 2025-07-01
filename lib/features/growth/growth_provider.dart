import 'package:flutter/material.dart';
import '../otak_kecil/memory_entry.dart';
import '../otak_kecil/otak_kecil_service.dart';

class GrowthProvider with ChangeNotifier {
  List<MemoryEntry> _memories = [];

  List<MemoryEntry> get memories => _memories;

  Future<void> fetch() async {
    _memories = OtakKecilService.getAll().where((e) => e.type == 'growth').toList();
    notifyListeners();
  }

  Future<void> add(MemoryEntry entry) async {
    await OtakKecilService.add(entry);
    await fetch();
  }
}
