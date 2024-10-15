import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_delivery_app/config/theme/app_themes.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/cart/cart_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/sales/sale_details_screen.dart';

part 'not_empty_cart_widget.dart';
part 'empty_cart_widget.dart';

part 'cart_item_cell.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmptyState) {
            return const _EmptyCartWidget();
          }
          if (state is CartNotEmptyState) {
            return _NotEmptyCartWidget(state: state);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

const TextStyle basicStyle = TextStyle(
  color: textFieldTextColor,
  fontSize: 16,
);

const TextStyle totalStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
