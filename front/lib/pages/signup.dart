import 'package:flutter/material.dart';
import 'package:front/widgets/banner.dart';
import 'package:front/widgets/flex.dart';
import 'package:front/widgets/signup.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(40),
          child: const Column(
            children: [
              NoneWidget(flex: 1),
              BannerWidget(),
              SignUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
