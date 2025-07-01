import 'package:flutter/material.dart';
import '../../core/common/adaptive_greeting_banner.dart';
import 'beranda_widget.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AdaptiveGreetingBanner(pageName: 'Beranda'),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: BerandaWidget(),
      ),
    );
  }
}
