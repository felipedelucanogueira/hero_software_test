import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hero_software_test/features/forgot_password_screen/forgot_password_screen.dart';
import 'package:hero_software_test/features/register_screen/register_screen.dart';

import 'features/home_screen/home_screen.dart';
import 'features/login_screen/login_screen.dart';
import 'features/splash_screen/splash_screen.dart';
import 'values/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      const InitialRoute(),
    ),
  );
}

class InitialRoute extends StatefulWidget {
  const InitialRoute({Key? key}) : super(key: key);

  @override
  State<InitialRoute> createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(0),
          isDense: true,
        ),
        textTheme: GoogleFonts.oswaldTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
            primary: AppColors.primary, seedColor: AppColors.black),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
