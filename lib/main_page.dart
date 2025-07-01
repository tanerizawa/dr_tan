import 'package:flutter/material.dart';
import 'features/beranda/beranda_widget.dart';
import 'features/chat/chat_widget.dart';
import 'features/growth/growth_widget.dart';
import 'features/psy/psy_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  final pages = const [
    BerandaWidget(),
    ChatWidget(),
    GrowthWidget(),
    PsyWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        onTap: (i) => setState(() => _current = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Growth'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: 'Psy'),
        ],
      ),
    );
  }
}
