import 'package:flutter/material.dart';
import '../otak_kecil/memory_entry.dart';
import 'growth_repository.dart';
import 'growth_model.dart';

class GrowthProvider with ChangeNotifier {
  final GrowthRepository repository;
  final List<GrowthModel> progresses = [];
  Map<DateTime, double> moodStats = {};
  Map<DateTime, int> progressStats = {};

  GrowthProvider({required this.repository});

  void addProgress(String prog) {
    progresses.insert(0, GrowthModel(prog, DateTime.now()));
    repository.add(prog);
    notifyListeners();
  }

  void loadData(List<MemoryEntry> memories) {
    progresses
      ..clear()
      ..addAll(repository.fetchAll());
    moodStats = repository.aggregateMood(memories);
    progressStats = repository.aggregateProgress();
    notifyListeners();
  }
}
