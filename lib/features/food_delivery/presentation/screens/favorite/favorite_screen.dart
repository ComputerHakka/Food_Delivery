import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Здесь должны быть ваши любимые блюда, скорее добавьте их',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNames.catalogScreen);
            },
            child: const Text('ПЕРЕЙТИ В МЕНЮ'),
          )
        ],
      ),
    );
  }
}
