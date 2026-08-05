import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class ValidationCheck extends StatelessWidget {
  const ValidationCheck({
    super.key,
    required this.validTitle,
    this.isValid = false,
  });
  final String validTitle;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outlined,
          size: AppSize.s18,
          color: isValid ? ColorManager.success : ColorManager.grey500,
        ),
        const SizedBox(width: AppSize.s8),
        Text(
          validTitle,
          style: AppTextStyles.bodySmall.copyWith(
            color: isValid ? ColorManager.success : ColorManager.grey500,
          ),
        ),
      ],
    );
  }
}
