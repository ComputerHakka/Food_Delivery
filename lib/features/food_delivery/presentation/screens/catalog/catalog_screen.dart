import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: MenuEntity.menuList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const MenuCell();
        },
      ),
    );
  }
}

class MenuCell extends StatelessWidget {
  const MenuCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('220 г. • 8 шт.'),
                const Text('ЛОСОСЬ ГРИЛЬ СЯКЕ ЗАПЕЧЕННЫЙ'),
                const Text(
                  'замес краб-микс, лосось, огурец, соус унаги, рис, нори',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('409 ₽'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('В КОРЗИНУ'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
