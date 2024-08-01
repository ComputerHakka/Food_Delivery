import 'package:flutter/material.dart';

class CompanyInformationScreen extends StatelessWidget {
  const CompanyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О компании')),
      body: const Center(
        child: Text('Здесь будет находится информация о вашей компании'),
      ),
    );
  }
}
