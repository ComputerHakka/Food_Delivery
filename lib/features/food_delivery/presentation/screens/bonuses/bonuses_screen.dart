import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class BonusesScreen extends StatelessWidget {
  const BonusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бонусы'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _BonusBannerWidget(),
            _AuthHintWidget(),
            _HowItWorksWidget(),
          ],
        ),
      ),
    );
  }
}

class _BonusBannerWidget extends StatelessWidget {
  const _BonusBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7.5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[900],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Image.asset(
                'lib/core/assets/decoration_images/fish.png',
                width: 190,
                height: 190,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'На счету',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    '0 бонусов',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Правила начисления бонусов',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationColor: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthHintWidget extends StatelessWidget {
  const _AuthHintWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthorizedState) {
          return Column(
            children: [
              Ink(
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'История бонусов',
                          style: TextStyle(fontSize: 17),
                        ),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Ink(
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Пригласить друга',
                          style: TextStyle(fontSize: 17),
                        ),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 3.5,
              child: Ink(
                padding: const EdgeInsets.symmetric(vertical: 7.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(RouteNames.authorizationScreen);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Text(
                      'Авторизируйтесь, чтобы увидеть количество ваших бонусных баллов и историю из начисления',
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class _HowItWorksWidget extends StatelessWidget {
  const _HowItWorksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          ListTile(
            title: Text('Заказывай любимую еду'),
            leading: CircleAvatar(),
          ),
          ListTile(
            title: Text(
              'Получай бонусные баллы с каждой покупки',
            ),
            leading: CircleAvatar(),
          ),
          ListTile(
            title: Text('Оплачивай баллами следующие покупки'),
            leading: CircleAvatar(),
          ),
        ],
      ),
    );
  }
}
