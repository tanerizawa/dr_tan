import 'package:flutter/material.dart';
import '../../core/common/adaptive_greeting_banner.dart';
import 'beranda_widget.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BerandaView();
  }
}

class _BerandaView extends StatelessWidget {
  const _BerandaView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Padding(
            padding: const EdgeInsets.all(8),
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
