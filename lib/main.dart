import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/routes/routes.dart';
import 'package:food_delivery_app/config/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: AppRoutes.router,
    );
  }
}
