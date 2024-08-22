import 'package:flutter/material.dart';

class CategoryEntity {
  final int? id;
  final String name;
  final IconData icon;

  CategoryEntity({
    this.id,
    required this.name,
    required this.icon,
  });

  static List<CategoryEntity> categoriesList = [
    CategoryEntity(id: 1, name: 'Народный', icon: Icons.thumb_up_alt_rounded),
    CategoryEntity(id: 2, name: 'От шефа', icon: Icons.blind_rounded),
    CategoryEntity(id: 3, name: 'Сеты', icon: Icons.fastfood_rounded),
    CategoryEntity(id: 4, name: 'Роллы и суши', icon: Icons.rice_bowl_rounded),
    CategoryEntity(id: 5, name: 'Пицца', icon: Icons.local_pizza_rounded),
    CategoryEntity(id: 6, name: 'Напитки', icon: Icons.local_cafe_rounded),
    CategoryEntity(
        id: 7, name: 'Горячее и салаты', icon: Icons.ramen_dining_rounded),
    CategoryEntity(id: 8, name: 'Детское меню', icon: Icons.child_care_rounded),
    CategoryEntity(id: 9, name: 'Десерты', icon: Icons.bakery_dining_rounded),
    CategoryEntity(
        id: 10, name: 'Дополнительно', icon: Icons.restaurant_menu_rounded),
  ];
}
