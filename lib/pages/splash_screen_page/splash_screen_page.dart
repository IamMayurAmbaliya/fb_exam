import 'package:fb_exam/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.instance.loginPage,
        );
      },
    );
    return const Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Image(
          image: AssetImage("assets/gifs/splash3.webp"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
