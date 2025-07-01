import 'package:hive/hive.dart';

part 'memory_entry.g.dart';

@HiveType(typeId: 0)
class MemoryEntry extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String type;
  @HiveField(2)
  DateTime timestamp;
  @HiveField(3)
  String content;
  @HiveField(4)
  List<String> tags;
  @HiveField(5)
  Map<String, dynamic> context;
  @HiveField(6)
  Map<String, dynamic>? aiGenerated;

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
