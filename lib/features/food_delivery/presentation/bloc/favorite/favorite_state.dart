part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState({this.favoriteMenus = const []});

  final List<MenuEntity> favoriteMenus;

  @override
  List<Object> get props => [favoriteMenus];
}

final class FavoriteLoadingState extends FavoriteState {}

final class FavoriteLoadedState extends FavoriteState {
  const FavoriteLoadedState({super.favoriteMenus});
}
