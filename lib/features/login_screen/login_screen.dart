import 'package:flutter/material.dart';
import 'package:hero_software_test/features/login_screen/login_controller.dart';
import 'package:hero_software_test/values/colors.dart';
import 'package:hero_software_test/values/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: Strings.emailHint,
                hintStyle: TextStyle(color: AppColors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white),
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: Strings.passwordHint,
                  hintStyle: TextStyle(color: AppColors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white))),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _controller.login(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (await _controller.isLoggedIn()) {
                    Navigator.pushNamed(context, '/home');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              child: const Text(Strings.loginButton),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot-password');
              },
              child: const Text(
                Strings.forgotPassword,
                style: TextStyle(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                Strings.register,
                style: TextStyle(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
