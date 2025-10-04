import 'package:flutter/material.dart';
import '../widgets/info_card.dart';

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
