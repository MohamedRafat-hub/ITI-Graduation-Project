import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/router/routes_manager.dart';
import 'package:graduation_project/core/constants/app_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await Future.wait([
        Future.delayed(const Duration(milliseconds: AppConstants.splashDelay)),
        _prefetchAppState(),
      ]);
    } catch (error, stackTrace) {
      log('Error during Splash prefetch', error: error, stackTrace: stackTrace);
      FlutterNativeSplash.remove();
    } finally {
      FlutterNativeSplash.remove();
    }

    _navigate();
  }

  Future<void> _prefetchAppState() async {
    // TODO: Load remote config / feature flags / validate auth token.
  }

  void _navigate() {
    if (!mounted) return;

    context.goNamed(RoutesManager.onboardingName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(child: SizedBox.shrink()),
    );
  }
}
