import 'package:flutter/material.dart';

class BerandaProvider with ChangeNotifier {
  final List<String> notes = [];

  void addNote(String note) {
    notes.insert(0, note);
    notifyListeners();
  }
}
