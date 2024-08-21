import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

TextStyle basicText = const TextStyle(
  color: Colors.black,
  height: 1.5,
);
TextStyle linkText = const TextStyle(
  color: Colors.black,
  decoration: TextDecoration.underline,
  decorationColor: Colors.black,
  decorationThickness: 2,
  height: 1.5,
);

class _AuthScreenState extends State<AuthScreen> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ну что? Начнем!'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_rounded),
                  suffixIcon: Icon(Icons.close_rounded),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const Text('На номер поступит звонок или SMS'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(text: 'Я согласен с ', style: basicText),
                      TextSpan(
                          text: 'политикой конфиденциальности, ',
                          style: linkText),
                      TextSpan(
                          text: 'пользовательским соглашением ',
                          style: linkText),
                      TextSpan(
                          text:
                              'и даю разрешение на обработку персональных данных.',
                          style: basicText),
                    ],
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
