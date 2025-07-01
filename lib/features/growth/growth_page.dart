import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../otak_kecil/memory_entry.dart';
import 'growth_provider.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GrowthProvider()..fetch(),
      child: const GrowthView(),
    );
  }
}

class GrowthView extends StatefulWidget {
  const GrowthView({super.key});

  @override
  State<GrowthView> createState() => _GrowthViewState();
}

class _GrowthViewState extends State<GrowthView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Penting untuk hindari memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GrowthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Growth')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Catat progres/kegiatan...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    if (_controller.text.trim().isNotEmpty) {
                      await provider.add(
                        MemoryEntry(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          type: "growth",
                          timestamp: DateTime.now(),
                          content: _controller.text,
                          tags: [],
                          context: {},
                        ),
                      );
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: provider.memories.isEmpty
                ? const Center(child: Text('Belum ada progres'))
                : ListView.builder(
                    itemCount: provider.memories.length,
                    itemBuilder: (context, i) {
                      final m = provider.memories[i];
                      return ListTile(
                        leading: const Icon(Icons.check_circle_outline),
                        title: Text(m.content),
                        subtitle: Text(
                          m.timestamp.toLocal().toString().split('.').first,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
