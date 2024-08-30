import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/config/routes/routes.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_delivery_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => container(),
      child: MaterialApp.router(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
