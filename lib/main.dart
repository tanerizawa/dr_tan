import 'package:flutter/material.dart';
import 'features/beranda/beranda_page.dart';
import 'features/chat/chat_page.dart';
import 'features/growth/growth_page.dart';
import 'features/psy/psy_page.dart';
import 'features/otak_kecil/otak_kecil_page.dart';
import 'core/common/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otak Kecil App',
      theme: AppTheme.light,
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentIndex = 0;
  final _pages = const [
    BerandaPage(),
    ChatPage(),
    GrowthPage(),
    PsyPage(),
    OtakKecilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Growth"),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: "Psy"),
          BottomNavigationBarItem(icon: Icon(Icons.memory), label: "Otak Kecil"),
        ],
      ),
    );
  }
}
