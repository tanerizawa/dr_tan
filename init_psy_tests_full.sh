#!/bin/bash

ROOT="lib/features/psy"

echo "Membuat fitur lengkap Tes Psikologi, MBTI, BDI, dan Konsultasi..."

mkdir -p $ROOT/tests
mkdir -p $ROOT/consultation

# --------------------------
# MBTI TEST
# --------------------------
cat > $ROOT/tests/mbti_test_widget.dart <<'EOL'
import 'package:flutter/material.dart';

class MBTITestWidget extends StatefulWidget {
  const MBTITestWidget({super.key});
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
    // Dummy logic: E/I, T/F, J/P berdasarkan pilihan 0/1
    String type = '';
    type += _answers[0] == 0 ? 'E' : 'I';
    type += 'N';
    type += _answers[1] == 0 ? 'T' : 'F';
    type += _answers[2] == 0 ? 'J' : 'P';
    setState(() {
      _result = "Tipe MBTI Anda: $type";
    });
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
# BDI TEST
# --------------------------
cat > $ROOT/tests/bdi_test_widget.dart <<'EOL'
import 'package:flutter/material.dart';

class BDITestWidget extends StatefulWidget {
  const BDITestWidget({super.key});
  @override
  State<BDITestWidget> createState() => _BDITestWidgetState();
}

class _BDITestWidgetState extends State<BDITestWidget> {
  // Dummy 3 dari 21, seharusnya bisa diperluas
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
# TES PSIKOLOGI (PILIHAN UMUM)
# --------------------------
cat > $ROOT/tests/psychology_test_list_widget.dart <<'EOL'
import 'package:flutter/material.dart';
import 'mbti_test_widget.dart';
import 'bdi_test_widget.dart';

class PsychologyTestListWidget extends StatelessWidget {
  const PsychologyTestListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = [
      ("Tes MBTI", const MBTITestWidget()),
      ("Tes BDI (Depresi)", const BDITestWidget()),
    ];

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("Daftar Tes Psikologi:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        ...tests.map((t) => ExpansionTile(
              title: Text(t.$1),
              initiallyExpanded: false,
              children: [t.$2],
            )),
      ],
    );
  }
}
EOL

# --------------------------
# FITUR KONSULTASI (DUMMY)
# --------------------------
cat > $ROOT/consultation/consultation_widget.dart <<'EOL'
import 'package:flutter/material.dart';

class ConsultationWidget extends StatelessWidget {
  const ConsultationWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
                "Jika hasil tes menunjukkan indikasi masalah psikologis, silakan konsultasi dengan psikolog profesional.\n\n"
                "Klik tombol di bawah untuk membuat jadwal konsultasi atau menghubungi layanan darurat:"),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule),
              label: const Text("Buat Janji Konsultasi"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Fitur janji konsultasi (dummy)")),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.phone_in_talk),
              label: const Text("Hubungi Bantuan Darurat"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Hotline darurat (dummy): 119, 112")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
EOL

# --------------------------
# UPDATE WIDGET UTAMA PSY UNTUK MENAMPILKAN TES DAN KONSULTASI
# --------------------------
cat > $ROOT/psy_widget.dart <<'EOL'
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
    return ChangeNotifierProvider(
      create: (_) => PsyProvider(),
      child: const _PsyView(),
    );
  }
}

class _PsyView extends StatelessWidget {
  const _PsyView();

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
EOL

echo "Fitur Tes Psikologi/MBTI/BDI/Konsultasi sudah lengkap dan siap dikembangkan!"
