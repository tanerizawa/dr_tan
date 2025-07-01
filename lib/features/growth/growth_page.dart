import 'package:flutter/material.dart';
import 'growth_widget.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Growth')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: GrowthWidget(),
      ),
    );
  }
}
