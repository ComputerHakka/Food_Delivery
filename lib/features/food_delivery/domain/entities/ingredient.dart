class IngredientEntity {
  final int id;
  final String name;

  const IngredientEntity({required this.id, required this.name});

  static const List<IngredientEntity> ingredients = [
    IngredientEntity(id: 1, name: 'Лосось'),
    IngredientEntity(id: 2, name: 'Сыр сливочный "Cremette"'),
    IngredientEntity(id: 3, name: 'Огурец'),
    IngredientEntity(id: 4, name: 'Соус унаги'),
    IngredientEntity(id: 5, name: 'Рис'),
    IngredientEntity(id: 6, name: 'Нори'),
    IngredientEntity(id: 7, name: 'Замес краб-микс'),
    IngredientEntity(id: 8, name: 'Замес монако'),
    IngredientEntity(id: 9, name: 'Соус яки'),
    IngredientEntity(id: 10, name: 'Мидии'),
    IngredientEntity(id: 11, name: 'Креветка'),
    IngredientEntity(id: 12, name: 'Бекон'),
    IngredientEntity(id: 13, name: 'Соус спайси'),
    IngredientEntity(id: 14, name: 'Лук зеленый'),
    IngredientEntity(id: 15, name: 'Кляр'),
    IngredientEntity(id: 16, name: 'Сухари панко'),
    IngredientEntity(id: 17, name: 'Свежий огурец'),
    IngredientEntity(id: 18, name: 'Кунжут'),
    IngredientEntity(id: 19, name: 'Икра масаго'),
    IngredientEntity(id: 20, name: 'Соус лава'),
    IngredientEntity(id: 21, name: 'Курица'),
  ];
}
