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
