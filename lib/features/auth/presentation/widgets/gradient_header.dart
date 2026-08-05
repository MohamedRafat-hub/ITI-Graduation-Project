import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + AppPadding.p24,
        left: AppPadding.p24,
        right: AppPadding.p24,
        bottom: AppPadding.p32,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorManager.gradientStart, ColorManager.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s28),
          bottomRight: Radius.circular(AppSize.s28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSize.s58,
            height: AppSize.s58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            child: const Icon(
              Icons.card_giftcard_rounded,
              color: ColorManager.gradientStart,
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSize.s28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: AppSize.s14,
            ),
          ),
        ],
      ),
    );
  }
}