import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Корзина пуста :('),
            const Text('Добавьте что-нибудь из меню'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('В каталог'),
            ),
          ],
        ),
      ),
    );
  }
}
