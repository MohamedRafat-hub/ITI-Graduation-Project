import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      // onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.textSecondary,
      backgroundColor: ColorManager.white,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,

      onTap: (index) {
        switch (index) {
          case 0:
            context.goNamed(RoutesManager.homeName);
            break;

          case 3:
            context.goNamed(RoutesManager.wishlistName);
            break;

          case 4:
            context.goNamed(RoutesManager.profileName);
            break;
        }
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: StringsManager.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: StringsManager.browse,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_outlined),
          activeIcon: Icon(Icons.auto_awesome),
          label: StringsManager.aiFinder,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: StringsManager.wishlist,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: StringsManager.profile,
        ),
      ],
    );
  }
}