import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArticleQuoteCarousel extends StatelessWidget {
  const ArticleQuoteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Tetaplah semangat untuk belajar dan berkembang setiap hari.',
      'Kesehatan mental sama pentingnya dengan kesehatan fisik.',
      'Luangkan waktu sejenak untuk merenung dan bersyukur.'
    ];

    return CarouselSlider.builder(
      itemCount: items.length,
      options: CarouselOptions(
        height: 140,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
      ),
      itemBuilder: (context, index, realIdx) {
        final text = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Selengkapnya'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
