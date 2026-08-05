import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';

class SkipRow extends StatelessWidget {
  const SkipRow({super.key, required this.visible, required this.onSkip});

  final bool visible;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s48,
      child: Visibility(
        visible: visible,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: onSkip,
            child: Text(
              StringsManager.onboardingSkip.trim(),
              style: AppTextStyles.labelLarge.copyWith(
                color: ColorManager.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
