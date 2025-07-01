import 'package:flutter/material.dart';
import 'visual/growth_tree_widget.dart';
import 'visual/heatmap_mood_widget.dart';
import 'visual/milestone_chart_widget.dart';
import 'visual/memory_timeline_widget.dart';

class GrowthPanel extends StatelessWidget {
  const GrowthPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
