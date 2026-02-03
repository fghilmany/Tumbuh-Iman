import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/di/injection.dart';

final router = GoRouter(
  routes: [],
  observers: [
    getIt<FirebaseAnalyticsObserver>(),
  ],
);