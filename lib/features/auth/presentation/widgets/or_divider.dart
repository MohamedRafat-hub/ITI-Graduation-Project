import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: ColorManager.divider)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Text(
            text,
            style: TextStyle(color: ColorManager.error, fontSize: AppSize.s14),
          ),
        ),
        Expanded(child: Divider(color: ColorManager.divider)),
      ],
    );
  }
}