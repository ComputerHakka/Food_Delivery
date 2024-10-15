part of 'cart_screen.dart';

class _EmptyCartWidget extends StatelessWidget {
  const _EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/core/assets/images/empty_cart_image_2.svg',
            width: MediaQuery.of(context).size.width / 1.7,
          ),
          const SizedBox(height: 20),
          const Text(
            'Корзина пуста :(',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Добавьте что-нибудь из меню',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNames.catalogScreen);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('В КАТАЛОГ'),
            ),
          ),
        ],
      ),
    );
  }
}
