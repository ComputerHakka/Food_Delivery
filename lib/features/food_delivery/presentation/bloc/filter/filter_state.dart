part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState({
    this.menus = const [],
    this.isSpicy = false,
    this.isVegan = false,
    this.categoryId = 0,
    this.lebelsIds = const [],
    this.ingredientsIds = const [],
  });

  final List<MenuEntity> menus;

  final bool isSpicy;
  final bool isVegan;
  final int categoryId;
  final List<int> lebelsIds;
  final List<int> ingredientsIds;

  @override
  List<Object> get props => [
        menus,
        isSpicy,
        isVegan,
        categoryId,
        lebelsIds,
        ingredientsIds,
      ];
}

final class FilterLoadingState extends FilterState {
  const FilterLoadingState();
}

final class FilterLoadedState extends FilterState {
  const FilterLoadedState(
      {required super.menus,
      required super.isSpicy,
      required super.isVegan,
      required super.categoryId,
      required super.lebelsIds,
      required super.ingredientsIds});

  FilterLoadedState copyWith({
    List<MenuEntity>? menus,
    bool? isSpicy,
    bool? isVegan,
    int? categoryId,
    List<bool>? labels,
    List<bool>? ingredients,
    List<int>? lebelsIds,
    List<int>? ingredientsIds,
  }) {
    return FilterLoadedState(
      menus: menus ?? this.menus,
      isSpicy: isSpicy ?? this.isSpicy,
      isVegan: isVegan ?? this.isVegan,
      categoryId: categoryId ?? this.categoryId,
      lebelsIds: lebelsIds ?? this.lebelsIds,
      ingredientsIds: ingredientsIds ?? this.ingredientsIds,
    );
  }
}
