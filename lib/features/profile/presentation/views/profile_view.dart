import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_state.dart';
import 'package:graduation_project/features/profile/presentation/widgets/logout_button.dart';
import 'package:graduation_project/features/profile/presentation/widgets/profile_header.dart';
import 'package:graduation_project/features/profile/presentation/views/edit_profile_view.dart';
import 'package:graduation_project/features/profile/presentation/widgets/profile_menu_item.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () {
                context.goNamed(RoutesManager.loginName);
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () {
                context.read<ProfileCubit>().getProfile();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (profile) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ProfileHeader(
                        name: profile.name,
                        email: profile.email,
                        imageUrl: profile.image,
                      ),

                      const SizedBox(height: 24),

                      ProfileMenuItem(
                        title: 'Edit Profile',
                        icon: Icons.person_outline,
                        onTap: () {
Navigator.push(
 context,
 MaterialPageRoute(
  builder: (_) => EditProfileView(
    name: profile.name,
  ),
 ),
).then((_) {
  context.read<ProfileCubit>().getProfile();
});
                        }
                      ),

                      const SizedBox(height: 12),

                      ProfileMenuItem(
  title: 'Wishlist',
  icon: Icons.favorite_border,
  onTap: () {
    context.pushNamed(RoutesManager.wishlistName);
  },
),
                      const SizedBox(height: 12),

                      ProfileMenuItem(
                        title: 'Settings',
                        icon: Icons.settings_outlined,
                        onTap: () {},
                      ),

                      const Spacer(),

                      LogoutButton(
                        onPressed: () {
                          context.read<AuthCubit>().logout();
                        },
                      ),
                    ],
                  ),
                );
              },
              updated: () {
                context.read<ProfileCubit>().getProfile();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (message) => Center(
                child: Text(message),
              ),
            );
          },
        ),
      ),
    );
  }
}