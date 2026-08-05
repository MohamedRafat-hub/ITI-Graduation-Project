import 'firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/router/app_router.dart';
import 'package:graduation_project/core/theme/theme_manager.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:graduation_project/core/utils/my_bloc_observer.dart';
import 'package:graduation_project/core/utils/cached_data_shared_preferences.dart';
Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheService.cacheInitialization();

  configureDependencies();

  Bloc.observer = const MyBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  FlutterNativeSplash.remove();

  runApp(const GiftMind());
}

class GiftMind extends StatelessWidget {
  const GiftMind({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GiftMind',
      routerConfig: AppRouter.router,
      theme: AppTheme.light,
    );
  }
}