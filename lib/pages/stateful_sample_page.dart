import 'package:flutter/material.dart';
import '../widgets/counter_panel.dart';

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
