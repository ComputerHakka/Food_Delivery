import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/config/routes/routes.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_delivery_app/injection_container.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await init.initMapkit(apiKey: '0ac6dc91-107b-4108-9b11-82210da98120');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => container(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => container()..add(const CheckAuthEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
