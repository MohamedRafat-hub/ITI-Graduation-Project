import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';

import '../../../../core/constants/strings_manager.dart';
import '../../../../core/theme/values_manager.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p16,
      ),      child: Container(
        height: AppSize.s54,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppRadius.r16),
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadow,
              blurRadius: AppSize.s10,
              offset: const Offset(
                AppSize.s0,
                AppSize.s4,
              ),
            ),          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: StringsManager.searchHint,
            hintStyle: AppTextStyles.hint,
            prefixIcon: const Icon(
              Icons.search,
              color: ColorManager.textSecondary,
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(AppRadius.r12),
              ),
              child: const Icon(
                Icons.tune,
                color: ColorManager.white,
              ),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16,
            ),          ),
        ),
      ),
    );
  }
}