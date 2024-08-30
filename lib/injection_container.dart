import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final container = GetIt.instance;
final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

Future<void> initializeDependencies() async {
  container.registerLazySingleton<SharedPreferencesAsync>(() => asyncPrefs);

  container.registerFactory<CartBloc>(() => CartBloc());
}
