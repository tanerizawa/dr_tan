import 'package:flutter/material.dart';

class GrowthProvider with ChangeNotifier {
  final List<String> progresses = [];

  void addProgress(String prog) {
    progresses.insert(0, prog);
    notifyListeners();
  }
}
