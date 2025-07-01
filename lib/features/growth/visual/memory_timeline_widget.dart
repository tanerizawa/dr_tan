import 'package:flutter/material.dart';

class MemoryTimelineWidget extends StatelessWidget {
  const MemoryTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            Icon(Icons.timeline, size: 48, color: Colors.blueGrey),
            SizedBox(height: 8),
            Text("Memory Timeline"),
            Text("Feature: Narasi perjalanan hidup, flashback progres"),
          ],
        ),
      ),
    );
  }
}
