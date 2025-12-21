import 'package:binbahadhur/core/common/widgets/custom_citylist.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:binbahadhur/core/common/widgets/custom_textfield.dart';

// Change StatelessWidget to StatefulWidget
class SigninPage extends StatefulWidget {
  final VoidCallback onSwitch;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SigninPage({
    super.key,
    required this.onSwitch,
    required this.emailController,
    required this.passwordController,
  });

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey("login_form"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back\nLogin to continue",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: widget.emailController,
              hintText: "Email",
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: widget.passwordController,
              hintText: "Password",
              maxLines: 1,
            ),
            const SizedBox(height: 20), // Add spacing
            // City Dropdown
            CityDropdownField(
              selectedCity: _selectedCity,
              onChanged: (value) => setState(() => _selectedCity = value),
              // Reuse the static list
            ),

            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                // You can access _selectedCity here when button is pressed
                if (_selectedCity == null || _selectedCity!.isEmpty) {
                  // Show error or validation message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a city')),
                  );
                  return;
                }

                // Your login logic here
                print('Logging in with city: $_selectedCity');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppPallete.backgroundColor,
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: widget.onSwitch,
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
