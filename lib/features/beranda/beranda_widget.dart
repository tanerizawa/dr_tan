import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../otak_kecil/otak_kecil_page.dart';
import 'beranda_provider.dart';
import 'beranda_form.dart';
import '../../core/common/pastel_empty_state.dart';
import 'music_widget.dart';
import 'article_quote_carousel.dart';
import 'quick_journal_widget.dart';

class BerandaWidget extends StatelessWidget {
  const BerandaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BerandaProvider>(context);
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: QuickJournalWidget(onSubmit: provider.addNote),
          ),
        ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BerandaForm(onSubmit: provider.addNote),
                const SizedBox(height: 12),
                const Text(
                  "Catatan Beranda:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: provider.notes.isEmpty
                      ? const PastelEmptyState(
                          message: "Belum ada catatan.",
                          icon: Icons.note_add,
                        )
                      : ListView.builder(
                          key: ValueKey(provider.notes.length),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.notes.length,
                          itemBuilder: (ctx, i) => Dismissible(
                            key: ValueKey(provider.notes[i]),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) => provider.removeNoteAt(i),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            child: Card(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 4),
                              child: ListTile(
                                leading: const Icon(Icons.note),
                                title: Text(provider.notes[i]),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
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
