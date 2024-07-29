import 'package:flutter/material.dart';

class BonusesScreen extends StatelessWidget {
  const BonusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бонусы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 7.5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[900],
                ),
              ),
            ),
            AspectRatio(
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
            ),
            const Divider(),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
