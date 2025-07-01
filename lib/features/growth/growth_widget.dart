import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'growth_provider.dart';
import 'growth_form.dart';

class GrowthWidget extends StatelessWidget {
  const GrowthWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GrowthProvider(),
      child: const _GrowthView(),
    );
  }
}

class _GrowthView extends StatelessWidget {
  const _GrowthView();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GrowthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GrowthForm(onSubmit: provider.addProgress),
        const SizedBox(height: 12),
        const Text("Riwayat Perkembangan:", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: provider.progresses.isEmpty
            ? const Center(child: Text("Belum ada progres."))
            : ListView.builder(
                itemCount: provider.progresses.length,
                itemBuilder: (ctx, i) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(provider.progresses[i]),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
