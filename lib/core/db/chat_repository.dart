import 'package:hive/hive.dart';

class ChatRepository {
  final Box<String> box;
  ChatRepository(this.box);

  List<String> getAll() => box.values.toList();

  Future<void> add(String s) async => await box.add(s);

  Future<void> delete(int key) async => await box.delete(key);

  Future<void> clear() async => await box.clear();
}
