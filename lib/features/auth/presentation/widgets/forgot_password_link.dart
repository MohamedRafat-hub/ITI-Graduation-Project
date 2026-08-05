import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';

class ForgotPasswordLink extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPasswordLink({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Forgot password?',
          style: TextStyle(color: ColorManager.gradientEnd),
        ),
      ),
    );
  }
}