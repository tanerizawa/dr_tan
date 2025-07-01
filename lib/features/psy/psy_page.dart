import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/common/quick_add_dialog.dart';
import '../../core/common/adaptive_greeting_banner.dart';
import 'psy_widget.dart';
import 'psy_provider.dart';

class PsyPage extends StatelessWidget {
  const PsyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PsyProvider(),
      child: const _PsyView(),
    );
  }
}

class _PsyView extends StatelessWidget {
  const _PsyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Psy')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            AdaptiveGreetingBanner(pageName: 'Psy'),
            Expanded(child: PsyWidget()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showQuickAddDialog(
          context,
          context.read<PsyProvider>().addPsy,
          hint: 'Catatan psikologi...',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
