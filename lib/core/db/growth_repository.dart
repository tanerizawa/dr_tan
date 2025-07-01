import 'package:hive/hive.dart';

class GrowthRepository {
  final Box<String> box;
  GrowthRepository(this.box);

  List<String> getAll() => box.values.toList();

  Future<void> add(String s) async => await box.add(s);

  Future<void> delete(int key) async => await box.delete(key);

  Future<void> clear() async => await box.clear();
}
