import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalDb {
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _initialized = true;
  }

  static Future<Box<T>> openBox<T>(String name) async {
    await init();
    return await Hive.openBox<T>(name);
  }

  static Future<void> closeAll() async {
    await Hive.close();
    _initialized = false;
  }
}
