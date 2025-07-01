class GrowthRepository {
  final List<String> _cache = [];

  List<String> fetchAll() => List.from(_cache);

  void add(String prog) => _cache.insert(0, prog);

  void clear() => _cache.clear();
}
