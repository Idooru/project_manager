import 'package:flutter/material.dart';
import 'package:front/pages/signup.dart';
import 'package:front/widgets/check.dart';
import 'package:front/widgets/text_input.dart';
import 'package:front/widgets/submit.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  bool isLoginable = false;
  bool isValidEmail = false;
  bool isValidPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    debugPrint('login..');
    debugPrint(email);
    debugPrint(password);
  }

  void handleEmail(String email) {
    if (email.isEmpty) {
      setState(() => isLoginable = false);
    }

    String emailPattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    RegExp regex = RegExp(emailPattern);
    bool isMatched = regex.hasMatch(email);

    if (isMatched) isValidEmail = true;
  }

  void handlePassword(String password) {
    if (password.isEmpty) {
      setState(() => isLoginable = false);
    }

    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(passwordPattern);
    bool isMatched = regex.hasMatch(password);

    if (isMatched) {
      isValidPassword = true;
      setState(() => isLoginable = true);
    }
  }

  void rememberMe(bool? isChecked) {
    debugPrint('is remember?');
    debugPrint('$isChecked');
  }

  void navigateSignupPage() {
    debugPrint('move to sign up!');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(6, 0, 0, 25),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            TextInputWidget(
              label: 'E-mail',
              controller: emailController,
              textChange: handleEmail,
              labelWidth: 60,
            ),
            const SizedBox(height: 10.0),
            TextInputWidget(
              label: 'PW',
              controller: passwordController,
              textChange: handlePassword,
              labelWidth: 60,
            ),
            const SizedBox(height: 10.0),
            CheckBoxWidget(
              label: 'remember me',
              onChange: rememberMe,
            ),
            const SizedBox(height: 10.0),
            SubmitWidget(
              text: 'Login',
              submit: login,
              isSubmitable: isLoginable,
            ),
            SizedBox(
              width: 190,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: navigateSignupPage,
                    child: const Text(
                      'sign up',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
