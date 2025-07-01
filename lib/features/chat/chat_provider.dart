import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<String> messages = [];

  void addMessage(String msg) {
    messages.insert(0, msg);
    notifyListeners();
  }
}
