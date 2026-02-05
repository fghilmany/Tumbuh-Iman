import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/features/debug/component_showcase_page.dart';
import 'package:tumbuh_iman/presentation/features/debug/debug_page.dart';
import 'package:tumbuh_iman/presentation/features/home/home_page.dart';
import 'package:tumbuh_iman/presentation/features/splash/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
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
          ),
          GoRoute(
            path: AppRouterConst.debug,
            name: AppRouterConst.getRouteWithoutSlash(AppRouterConst.debug),
            builder: (context, state) => const DebugPage(),
          ),
          GoRoute(
            path: AppRouterConst.talker,
            name: AppRouterConst.getRouteWithoutSlash(AppRouterConst.talker),
            builder: (context, state) {
              final talker = getIt<Talker>();
              return TalkerScreen(talker: talker);
            },
          ),
          GoRoute(
            path: AppRouterConst.componentShowcase,
            name: AppRouterConst.getRouteWithoutSlash(AppRouterConst.componentShowcase),
            builder: (context, state) => const ComponentShowcasePage(),
          ),
        ],
      ),
    ],
    observers: [
      getIt<FirebaseAnalyticsObserver>(),
    ],
  );
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
        context.push(AppRouterConst.debug);
      },
      child: child,
    );
  }
}