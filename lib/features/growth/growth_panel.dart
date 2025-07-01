import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'visual/growth_tree_widget.dart';
import 'visual/heatmap_mood_widget.dart';
import 'visual/milestone_chart_widget.dart';
import 'visual/memory_timeline_widget.dart';
import 'growth_provider.dart';
import 'growth_repository.dart';
import '../otak_kecil/otak_kecil_provider.dart';
import '../../core/ai/ai_service.dart';

class GrowthPanel extends StatelessWidget {
  const GrowthPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<OtakKecilProvider, GrowthProvider>(
      create: (_) => GrowthProvider(repository: GrowthRepository()),
      update: (_, mem, growth) {
        growth ??= GrowthProvider(repository: GrowthRepository());
        growth.loadData(mem.memories);
        return growth;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Growth Panel')),
        body: ListView(
          children: const [
            GrowthTreeWidget(),
            Divider(),
            HeatmapMoodWidget(),
            Divider(),
            MilestoneChartWidget(),
            Divider(),
            MemoryTimelineWidget(),
            Divider(),
            _AiNextStep(),
          ],
        ),
      ),
    );
  }
}

class _AiNextStep extends StatelessWidget {
  const _AiNextStep();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GrowthProvider>(context);
    final prompt =
        'Berikan saran langkah selanjutnya berdasarkan data growth pengguna.';
    return FutureBuilder<String>(
      future: AiService().getInsight(prompt),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(snapshot.data!),
        );
      },
    );
  }
}
