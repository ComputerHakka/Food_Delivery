part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent({this.menu});

  final MenuEntity? menu;

  @override
  List<Object?> get props => [menu];
}

class GetFavoriteEvent extends FavoriteEvent {
  const GetFavoriteEvent();
}

class AddFavoriteEvent extends FavoriteEvent {
  const AddFavoriteEvent({super.menu});
}

class RemoveFavoriteEvent extends FavoriteEvent {
  const RemoveFavoriteEvent({super.menu});
}
