import 'package:flutter/material.dart';

class BerandaProvider with ChangeNotifier {
  final List<String> notes = [];

  void addNote(String note) {
    notes.insert(0, note);
    notifyListeners();
  }

  void removeNoteAt(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      notifyListeners();
    }
  }
}
