import 'package:flutter/material.dart';

class GrowthForm extends StatefulWidget {
  final void Function(String) onSubmit;
  const GrowthForm({super.key, required this.onSubmit});

  @override
  State<GrowthForm> createState() => _GrowthFormState();
}

class _GrowthFormState extends State<GrowthForm> {
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
              labelText: "Catat perkembangan/milestone...",
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
