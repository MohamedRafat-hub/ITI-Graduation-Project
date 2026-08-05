import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_project/core/utils/validation.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
// ---------------------------------------------------------------------------
// Password field
// ---------------------------------------------------------------------------


class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.obscure,
    required this.onToggleObscure,
    this.label,
    this.hintText,
    this.validator,
    super.key,
    this.onChanged,
  });

  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggleObscure;
  final Function(String)? onChanged;

  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? StringsManager.loginPasswordLabel.tr(),
          style: AppTextStyles.titleSmall,
        ),
        const SizedBox(height: AppSize.s8),
        CustomTextFormField(
          controller: controller,
          hintText: hintText ?? StringsManager.loginPasswordLabel.tr(),
          obscureText: obscure,
          onChanged: onChanged,
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: ColorManager.grey500,
            size: AppSize.s24,
          ),
          suffixIcon: IconButton(
            onPressed: onToggleObscure,
            icon: Icon(
              obscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: ColorManager.grey500,
              size: AppSize.s24,
            ),
          ),
          autofillHints: const [AutofillHints.password],
          validator:
              validator ?? (value) => AuthValidator.validatePassword(value),
        ),
      ],
    );
  }
}
