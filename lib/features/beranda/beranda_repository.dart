class BerandaRepository {
  final List<String> _cache = [];

  List<String> fetchAll() => List.from(_cache);

  void add(String note) => _cache.insert(0, note);

  void clear() => _cache.clear();
}
