import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
            child: Column(
              children: [
                SvgPicture.asset(
                  'lib/core/assets/images/orders_image.svg',
                  width: MediaQuery.of(context).size.width / 1.3,
                ),
                const Text(
                  'Пока нет операций.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
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
