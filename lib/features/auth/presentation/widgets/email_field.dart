import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_project/core/utils/validation.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
// ---------------------------------------------------------------------------
// Email field
// ---------------------------------------------------------------------------


class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.loginEmailLabel.tr(),
          style: AppTextStyles.titleSmall,
        ),
        const SizedBox(height: AppSize.s8),
        CustomTextFormField(
          controller: controller,
          hintText: StringsManager.loginEmailHint.tr(),
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: ColorManager.grey500,
            size: AppSize.s24,
          ),
          autofillHints: const [AutofillHints.email],
          validator: (value) => AuthValidator.validateEmail(value),
        ),
      ],
    );
  }
}
