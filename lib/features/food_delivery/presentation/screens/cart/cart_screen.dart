import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/sales/sale_details_screen.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmptyState) {
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
          if (state is CartNotEmptyState) {
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Товары', style: basicStyle),
                                  Text(state.getCost().toString(),
                                      style: basicStyle),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Доставка', style: basicStyle),
                                  Text('150.0', style: basicStyle)
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('ИТОГО', style: totalStyle),
                                  Text((state.getCost() + 150).toString(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                              'На данный момент вы не можете оформить заказ, ждите следующих обновлений',
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

const TextStyle basicStyle = TextStyle(
  color: textFieldTextColor,
  fontSize: 16,
);

const TextStyle totalStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

class _CartItemCell extends StatelessWidget {
  const _CartItemCell({super.key, required this.item, required this.count});

  final MenuEntity item;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Ink(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              offset: Offset(0.0, 5.5),
            )
          ],
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      item.images!.first,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${(item.cost * count).toString()} ₽',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Ink(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: unselectedItemColor,
                            width: 1,
                          ),
                        ),
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<CartBloc>(context)
                                          .add(RemoveProductEvent(menu: item));
                                    },
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(10)),
                                    child: const SizedBox(
                                      height: double.infinity,
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      state.cartItems[item].toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<CartBloc>(context)
                                          .add(AddProductEvent(menu: item));
                                    },
                                    borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(10)),
                                    child: const SizedBox(
                                      height: double.infinity,
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
