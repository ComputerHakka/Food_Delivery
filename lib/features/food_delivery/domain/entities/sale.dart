import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

class SaleEntity {
  final int id;
  final String title;
  final String? description;
  final List<MenuEntity> salePositions;

  const SaleEntity({
    required this.id,
    required this.title,
    this.description,
    required this.salePositions,
  });
}
