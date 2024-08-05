import 'package:flutter/material.dart';

class MenuLabelEntity {
  final int id;
  final String name;
  final Color? color;

  const MenuLabelEntity({
    required this.id,
    required this.name,
    required this.color,
  });

  static List<MenuLabelEntity> labelsList = [
    MenuLabelEntity(id: 1, name: 'NEW', color: Colors.pink[900]),
    const MenuLabelEntity(id: 2, name: 'АКЦИЯ', color: Colors.red),
    const MenuLabelEntity(id: 3, name: '5 ЧЕЛ.', color: Colors.green),
    const MenuLabelEntity(id: 4, name: '4 ЧЕЛ.', color: Colors.green),
    const MenuLabelEntity(id: 5, name: '2 ЧЕЛ.', color: Colors.green),
    const MenuLabelEntity(id: 6, name: '6 ЧЕЛ.', color: Colors.green),
    MenuLabelEntity(id: 7, name: 'СРЕДНЕОСТРОЕ', color: Colors.red[600]),
    MenuLabelEntity(id: 8, name: 'СИЛЬНООСТРОЕ', color: Colors.red[900]),
    MenuLabelEntity(id: 9, name: 'НЕМНОГО ОСТРОЕ', color: Colors.red[300]),
    const MenuLabelEntity(id: 10, name: 'МИНИ', color: Colors.yellow),
    MenuLabelEntity(id: 11, name: 'ИЗ ПЕЧИ', color: Colors.brown[600]),
    MenuLabelEntity(id: 12, name: 'ОПАЛЕННЫЕ', color: Colors.orange[300]),
    MenuLabelEntity(id: 13, name: 'VEG', color: Colors.green[600]),
    MenuLabelEntity(id: 14, name: 'ФИТНЕСС', color: Colors.redAccent[100]),
  ];
}
