import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/quran_detail_page.dart';

class QuranRoutes {
  const QuranRoutes._();

  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: AppRouterConst.quran.detailPattern,
        name: AppRouterConst.getRouteWithoutSlash(AppRouterConst.quran.detailPattern),
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '');
          if (id == null) return const SizedBox.shrink();
          return QuranDetailPage(surahId: id);
        },
      ),
    ];
  }
}