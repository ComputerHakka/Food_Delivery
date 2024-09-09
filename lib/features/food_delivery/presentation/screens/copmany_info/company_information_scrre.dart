import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyInformationScreen extends StatelessWidget {
  const CompanyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О компании')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/core/assets/images/company_empty.svg',
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Здесь будет находится информация о вашей компании',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
