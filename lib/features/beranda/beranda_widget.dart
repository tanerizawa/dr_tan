import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../otak_kecil/otak_kecil_page.dart';
import 'music_widget.dart';
import 'article_quote_carousel.dart';
import 'beranda_provider.dart';
import 'quick_journal_widget.dart';

class BerandaWidget extends StatelessWidget {
  const BerandaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BerandaProvider>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _HomeSection(
            child: QuickJournalWidget(onSubmit: provider.addNote),
          ),
          if (provider.notes.isNotEmpty)
            _HomeSection(
              child: Column(
                children: List.generate(provider.notes.length, (i) {
                  final note = provider.notes[i];
                  return Dismissible(
                    key: ValueKey(note),
                    onDismissed: (_) => provider.removeNoteAt(i),
                    child: ListTile(title: Text(note)),
                  );
                }),
              ),
            ),
          _HomeSection(child: const ArticleQuoteCarousel()),
          _HomeSection(child: const MusicWidget()),
          _HomeSection(
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
        ],
      ),
    );
  }
}

class _HomeSection extends StatelessWidget {
  final Widget child;
  const _HomeSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: child,
    );
  }
}
