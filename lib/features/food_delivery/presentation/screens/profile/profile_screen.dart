import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              isChangeble: false,
            ),
            _ProfilePoint(
              title: 'Дата рождения',
              value: 'Добавить дату рождения',
              hint: '30.12.2000',
            ),
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
          'Удалить профиль и все мои данные',
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
    this.hint,
    this.isChangeble = true,
    this.callback,
  });

  final String title;
  final String? value;
  final String? hint;
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
          onTap: isChangeble
              ? () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // constraints: BoxConstraints(
                    //     maxHeight: MediaQuery.of(context).size.height / 3.5),
                    builder: (_) =>
                        _ChangeProfileSheet(title: title, hint: hint),
                  );
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      value != null
                          ? Text(
                              value!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox.shrink(),
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

class _ChangeProfileSheet extends StatelessWidget {
  const _ChangeProfileSheet({
    super.key,
    required this.title,
    this.hint,
    this.agreement,
  });

  final String title;
  final String? hint;
  final String? agreement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 25,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hintText: hint,
                labelText: title.toUpperCase(),
                //alignLabelWithHint: true,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ОТМЕНА'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ГОТОВО'),
                  ),
                ),
              ],
            )
          ],
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
          OutlinedButton(
            onPressed: () {},
            child: const Text('Добавить фото'),
          )
        ],
      ),
    );
  }
}
