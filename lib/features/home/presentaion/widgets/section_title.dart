import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import '../views/categoriesView.dart';
import '../views/gifts_view.dart';

enum SectionType {
categories,
gifts,
}

class SectionTitle extends StatelessWidget {
final String title;
final SectionType? type;

const SectionTitle({
super.key,
required this.title,
this.type,
});

void _navigateToSeeAll(BuildContext context) {
if (type == SectionType.categories) {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const CategoriesView(),
  ),
);
}

if (type == SectionType.gifts) {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const  GiftsView(),
  ),
);
}
}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(
horizontal: AppPadding.p20,
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
title,
style: AppTextStyles.headlineSmall,
),

TextButton(
onPressed: type == null
? null
    : () => _navigateToSeeAll(context),
child: Text(
StringsManager.seeAll,
style: AppTextStyles.bodyMedium.copyWith(
color: ColorManager.primary,
),
),
),
],
),
);
}
}

