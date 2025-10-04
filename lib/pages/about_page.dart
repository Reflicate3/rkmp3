import 'package:flutter/material.dart';

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
