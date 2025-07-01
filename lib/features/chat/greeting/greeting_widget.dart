import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String greetingText;
  const GreetingWidget({super.key, required this.greetingText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            const Icon(Icons.waving_hand, color: Colors.orange, size: 32),
            const SizedBox(width: 16),
            Expanded(child: Text(greetingText, style: const TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
