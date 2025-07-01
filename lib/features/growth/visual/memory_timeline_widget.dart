import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../otak_kecil/otak_kecil_provider.dart';

class MemoryTimelineWidget extends StatelessWidget {
  const MemoryTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final memories = context.watch<OtakKecilProvider>().memories;
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Memory Timeline', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (memories.isEmpty)
              const Text('Belum ada memori')
            else
              Column(
                children: [
                  for (final m in memories.take(5))
                    ListTile(
                      leading: const Icon(Icons.timeline),
                      title: Text(m.content),
                      subtitle: Text(m.timestamp.toIso8601String()),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
