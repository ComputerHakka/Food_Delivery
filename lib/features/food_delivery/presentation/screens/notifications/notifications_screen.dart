import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Здесь будет интересно!'),
            Text('Специально для вас мы сохраним все уведомления'),
            Text('Теперь ни одна классная акция не пройдет мимо'),
          ],
        ),
      ),
    );
  }
}
