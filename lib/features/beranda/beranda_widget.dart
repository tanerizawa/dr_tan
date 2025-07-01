import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../otak_kecil/otak_kecil_page.dart';
import 'beranda_provider.dart';
import 'beranda_form.dart';

class BerandaWidget extends StatelessWidget {
  const BerandaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BerandaProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BerandaForm(onSubmit: provider.addNote),
        const SizedBox(height: 12),
        const Text("Catatan Beranda:", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: provider.notes.isEmpty
            ? const Center(child: Text("Belum ada catatan."))
            : ListView.builder(
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
