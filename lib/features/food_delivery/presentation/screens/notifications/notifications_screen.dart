import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/core/assets/images/notifications.png',
              height: 250,
            ),
            const Text('Здесь будет интересно!'),
            const SizedBox(height: 15),
            const Text('Специально для вас мы сохраним все уведомления'),
            const SizedBox(height: 10),
            const Text('Теперь ни одна классная акция не пройдет мимо'),
          ],
        ),
      ),
    );
  }
}
