import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/core/router/debug/debug_routes_const.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/features/debug/component_showcase_page.dart';
import 'package:tumbuh_iman/presentation/features/debug/debug_page.dart';

class DebugRoutes {
  const DebugRoutes._();

  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: DebugRoutesConst.componentShowcase,
        name: AppRouterConst.getRouteWithoutSlash(DebugRoutesConst.componentShowcase),
        builder: (context, state) => const ComponentShowcasePage(),
      ),

      GoRoute(
        path: DebugRoutesConst.debug,
        name: AppRouterConst.getRouteWithoutSlash(DebugRoutesConst.debug),
        builder: (context, state) => const DebugPage(),
      ),
      GoRoute(
        path: DebugRoutesConst.talker,
        name: AppRouterConst.getRouteWithoutSlash(DebugRoutesConst.talker),
        builder: (context, state) {
          final talker = getIt<Talker>();
          return TalkerScreen(talker: talker);
        },
      ),
    ];
  }
}