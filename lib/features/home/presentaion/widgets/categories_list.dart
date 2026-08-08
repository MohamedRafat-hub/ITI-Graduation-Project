import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/features/home/presentaion/cubit/categoryCubit.dart';
import 'package:graduation_project/features/home/presentaion/cubit/category_state.dart';
import 'package:graduation_project/features/home/presentaion/views/gifts_view.dart';

import '../utils/category_icon_mapper.dart';
import 'category_item.dart';
import 'section_title.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: StringsManager.categories,
          type: SectionType.categories,
        ),

        const SizedBox(height: AppSize.s12),

        SizedBox(
          height: AppSize.s100,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeError) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is CategorySuccess) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,

                  separatorBuilder: (_, __) =>
                  const SizedBox(
                    width: AppSize.s16,
                  ),

                  itemBuilder: (context, index) {
                    final category =
                    state.categories[index];

                    return CategoryItem(
                      icon: getCategoryIcon(
                        category.icon,
                      ),
                      title: category.name,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GiftsView(
                              categoryName: category.name,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}