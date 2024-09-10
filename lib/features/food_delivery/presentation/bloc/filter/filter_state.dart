part of 'filter_bloc.dart';

final class FilterState extends Equatable {
  const FilterState(
      {this.menus = const [],
      this.isSpicy = false,
      this.isVegan = false,
      this.labels = const [false, false, false, false, false, false, false],
      this.ingredients = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.lebelsIds = const [],
      this.ingredientsIds = const []});

  final List<MenuEntity> menus;

  final bool isSpicy;
  final bool isVegan;
  final List<bool> labels;
  final List<bool> ingredients;
  final List<int> lebelsIds;
  final List<int> ingredientsIds;

  FilterState copyWith({
    List<MenuEntity>? menus,
    bool? isSpicy,
    bool? isVegan,
    List<bool>? labels,
    List<bool>? ingredients,
    List<int>? lebelsIds,
    List<int>? ingredientsIds,
  }) {
    return FilterState(
      menus: menus ?? this.menus,
      isSpicy: isSpicy ?? this.isSpicy,
      isVegan: isVegan ?? this.isVegan,
      labels: labels ?? this.labels,
      ingredients: ingredients ?? this.ingredients,
      lebelsIds: lebelsIds ?? this.lebelsIds,
      ingredientsIds: ingredientsIds ?? this.ingredientsIds,
    );
  }

  @override
  List<Object> get props => [
        menus,
        isSpicy,
        isVegan,
        labels,
        ingredients,
        lebelsIds,
        ingredientsIds,
      ];
}

final class FilterLoadingState extends FilterState {
  const FilterLoadingState();
}

final class FilterLoadedState extends FilterState {
  const FilterLoadedState({required super.menus});
}
