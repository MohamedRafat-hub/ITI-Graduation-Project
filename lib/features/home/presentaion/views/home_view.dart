import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

import 'package:graduation_project/features/aiFinder/presentation/views/gift_finder_input_page.dart';
import 'package:graduation_project/features/cart/presentation/views/cart_view.dart';
import 'package:graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/features/search/views/search_view.dart';
import 'package:graduation_project/features/wishlist/presentation/cubit/wishlist_cubit.dart';

import '../cubit/categoryCubit.dart';
import '../cubit/gifts_cubit.dart';
import '../widgets/ bottom_navigation.dart';
import '../widgets/ai_banner.dart';
import '../widgets/categories_list.dart';
import '../widgets/home_header.dart';
import '../widgets/popular_products.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeContent(
        onAiBannerTap: () {
          setState(() {
            _currentIndex = 2; // الانتقال للـ Tab رقم 2 (GiftFinderInputPage)
          });
        },
      ),
      const SearchView(),
      const GiftFinderInputPage(),
      const CartView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final VoidCallback? onAiBannerTap;

  const HomeContent({super.key, this.onAiBannerTap});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String userName =
        user?.displayName ?? user?.email?.split('@').first ?? "User";

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoryCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (_) => getIt<GiftsCubit>()..getGifts(),
        ),
        BlocProvider(
          create: (_) => getIt<WishlistCubit>()..getWishlist(),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(
                  greeting: StringsManager.homeGreeting,
                  userName: userName,
                ),
                const SizedBox(height: AppSize.s10),
                AiBanner(onTap: onAiBannerTap),
                const CategoriesList(),
                const SizedBox(height: AppSize.s16),
                const PopularProducts(),
                const SizedBox(height: AppSize.s24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}