import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            SvgPicture.asset(
              'lib/core/assets/images/empty_cart_image.svg',
              width: MediaQuery.of(context).size.width / 1.3,
            ),
            const SizedBox(height: 20),
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
