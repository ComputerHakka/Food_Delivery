class MenuLabelEntity {
  final int id;
  final String name;

  const MenuLabelEntity({required this.id, required this.name});

  static const List<MenuLabelEntity> labelsList = [
    MenuLabelEntity(id: 1, name: 'NEW'),
    MenuLabelEntity(id: 2, name: 'АКЦИЯ'),
    MenuLabelEntity(id: 3, name: '5 чел.'),
    MenuLabelEntity(id: 4, name: '4 чел.'),
    MenuLabelEntity(id: 5, name: '2 чел.'),
    MenuLabelEntity(id: 6, name: '6 чел.'),
    MenuLabelEntity(id: 7, name: 'СРЕДНЕОСТРОЕ'),
    MenuLabelEntity(id: 8, name: 'СИЛЬНООСТРОЕ'),
    MenuLabelEntity(id: 9, name: 'МАЛООСТРОЕ'),
    MenuLabelEntity(id: 10, name: 'МИНИ'),
    MenuLabelEntity(id: 11, name: 'ИЗ ПЕЧИ'),
    MenuLabelEntity(id: 12, name: 'ОПАЛЕННЫЕ'),
    MenuLabelEntity(id: 13, name: 'VEG'),
    MenuLabelEntity(id: 14, name: 'ФИТНЕСС'),
  ];
}
