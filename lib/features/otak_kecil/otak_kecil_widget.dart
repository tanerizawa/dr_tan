import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'otak_kecil_provider.dart';
import 'memory_entry.dart';
import '../../core/common/pastel_empty_state.dart';

class OtakKecilWidget extends StatelessWidget {
  const OtakKecilWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const _OtakKecilView();
  }
}

class _OtakKecilView extends StatelessWidget {
  const _OtakKecilView();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtakKecilProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.memory),
          label: const Text("Tambah Memori Otak Kecil"),
          onPressed: () {
            final now = DateTime.now();
            provider.addMemory(
              MemoryEntry(
                id: now.millisecondsSinceEpoch.toString(),
                type: "note",
                timestamp: now,
                content: "Contoh memori pada \${now.toIso8601String()}",
                tags: const ["contoh"],
                context: const {},
                moodScore: 3,
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text("Memori Tersimpan:", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: provider.memories.isEmpty
                ? const PastelEmptyState(
                    message: "Belum ada memori.",
                    icon: Icons.memory,
                  )
                : ListView.builder(
                    key: ValueKey(provider.memories.length),
                    itemCount: provider.memories.length,
                    itemBuilder: (ctx, i) {
                      final m = provider.memories[i];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.memory),
                          title: Text(m.content),
                          subtitle: Text(
                              "Waktu: \${m.timestamp} | Mood: \${m.moodScore ?? '-'} | Tag: \${m.tags.join(', ')}"),
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
