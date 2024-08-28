import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartEmptyState()) {
    on<AddProductEvent>(addProduct);
    on<RemoveProductEvent>(removeProduct);
    on<CleanCartEvent>(cleanCart);
  }

  void addProduct(AddProductEvent event, Emitter<CartState> emit) {
    if (state.cartItems.containsKey(event.menu)) {
      Map<MenuEntity, int> cartItems = {...state.cartItems};
      cartItems.update(event.menu, (value) => value + 1);
      emit(CartNotEmptyState(cartItems: cartItems));
    } else {
      Map<MenuEntity, int> cartItems = {...state.cartItems};
      cartItems.addEntries({event.menu: 1}.entries);
      emit(CartNotEmptyState(cartItems: cartItems));
    }
  }

  void removeProduct(RemoveProductEvent event, Emitter<CartState> emit) {
    Map<MenuEntity, int> cartItems = {...state.cartItems};
    if (cartItems[event.menu]! > 1) {
      cartItems.update(event.menu, (value) => value - 1);
    } else {
      cartItems.remove(event.menu);
    }

    if (cartItems.isEmpty) {
      emit(const CartEmptyState());
    } else {
      emit(CartNotEmptyState(cartItems: cartItems));
    }
  }

  void cleanCart(CleanCartEvent event, Emitter<CartState> emit) {
    emit(const CartEmptyState());
  }
}
