import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/ingredient.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/label.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.menu});

  final MenuEntity menu;

  @override
  Widget build(BuildContext context) {
    List<MenuLabelEntity> labels = menu.labels
            ?.map((e) =>
                MenuLabelEntity.labelsList.firstWhere((el) => el.id == e))
            .toList() ??
        [];
    List<String> ingredients = menu.ingredients
            ?.map((e) => IngredientEntity.ingredients
                .firstWhere((el) => el.id == e)
                .name)
            .toList() ??
        [];
    final onPrimary = Theme.of(context).colorScheme.onPrimaryContainer;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                menu.images?.first ??
                    'lib/core/assets/food_images/product_one.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              if (labels.isNotEmpty)
                Positioned(
                  top: 40,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (var label in labels)
                        LabelWidget(
                          label: label,
                        ),
                    ],
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${menu.weight}г. • ${menu.quantity ?? 1} шт.',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text('${menu.cost} ₽',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  menu.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  ingredients.join(', '),
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 12),
                if (menu.isSpicy)
                  const Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.red),
                      SizedBox(width: 4),
                      Text('Острое блюдо', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                const SizedBox(height: 8),
                Text(
                  '${(menu.cost * 0.05).toInt()} бонусов будет начислено',
                  style: TextStyle(fontSize: 16, color: Colors.red[600]),
                ),
              ],
            ),
          ),
          if (menu.menuPositions?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Рекомендуем:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: menu.menuPositions?.length ?? 0,
                      itemBuilder: (context, index) {
                        // Здесь нужно отобразить элементы меню по их ID, для простоты используем заглушки
                        return Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'lib/core/assets/food_images/product_one.jpg',
                                width: 160,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Гранд Азия с лососем',
                                style: TextStyle(fontSize: 14),
                              ),
                              const Text(
                                '329₽',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartEmptyState) {
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(
                              AddProductEvent(menu: menu),
                            );
                          },
                          child: const Text('В КОРЗИНУ'),
                        );
                      }
                      if (state is CartNotEmptyState) {
                        if (state.cartItems.containsKey(menu)) {
                          return Ink(
                            height: 40,
                            width: 125.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<CartBloc>(context)
                                          .add(AddProductEvent(menu: menu));
                                    },
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(50)),
                                    child: SizedBox(
                                      height: double.infinity,
                                      child: Icon(
                                        Icons.add,
                                        color: onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      state.cartItems[menu].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: onPrimary),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<CartBloc>(context)
                                          .add(RemoveProductEvent(menu: menu));
                                    },
                                    borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(50)),
                                    child: SizedBox(
                                      height: double.infinity,
                                      child: Icon(
                                        Icons.remove,
                                        color: onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context).add(
                                AddProductEvent(menu: menu),
                              );
                            },
                            child: const Text('В КОРЗИНУ'),
                          );
                        }
                      }

                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context).add(
                            AddProductEvent(menu: menu),
                          );
                        },
                        child: const Text('В КОРЗИНУ'),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 30),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartNotEmptyState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const Icon(
                              Icons.shopping_basket_outlined,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                                child: Text(
                                  state.getCount().toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(state.getCost().toString()),
                      ],
                    );
                  }
                  if (state is CartEmptyState) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_basket_outlined),
                        Text('Пусто'),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.label,
  });

  final MenuLabelEntity label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: label.color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        label.name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
