class PsyModel {
  final String note;
  final DateTime createdAt;
  final String? testType;
  final num? score;

  PsyModel(this.note, this.createdAt, {this.testType, this.score});
}
