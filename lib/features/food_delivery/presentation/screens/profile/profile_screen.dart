import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личные данные'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _ProfilePoint(title: 'Имя', value: 'Вячеслав'),
            _ProfilePoint(
                title: 'Номер телефона',
                value: '+7 (918) 656 56-65',
                isChangeble: false),
            _ProfilePoint(title: 'Эл. почта', value: 'qoifqoiefj@mail.ru'),
            _ProfilePoint(
              title: 'Получать электронные чеки и беречь природу',
            ),
            _ProfilePoint(
                title: 'Дата рождения', value: 'Добавить дату рождения'),
            _ChangePhotoWidget(),
            _DestroyProfileWidget()
          ],
        ),
      ),
    );
  }
}

class _DestroyProfileWidget extends StatelessWidget {
  const _DestroyProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.delete, color: Colors.red),
        SizedBox(width: 10),
        Text(
          'Удалить профил и все мои данные',
          style: TextStyle(
            color: Colors.red,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

class _ProfilePoint extends StatelessWidget {
  const _ProfilePoint({
    super.key,
    required this.title,
    this.value,
    this.isChangeble = true,
    this.callback,
  });

  final String title;
  final String? value;
  final bool isChangeble;
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              offset: Offset(0.0, 4),
            )
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: isChangeble ? () {} : null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      value != null ? Text(value!) : const SizedBox.shrink(),
                    ],
                  ),
                ),
                const SizedBox(width: 55),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangePhotoWidget extends StatelessWidget {
  const _ChangePhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Добавить фото'),
          )
        ],
      ),
    );
  }
}
