import 'package:flutter/material.dart';

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
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
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
          // Container + внутренний отступ
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

          // Column
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

          // Заголовок блока Row
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

          // Row с явным выравниванием
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
