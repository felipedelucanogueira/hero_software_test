import 'package:flutter/material.dart';
import 'package:hero_software_test/components/logo_component.dart';
import 'package:hero_software_test/features/login_screen/login_controller.dart';
import 'package:hero_software_test/values/colors.dart';
import 'package:hero_software_test/values/strings.dart';
import 'package:validatorless/validatorless.dart';

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
  var _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: Column(
              children: [
                const Spacer(),
                const Logo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.email(Strings.invalidEmail),
                    Validatorless.required(Strings.emptyEmail)
                  ]),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: Strings.emailHint,
                    hintStyle: TextStyle(color: AppColors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20, color: AppColors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isVisible,
                  validator: Validatorless.required(Strings.emptyPassword),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: Strings.passwordHint,
                    suffixIcon: IconButton(
                      icon: _isVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      color: AppColors.white,
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                    suffixIconConstraints: const BoxConstraints(
                        minWidth: 0, minHeight: 20, maxHeight: 35),
                    hintStyle: const TextStyle(color: AppColors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20, color: AppColors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
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
                        }
                      },
                      child: const Text(Strings.loginButton),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: const Text(
                    Strings.forgotPassword,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    Strings.register,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
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
