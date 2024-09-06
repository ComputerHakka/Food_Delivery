import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/screens/catalog/catalog_screen.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoadedState) {
            if (state.favoriteMenus.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Здесь должны быть ваши любимые блюда, скорее добавьте их',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(RouteNames.catalogScreen);
                    },
                    child: const Text('ПЕРЕЙТИ В МЕНЮ'),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: state.favoriteMenus.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MenuCell(product: state.favoriteMenus[index]);
                },
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
