import 'package:flutter/material.dart';

class PsyForm extends StatefulWidget {
  final void Function(String) onSubmit;
  const PsyForm({super.key, required this.onSubmit});

  @override
  State<PsyForm> createState() => _PsyFormState();
}

class _PsyFormState extends State<PsyForm> {
  final _controller = TextEditingController();

  void _submit() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSubmit(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Catatan psikologi atau hasil tes...",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _submit,
          child: const Icon(Icons.psychology),
        )
      ],
    );
  }
}
