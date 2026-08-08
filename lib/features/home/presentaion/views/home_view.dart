import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import '../../../../core/constants/strings_manager.dart';
import '../../../../core/theme/values_manager.dart';
import '../cubit/categoryCubit.dart';
import '../cubit/gifts_cubit.dart';

import '../widgets/ bottom_navigation.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/ai_banner.dart';
import '../widgets/categories_list.dart';
import '../widgets/popular_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final String userName =
        user?.displayName ??
            user?.email?.split('@').first ??
            "User";

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoryCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (_) => getIt<GiftsCubit>()..getGifts(),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.background,
        bottomNavigationBar: const HomeBottomNavigation(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(
                  greeting: StringsManager.homeGreeting,
                  userName: userName,
                ),

                const SizedBox(
                  height: AppSize.s8,
                ),

                const SearchBarWidget(),

                const AiBanner(),

                const CategoriesList(),

                const SizedBox(
                  height: AppSize.s16,
                ),

                const PopularProducts(),

                const SizedBox(
                  height: AppSize.s24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}