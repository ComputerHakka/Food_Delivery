class CategoryEntity {
  final int? id;
  final String name;

  CategoryEntity({this.id, required this.name});

  static List<CategoryEntity> categoriesList = [
    CategoryEntity(id: 1, name: 'Народный'),
    CategoryEntity(id: 2, name: 'От шефа'),
    CategoryEntity(id: 3, name: 'Сеты'),
    CategoryEntity(id: 4, name: 'Роллы и суши'),
    CategoryEntity(id: 5, name: 'Пицца'),
    CategoryEntity(id: 6, name: 'Напитки'),
    CategoryEntity(id: 7, name: 'Горячее и салаты'),
    CategoryEntity(id: 8, name: 'Детское меню'),
    CategoryEntity(id: 9, name: 'Десерты'),
    CategoryEntity(id: 10, name: 'Дополнительно'),
  ];
}
