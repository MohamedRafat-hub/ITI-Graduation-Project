import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/gift_finder_input_page.dart';
import 'package:graduation_project/features/home/presentaion/views/home_view.dart';
import 'package:graduation_project/features/splash/splash_view.dart';
import 'package:graduation_project/features/auth/presentation/views/sign_up.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:graduation_project/features/cart/presentation/views/cart_view.dart';
import 'package:graduation_project/features/search/views/search_view.dart';

import '../../features/aiFinder/domain/entities/gift_request_entity.dart';
import '../../features/aiFinder/presentation/cubits/ai_recommendation_cubit/ai_recommendation_cubit.dart';
import '../../features/aiFinder/presentation/views/gift_recommentation_result_page.dart';
import '../../features/auth/presentation/views/login_view.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutesManager.splashPath,
    redirect: _authRedirect,
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(child: Text('No route defined for ${state.uri.path}')),
    ),
    routes: [
      GoRoute(
        path: RoutesManager.splashPath,
        name: RoutesManager.splashName,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutesManager.onboardingPath,
        name: RoutesManager.onboardingName,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: RoutesManager.loginPath,
        name: RoutesManager.loginName,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RoutesManager.signUpPath,
        name: RoutesManager.signUpName,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: RoutesManager.homeViewPath,
        name: RoutesManager.homeViewName,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartView(),
      ),

      // ─── AI GIFT RECOMMENDATION ROUTES ─────────────────────────────
      GoRoute(
        path: '/gift-finder',
        name: 'giftFinderInput',
        builder: (context, state) => const GiftFinderInputPage(),
      ),
      GoRoute(
        path: '/gift-recommendations',
        name: 'giftRecommendationResults',
        builder: (context, state) {
          final request = state.extra as GiftRequestEntity;
          return BlocProvider(
            create: (_) => getIt<AiRecommendationCubit>()..fetchRecommendations(request),
            child: GiftRecommendationResultsPage(request: request),
          );
        },
      ),

      GoRoute(
        path: RoutesManager.ProfilePath,
        name: RoutesManager.profileName,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<ProfileCubit>()..getProfile(),
            ),
            BlocProvider(
              create: (_) => getIt<AuthCubit>(),
            ),
          ],
          child: const ProfileView(),
        ),
      ),
    ],
  );

  static String? _authRedirect(BuildContext context, GoRouterState state) {
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;

    final isSplash = state.matchedLocation == RoutesManager.splashPath;

    if (isSplash) return null;

    const publicRoutes = [
      RoutesManager.onboardingPath,
      RoutesManager.loginPath,
      RoutesManager.signUpPath,
      RoutesManager.registerSuccessPath,
      RoutesManager.homeViewPath,
      '/search',
      '/cart',
      '/gift-finder',
      '/gift-recommendations',
    ];

    if (!isAuthenticated && !publicRoutes.contains(state.matchedLocation)) {
      return RoutesManager.loginPath;
    }

    return null;
  }
}