import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/common/quick_add_dialog.dart';
import 'beranda_widget.dart';
import 'beranda_provider.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BerandaProvider(),
      child: const _BerandaView(),
    );
  }
}

class _BerandaView extends StatelessWidget {
  const _BerandaView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: BerandaWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showQuickAddDialog(
          context,
          context.read<BerandaProvider>().addNote,
          hint: 'Tambah catatan...',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
