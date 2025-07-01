import 'package:flutter/material.dart';

class BerandaForm extends StatefulWidget {
  final void Function(String) onSubmit;
  const BerandaForm({super.key, required this.onSubmit});

  @override
  State<BerandaForm> createState() => _BerandaFormState();
}

class _BerandaFormState extends State<BerandaForm> {
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
              labelText: "Tambah catatan beranda...",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _submit,
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
