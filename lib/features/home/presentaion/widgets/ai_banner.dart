// lib/features/home/presentation/widgets/ai_banner.dart

import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';

import '../../../../core/theme/values_manager.dart';

class AiBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const AiBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: _BannerContent(onTap: onTap),
    );
  }
}

class _BannerContent extends StatelessWidget {
  final VoidCallback? onTap;

  const _BannerContent({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorManager.gradientStart,
            ColorManager.gradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      child: Row(
        children: [
          Expanded(
            child: _BannerTexts(onTap: onTap),
          ),
          const SizedBox(width: AppSize.s16),
          const _BannerIcon(),
        ],
      ),
    );
  }
}

class _BannerTexts extends StatelessWidget {
  final VoidCallback? onTap;

  const _BannerTexts({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.aiBannerTitle,
          style: AppTextStyles.headlineSmall.copyWith(
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          StringsManager.aiBannerBody,
          style: AppTextStyles.bodySmall.copyWith(
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: AppSize.s16),
        ElevatedButton(
          onPressed: onTap, // 👈 استدعاء الـ Callback هنا
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.white,
            foregroundColor: ColorManager.primary,
            elevation: AppSize.s0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
          ),
          child: const Text(
            StringsManager.aiButton,
          ),
        )
      ],
    );
  }
}

class _BannerIcon extends StatelessWidget {
  const _BannerIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s100,
      height: AppSize.s100,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      child: const Icon(
        Icons.card_giftcard,
        color: ColorManager.white,
        size: AppSize.s48,
      ),
    );
  }
}