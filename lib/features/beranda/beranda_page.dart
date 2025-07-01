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
        // Menyembunyikan title untuk tampilan lebih clean
        title: const SizedBox.shrink(),
        toolbarHeight: 0, // Jika ingin tanpa toolbar, atau hapus jika ingin pakai title custom
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100), // 100 atau 120 bisa disesuaikan kebutuhan UI/UX
          child: Padding(
            padding: const EdgeInsets.all(16), // Gunakan padding 16 agar konsisten dengan body
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
