part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent(
      {required this.isSpicy,
      required this.isVegan,
      required this.categoryId,
      required this.lebelsIds,
      required this.ingredientsIds});

  final bool isSpicy;
  final bool isVegan;
  final int categoryId;
  final List<int> lebelsIds;
  final List<int> ingredientsIds;

  @override
  List<Object> get props => [
        isSpicy,
        isVegan,
        categoryId,
        lebelsIds,
        ingredientsIds,
      ];
}

class FilterChangedEvent extends FilterEvent {
  const FilterChangedEvent(
      {required super.categoryId,
      required super.isSpicy,
      required super.isVegan,
      required super.lebelsIds,
      required super.ingredientsIds});
}
