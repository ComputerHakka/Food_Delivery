import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.menu});

  final MenuEntity menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                menu.images?.first ?? 'assets/images/default.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              if (menu.labels?.contains(1) ?? false)
                Positioned(
                  top: 40,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    color: Colors.orange,
                    child:
                        Text('ТЕМПУРА', style: TextStyle(color: Colors.white)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${menu.weight}г. • ${menu.quantity ?? 1} шт.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  menu.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Тунец, замес краб-микс, авокадо, икра масаго, соус японский майонез, кляр, сухари панко, рис, нори',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 12),
                if (menu.isSpicy)
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.red),
                      SizedBox(width: 4),
                      Text('Острое блюдо', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                SizedBox(height: 8),
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
                  Text(
                    'Рекомендуем:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: menu.menuPositions?.length ?? 0,
                      itemBuilder: (context, index) {
                        // Здесь нужно отобразить элементы меню по их ID, для простоты используем заглушки
                        return Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/default.png',
                                width: 160,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Гранд Азия с лососем',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
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
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${menu.cost}₽',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Логика добавления в корзину
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                child: Text('В КОРЗИНУ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
