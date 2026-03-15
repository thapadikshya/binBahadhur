import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:binbahadhur/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // Make container take only as much space as needed
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // important!
          children: const [
            Text(
              "Namaste\nHello there, please signup to continue!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppPallete.blackColor,
              ),
            ),
            const SizedBox(height: 15),
            AuthField(hintText: "Name"),

            const SizedBox(height: 15),
            AuthField(hintText: "Email"),

            const SizedBox(height: 15),
            AuthField(hintText: "Password"),
          ],
        ),
      ),
    );
  }
}
