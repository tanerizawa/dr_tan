import '../otak_kecil/memory_entry.dart';
import 'growth_model.dart';

class GrowthRepository {
  final List<GrowthModel> _cache = [];

  List<GrowthModel> fetchAll() => List.from(_cache);

  void add(String prog) =>
      _cache.insert(0, GrowthModel(prog, DateTime.now()));

  Map<DateTime, double> aggregateMood(List<MemoryEntry> memories) {
    final Map<DateTime, List<int>> daily = {};
    for (final m in memories) {
      if (m.moodScore != null) {
        final day = DateTime(m.timestamp.year, m.timestamp.month, m.timestamp.day);
        daily.putIfAbsent(day, () => []);
        daily[day]!.add(m.moodScore!);
      }
    }
    return daily.map((day, scores) {
      final avg = scores.reduce((a, b) => a + b) / scores.length;
      return MapEntry(day, avg);
    });
  }

  Map<DateTime, int> aggregateProgress() {
    final Map<DateTime, int> monthly = {};
    for (final g in _cache) {
      final key = DateTime(g.createdAt.year, g.createdAt.month);
      monthly.update(key, (v) => v + 1, ifAbsent: () => 1);
    }
    return monthly;
  }

  void clear() => _cache.clear();
}
