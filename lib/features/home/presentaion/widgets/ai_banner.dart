import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class AiBanner extends StatelessWidget {
const AiBanner({super.key});

@override
Widget build(BuildContext context) {
return const Padding(
padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
child: _BannerContent(),
);
}
}

class _BannerContent extends StatelessWidget {
const _BannerContent();

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
children: const [
Expanded(
child: _BannerTexts(),
),
SizedBox(width: AppSize.s16),
_BannerIcon(),
],
),
);
}
}

class _BannerTexts extends StatelessWidget {
const _BannerTexts();

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
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>  Container(),
),
);
},
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
),
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
