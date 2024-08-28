part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState({this.cartItems = const {}});
  final Map<MenuEntity, int> cartItems;

  double getCost() {
    double cost = 0;
    cartItems.forEach((key, value) {
      cost += key.cost * value;
    });
    return cost;
  }

  int getCount() {
    int count = 0;
    cartItems.forEach((key, value) {
      if (key.cost > 0) {
        count += value;
      }
    });
    return count;
  }

  @override
  List<Object> get props => [cartItems];
}

final class CartEmptyState extends CartState {
  const CartEmptyState();
}

final class CartLoadingState extends CartState {
  const CartLoadingState();
}

final class CartNotEmptyState extends CartState {
  const CartNotEmptyState({required super.cartItems});
}
