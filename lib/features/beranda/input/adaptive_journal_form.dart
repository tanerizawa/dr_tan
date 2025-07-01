import 'package:flutter/material.dart';

class AdaptiveJournalForm extends StatefulWidget {
  final void Function(String content, List<String> tags) onSubmit;
  const AdaptiveJournalForm({super.key, required this.onSubmit});

  @override
  State<AdaptiveJournalForm> createState() => _AdaptiveJournalFormState();
}

class _AdaptiveJournalFormState extends State<AdaptiveJournalForm> {
  final _controller = TextEditingController();
  final List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: "Tulis jurnal harian...",
          ),
        ),
        const SizedBox(height: 8),
        // Placeholder: Anda bisa tambah DynamicTagSuggestion di sini
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  widget.onSubmit(_controller.text, _selectedTags);
                  _controller.clear();
                }
              },
              child: const Text("Simpan Jurnal"),
            ),
          ],
        ),
      ],
    );
  }
}
