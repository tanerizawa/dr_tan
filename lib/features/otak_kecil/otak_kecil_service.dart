import 'memory_entry.dart';

class OtakKecilService {
  final List<MemoryEntry> _memories = [];

  List<MemoryEntry> fetchAll() => List.from(_memories);

  void add(MemoryEntry m) => _memories.insert(0, m);

  void clear() => _memories.clear();
}
