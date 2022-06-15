import 'package:flutter/material.dart';
import 'package:hero_software_test/features/login_screen/login_controller.dart';
import 'package:hero_software_test/values/colors.dart';

import '../../values/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final LoginController _controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              _controller.logout();
              if (await _controller.isLoggedIn() == false) {
                Navigator.pushNamed(context, '/login');
              }
            },
            child: const Text(Strings.logoutButton),
          ),
        )
      ]),
    );
  }
}
