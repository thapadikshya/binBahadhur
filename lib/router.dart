import 'package:binbahadhur/features/admin/presentation/pages/admin_page.dart';
import 'package:binbahadhur/features/admin/presentation/pages/manage_employee.dart';
import 'package:binbahadhur/features/admin/presentation/pages/reports_pages.dart';
import 'package:binbahadhur/features/employee/presentation/pages/complain.dart';
import 'package:binbahadhur/features/employee/presentation/pages/employee.dart';
import 'package:binbahadhur/features/report_and_reward/presentation/pages/report_page.dart';
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

      //homepage ma janxa
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
