import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../login_screen/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController _controller = LoginController();

  void loadUser() async {
    await Future.delayed(const Duration(seconds: 3));

    if (await _controller.isLoggedIn()) {
      Navigator.of(context).popAndPushNamed(
        '/home',
      );
    } else {
      Navigator.of(context).popAndPushNamed(
        '/login',
      );
    }
  }

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Container(),
    );
  }
}
