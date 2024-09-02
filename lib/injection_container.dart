import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final container = GetIt.instance;

Future<void> initializeDependencies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  container.registerSingleton<SharedPreferences>(prefs);

  container.registerFactory<CartBloc>(() => CartBloc());
  container.registerFactory<AuthBloc>(() => AuthBloc(container()));
}
