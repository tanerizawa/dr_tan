import 'package:flutter/material.dart';

Future<void> showQuickAddDialog(
  BuildContext context,
  void Function(String) onSubmit, {
  String? hint,
}) {
  final controller = TextEditingController();

  void submit() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    onSubmit(text);
    Navigator.of(context).pop();
  }

  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(hintText: hint),
        onSubmitted: (_) => submit(),
      ),
      actions: [
        TextButton(onPressed: submit, child: const Text('Add')),
      ],
    ),
  );
}
