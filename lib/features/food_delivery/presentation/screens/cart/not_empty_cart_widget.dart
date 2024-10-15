part of 'cart_screen.dart';

class _NotEmptyCartWidget extends StatelessWidget {
  const _NotEmptyCartWidget({
    super.key,
    required this.state,
  });

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                for (var menu in state.cartItems.entries)
                  _CartItemCell(item: menu.key, count: menu.value),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Добавить к заказу?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    scrollDirection: Axis.horizontal,
                    itemCount: MenuEntity.menuList.length,
                    itemBuilder: (context, index) {
                      if (index < 5) {
                        return SalePositionWidget(
                          menu: MenuEntity.menuList[index],
                        );
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Есть промокод',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Товары', style: basicStyle),
                          Text('${state.getCost().toInt().toString()}₽',
                              style: basicStyle),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Доставка', style: basicStyle),
                          Text('150₽', style: basicStyle)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ИТОГО', style: totalStyle),
                          Text('${(state.getCost() + 150).toInt().toString()}₽',
                              style: totalStyle)
                        ],
                      ),
                      // const SizedBox(
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.card_giftcard_outlined),
                      //       Expanded(
                      //         child: Text(
                      //             '226 бонусов будет начислено за оформление заказа'),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0.0, -1.5),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'На данный момент вы не можете оформить заказ, идите нахуй!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: [
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'ОК',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('ОФОРМИТЬ'),
          ),
        ),
      ],
    );
  }
}
