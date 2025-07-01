import 'package:flutter/material.dart';

class InsightCarouselWidget extends StatelessWidget {
  const InsightCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data carousel, ganti dengan PageView atau CarouselSlider jika ingin dinamis
    final insights = [
      "Hari ini kamu produktif!",
      "Jangan lupa minum air.",
      "Sudah refleksi diri minggu ini?",
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: insights.length,
          itemBuilder: (context, idx) => Container(
            width: 220,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100 * (idx % 9 + 1)],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                insights[idx],
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
