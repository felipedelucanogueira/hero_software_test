import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_software_test/values/strings.dart';

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
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0224,
            ),
            RichText(
              text: TextSpan(
                text: Strings.chronos.toUpperCase(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.036,
                ),
                children: [
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text: Strings.partners.toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.036,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(Strings.splashFooter,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.white,
                )),
          ],
        ),
      ),
    );
  }
}
