import 'package:flutter/material.dart';
import 'package:habit_tracker_pre/screens/-main/view.dart';
import 'package:habit_tracker_pre/screens/about/view.dart';
import 'package:habit_tracker_pre/screens/auth/view_login.dart';
import 'package:habit_tracker_pre/screens/auth/view_register.dart';
import 'package:habit_tracker_pre/screens/info/view.dart';
import 'package:habit_tracker_pre/screens/intro/view.dart';
import 'package:habit_tracker_pre/screens/privacy/view.dart';
import 'package:habit_tracker_pre/screens/report/view.dart';
import 'package:habit_tracker_pre/screens/settings/view.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings things) {
    switch (things.name) {
      case intro:
        return MaterialPageRoute(builder: (context) => const IntroScreen());
      case settings:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case about:
        return MaterialPageRoute(builder: (context) => const AboutScreen());
      case privacy:
        return MaterialPageRoute(builder: (context) => const PrivacyScreen());
      case report:
        return MaterialPageRoute(builder: (context) => const ReportScreen());
      case auth:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case register:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RegisterScreen(),
        );
      case login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
        );
        case mainn:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainScreen(),
        );
        case info:
        return MaterialPageRoute(builder: (context) => const InfoScreen());
      default:
    }

    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text("Hata"),
              ),
            ));
  }
}

const String intro = 'intro';
const String settings = 'settings';
const String about = 'about';
const String privacy = 'privacy';
const String report = 'report';
const String auth = 'auth';
const String register = 'register';
const String login = 'login';
const String mainn = 'main';
const String info = 'info';