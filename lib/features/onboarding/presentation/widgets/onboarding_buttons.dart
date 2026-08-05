import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/theme/color_manager.dart' show ColorManager;


class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool outlined;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = Text(
      text,
      style: AppTextStyles.titleMedium.copyWith(
        color: outlined
            ? ColorManager.primary
            : ColorManager.white,
      ),
    );

    return SizedBox(
      height: AppSize.s54,
      width: double.infinity,
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              child: child,
            )
          : FilledButton(
              onPressed: onPressed,
              child: child,
            ),
    );
  }
}
class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onNext;

  const OnboardingNextButton({
    super.key,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: StringsManager.onboardingNext.trim(),
      onPressed: onNext,
    );
  }
}
class OnboardingLastActions extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

  const OnboardingLastActions({
    super.key,
    required this.onLogin,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: StringsManager.onboardingLogin.trim(),
          onPressed: onLogin,
        ),

        const SizedBox(height: AppSize.s12),

        AppButton(
          text: StringsManager.onboardingSignup.trim(),
          onPressed: onSignUp,
          outlined: true,
        ),
      ],
    );
  }
}
