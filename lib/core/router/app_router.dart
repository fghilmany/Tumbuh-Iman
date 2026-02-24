import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/core/router/debug/debug_routes.dart';
import 'package:tumbuh_iman/core/router/debug/debug_routes_const.dart';
import 'package:tumbuh_iman/core/router/quran/quran_routes.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/features/home/home_page.dart';
import 'package:tumbuh_iman/presentation/features/splash/splash_page.dart';

class AppRouter {
  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return DoubleTapNavigator(child: child);
          },
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
              routes: [

              ]
            ),

            ...QuranRoutes.getRoutes(),
            ...DebugRoutes.getRoutes(),
          ],
        ),
      ],
      observers: [
        getIt<FirebaseAnalyticsObserver>(),
        routeObserver,
      ],
    );
  }

  // Keep static router for backward compatibility
  static final GoRouter router = createRouter();
}

/// Wrapper widget that enables double-tap navigation to debug screen
class DoubleTapNavigator extends StatelessWidget {
  final Widget child;

  const DoubleTapNavigator({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        context.push(DebugRoutesConst.debug);
      },
      child: child,
    );
  }
}