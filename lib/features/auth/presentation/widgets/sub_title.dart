import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/style_manager.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.bodyLarge);
  }
}
