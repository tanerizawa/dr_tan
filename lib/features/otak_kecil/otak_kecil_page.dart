import 'package:flutter/material.dart';
import 'otak_kecil_widget.dart';

class OtakKecilPage extends StatelessWidget {
  const OtakKecilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Otak Kecil')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: OtakKecilWidget(),
      ),
    );
  }
}
