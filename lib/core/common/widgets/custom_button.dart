import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //Decleration of field
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;

  //constructor to initiates field
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: backgroundColor ?? AppPallete.backgroundColor,
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              )
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor == null ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
