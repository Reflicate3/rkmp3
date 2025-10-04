import 'package:flutter/material.dart';
import 'pages/text_and_button_page.dart';
import 'pages/layout_page.dart';
import 'pages/stateless_sample_page.dart';
import 'pages/stateful_sample_page.dart';
import 'pages/about_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практика №3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.deepPurple.shade700,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedIconTheme: const IconThemeData(size: 24),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});
  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  int _index = 0;

  final _pages = const [
    TextAndButtonPage(),   // Text + ElevatedButton
    LayoutPage(),          // Layout: Column, Row, ...
    StatelessSamplePage(), // Собственный StatelessWidget
    StatefulSamplePage(),  // Собственный StatefulWidget
    AboutPage(),           // О приложении
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Практическая работа №3')),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(icon: Icon(Icons.view_quilt), label: 'Layout'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Stateless'),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Stateful'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'About'),
        ],
      ),
    );
  }
}
