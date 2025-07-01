import 'package:flutter/material.dart';
import 'beranda_widget.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: BerandaWidget(),
      ),
    );
  }
}
