import 'package:flutter/material.dart';
import '../service/consultation_service.dart';

class ConsultationWidget extends StatefulWidget {
  const ConsultationWidget({super.key});

  @override
  State<ConsultationWidget> createState() => _ConsultationWidgetState();
}

class _ConsultationWidgetState extends State<ConsultationWidget> {
  final ConsultationService _service = ConsultationService();
  final _controller = TextEditingController();

  void _submitConsult() {
    if (_controller.text.trim().isNotEmpty) {
      _service.submit(
        ConsultationRequest(
          userId: "dummy_user_1",
          requestedAt: DateTime.now(),
          description: _controller.text.trim(),
        ),
      );
      setState(() {
        _controller.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permintaan konsultasi telah dikirim!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final history = _service.fetchAll();
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Konsultasi Psikologi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Ceritakan masalah/kebutuhan Anda...",
                border: OutlineInputBorder(),
              ),
              minLines: 2,
              maxLines: 4,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule),
              label: const Text("Kirim Permintaan Konsultasi"),
              onPressed: _submitConsult,
            ),
            const SizedBox(height: 18),
            const Text("Riwayat Permintaan Konsultasi:"),
            ...history.isEmpty
                ? [const Text("Belum ada permintaan konsultasi.")]
                : history.map((e) => ListTile(
                    leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                    title: Text(e.description ?? "(Tidak ada keterangan)"),
                    subtitle: Text("Waktu: ${e.requestedAt}"),
                  )),
          ],
        ),
      ),
    );
  }
}
