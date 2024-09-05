import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/category.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/ingredient.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/label.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/catalog/product_details_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/main/main_screen.dart';
import 'package:go_router/go_router.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, required this.index});
  final int? index;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int _selectedIndex = 0; // Индекс выбранной категории
  String _currentTitle = 'Народный';
  late PageController _pageController;

  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index!;
      _pageController = PageController(initialPage: _selectedIndex);
      _currentTitle = CategoryEntity.categoriesList[_selectedIndex].name;
    } else {
      _pageController = PageController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CartFloatingActionButtonWidget(),
      body: Column(
        children: [
          SizedBox(
            height: 146.0,
            child: Column(
              children: [
                Container(
                  height: 80.0,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryEntity.categoriesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Ink(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                  _currentTitle =
                                      CategoryEntity.categoriesList[index].name;
                                });
                                // Переход на соответствующую страницу
                                // animateToPage
                                // duration: const Duration(milliseconds: 400),
                                //   curve: Curves.easeInOut,

                                _pageController.jumpToPage(
                                  index,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                    CategoryEntity.categoriesList[index].name),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(height: 10, color: Colors.white),
                const Divider(height: 0, thickness: 0.5),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 1),
                      ),
                    ],
                  ),
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const SizedBox(width: 25),
                          Text(
                            _currentTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .goNamed(RouteNames.filterScreen);
                          },
                          icon: const Icon(Icons.filter_alt))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                  _currentTitle = CategoryEntity.categoriesList[index].name;
                });
              },
              itemCount: CategoryEntity.categoriesList.length,
              itemBuilder: (context, index) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: MenuEntity.menuList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _MenuCell(product: MenuEntity.menuList[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCell extends StatelessWidget {
  const _MenuCell({super.key, required this.product});

  final MenuEntity product;

  @override
  Widget build(BuildContext context) {
    List<MenuLabelEntity> labels = product.labels
            ?.map((e) =>
                MenuLabelEntity.labelsList.firstWhere((el) => el.id == e))
            .toList() ??
        [];
    List<String> ingredients = product.ingredients
            ?.map((e) => IngredientEntity.ingredients
                .firstWhere((el) => el.id == e)
                .name)
            .toList() ??
        [];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              offset: Offset(0.0, 4),
            )
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            GoRouter.of(context)
                .pushNamed(RouteNames.productDetailsScreen, extra: product);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        'lib/core/assets/food_images/product_one.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (labels.isNotEmpty)
                    Positioned(
                      top: 10,
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
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.weight}г. • 8 шт.',
                      style: const TextStyle(
                        color: textFieldTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ingredients.join(', '),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: textFieldTextColor),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.cost} ₽',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartNotEmptyState) {
                              if (state.cartItems.containsKey(product)) {
                                return Ink(
                                  height: 40,
                                  width: 125.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: onPrimaryContainers,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            BlocProvider.of<CartBloc>(context)
                                                .add(RemoveProductEvent(
                                                    menu: product));
                                          },
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(10)),
                                          child: const SizedBox(
                                            height: double.infinity,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: Text(
                                            state.cartItems[product].toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            BlocProvider.of<CartBloc>(context)
                                                .add(AddProductEvent(
                                                    menu: product));
                                          },
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(10)),
                                          child: const SizedBox(
                                            height: double.infinity,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.red,
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
                                    BlocProvider.of<CartBloc>(context)
                                        .add(AddProductEvent(menu: product));
                                  },
                                  child: const Text('В КОРЗИНУ'),
                                );
                              }
                            }
                            if (state is CartEmptyState) {
                              return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(AddProductEvent(menu: product));
                                },
                                child: const Text('В КОРЗИНУ'),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
