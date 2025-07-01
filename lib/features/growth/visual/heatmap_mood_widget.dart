import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../growth_provider.dart';

class HeatmapMoodWidget extends StatelessWidget {
  const HeatmapMoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<GrowthProvider>().moodStats;

    Color colorForScore(double v) {
      if (v >= 4) return Colors.green;
      if (v >= 3) return Colors.lightGreen;
      if (v >= 2) return Colors.orange;
      return Colors.red;
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Heatmap Mood', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (stats.isEmpty)
              const Text('Belum ada data mood')
            else
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  for (final entry in stats.entries)
                    Container(
                      width: 16,
                      height: 16,
                      color: colorForScore(entry.value),
                    )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
