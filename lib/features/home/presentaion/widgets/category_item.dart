import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppSize.s73,
            height: AppSize.s73,
            decoration: BoxDecoration(
              color: ColorManager.primaryLight,
              borderRadius: BorderRadius.circular(
                AppRadius.r16,
              ),
            ),
            child: Icon(
              icon,
              color: ColorManager.primary,
              size: AppSize.s35,
            ),
          ),

          const SizedBox(height: AppSize.s8),

          Text(
            title,
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}