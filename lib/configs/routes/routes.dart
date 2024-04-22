import 'package:flutter/material.dart';
import 'package:my_hotel/configs/routes/routes_name.dart';
import 'package:my_hotel/view/home/home_page.dart';
import 'package:my_hotel/view/login/login_screen.dart';
import 'package:my_hotel/view/main_screen.dart';
import 'package:my_hotel/view/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
