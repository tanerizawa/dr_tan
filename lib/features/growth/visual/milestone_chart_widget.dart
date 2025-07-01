import 'package:flutter/material.dart';

class MilestoneChartWidget extends StatelessWidget {
  const MilestoneChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            Icon(Icons.emoji_events, size: 48, color: Colors.amber),
            SizedBox(height: 8),
            Text("Milestone Chart"),
            Text("Feature: Daftar pencapaian, progres bulanan/tahunan"),
          ],
        ),
      ),
    );
  }
}
