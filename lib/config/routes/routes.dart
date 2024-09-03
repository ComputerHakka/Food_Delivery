import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/sale.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/auth/auth_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/bonuses/bonuses_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/cart/cart_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/catalog/catalog_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/catalog/product_details_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/copmany_info/company_information_scrre.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/delivery_conditions/delivery_conditions_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/filters/filters_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/main/main_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/notifications/notifications_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/profile/profile_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/sales/sale_details_screen.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/sales/sales_screen.dart';
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
            path: 'sales',
            name: RouteNames.salesScreen,
            builder: (context, state) => const SalesScreen(),
            routes: [
              GoRoute(
                path: 'sale_details',
                name: RouteNames.saleDetailsScreen,
                builder: (context, state) {
                  SaleEntity sale = state.extra as SaleEntity;
                  return SaleDetailsScreen(sale: sale);
                },
              ),
            ],
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
            builder: (context, state) {
              int? index = state.extra as int?;
              return CatalogScreen(index: index);
            },
            routes: [
              GoRoute(
                path: 'filter',
                name: RouteNames.filterScreen,
                builder: (context, state) => const FiltersScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'delivery',
            name: RouteNames.deliveryConditionsScreen,
            builder: (context, state) => const DeliveryConditionsScreen(),
          ),
          GoRoute(
            path: 'auth',
            name: RouteNames.authorizationScreen,
            builder: (context, state) => const AuthScreen(),
            redirect: (context, state) {
              final state = context.read<AuthBloc>().state;
              if (state is AuthorizedState) return '/main/profile';

              return null;
            },
          ),
          GoRoute(
            path: 'profile',
            name: RouteNames.profileScreen,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/cart',
        name: RouteNames.cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
          path: '/product_details',
          name: RouteNames.productDetailsScreen,
          builder: (context, state) {
            var menu = state.extra as MenuEntity;
            return ProductDetailsScreen(menu: menu);
          })
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
