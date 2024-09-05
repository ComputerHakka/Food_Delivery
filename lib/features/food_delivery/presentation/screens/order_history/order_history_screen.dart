import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:go_router/go_router.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заказы'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Пока нет операций.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Заказывайте чаще и получайте приятные бонусы!',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNames.catalogScreen);
            },
            child: const Text('В КАТАЛОГ'),
          ),
        ],
      ),
    );
  }
}
