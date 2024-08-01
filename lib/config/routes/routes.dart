import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/bonuses/bonuses_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/cart/cart_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/catalog/catalog_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/copmany_info/company_information_scrre.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/main/main_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/notifications/notifications_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/main',
    routes: [
      GoRoute(
        path: '/main',
        name: RouteNames.mainScreen,
        builder: (context, state) => const MainScreen(),
        routes: [
          GoRoute(
            path: 'notifications',
            name: RouteNames.notifiactionsScreen,
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: 'bonuses',
            name: RouteNames.bonusesScreen,
            builder: (context, state) => const BonusesScreen(),
          ),
          GoRoute(
            path: 'cart',
            name: RouteNames.cartScreen,
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: 'company_info',
            name: RouteNames.companyInfoScreen,
            builder: (context, state) => const CompanyInformationScreen(),
          ),
          GoRoute(
            path: 'settings',
            name: RouteNames.settingsScreen,
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: 'catalog',
            name: RouteNames.catalogScreen,
            builder: (context, state) => const CatalogScreen(),
          ),
        ],
      ),
      // GoRoute(
      //   path: '/',
      //   name: RouteNames.loaderScreen,
      //   builder: (context, state) => const LoadingScreen(),
      // ),
      // GoRoute(
      //   path: '/main',
      //   name: RouteNames.startScreen,
      //   builder: (context, state) => const StartScreen(),
      // ),
      // GoRoute(
      //   path: '/notifications',
      //   name: RouteNames.notifiactionsScreen,
      //   builder: (context, state) => const NotificationsScreen(),
      // ),
      // GoRoute(
      //   path: '/transaction_details',
      //   name: RouteNames.notifiactionsScreen,
      // ),
      // GoRoute(
      //   path: '/service_details',
      //   name: RouteNames.serviceDetailsScreen,
      // ),
    ],
  );
}
