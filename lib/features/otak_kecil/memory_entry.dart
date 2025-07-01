class MemoryEntry {
  final String id;
  final String type; // mood, journal, event, etc
  final DateTime timestamp;
  final String content;
  final List<String> tags;
  final Map<String, dynamic> context;
  final Map<String, dynamic>? aiGenerated;
  final int? moodScore; // e.g. 1-5
  final List<String>? activities;

  MemoryEntry({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.content,
    required this.tags,
    required this.context,
    this.aiGenerated,
    this.moodScore,
    this.activities,
  });
}
