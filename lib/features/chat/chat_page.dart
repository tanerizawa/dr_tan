import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/common/quick_add_dialog.dart';
import 'chat_widget.dart';
import 'chat_provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ChatWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showQuickAddDialog(
          context,
          context.read<ChatProvider>().addMessage,
          hint: 'Ketik pesan...',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
