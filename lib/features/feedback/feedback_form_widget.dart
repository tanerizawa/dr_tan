import 'package:flutter/material.dart';

class FeedbackFormWidget extends StatefulWidget {
  final void Function(String) onSubmit;
  const FeedbackFormWidget({super.key, required this.onSubmit});

  @override
  State<FeedbackFormWidget> createState() => _FeedbackFormWidgetState();
}

class _FeedbackFormWidgetState extends State<FeedbackFormWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kirim Feedback", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Masukan feedback Anda..."),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  widget.onSubmit(_controller.text);
                  _controller.clear();
                }
              },
              child: const Text("Kirim"),
            ),
          ],
        ),
      ),
    );
  }
}
