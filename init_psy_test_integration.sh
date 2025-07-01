#!/bin/bash

ROOT="lib/features/psy"
TESTS="$ROOT/tests"
CONSULT="$ROOT/consultation"
SERV="$ROOT/service"

echo "Menambahkan integrasi penyimpanan hasil tes psikologi, model, dan konsultasi API..."

mkdir -p $TESTS
mkdir -p $CONSULT
mkdir -p $SERV

# --------------------------
# MODEL DATA HASIL TES
# --------------------------
cat > $ROOT/psy_test_result_model.dart <<'EOL'
class PsyTestResult {
  final String id; // unique (timestamp, UUID, dsb)
  final String type; // 'MBTI', 'BDI', dst
  final Map<String, dynamic> answers;
  final dynamic score; // string untuk MBTI (INTJ, ENFP), int untuk BDI
  final DateTime testedAt;

  PsyTestResult({
    required this.id,
    required this.type,
    required this.answers,
    required this.score,
    required this.testedAt,
  });
}
EOL

# --------------------------
# REPOSITORY/SERVICE HASIL TES
# --------------------------
cat > $SERV/psy_test_repository.dart <<'EOL'
import '../psy_test_result_model.dart';

class PsyTestRepository {
  final List<PsyTestResult> _results = [];

  List<PsyTestResult> fetchAll() => List.from(_results);

  void add(PsyTestResult result) => _results.insert(0, result);

  void clear() => _results.clear();

  PsyTestResult? latestByType(String type) =>
      _results.firstWhere((e) => e.type == type, orElse: () => null);
}
EOL

# --------------------------
# LOGIKA SIMPAN HASIL TES DI WIDGET MBTI
# --------------------------
cat > $TESTS/mbti_test_widget.dart <<'EOL'
import 'package:flutter/material.dart';
import '../psy_test_result_model.dart';
import '../service/psy_test_repository.dart';

class MBTITestWidget extends StatefulWidget {
  final PsyTestRepository? repository;
  const MBTITestWidget({super.key, this.repository});
  @override
  State<MBTITestWidget> createState() => _MBTITestWidgetState();
}

class _MBTITestWidgetState extends State<MBTITestWidget> {
  final List<_MBTIQuestion> _questions = [
    _MBTIQuestion('Anda lebih suka...', ['Berinteraksi dengan banyak orang', 'Waktu sendiri dan tenang']),
    _MBTIQuestion('Saat menghadapi masalah...', ['Analisis logis', 'Mengandalkan perasaan']),
    _MBTIQuestion('Dalam pekerjaan, Anda cenderung...', ['Terstruktur & terencana', 'Fleksibel & spontan']),
  ];
  final List<int?> _answers = [null, null, null];
  String? _result;

  void _calculateResult() {
    if (_answers.any((a) => a == null)) return;
    String type = '';
    type += _answers[0] == 0 ? 'E' : 'I';
    type += 'N';
    type += _answers[1] == 0 ? 'T' : 'F';
    type += _answers[2] == 0 ? 'J' : 'P';
    setState(() {
      _result = "Tipe MBTI Anda: $type";
    });
    // Simpan hasil
    widget.repository?.add(
      PsyTestResult(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: 'MBTI',
        answers: {
          for (var i = 0; i < _questions.length; i++)
            'q${i+1}': _answers[i]
        },
        score: type,
        testedAt: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Tes MBTI Sederhana", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ...List.generate(_questions.length, (i) {
              final q = _questions[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text("${i + 1}. ${q.question}"),
                  ),
                  for (int j = 0; j < q.options.length; j++)
                    RadioListTile(
                      value: j,
                      groupValue: _answers[i],
                      title: Text(q.options[j]),
                      onChanged: (val) {
                        setState(() {
                          _answers[i] = val;
                        });
                        _calculateResult();
                      },
                    ),
                ],
              );
            }),
            if (_result != null)
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(_result!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
          ],
        ),
      ),
    );
  }
}

class _MBTIQuestion {
  final String question;
  final List<String> options;
  _MBTIQuestion(this.question, this.options);
}
EOL

# --------------------------
# LOGIKA SIMPAN HASIL TES DI WIDGET BDI
# --------------------------
cat > $TESTS/bdi_test_widget.dart <<'EOL'
import 'package:flutter/material.dart';
import '../psy_test_result_model.dart';
import '../service/psy_test_repository.dart';

class BDITestWidget extends StatefulWidget {
  final PsyTestRepository? repository;
  const BDITestWidget({super.key, this.repository});
  @override
  State<BDITestWidget> createState() => _BDITestWidgetState();
}

class _BDITestWidgetState extends State<BDITestWidget> {
  final List<_BDIQuestion> _questions = [
    _BDIQuestion('Sedih', [
      'Saya tidak merasa sedih',
      'Saya merasa sedih',
      'Saya selalu sedih & tidak bisa keluar dari perasaan ini',
      'Saya sangat sedih atau tidak bahagia sehingga tidak tahan lagi'
    ]),
    _BDIQuestion('Pesimisme', [
      'Saya tidak merasa putus asa',
      'Saya merasa kurang optimis tentang masa depan',
      'Saya merasa tidak ada harapan',
      'Saya merasa masa depan sangat suram'
    ]),
    _BDIQuestion('Kegagalan', [
      'Saya tidak merasa gagal',
      'Saya merasa gagal dibanding orang lain',
      'Saya sering gagal dalam mencapai tujuan',
      'Saya merasa sebagai orang gagal'
    ]),
  ];

  final List<int?> _answers = [null, null, null];
  int? _score;
  String? _resultText;

  void _calculateScore() {
    if (_answers.any((a) => a == null)) return;
    final score = _answers.fold<int>(0, (sum, a) => sum + (a ?? 0));
    setState(() {
      _score = score;
      if (score <= 4) {
        _resultText = "Depresi minimal";
      } else if (score <= 7) {
        _resultText = "Depresi ringan";
      } else if (score <= 12) {
        _resultText = "Depresi sedang";
      } else {
        _resultText = "Depresi berat";
      }
    });
    // Simpan hasil
    widget.repository?.add(
      PsyTestResult(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: 'BDI',
        answers: {
          for (var i = 0; i < _questions.length; i++)
            'q${i+1}': _answers[i]
        },
        score: score,
        testedAt: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Tes Beck Depression Inventory (BDI)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ...List.generate(_questions.length, (i) {
              final q = _questions[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text("${i + 1}. ${q.question}"),
                  ),
                  for (int j = 0; j < q.options.length; j++)
                    RadioListTile(
                      value: j,
                      groupValue: _answers[i],
                      title: Text(q.options[j]),
                      onChanged: (val) {
                        setState(() {
                          _answers[i] = val;
                        });
                        _calculateScore();
                      },
                    ),
                ],
              );
            }),
            if (_score != null)
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  "Total Skor: $_score | $_resultText",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BDIQuestion {
  final String question;
  final List<String> options;
  _BDIQuestion(this.question, this.options);
}
EOL

# --------------------------
# INTEGRASI REPO & HASIL TES DI TEST LIST
# --------------------------
cat > $TESTS/psychology_test_list_widget.dart <<'EOL'
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
EOL

# --------------------------
# KONSULTASI (REAL/DUMMY API)
# --------------------------
cat > $SERV/consultation_service.dart <<'EOL'
class ConsultationRequest {
  final String userId;
  final DateTime requestedAt;
  final String? description;
  final String? urgency; // ex: 'emergency', 'normal'

  ConsultationRequest({
    required this.userId,
    required this.requestedAt,
    this.description,
    this.urgency,
  });
}

class ConsultationService {
  final List<ConsultationRequest> _requests = [];

  void submit(ConsultationRequest req) {
    _requests.insert(0, req);
    // Di real app, bisa POST ke API!
  }

  List<ConsultationRequest> fetchAll() => List.from(_requests);
}
EOL

cat > $CONSULT/consultation_widget.dart <<'EOL'
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
EOL

echo "Integrasi penyimpanan hasil tes, model data, & dummy API konsultasi selesai!"
