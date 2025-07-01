class PsyTestResult {
  final String id; // unique (timestamp, UUID, dsb)
  final String type; // 'MBTI', 'BDI', dst
  final Map<String, dynamic> answers;
  final dynamic score; // string untuk MBTI (INTJ, ENFP), int untuk BDI
  final DateTime testedAt;

  PsyTestResult({
    required this.id,
    required this.type,
    required this.answers,
    required this.score,
    required this.testedAt,
  });
}
