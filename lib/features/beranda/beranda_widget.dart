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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuickJournalWidget(onSubmit: provider.addNote),
        const SizedBox(height: 12),
        const ArticleQuoteCarousel(),
        const SizedBox(height: 12),
        const MusicWidget(),
        const SizedBox(height: 12),
        BerandaForm(onSubmit: provider.addNote),
        const SizedBox(height: 12),
        const Text("Catatan Beranda:", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: provider.notes.isEmpty
                ? const PastelEmptyState(
                    message: "Belum ada catatan.",
                    icon: Icons.note_add,
                  )
                : ListView.builder(
                    key: ValueKey(provider.notes.length),
                    itemCount: provider.notes.length,
                    itemBuilder: (ctx, i) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: const Icon(Icons.note),
                        title: Text(provider.notes[i]),
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const OtakKecilPage()),
            );
          },
          icon: const Icon(Icons.memory),
          label: const Text('Buka Otak Kecil'),
        ),
      ],
    );
  }
}
