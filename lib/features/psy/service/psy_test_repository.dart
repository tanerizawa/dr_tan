import '../psy_test_result_model.dart';

class PsyTestRepository {
  final List<PsyTestResult> _results = [];

  List<PsyTestResult> fetchAll() => List.from(_results);

  void add(PsyTestResult result) => _results.insert(0, result);

  void clear() => _results.clear();

  PsyTestResult? latestByType(String type) {
    try {
      return _results.firstWhere((e) => e.type == type);
    } catch (_) {
      return null;
    }
  }
}
