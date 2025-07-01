import 'package:flutter/material.dart';
import 'chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ChatWidget(),
      ),
    );
  }
}
