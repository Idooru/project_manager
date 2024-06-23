import 'package:flutter/material.dart';
import 'package:front/widgets/banner.dart';
import 'package:front/widgets/login.dart';
import 'package:front/widgets/flex.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(40),
      child: const Column(
        children: [
          NoneWidget(flex: 1),
          BannerWidget(),
          LoginWidget(),
        ],
      ),
    );
  }
}
