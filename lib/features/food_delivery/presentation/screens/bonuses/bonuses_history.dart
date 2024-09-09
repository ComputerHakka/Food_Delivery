import 'package:flutter/material.dart';

class BonusesHistoryScreen extends StatelessWidget {
  const BonusesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История бонусов'),
      ),
      body: const Center(
        child: Text('История бонусов пуста'),
      ),
    );
  }
}
