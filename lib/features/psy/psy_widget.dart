import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'psy_provider.dart';
import 'psy_form.dart';
import 'tests/psychology_test_list_widget.dart';
import 'consultation/consultation_widget.dart';

class PsyWidget extends StatelessWidget {
  const PsyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PsyProvider>(context);
    return ListView(
      children: [
        PsyForm(onSubmit: provider.addPsy),
        const SizedBox(height: 16),
        const PsychologyTestListWidget(),
        const SizedBox(height: 24),
        const ConsultationWidget(),
        const SizedBox(height: 18),
        const Text("Catatan Psikologi:", style: TextStyle(fontWeight: FontWeight.bold)),
        ...provider.psyNotes.isEmpty
          ? [const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Center(child: Text("Belum ada catatan psikis.")),
            )]
          : provider.psyNotes.map((note) => Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: ListTile(
                leading: const Icon(Icons.psychology),
                title: Text(note),
              ),
            )),
      ],
    );
  }
}
