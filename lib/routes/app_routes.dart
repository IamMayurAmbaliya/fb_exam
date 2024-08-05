import 'package:fb_exam/pages/home_page/home_page.dart';
import 'package:fb_exam/pages/login_page/login_page.dart';
import 'package:fb_exam/pages/sign_up_page/sign_up_page.dart';
import 'package:fb_exam/pages/splash_screen_page/splash_screen_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static final AppRoutes instance = AppRoutes._();

  String splashScreenPage = "splash_screen_page";
  String signUpPage = "signup_page";
  String loginPage = "login_page";
  String homePage = "home_page";

  Map<String, WidgetBuilder> routes = {
    "/": (context) => const SplashScreenPage(),
    "signup_page": (context) => const SignUpPage(),
    "login_page": (context) => const LoginPage(),
    "home_page": (context) => const HomePage(),
  };
}
