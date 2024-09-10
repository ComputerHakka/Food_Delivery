import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterLoadingState()) {
    on<FilterChangedEvent>(filterChange);
  }

  void filterChange(FilterChangedEvent event, Emitter<FilterState> emit) {
    List<MenuEntity> menus = MenuEntity.menuList;
    if (event.isSpicy) {
      menus = menus
          .where((menu) => menu.isSpicy == event.isSpicy)
          .toList()
          .cast<MenuEntity>();
    }
    if (event.isVegan) {
      menus = menus
          .where((menu) => menu.isVegan == event.isVegan)
          .toList()
          .cast<MenuEntity>();
    }
    if (event.categoryId != 0) {
      menus = menus
          .where((menu) => menu.categoryId == event.categoryId)
          .toList()
          .cast<MenuEntity>();
    }

    if (event.lebelsIds.isNotEmpty) {
      menus = menus
          .where((menu) => event.lebelsIds
              .map((id) => menu.labels?.contains(id))
              .contains(true))
          .toList()
          .cast<MenuEntity>();
    }
    if (event.ingredientsIds.isNotEmpty) {
      menus = menus
          .where((menu) => event.ingredientsIds
              .map((id) => menu.ingredients?.contains(id))
              .contains(true))
          .toList()
          .cast<MenuEntity>();
    }

    emit(FilterLoadedState(
        menus: menus,
        isSpicy: event.isSpicy,
        isVegan: event.isVegan,
        categoryId: event.categoryId,
        lebelsIds: event.lebelsIds,
        ingredientsIds: event.ingredientsIds));
  }
}
