import 'package:flutter/material.dart';

class MemoryCloudWidget extends StatelessWidget {
  const MemoryCloudWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy word cloud, bisa diintegrasi dengan analisis memory
    final keywords = ["kerja", "makan", "refleksi", "bahagia", "proyek", "AI", "teman", "target"];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 12,
          children: keywords
              .asMap()
              .entries
              .map((e) => Chip(
                    label: Text(
                      e.value,
                      style: TextStyle(
                        fontSize: 14.0 + (e.key % 5) * 3.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.primaries[e.key % Colors.primaries.length],
                      ),
                    ),
                    backgroundColor: Colors.grey[100 * ((e.key % 8) + 1)],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
