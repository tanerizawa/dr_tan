import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class QuickJournalWidget extends StatefulWidget {
  final void Function(String) onSubmit;
  const QuickJournalWidget({super.key, required this.onSubmit});

  @override
  State<QuickJournalWidget> createState() => _QuickJournalWidgetState();
}

class _QuickJournalWidgetState extends State<QuickJournalWidget> {
  final TextEditingController _controller = TextEditingController();
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _listening = false;

  Future<void> _toggleListening() async {
    if (_listening) {
      await _speech.stop();
      setState(() => _listening = false);
    } else {
      final available = await _speech.initialize();
      if (available) {
        setState(() => _listening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _controller.text = result.recognizedWords;
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          });
        });
      }
    }
  }

  void _submit() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSubmit(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Catatan cepat...',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
        ),
        IconButton(
          icon: Icon(_listening ? Icons.mic_off : Icons.mic),
          onPressed: _toggleListening,
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Icon(Icons.send),
        ),
      ],
    );
  }
}
