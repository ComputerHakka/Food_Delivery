import 'package:flutter/material.dart';

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
        onPressed: () {},
        child: const Icon(Icons.shopping_basket_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AdBannerWidget(),
                  AdBannerWidget(),
                  AdBannerWidget(),
                  AdBannerWidget(),
                  AdBannerWidget(),
                  AdBannerWidget(),
                ],
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Меню'),
                  GridView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                    ),
                    children: const [
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                      MenuCategoryWidget(),
                    ],
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.cyan,
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
              children: const [
                ListTile(
                  title: Text('Уведомления'),
                  leading: Icon(Icons.notifications_none_rounded),
                ),
                ListTile(
                  title: Text('Бонусы'),
                  leading: Icon(Icons.wallet_giftcard_rounded),
                ),
                ListTile(
                  title: Text('Акции'),
                  leading: Icon(Icons.sell_outlined),
                ),
                ListTile(
                  title: Text('Каталог'),
                  leading: Icon(Icons.my_library_books_outlined),
                ),
                ListTile(
                  title: Text('Условия доставки'),
                  leading: Icon(Icons.pedal_bike_rounded),
                ),
                ListTile(
                  title: Text('Настройки'),
                  leading: Icon(Icons.settings),
                ),
                ListTile(
                  title: Text('О компании'),
                  leading: Icon(Icons.work_outline_rounded),
                ),
                ListTile(
                  title: Text('Поддержка'),
                  leading: Icon(Icons.support_agent_rounded),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ПРИСОЕДИНЯЙТЕСЬ К НАМ'),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.adb_rounded),
                    SizedBox(width: 10),
                    Icon(Icons.adb_rounded),
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

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
    );
  }
}

class MenuCategoryWidget extends StatelessWidget {
  const MenuCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.fastfood_rounded,
                size: 70,
              ),
              Text('Сеты'),
            ],
          ),
        ),
      ),
    );
  }
}
