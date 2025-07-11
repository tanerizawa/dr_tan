import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ai/ai_service.dart';
import '../../growth/growth_provider.dart';
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
  String? _insight;
  bool _loadingInsight = false;

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
    _fetchInsight(type);
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

  Future<void> _fetchInsight(String type) async {
    setState(() {
      _loadingInsight = true;
    });
    final prompt =
        'Saya mendapat hasil MBTI $type. Berikan saran langkah pengembangan diri.';
    final res = await AiService().getInsight(prompt);
    if (!mounted) return;
    setState(() {
      _insight = res;
      _loadingInsight = false;
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
                child: Text(_result!,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            if (_loadingInsight)
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: CircularProgressIndicator(),
              )
            else if (_insight != null)
              _NextStepCard(
                text: _insight!,
                onSave: () {
                  final growth = context.read<GrowthProvider?>();
                  growth?.addProgress(_insight!);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NextStepCard extends StatelessWidget {
  final String text;
  final VoidCallback onSave;
  const _NextStepCard({required this.text, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Next Step', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(text),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: onSave, child: const Text('Save as Goal')),
            )
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
