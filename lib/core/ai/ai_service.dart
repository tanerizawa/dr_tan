// Wrapper service AI (bisa untuk API OpenRouter, Local ML, dsb)
class AiService {
  // Simpel cache untuk mencegah pemanggilan berulang dengan prompt yang sama
  static final Map<String, String> _cache = {};

  // Contoh stub: dapatkan rekomendasi atau hasil AI
  Future<String> getInsight(String prompt) async {
    if (_cache.containsKey(prompt)) return _cache[prompt]!;

    // TODO: Implementasi panggil AI
    final result = "Hasil AI untuk prompt: $prompt";
    _cache[prompt] = result;
    return result;
  }
}
