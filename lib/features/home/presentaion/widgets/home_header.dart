import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String userName;

  const HomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppPadding.p20,
        AppPadding.p20,
        AppPadding.p20,
        AppPadding.p24,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.gradientStart,
            ColorManager.gradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppRadius.r28),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: ColorManager.white,
                  ),
                ),

                const SizedBox(height: AppSize.s6),

                Text(
                  userName,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: ColorManager.white,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: ColorManager.white,
            ),
          ),

          const SizedBox(width: AppSize.s12),

          // const CircleAvatar(
          //   radius: AppRadius.r22,
          //   backgroundImage: NetworkImage(
          //     "https://i.pravatar.cc/150",
          //   ),
          // ),
        ],
      ),
    );
  }
}