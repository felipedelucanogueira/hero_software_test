import 'package:flutter/material.dart';
import 'package:hero_software_test/components/logo_component.dart';
import 'package:hero_software_test/features/forgot_password_screen/forgot_password_controller.dart';
import 'package:hero_software_test/values/colors.dart';
import 'package:hero_software_test/values/strings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ForgotPasswordController _controller = ForgotPasswordController();
  var email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primary),
        elevation: 0.0,
        backgroundColor: AppColors.blackBackground,
      ),
      backgroundColor: AppColors.blackBackground,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Logo(),
              const Spacer(),
              const TitleComponent(),
              const Spacer(),
              TextField(
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: Strings.emailHint,
                  hintStyle: TextStyle(color: AppColors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white),
                  ),
                ),
                onSubmitted: (value) => email = value,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.04,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: AppColors.primary),
                    onPressed: () async {
                      try {
                        await _controller.forgotPassword(
                          email: _emailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(Strings.sucessfulSentEmail),
                          ),
                        );
                        Navigator.of(context).pop();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                          ),
                        );
                      }
                    },
                    child: Text(
                      Strings.resetPasswordButton.toUpperCase(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

class TitleComponent extends StatelessWidget {
  const TitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            Strings.resetPasswordTitle,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          Text(
            Strings.resetPasswordSubtitle,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
