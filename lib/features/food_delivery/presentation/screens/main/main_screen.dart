import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search_rounded),
          ),
        ],
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
    return Ink(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fastfood_rounded),
            Text('Сеты'),
          ],
        ),
      ),
    );
  }
}
