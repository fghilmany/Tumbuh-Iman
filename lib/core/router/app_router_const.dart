class AppRouterConst {
  static const String splash = '/';
  static const String home = '/home';
  static const String quran = 'quran';
  static const String dailyHabit = 'daily-habit';
  static const String prayerTimes = 'prayer-times';
  static const String debug = '/debug';
  static const String talker = '/talker';
  static const String componentShowcase = '/component-showcase';

  static String getRouteWithoutSlash(String route) {
    return route.startsWith('/') ? route.substring(1) : route;
  }
}