class ChatRepository {
  final List<String> _cache = [];

  List<String> fetchAll() => List.from(_cache);

  void add(String msg) => _cache.insert(0, msg);

  void clear() => _cache.clear();
}
