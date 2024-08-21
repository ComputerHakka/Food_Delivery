import 'package:flutter/material.dart';

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
            Divider(),
            _HowItWorksWidget(),
          ],
        ),
      ),
    );
  }
}

TextStyle bonusText = const TextStyle(color: Colors.white);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'На счету',
                    style: bonusText,
                  ),
                  Text(
                    '0 бонусов',
                    style: bonusText,
                  ),
                  Text(
                    'Правила начисления бонусов',
                    style: bonusText,
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
    return AspectRatio(
      aspectRatio: 3.5,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            child: Text(
                'Авторизируйтесь, чтобы увидеть количество ваших бонусных баллов и историю из начисления'),
          ),
        ),
      ),
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
            title: Text('Получай бонусные баллы с каждой покупки'),
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
