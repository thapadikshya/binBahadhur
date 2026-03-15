import 'package:binbahadhur/features/auth/presentation/pages/signin_page.dart';
import 'package:binbahadhur/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/theme/app_pallete.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _imageAnimated = false;
  bool _textVisible = false;
  bool _slideUp = false;
  bool _isLogin = false; //login rw signup page ma switch garna

  // user ly type gareko value hold garxa
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    //binbahadhur mascot aauxa
    Future.delayed(Duration.zero, () {
      setState(() => _imageAnimated = true);
    });
    //text aauxa
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _textVisible = true);
    });
    //signup page janxa mathi
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _slideUp = true);
    });
  }

  @override
  void dispose() {
    // DISPOSE CONTROLLERS
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: Stack(
        children: [
          /// Welcomepage content
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _slideUp ? 40 : height / 2 - 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AnimatedScale(
                  duration: const Duration(seconds: 1),
                  scale: _imageAnimated ? 1 : 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      _imageAnimated ? 50 : 0,
                    ),
                    child: Image.asset(
                      'assets/binbahadhur.png',
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _textVisible ? 1 : 0,
                  child: const Text(
                    "binBahadur",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // animate varw aauney
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _slideUp
                ? 200
                : height, //200 samma matrw mathi janxa so that mascot hoss mathi vanerw
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              //white background/cover
              decoration: const BoxDecoration(
                color: AppPallete.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),

              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _isLogin ? SigninPage() : SignupPage(),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
