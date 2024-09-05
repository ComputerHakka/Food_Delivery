import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/food_delivery/presentation/bloc/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

TextStyle basicText = const TextStyle(
  fontSize: 15,
  color: Colors.black,
  height: 1.5,
);
TextStyle linkText = const TextStyle(
  fontSize: 15,
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
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ну что? Начнем!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
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
            Text('На номер поступит звонок или SMS', style: basicText),
            const SizedBox(height: 30),
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
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(const LogInEvent());
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('ВХОД'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocListener(
              listener: (context, state) {
                if (state is AuthorizedState) {
                  GoRouter.of(context).refresh();
                }
              },
              bloc: BlocProvider.of<AuthBloc>(context),
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
