import 'package:flutter/material.dart';

class PsyProvider with ChangeNotifier {
  final List<String> psyNotes = [];

  void addPsy(String p) {
    psyNotes.insert(0, p);
    notifyListeners();
  }
}
