import 'package:flutter/material.dart';
import 'package:binbahadhur/core/theme/app_pallete.dart';

class CustomBigButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomBigButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // 👈 default margin
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.backgroundColor,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
