import 'package:flutter/material.dart';
import '../service/psy_test_repository.dart';
import 'mbti_test_widget.dart';
import 'bdi_test_widget.dart';

class PsychologyTestListWidget extends StatefulWidget {
  const PsychologyTestListWidget({super.key});

  @override
  State<PsychologyTestListWidget> createState() => _PsychologyTestListWidgetState();
}

class _PsychologyTestListWidgetState extends State<PsychologyTestListWidget> {
  final PsyTestRepository _repo = PsyTestRepository();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("Daftar Tes Psikologi:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        ExpansionTile(
          title: const Text("Tes MBTI"),
          initiallyExpanded: false,
          children: [
            MBTITestWidget(repository: _repo),
            _ResultWidget(title: "Riwayat MBTI Terakhir", result: _repo.latestByType("MBTI")?.score?.toString()),
          ],
        ),
        ExpansionTile(
          title: const Text("Tes BDI (Depresi)"),
          initiallyExpanded: false,
          children: [
            BDITestWidget(repository: _repo),
            _ResultWidget(title: "Skor BDI Terakhir", result: _repo.latestByType("BDI")?.score?.toString()),
          ],
        ),
      ],
    );
  }
}

class _ResultWidget extends StatelessWidget {
  final String title;
  final String? result;
  const _ResultWidget({required this.title, this.result});
  @override
  Widget build(BuildContext context) {
    if (result == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.history, color: Colors.indigo),
          const SizedBox(width: 8),
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(result!, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
