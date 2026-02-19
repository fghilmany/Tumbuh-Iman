import 'package:tumbuh_iman/core/router/quran/quran_routes_const.dart';

class AppRouterConst {
  AppRouterConst._();

  // Root Route
  static const String splash = '/';
  static const String home = '/home';
  static const String dailyHabit = 'daily-habit';
  static const String prayerTimes = 'prayer-times';

  // Feature Routes
  static const quran = QuranRoutesConst();

  // Helpers Methods
  static String getRouteWithoutSlash(String route) {
    return route.startsWith('/') ? route.substring(1) : route;
  }

  static String getRouteName(String route) {
    return getRouteWithoutSlash(route).replaceAll('/', '-');
  }
}


