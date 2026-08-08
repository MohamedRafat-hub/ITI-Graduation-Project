

import 'package:flutter/material.dart';

import '../../data/model/category_model.dart';
import '../utils/category_icon_mapper.dart';
import 'categories_card.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(String categoryName) onCategoryTap;

  const CategoriesGrid({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        30,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final category = categories[index];

            return CategoriesCard(
              icon: getCategoryIcon(category.icon),
              title: category.name,
              onTap: () {
                onCategoryTap(category.name);
              },
            );
          },
          childCount: categories.length,
        ),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.95,
        ),
      ),
    );
  }
}