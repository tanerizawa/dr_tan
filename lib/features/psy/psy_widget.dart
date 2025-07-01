import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'psy_provider.dart';
import 'psy_form.dart';
import 'tests/psychology_test_list_widget.dart';
import 'consultation/consultation_widget.dart';
import '../../core/common/pastel_empty_state.dart';

class PsyWidget extends StatelessWidget {
  const PsyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PsyProvider>(context);
    final notesWidget = provider.psyNotes.isEmpty
        ? const PastelEmptyState(
            message: "Belum ada catatan psikis.",
            icon: Icons.psychology,
          )
        : Column(
            key: ValueKey(provider.psyNotes.length),
            children: provider.psyNotes
                .map((note) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      child: ListTile(
                        leading: const Icon(Icons.psychology),
                        title: Text(note),
                      ),
                    ))
                .toList(),
          );

    return ListView(
      children: [
        PsyForm(onSubmit: provider.addPsy),
        const SizedBox(height: 16),
        const PsychologyTestListWidget(),
        const SizedBox(height: 24),
        const ConsultationWidget(),
        const SizedBox(height: 18),
        const Text("Catatan Psikologi:", style: TextStyle(fontWeight: FontWeight.bold)),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: notesWidget,
        ),
      ],
    );
  }
}
