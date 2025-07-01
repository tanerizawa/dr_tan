import 'package:flutter/material.dart';

class GrowthTreeWidget extends StatelessWidget {
  const GrowthTreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            Icon(Icons.park, size: 48, color: Colors.green),
            SizedBox(height: 8),
            Text("Visualisasi Pohon Kehidupan (Growth Tree)"),
            Text("Feature: Progress bertingkat, badge, cabang personal"),
          ],
        ),
      ),
    );
  }
}
