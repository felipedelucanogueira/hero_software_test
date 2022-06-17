import 'package:flutter/material.dart';
import 'package:hero_software_test/components/user_terms_component.dart';
import 'package:hero_software_test/features/register_screen/register_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../values/colors.dart';
import '../../values/decorations.dart';
import '../../values/strings.dart';
import '../../values/validators.dart';

class RegisterFormComponent extends StatefulWidget {
  const RegisterFormComponent({Key? key}) : super(key: key);

  @override
  State<RegisterFormComponent> createState() =>
      _CreateAccountFormComponentState();
}

class _CreateAccountFormComponentState extends State<RegisterFormComponent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _registryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          children: [
            TextFormField(
              validator: Validatorless.required(Strings.emptyName),
              style: const TextStyle(color: AppColors.white),
              controller: _nameController,
              decoration: Decorations.inputDecoration(
                hintText: Strings.nameHint,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            TextFormField(
              validator: Validatorless.multiple(
                [
                  Validatorless.required(Strings.emptyEmail),
                  Validatorless.email(Strings.invalidEmail),
                ],
              ),
              style: const TextStyle(color: AppColors.white),
              controller: _emailController,
              decoration: Decorations.inputDecoration(
                hintText: Strings.emailHint,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            TextFormField(
              validator: Validatorless.required(Strings.emptyPhone),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: AppColors.white),
              controller: _phoneController,
              decoration: Decorations.inputDecoration(
                hintText: Strings.phoneHint,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            TextFormField(
              style: const TextStyle(color: AppColors.white),
              controller: _registryController,
              decoration: Decorations.inputDecoration(
                hintText: Strings.registryHint,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            TextFormField(
              validator: Validatorless.required(Strings.emptyPassword),
              style: const TextStyle(color: AppColors.white),
              controller: _passwordController,
              decoration:
                  Decorations.inputDecoration(hintText: Strings.passwordHint),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            TextFormField(
              style: const TextStyle(color: AppColors.white),
              validator: Validatorless.multiple([
                Validators.compare(
                    _passwordController, Strings.differentPasswords),
                Validatorless.required(Strings.differentPasswords),
              ]),
              controller: _confirmPasswordController,
              decoration: Decorations.inputDecoration(
                hintText: Strings.confirmPasswordHint,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.058,
            ),
            const UserTermsComponent(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.058,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.056,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColors.primary),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await _controller.register(
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          registry: _registryController.text,
                          password: _passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              Strings.accountCreated,
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    Strings.register.toUpperCase(),
                    style: const TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.058,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _registryController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
