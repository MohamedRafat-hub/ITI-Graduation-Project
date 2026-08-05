import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class LoginRow extends StatelessWidget {
  final VoidCallback onTap;

  const LoginRow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(color:ColorManager.textPrimary, fontSize: AppSize.s14),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: ColorManager.gradientEnd,
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s14,
            ),
          ),
        ),
      ],
    );
  }
}