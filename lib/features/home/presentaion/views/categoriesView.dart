import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/features/home/presentaion/cubit/categoryCubit.dart';
import 'package:graduation_project/features/home/presentaion/cubit/category_state.dart';
import 'package:graduation_project/features/home/presentaion/views/gifts_view.dart';

import '../utils/category_icon_mapper.dart';
import '../widgets/categories_grid.dart';
import '../widgets/categories_header.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF8),
      body: BlocProvider(
        create: (_) => getIt<CategoryCubit>()..getCategories(),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }

            if (state is CategorySuccess) {
              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    const CategoriesHeader(),

                    CategoriesGrid(
                      categories: state.categories,
                      onCategoryTap: (categoryName) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GiftsView(
                              categoryName: categoryName,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}