// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:binbahadhur/features/auth/data/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:binbahadhur/core/theme/app_pallete.dart';

import 'package:binbahadhur/features/auth/presentation/widgets/auth_button.dart';
import 'package:binbahadhur/features/auth/presentation/widgets/auth_field.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback onSignUpTap;
  const SigninPage({Key? key, required this.onSignUpTap}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthServices authservices = AuthServices();
  // Controllers

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signInUser() {
    authservices.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Namaste\nWelcome back, please enter your credentials to continue!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.blackColor,
                ),
              ),
              const SizedBox(height: 25),

              AuthField(hintText: "Email", controller: emailController),
              const SizedBox(height: 15),

              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),

              const SizedBox(height: 25),

              AuthButton(
                buttonText: 'Sign In',
                onTap: () {
                  print(
                    "Button was clicked!",
                  ); // This will show in your VS Code terminal
                  if (formKey.currentState!.validate()) {
                    print("Form is valid, calling backend...");
                    signInUser();
                  } else {
                    print("Form is NOT valid - check the text fields!");
                  }
                },
              ),

              const SizedBox(height: 20),

              Center(
                child: GestureDetector(
                  onTap: widget.onSignUpTap,
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(
                        color: AppPallete.blackColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppPallete.backgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
