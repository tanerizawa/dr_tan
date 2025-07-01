import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/ai/ai_service.dart';
import '../../core/common/pastel_empty_state.dart';
import 'growth_form.dart';
import 'growth_provider.dart';

class GrowthWidget extends StatefulWidget {
  const GrowthWidget({super.key});

  @override
  State<GrowthWidget> createState() => _GrowthWidgetState();
}

class _GrowthWidgetState extends State<GrowthWidget> {
  late Future<String>? _futureInsight;
  int _lastCount = 0;

  @override
  void initState() {
    super.initState();
    _futureInsight = null;
  }

  void _refreshInsight(GrowthProvider provider) {
    if (provider.progresses.isEmpty) return;
    if (_futureInsight != null && provider.progresses.length == _lastCount) {
      return;
    }
    final latest = provider.progresses.first.progress;
    final prompt =
        'Saya telah mencapai "$latest". Apa langkah perkembangan selanjutnya?';
    setState(() {
      _futureInsight = AiService().getInsight(prompt);
      _lastCount = provider.progresses.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GrowthProvider>(context);
    _refreshInsight(provider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GrowthForm(onSubmit: (p) {
          provider.addProgress(p);
          _refreshInsight(provider);
        }),
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
        if (_futureInsight != null)
          _NextStepCard(
            future: _futureInsight!,
            onSave: provider.addProgress,
          ),
      ],
    );
  }
}

class _NextStepCard extends StatelessWidget {
  final Future<String> future;
  final void Function(String) onSave;
  const _NextStepCard({required this.future, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future,
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final text = snap.data!;
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Next Step',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(text),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => onSave(text),
                    child: const Text('Save as Goal'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
