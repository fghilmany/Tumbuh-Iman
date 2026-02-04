import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/features/home/home_page.dart';
import 'package:tumbuh_iman/presentation/features/splash/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // Splash Page
      GoRoute(
        path: AppRouterConst.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRouterConst.home,
        name: AppRouterConst.getRouteWithoutSlash(AppRouterConst.home),
        builder: (context, state) => const HomePage(),
      ),
    ],
    observers: [
      getIt<FirebaseAnalyticsObserver>(),
    ],
  );
}