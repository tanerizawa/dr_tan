import 'package:flutter/material.dart';
import 'psy_widget.dart';

class PsyPage extends StatelessWidget {
  const PsyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Psy')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: PsyWidget(),
      ),
    );
  }
}
