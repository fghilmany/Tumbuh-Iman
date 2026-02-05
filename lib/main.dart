import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/core/obeservers/crashlytics_bloc_observer.dart';
import 'package:tumbuh_iman/core/router/app_router.dart';
import 'package:tumbuh_iman/core/services/analytics_service.dart';
import 'package:tumbuh_iman/core/services/crashlytics_service.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  // Initialize Crashlytics
  final crashlyticsService = getIt<CrashlyticsService>();
  await crashlyticsService.initialize();

  Bloc.observer = CrashlyticsBlocObserver(crashlyticsService);

  // Get Talker instance once
  final talker = getIt<Talker>();

  // Setup BLoC observer
  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('id'),
      saveLocale: true,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => "app_name".tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRouter.router,
    );
  }
}

class AnalyticsClickable extends StatelessWidget {
  final String elementName;
  final String? screenName;
  final Map<String, dynamic>? additionalParams;
  final VoidCallback onTap;
  final Widget child;

  const AnalyticsClickable({
    super.key,
    required this.elementName,
    required this.onTap,
    required this.child,
    this.screenName,
    this.additionalParams,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Get analytics service
        final analytics = getIt<AnalyticsService>();

        // Log click
        await analytics.logClick(
          elementName: elementName,
          screenName: screenName,
          additionalParams: additionalParams,
        );

        // Execute original callback
        onTap();
      },
      child: child,
    );
  }
}