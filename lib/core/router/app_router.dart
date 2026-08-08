import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/features/home/home_demo.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/features/home/presentaion/views/home_view.dart';
import 'package:graduation_project/features/splash/splash_view.dart';
import 'package:graduation_project/features/auth/presentation/views/sign_up.dart';
import 'package:graduation_project/core/utils/cached_data_shared_preferences.dart';
import 'package:graduation_project/features/auth/presentation/views/login_view.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/onboarding/presentation/view/onboarding_view.dart';
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
  // GoRoute(
  //       path: RoutesManager.homePath,
  //       name: RoutesManager.homeName,
  //       builder: (context, state) => const HomePage(),
  //     ),
      GoRoute(
        path: RoutesManager.homeViewPath,
        name: RoutesManager.homeViewName,
        builder: (context, state) => const HomeView(),
      ),

      // GoRoute(
      //   path: RoutesManager.registerSuccessPath,
      //   name: RoutesManager.registerSuccessName,
      //   builder: (context, state) => const RegisterSuccessView(),
      // ),
      
      // GoRoute(
      //   path: RoutesManager.changePasswordPath,
      //   name: RoutesManager.changePasswordName,
      //   builder: (context, state) => const ChangePasswordView(),
      // ),
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

  ];

  if (!isAuthenticated && !publicRoutes.contains(state.matchedLocation)) {
    return RoutesManager.loginPath;
  }

  return null;
}
}