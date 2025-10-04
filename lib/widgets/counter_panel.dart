import 'package:flutter/material.dart';

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
        Text(
          'Баллов за практику: $_points',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
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
