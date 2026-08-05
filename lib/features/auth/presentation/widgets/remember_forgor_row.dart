import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
// ---------------------------------------------------------------------------
// Remember me + forgot password row
// ---------------------------------------------------------------------------


class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({
    required this.rememberMe,
    required this.onRememberChanged,
    super.key,
    required this.onPressed,
  });

  final bool rememberMe;
  final ValueChanged<bool?> onRememberChanged;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: Checkbox(
                value: rememberMe,
                onChanged: onRememberChanged,
                activeColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                ),
                side: const BorderSide(color: ColorManager.border),
              ),
            ),
            const SizedBox(width: AppSize.s8),
            Text(
              StringsManager.loginRememberMe.tr(),
              style: AppTextStyles.labelSmall,
            ),
          ],
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            StringsManager.loginForgotPassword.tr(),
            style: AppTextStyles.labelSmall.copyWith(
              color: ColorManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
