import 'package:hive/hive.dart';
import 'memory_entry.dart';

class OtakKecilService {
  static Box<MemoryEntry> get box => Hive.box<MemoryEntry>('memories');

  static List<MemoryEntry> getAll() => box.values.toList();

  static Future<void> add(MemoryEntry entry) => box.add(entry);

  static Future<void> delete(int key) => box.delete(key);

  static Future<void> update(int key, MemoryEntry entry) => box.put(key, entry);

  static MemoryEntry? getByKey(int key) => box.get(key);
}
