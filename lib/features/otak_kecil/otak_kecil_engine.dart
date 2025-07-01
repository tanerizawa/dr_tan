import 'memory_entry.dart';

class OtakKecilEngine {
  // Contoh: agregasi memory, generate insight, dst.
  List<String> extractTags(List<MemoryEntry> entries) {
    final tags = <String>{};
    for (final e in entries) {
      tags.addAll(e.tags);
    }
    return tags.toList();
  }

  String summarizeMemory(MemoryEntry e) {
    return e.content.length > 40
        ? "${e.content.substring(0, 40)}..."
        : e.content;
  }
}
