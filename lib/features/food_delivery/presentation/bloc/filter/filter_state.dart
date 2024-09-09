part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState({this.menus = const []});

  final List<MenuEntity> menus;

  @override
  List<Object> get props => [menus];
}

final class FilterLoadingState extends FilterState {
  const FilterLoadingState();
}

final class FilterLoadedState extends FilterState {
  const FilterLoadedState({required super.menus});
}
