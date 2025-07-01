import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/common/quick_add_dialog.dart';
import 'growth_widget.dart';
import 'growth_provider.dart';
import 'growth_repository.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GrowthProvider(repository: GrowthRepository()),
      child: const _GrowthView(),
    );
  }
}

class _GrowthView extends StatelessWidget {
  const _GrowthView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Growth')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: GrowthWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showQuickAddDialog(
          context,
          context.read<GrowthProvider>().addProgress,
          hint: 'Catat perkembangan...',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
