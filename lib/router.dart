import 'package:flutter/material.dart';
import 'package:binbahadhur/features/home/presentation/pages/home_page.dart';
import 'package:binbahadhur/features/auth/presentation/pages/welcome_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const WelcomePage(),
        );

      case HomePage.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomePage(),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
