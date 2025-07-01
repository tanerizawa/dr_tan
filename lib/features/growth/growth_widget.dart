import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'growth_provider.dart';
import 'growth_form.dart';
import 'growth_repository.dart';
import 'growth_model.dart';
import '../../core/common/pastel_empty_state.dart';

class GrowthWidget extends StatelessWidget {
  const GrowthWidget({super.key});

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
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: provider.progresses.isEmpty
                ? const PastelEmptyState(
                    message: "Belum ada progres.",
                    icon: Icons.check_circle_outline,
                  )
                : ListView.builder(
                    key: ValueKey(provider.progresses.length),
                    itemCount: provider.progresses.length,
                    itemBuilder: (ctx, i) {
                      final g = provider.progresses[i];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.check_circle_outline),
                          title: Text(g.progress),
                          subtitle: Text(g.createdAt.toIso8601String()),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
