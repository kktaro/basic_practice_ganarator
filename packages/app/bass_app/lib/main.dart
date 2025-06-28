import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metronome/metronome.dart';

void main() {
  runApp(const ProviderScope(child: BassApp()));
}

class BassApp extends StatelessWidget {
  const BassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bass Practice Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const BassHomePage(),
    );
  }
}

class BassHomePage extends StatefulWidget {
  const BassHomePage({super.key});

  @override
  State<BassHomePage> createState() => _BassHomePageState();
}

class _BassHomePageState extends State<BassHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    MetronomeWidget(),
    Center(child: Text('コード進行', style: TextStyle(fontSize: 24))),
    Center(child: Text('設定', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bass Practice Generator'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'メトロノーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'コード進行',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
