import 'package:flutter/material.dart';

class FlashbackWidget extends StatelessWidget {
  const FlashbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy flashback, bisa diisi dengan logika fetch memory Otak Kecil
    final memories = [
      "1 Juli 2023: Mulai proyek AI Diary",
      "1 Januari 2024: 100 hari konsisten journaling",
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Flashback Momen Penting",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...memories.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.history, color: Colors.cyan, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(e)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
