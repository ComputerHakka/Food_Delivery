import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/category.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/sale.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marqueer/marqueer.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenuWidget(),
      appBar: AppBar(
        title: const AppBarMainTitle(),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search_rounded),
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: const CartFloatingActionButtonWidget(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            _SalesListWidget(),
            _GreetingsWidget(),
            SizedBox(height: 10),
            _SomethingCoolWidget(),
            SizedBox(height: 20),
            _SelectableCategoriesWidget()
          ],
        ),
      ),
    );
  }
}

class _GreetingsWidget extends StatelessWidget {
  const _GreetingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthorizedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Привет, ${state.user!.name}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Ink(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          GoRouter.of(context)
                              .goNamed(RouteNames.bonusesScreen);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Бонусы',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Text(
                  'Ты словно праздник',
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _SelectableCategoriesWidget extends StatelessWidget {
  const _SelectableCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Меню', style: textStyleMain),
          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.9,
            ),
            itemCount: CategoryEntity.categoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuCategoryWidget(
                category: CategoryEntity.categoriesList[index],
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SomethingCoolWidget extends StatelessWidget {
  const _SomethingCoolWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 253, 209, 209),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              offset: Offset(0.0, 4),
            )
          ]),
      child: Row(
        children: [
          SvgPicture.asset(
            'lib/core/assets/images/main_pizza.svg',
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Что сегодня на обед?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Вы просто выбираете что по душе, а мы это быстро доставляем!',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SalesListWidget extends StatelessWidget {
  const _SalesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: SaleEntity.salesNow.length,
        itemBuilder: (context, index) {
          return SaleBannerWidget(sale: SaleEntity.salesNow[index]);
        },
      ),
    );
  }
}

class CartFloatingActionButtonWidget extends StatelessWidget {
  const CartFloatingActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        GoRouter.of(context).pushNamed(RouteNames.cartScreen);
      },
      label: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const CircularProgressIndicator(strokeWidth: 10);
          }

          if (state is CartNotEmptyState) {
            return Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        const Icon(Icons.shopping_basket_outlined),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.red,
                            child: Text(
                              state.getCount().toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text('${state.getCost().toString()}₽'),
                  ],
                ),
                const Text('60 мин')
              ],
            );
          }

          if (state is CartEmptyState) {
            return const Icon(Icons.shopping_basket_outlined);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  GoRouter.of(context).goNamed(RouteNames.authorizationScreen);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 15,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthorizedState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.user!.name,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(state.user!.phone),
                              ],
                            );
                          }
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Привет',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Войти'),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Уведомления'),
                  //leading: const Icon(Icons.notifications_none_rounded),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/notifications.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context)
                        .goNamed(RouteNames.notifiactionsScreen);
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthorizedState) {
                      return Column(
                        children: [
                          ListTile(
                            title: const Text('Избранное'),
                            //leading: const Icon(Icons.favorite_border_rounded),
                            leading: SvgPicture.asset(
                                'lib/core/assets/drawer_icons/favorite.svg',
                                width: 21),
                            onTap: () {
                              GoRouter.of(context)
                                  .goNamed(RouteNames.favoriteScreen);
                            },
                          ),
                          ListTile(
                            title: const Text('История заказов'),
                            //leading: const Icon(Icons.history_rounded),
                            leading: SvgPicture.asset(
                                'lib/core/assets/drawer_icons/order_history.svg',
                                width: 21),
                            onTap: () {
                              GoRouter.of(context)
                                  .goNamed(RouteNames.orderHistoryScreen);
                            },
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                ListTile(
                  title: const Text('Бонусы'),
                  //leading: const Icon(Icons.wallet_giftcard_rounded),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/bonuses.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.bonusesScreen);
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthorizedState) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                ListTile(
                  title: const Text('Акции'),
                  //leading: const Icon(Icons.local_fire_department),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/sales.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.salesScreen);
                  },
                ),
                ListTile(
                  title: const Text('Каталог'),
                  //leading: const Icon(Icons.my_library_books_outlined),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/catalog.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.catalogScreen);
                  },
                ),
                ListTile(
                  title: const Text('Условия доставки'),
                  //leading: const Icon(Icons.pedal_bike_rounded),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/delivery.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context)
                        .goNamed(RouteNames.deliveryConditionsScreen);
                  },
                ),
                // ListTile(
                //   title: const Text('Настройки'),
                //   //leading: const Icon(Icons.settings),
                //   leading: SvgPicture.asset(
                //       'lib/core/assets/drawer_icons/theme_settings.svg',
                //       width: 21),
                //   onTap: () {
                //     GoRouter.of(context).goNamed(RouteNames.settingsScreen);
                //   },
                // ),
                ListTile(
                  title: const Text('О компании'),
                  //leading: const Icon(Icons.work_outline_rounded),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/company_info.svg',
                      width: 21),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.companyInfoScreen);
                  },
                ),
                ListTile(
                  title: const Text('Поддержка'),
                  //leading: const Icon(Icons.support_agent_rounded),
                  leading: SvgPicture.asset(
                      'lib/core/assets/drawer_icons/support.svg',
                      width: 21),
                  onTap: () async {
                    final Uri smsLaunchUri =
                        Uri(scheme: 'tel', path: '89189810271');
                    await launchUrl(smsLaunchUri);
                  },
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthorizedState) {
                      return ListTile(
                        title: const Text('Выход'),
                        //leading: const Icon(Icons.exit_to_app_rounded),
                        leading: SvgPicture.asset(
                            'lib/core/assets/drawer_icons/logout.svg',
                            width: 21),
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(const LogOutEvent());
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ПРИСОЕДИНЯЙТЕСЬ К НАМ',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/core/assets/images/vk_logo.svg',
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'lib/core/assets/images/telegram_logo.svg',
                        width: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SaleBannerWidget extends StatelessWidget {
  const SaleBannerWidget({super.key, required this.sale});

  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(RouteNames.saleDetailsScreen, extra: sale);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(sale.imagePath!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class MenuCategoryWidget extends StatelessWidget {
  const MenuCategoryWidget(
      {super.key, required this.category, required this.index});

  final int index;
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        decoration: BoxDecoration(
          color: containersColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            GoRouter.of(context)
                .goNamed(RouteNames.catalogScreen, extra: index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   category.icon,
              //   size: 67,
              //   color: Colors.red,
              // ),
              SvgPicture.asset(
                category.imagePath,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  category.name.toUpperCase(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarMainTitle extends StatelessWidget {
  const AppBarMainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: mainScreenTitleColor,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        children: [
          const Text('Доставка', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 15),
          Expanded(
            child: SizedBox(
              height: 25,
              child: Marqueer(
                pps: 30,
                restartAfterInteractionDuration: const Duration(seconds: 2),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  child: Text(
                    'ул. Рашпилевская, д 315/1',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
