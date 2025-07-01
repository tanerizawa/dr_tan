import 'package:flutter/material.dart';
import '../otak_kecil/otak_kecil_page.dart';
import 'music_widget.dart';
import 'article_quote_carousel.dart';

class BerandaWidget extends StatelessWidget {
  const BerandaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: const ArticleQuoteCarousel(),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: const MusicWidget(),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const OtakKecilPage()),
                );
              },
              icon: const Icon(Icons.memory),
              label: const Text('Buka Otak Kecil'),
            ),
          ),
        ),
      ],
    );
  }
}
