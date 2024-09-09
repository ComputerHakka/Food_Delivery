class CategoryEntity {
  final int? id;
  final String name;
  final String imagePath;

  CategoryEntity({
    this.id,
    required this.name,
    required this.imagePath,
  });

  static List<CategoryEntity> categoriesList = [
    CategoryEntity(
        id: 1,
        name: 'Народный',
        imagePath: 'lib/core/assets/menu_images/popular.svg'),
    CategoryEntity(
        id: 2,
        name: 'От шефа',
        imagePath: 'lib/core/assets/menu_images/sheff.svg'),
    CategoryEntity(
        id: 3,
        name: 'На огне',
        imagePath: 'lib/core/assets/menu_images/on_fire.svg'),
    CategoryEntity(
        id: 4,
        name: 'Азиатская',
        imagePath: 'lib/core/assets/menu_images/wok.svg'),
    CategoryEntity(
        id: 5,
        name: 'Пицца',
        imagePath: 'lib/core/assets/menu_images/pizza.svg'),
    CategoryEntity(
        id: 6,
        name: 'Напитки',
        imagePath: 'lib/core/assets/menu_images/drinks.svg'),
    CategoryEntity(
        id: 7,
        name: 'Горячее',
        imagePath: 'lib/core/assets/menu_images/hot_and_salat.svg'),
    CategoryEntity(
        id: 8,
        name: 'Детское',
        imagePath: 'lib/core/assets/menu_images/child.svg'),
    CategoryEntity(
        id: 9,
        name: 'Десерты',
        imagePath: 'lib/core/assets/menu_images/desert.svg'),
    CategoryEntity(
        id: 10,
        name: 'Закуски',
        imagePath: 'lib/core/assets/menu_images/snacks.svg'),
  ];
}
