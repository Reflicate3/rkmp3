import 'package:flutter/material.dart';

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

/// Главный экран: 5 разделов по плану методички
class DemoHome extends StatefulWidget {
  const DemoHome({super.key});
  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  int _index = 0;

  final _pages = const [
    TextAndButtonPage(),   // 1) Text + ElevatedButton
    LayoutPage(),          // 2) Layout: Column, Row, ...
    StatelessSamplePage(), // 3) Собственный StatelessWidget
    StatefulSamplePage(),  // 4) Собственный StatefulWidget
    AboutPage(),           // 5) О приложении
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

/// 1) Text + ElevatedButton
class TextAndButtonPage extends StatelessWidget {
  const TextAndButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Виджет Text выводит строку на экран.\nНиже — кнопка ElevatedButton.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              elevation: 4,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Нажата ElevatedButton')),
              );
            },
            child: const Text('Показать ElevatedButton'),
          ),
        ],
      ),
    );
  }
}

/// 2) Layout: Column / Row / SizedBox / Padding / Container
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  Widget _coloredBlock(String text, Color color) {
    return Expanded(
      child: Container(
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Column: элементы располагаются вертикально',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Элемент 1'),
              SizedBox(height: 8),
              Text('Элемент 2'),
              SizedBox(height: 8),
              Text('Элемент 3'),
            ],
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Row: одинаково оформленные блоки по горизонтали',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              _coloredBlock('Block A', Colors.teal.shade400),
              const SizedBox(width: 8),
              _coloredBlock('Block B', Colors.teal.shade500),
              const SizedBox(width: 8),
              _coloredBlock('Block C', Colors.teal.shade600),
            ],
          ),
        ],
      ),
    );
  }
}

/// 3) Собственный StatelessWidget
class InfoCard extends StatelessWidget {
  final int number;
  final String text;

  const InfoCard({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Номер элемента
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            child: Text(
              number.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          // Текст элемента
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class StatelessSamplePage extends StatelessWidget {
  const StatelessSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        InfoCard(number: 1, text: 'Изучение базовых виджетов Flutter'),
        InfoCard(number: 2, text: 'Использование Column и Row для компоновки'),
        InfoCard(number: 3, text: 'Работа с отступами через SizedBox и Padding'),
        InfoCard(number: 4, text: 'Применение Container для оформления блоков'),
        InfoCard(number: 5, text: 'Создание собственного StatelessWidget'),
        InfoCard(number: 6, text: 'Создание собственного StatefulWidget и работа со state'),
      ],
    );
  }
}

/// 4) StatefulWidget: счётчик заменён на "Баллов за практику"
class CounterPanel extends StatefulWidget {
  const CounterPanel({super.key});
  @override
  State<CounterPanel> createState() => _CounterPanelState();
}

class _CounterPanelState extends State<CounterPanel> {
  int _points = 3; // стартовое значение = 3

  void _inc() => setState(() => _points++);
  void _dec() => setState(() => _points--);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Баллов за практику: $_points',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: _dec,
              child: const Text('-'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: _inc,
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}

class StatefulSamplePage extends StatelessWidget {
  const StatefulSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orange.withOpacity(0.08),
        ),
        child: const CounterPanel(),
      ),
    );
  }
}

/// 5) О приложении (About)
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'О приложении',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Text(
          'Учебное приложение создано для выполнения практической работы №3 '
              'по дисциплине «Разработка кроссплатформенных мобильных приложений».\n',
        ),
        Text(
          'В приложении демонстрируются:\n'
              '• базовые виджеты (Text, ElevatedButton);\n'
              '• приёмы компоновки (Column, Row, SizedBox, Padding, Container);\n'
              '• создание собственных виджетов: Stateless и Stateful;\n'
              '• работа со состоянием через setState.\n',
        ),
        Text(
          'Автор: Емелин В. В., группа ИКБО-12-22',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
