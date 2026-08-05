import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';

// ---------------------------------------------------------------------------
// Welcome header
// ---------------------------------------------------------------------------


class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.loginWelcomeTitle.tr(),
          style: AppTextStyles.headlineMedium,
        ),
        
        Text(
          StringsManager.loginWelcomeSubtitle.tr(),
          textAlign: TextAlign.start,
          style: AppTextStyles.bodyMedium.copyWith(
            color: ColorManager.textSecondary,
          ),
        ),
      ],
    );
  }
}
