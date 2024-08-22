import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/category.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/sale.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenuWidget(),
      appBar: AppBar(
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search_rounded),
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).goNamed(RouteNames.cartScreen);
        },
        child: const Icon(Icons.shopping_basket_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SaleEntity.salesNow.length,
                itemBuilder: (context, index) {
                  return SaleBannerWidget(sale: SaleEntity.salesNow[index]);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Меню'),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
            )
          ],
        ),
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
                color: Colors.cyan,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  GoRouter.of(context).goNamed(RouteNames.authorizationScreen);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Привет'),
                          Text('Войти'),
                        ],
                      )
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
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: const Text('Уведомления'),
                  leading: const Icon(Icons.notifications_none_rounded),
                  onTap: () {
                    GoRouter.of(context)
                        .goNamed(RouteNames.notifiactionsScreen);
                  },
                ),
                ListTile(
                  title: const Text('Бонусы'),
                  leading: const Icon(Icons.wallet_giftcard_rounded),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.bonusesScreen);
                  },
                ),
                ListTile(
                  title: const Text('Акции'),
                  leading: const Icon(Icons.sell_outlined),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.salesScreen);
                  },
                ),
                ListTile(
                  title: const Text('Каталог'),
                  leading: const Icon(Icons.my_library_books_outlined),
                  onTap: () {
                    GoRouter.of(context)
                        .goNamed(RouteNames.catalogScreen, extra: 0);
                  },
                ),
                ListTile(
                  title: const Text('Условия доставки'),
                  leading: const Icon(Icons.pedal_bike_rounded),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Настройки'),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.settingsScreen);
                  },
                ),
                ListTile(
                  title: const Text('О компании'),
                  leading: const Icon(Icons.work_outline_rounded),
                  onTap: () {
                    GoRouter.of(context).goNamed(RouteNames.companyInfoScreen);
                  },
                ),
                ListTile(
                  title: const Text('Поддержка'),
                  leading: const Icon(Icons.support_agent_rounded),
                  onTap: () async {
                    final Uri smsLaunchUri =
                        Uri(scheme: 'tel', path: '89189810271');
                    await launchUrl(smsLaunchUri);
                  },
                ),
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
                const Text('ПРИСОЕДИНЯЙТЕСЬ К НАМ'),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/core/assets/images/vk_logo.svg',
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      'lib/core/assets/images/telegram_logo.svg',
                      width: 30,
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
    return Container(
      margin: const EdgeInsets.all(5),
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(sale.imagePath!),
          fit: BoxFit.fill,
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
              Icon(
                category.icon,
                size: 67,
                color: Colors.red,
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
