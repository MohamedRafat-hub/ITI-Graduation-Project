import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.onPressed,
    required this.isLoading,
    this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          disabledBackgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          elevation: 0,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loader'),
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: CircularProgressIndicator(
                    strokeWidth: AppSize.s2,
                    color: ColorManager.white,
                  ),
                )
              : Text(
                  label ?? StringsManager.loginSubmit.tr(),
                  key: const ValueKey('text'),
                  style: AppTextStyles.titleMedium.copyWith(
                    color: ColorManager.white,
                  ),
                ),
        ),
      ),
    );
  }
}