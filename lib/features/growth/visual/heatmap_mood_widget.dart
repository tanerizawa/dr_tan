import 'package:flutter/material.dart';

class HeatmapMoodWidget extends StatelessWidget {
  const HeatmapMoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            Icon(Icons.heat_pump, size: 48, color: Colors.orange),
            SizedBox(height: 8),
            Text("Heatmap Mood"),
            Text("Feature: Kalender emosi, warna sesuai suasana harian"),
          ],
        ),
      ),
    );
  }
}
