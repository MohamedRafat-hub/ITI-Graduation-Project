import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.logout,
          color: ColorManager.primary,
        ),
        label: const Text(
          "Log Out",
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: ColorManager.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}