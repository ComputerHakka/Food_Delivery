import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SharedPreferences prefs;
  FavoriteBloc(this.prefs) : super(FavoriteLoadingState()) {
    on<GetFavoriteEvent>(onGetFavorite);
    on<AddFavoriteEvent>(onAddFavorite);
    on<RemoveFavoriteEvent>(onRemoveFavorite);
  }

  Future<void> onGetFavorite(
      GetFavoriteEvent event, Emitter<FavoriteState> emit) async {
    var favorites = prefs.getStringList('favorites');
    if (favorites == null) {
      await prefs.setStringList('favorites', []);
      favorites = [];
    }
    emit(
      FavoriteLoadedState(
        favoriteMenus: favorites
            .map((e) => MenuEntity.menuList
                .firstWhere((element) => element.id == int.tryParse(e)))
            .toList(),
      ),
    );
  }

  Future<void> onAddFavorite(
      AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    var favorites = [...state.favoriteMenus, event.menu!];
    await prefs.setStringList(
        'favorites', favorites.map((e) => e.id.toString()).toList());
    emit(FavoriteLoadedState(favoriteMenus: favorites));
  }

  Future<void> onRemoveFavorite(
      RemoveFavoriteEvent event, Emitter<FavoriteState> emit) async {
    List<MenuEntity> favorites = [...state.favoriteMenus];
    favorites.remove(event.menu);
    await prefs.setStringList(
        'favorites', favorites.map((e) => e.id.toString()).toList());
    emit(FavoriteLoadedState(favoriteMenus: favorites));
  }
}
