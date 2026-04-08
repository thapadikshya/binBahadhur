import 'package:binbahadhur/core/theme/theme.dart';
import 'package:binbahadhur/features/auth/presentation/pages/welcome_page.dart';
import 'package:binbahadhur/features/auth/presentation/providers/user_provider.dart';
import 'package:binbahadhur/features/home/presentation/pages/home_page.dart';
import 'package:binbahadhur/features/auth/data/auth_services.dart';
import 'package:binbahadhur/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    // This method checks SharedPreferences for a token and updates the Provider
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    // Listens to the UserProvider. Whenever the user state changes (e.g., after login),
    // this build method triggers again and updates the 'home' widget.
    final user = Provider.of<UserProvider>(context).user;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'binBahadhur',
      theme: AppTheme.darkThemeMode,

      // CORRECTED: Calling the static method from your AppRouter class
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),

      // LOGIC: Automatically switches between Home and Welcome based on login status
      home: user.token.isNotEmpty ? const HomePage() : const WelcomePage(),
    );
  }
}
