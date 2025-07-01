import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../growth_provider.dart';

class MilestoneChartWidget extends StatelessWidget {
  const MilestoneChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<GrowthProvider>().progressStats;
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Milestone Chart', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (stats.isEmpty)
              const Text('Belum ada progres')
            else
              Row(
                children: [
                  for (final entry in stats.entries)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: (entry.value * 10).toDouble(),
                        color: Colors.blueAccent,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
