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
        // Kosongkan judul dan sembunyikan elevation jika ingin tampilan minimalis
        title: const SizedBox.shrink(),
        elevation: 0,
        toolbarHeight: 0, // Sembunyikan toolbar jika tidak perlu
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AdaptiveGreetingBanner(pageName: 'Beranda'),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: BerandaWidget(),
      ),
    );
  }
}
