import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_provider.dart';
import 'chat_form.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);
    return Column(
      children: [
        Expanded(
          child: provider.messages.isEmpty
            ? const Center(child: Text("Belum ada pesan."))
            : ListView.builder(
                reverse: true,
                itemCount: provider.messages.length,
                itemBuilder: (ctx, i) => Align(
                  alignment: i % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: i % 2 == 0 ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(provider.messages[i]),
                  ),
                ),
              ),
        ),
        ChatForm(onSubmit: provider.addMessage),
      ],
    );
  }
}
