class MenuEntity {
  final int id;
  final String name;
  final int? quantity;
  final double cost;
  final int? weight;
  final int categoryId;
  final bool isSpicy;
  final bool isVegan;
  final List<int>? ingredients;
  final List<String>? images;
  final List<int>? labels;
  final List<int>? menuPositions;

  const MenuEntity({
    required this.id,
    required this.name,
    this.quantity,
    required this.cost,
    this.weight,
    required this.categoryId,
    this.isSpicy = false,
    this.isVegan = false,
    this.ingredients,
    this.images,
    this.labels,
    this.menuPositions,
  });

  static const List<MenuEntity> menuList = [
    MenuEntity(
        id: 1,
        name: 'Спагетти Карбонара',
        quantity: 10,
        cost: 350,
        weight: 250,
        categoryId: 1,
        isSpicy: true,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/carbonara.jpg'],
        labels: [],
        menuPositions: [1, 2]),
    MenuEntity(
        id: 2,
        name: 'Салат Цезарь',
        quantity: 15,
        cost: 270,
        weight: 270,
        categoryId: 7,
        isSpicy: false,
        isVegan: false,
        ingredients: [4, 5, 6, 7],
        images: ['lib/core/assets/food_images/cezar.jpg'],
        labels: [],
        menuPositions: [3]),
    MenuEntity(
        id: 3,
        name: 'Пицца Маргарита',
        quantity: 20,
        cost: 499,
        weight: 300,
        categoryId: 5,
        isSpicy: true,
        isVegan: true,
        ingredients: [7, 8, 9],
        images: ['lib/core/assets/food_images/margo.jpg'],
        labels: [11],
        menuPositions: [4, 5]),
    MenuEntity(
        id: 4,
        name: 'Сэндвич с курицей гриль',
        quantity: 8,
        cost: 260,
        weight: 150,
        categoryId: 1,
        isSpicy: true,
        isVegan: false,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/sandwich.jpg'],
        labels: [12, 1],
        menuPositions: [6]),
    MenuEntity(
        id: 5,
        name: 'Овощное жаркое',
        quantity: 12,
        cost: 670,
        weight: 200,
        categoryId: 7,
        isSpicy: true,
        isVegan: true,
        ingredients: [13, 14, 15],
        images: ['lib/core/assets/food_images/vigatables.jpg'],
        labels: [7],
        menuPositions: [7, 8]),
    MenuEntity(
        id: 6,
        name: 'Тортилья с говядиной',
        quantity: 10,
        cost: 410,
        weight: 180,
        categoryId: 2,
        isSpicy: true,
        isVegan: false,
        ingredients: [16, 17, 18],
        images: ['lib/core/assets/food_images/torro_wrap_beef.jpg'],
        labels: [8],
        menuPositions: [9]),
    MenuEntity(
        id: 7,
        name: 'Манговый смузи',
        quantity: 20,
        cost: 150,
        weight: 250,
        categoryId: 6,
        isSpicy: false,
        isVegan: true,
        ingredients: [19, 20, 21],
        images: ['lib/core/assets/food_images/mango_smoozee.jpg'],
        labels: [2, 14],
        menuPositions: [10]),
    MenuEntity(
        id: 8,
        name: 'Ребрышки BBQ',
        quantity: 5,
        cost: 769,
        weight: 350,
        categoryId: 3,
        isSpicy: true,
        isVegan: false,
        ingredients: [4, 5, 6, 7],
        images: ['lib/core/assets/food_images/bbq_pig.jpg'],
        labels: [9],
        menuPositions: [11, 12]),
    MenuEntity(
        id: 9,
        name: 'Шоколадный торт',
        quantity: 8,
        cost: 1500,
        weight: 150,
        categoryId: 9,
        isSpicy: false,
        isVegan: false,
        ingredients: [19, 20, 21],
        images: ['lib/core/assets/food_images/choco_cake.jpg'],
        labels: [3],
        menuPositions: [13]),
    MenuEntity(
        id: 10,
        name: 'Тост с авокадо',
        quantity: 10,
        cost: 249,
        weight: 120,
        categoryId: 7,
        isSpicy: false,
        isVegan: true,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/avacado_tost.jpg'],
        labels: [13, 14],
        menuPositions: [14]),
    MenuEntity(
        id: 11,
        name: 'Лосось на гриле',
        quantity: 7,
        cost: 899,
        weight: 200,
        categoryId: 3,
        isSpicy: true,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/losos_grill.jpg'],
        labels: [2],
        menuPositions: [15]),
    MenuEntity(
        id: 12,
        name: 'Греческий салат',
        quantity: 10,
        cost: 200,
        weight: 150,
        categoryId: 7,
        isSpicy: false,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/grecheskij_scaled.jpg'],
        labels: [13, 14],
        menuPositions: [16]),
    MenuEntity(
        id: 13,
        name: 'Пицца Пепперони',
        quantity: 20,
        cost: 659,
        weight: 300,
        categoryId: 5,
        isSpicy: true,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/pepperoni.jpg'],
        labels: [11],
        menuPositions: [17, 18]),
    MenuEntity(
        id: 14,
        name: 'Куриные крылышки',
        quantity: 15,
        cost: 449,
        weight: 250,
        categoryId: 1,
        isSpicy: true,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/chiken_wings.jpg'],
        labels: [8],
        menuPositions: [19]),
    MenuEntity(
        id: 15,
        name: 'Жаркое с тофу',
        quantity: 12,
        cost: 359,
        weight: 200,
        categoryId: 7,
        isSpicy: true,
        isVegan: true,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/tofu.jpg'],
        labels: [1],
        menuPositions: [20, 21]),
    MenuEntity(
        id: 16,
        name: 'Тортилья с рыбой',
        quantity: 8,
        cost: 399,
        weight: 180,
        categoryId: 2,
        isSpicy: true,
        isVegan: false,
        ingredients: [1, 2, 3],
        images: ['lib/core/assets/food_images/fish_tortille.jpg'],
        labels: [],
        menuPositions: [22]),
    MenuEntity(
        id: 17,
        name: 'Клубничный смузи',
        quantity: 18,
        cost: 159,
        weight: 250,
        categoryId: 6,
        isSpicy: false,
        isVegan: true,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/strawberry_smoozee.jpg'],
        labels: [14],
        menuPositions: [23]),
    MenuEntity(
        id: 18,
        name: 'Свинина на косточке',
        quantity: 5,
        cost: 599,
        weight: 350,
        categoryId: 2,
        isSpicy: true,
        isVegan: false,
        ingredients: [10, 11, 12, 5, 6, 7],
        images: ['lib/core/assets/food_images/pig_on_bone.jpg'],
        labels: [],
        menuPositions: [24, 25]),
    MenuEntity(
        id: 19,
        name: 'Чизкейк',
        quantity: 7,
        cost: 159,
        weight: 150,
        categoryId: 9,
        isSpicy: false,
        isVegan: false,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/cheezecake.jpg'],
        labels: [],
        menuPositions: [26]),
    MenuEntity(
        id: 20,
        name: 'Паста с морепродуктами',
        quantity: 9,
        cost: 299,
        weight: 250,
        categoryId: 7,
        isSpicy: true,
        isVegan: false,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/sea_pasta.jpg'],
        labels: [1],
        menuPositions: [27]),
    MenuEntity(
        id: 21,
        name: 'Панини с ветчиной и сыром',
        quantity: 10,
        cost: 320,
        weight: 200,
        categoryId: 1,
        isSpicy: true,
        isVegan: false,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/panini.jpg'],
        labels: [10],
        menuPositions: [28]),
    MenuEntity(
        id: 22,
        name: 'Тайский карри с овощами',
        quantity: 8,
        cost: 299,
        weight: 300,
        categoryId: 4,
        isSpicy: true,
        isVegan: true,
        ingredients: [10, 11, 12, 20, 19, 3],
        images: ['lib/core/assets/food_images/thai_curry.jpg'],
        labels: [],
        menuPositions: [29]),
    MenuEntity(
        id: 23,
        name: 'Блины с ягодами',
        quantity: 12,
        cost: 199,
        weight: 150,
        categoryId: 9,
        isSpicy: false,
        isVegan: true,
        ingredients: [10, 11, 12],
        images: ['lib/core/assets/food_images/blins_with_berries.jpg'],
        labels: [],
        menuPositions: [30]),
    MenuEntity(
        id: 24,
        name: 'Французский луковый суп',
        quantity: 5,
        cost: 259,
        weight: 200,
        categoryId: 7,
        isSpicy: true,
        isVegan: false,
        ingredients: [10, 11, 12, 5, 6, 20],
        images: ['lib/core/assets/food_images/la_soupe_a_loignon.jpg'],
        labels: [7],
        menuPositions: [31]),
    MenuEntity(
        id: 25,
        name: 'Рататуй',
        quantity: 6,
        cost: 359,
        weight: 250,
        categoryId: 7,
        isSpicy: true,
        isVegan: true,
        ingredients: [15, 11, 12, 14, 2, 4],
        images: ['lib/core/assets/food_images/ratatui.jpg'],
        labels: [],
        menuPositions: [32]),
  ];
}
