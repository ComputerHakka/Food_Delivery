import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:get_it/get_it.dart';

final container = GetIt.instance;

void initializeDependencies() {
  container.registerFactory<CartBloc>(() => CartBloc());
}
