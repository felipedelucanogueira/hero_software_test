import 'package:flutter/material.dart';
import 'package:hero_software_test/components/forms/form_component.dart';
import 'package:hero_software_test/components/logo_component.dart';
import 'package:hero_software_test/values/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blackBackground,
        iconTheme: const IconThemeData(color: AppColors.primary),
        centerTitle: true,
      ),
      backgroundColor: AppColors.blackBackground,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: const [
              Logo(),
              Spacer(
                flex: 1,
              ),
              RegisterFormComponent(),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
