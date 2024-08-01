import 'package:flutter/material.dart';
import 'package:front/pages/login.dart';
import 'package:front/widgets/submit.dart';
import 'package:front/widgets/validate_input.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool isSignUpable = false;
  bool isValidNickname = false;
  bool isValidEmail = false;
  bool isValidPassword = false;
  bool isValidPasswordConfirm = false;

  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  void signUp() {
    print("sign up!");
  }

  void handleNickname(String nickname) {
    if (nickname.isEmpty) {
      setState(() => isSignUpable = false);
    }

    String nicknamePattern = r'^[a-zA-Z0-9_]{3,16}$';
    RegExp regex = RegExp(nicknamePattern);
    bool isMatched = regex.hasMatch(nickname);

    setState(() {
      isValidNickname = isMatched ? true : false;
    });
  }

  void handleEmail(String email) {
    if (email.isEmpty) {
      setState(() => isSignUpable = false);
    }

    String emailPattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    RegExp regex = RegExp(emailPattern);
    bool isMatched = regex.hasMatch(email);

    setState(() {
      isValidEmail = isMatched ? true : false;
    });
  }

  void handlePassword(String password) {
    if (password.isEmpty) {
      setState(() => isSignUpable = false);
    }

    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(passwordPattern);
    bool isMatched = regex.hasMatch(password);

    setState(() {
      isValidPassword = isMatched ? true : false;
    });
  }

  void handlePasswordConfirm(String passwordConfrim) {
    if (passwordConfrim.isEmpty) {
      setState(() => isSignUpable = false);
    }

    String currentPassword = passwordController.text;

    setState(() {
      isValidPasswordConfirm = currentPassword == passwordConfrim;

      if (isValidNickname &&
          isValidEmail &&
          isValidPassword &&
          isValidPasswordConfirm) {
        isSignUpable = true;
      }
    });
  }

  String getNicknameFailReason() {
    return 'invalid nick name';
  }

  String getEmailFailReason() {
    return 'invalid email';
  }

  String getPasswordFailReason() {
    return 'invalid password';
  }

  void navigateLoginPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(6, 0, 0, 25),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            ValidateInputWidget(
              label: 'nick name',
              controller: nicknameController,
              textChange: handleNickname,
              isValid: isValidNickname,
              labelWidth: 100,
              failReason: getNicknameFailReason(),
            ),
            const SizedBox(height: 10.0),
            ValidateInputWidget(
              label: 'E-mail',
              controller: emailController,
              textChange: handleEmail,
              isValid: isValidEmail,
              labelWidth: 100,
              failReason: getEmailFailReason(),
            ),
            const SizedBox(height: 10.0),
            ValidateInputWidget(
              label: 'PW',
              controller: passwordController,
              textChange: handlePassword,
              isValid: isValidPassword,
              labelWidth: 100,
              failReason: getPasswordFailReason(),
            ),
            const SizedBox(height: 10.0),
            ValidateInputWidget(
              label: 'PW confirm',
              controller: passwordConfirmController,
              textChange: handlePasswordConfirm,
              isValid: isValidPasswordConfirm,
              labelWidth: 100,
              failReason: 'password incorrect',
            ),
            const SizedBox(height: 15.0),
            SubmitWidget(
              submit: signUp,
              text: 'sign up',
              isSubmitable: isSignUpable,
            ),
            SizedBox(
              width: 190,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Already have account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: navigateLoginPage,
                    child: const Text(
                      'login',
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
