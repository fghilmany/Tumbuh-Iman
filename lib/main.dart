import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/core/router/app_router.dart';
import 'package:tumbuh_iman/core/services/analytics_service.dart';
import 'package:tumbuh_iman/core/services/crashlytics_service.dart';
import 'package:tumbuh_iman/core/services/firebase_remote_config_service.dart';
import 'package:tumbuh_iman/core/services/translation_service.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/firebase_options.dart';

import 'presentation/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final talker = getIt<Talker>();

  try {
    talker.info('🚀 Starting Tumbuh Iman...');

    // Firebase
    talker.info('🔥 Initializing Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    talker.info('✅ Firebase initialized');

    // Crashlytics
    talker.info('📊 Initializing Crashlytics...');
    final crashlytics = getIt<CrashlyticsService>();
    await crashlytics.initialize();
    talker.info('✅ Crashlytics initialized');

    // Remote Config
    talker.info('⚙️ Initializing Remote Config...');
    final remoteConfig = getIt<FirebaseRemoteConfigService>();
    await remoteConfig.initialize();
    talker.info('✅ Remote Config initialized');

    // Translation
    talker.info('🌍 Initializing Translation...');
    final translation = getIt<TranslationService>();
    await translation.initialize();
    talker.info('✅ Translation initialized');
    talker.info('📍 Locale: ${translation.currentLocale}');
    talker.info('🔢 Keys: ${translation.translationCount}');

    // BLoC Observer
    Bloc.observer = _CombinedBlocObserver(
      crashlyticsService: crashlytics,
      talker: talker,
    );

    talker.info('🎉 App initialization completed');

    runApp(const MyApp());
  } catch (e, stackTrace) {
    talker.error('❌ Initialization failed', e, stackTrace);

    try {
      final crashlytics = getIt<CrashlyticsService>();
      await crashlytics.recordError(e, stackTrace, reason: 'Init failed', fatal: true);
    } catch (_) {}

    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final talker = getIt<Talker>();
    final translationService = getIt<TranslationService>();

    return ListenableBuilder(
      listenable: translationService,
      builder: (context, child) {
        // Recreate router on locale change to force full rebuild
        final router = AppRouter.createRouter();

        return MaterialApp.router(
          key: ValueKey(translationService.currentLocale), // Force rebuild on locale change
          title: translationService.translate('app_name', fallback: 'Tumbuh Iman'),
          theme: AppTheme.lightTheme,
          locale: Locale(translationService.currentLocale),
          supportedLocales: translationService.availableLocales
              .map((locale) => Locale(locale))
              .toList(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return TalkerWrapper(
              talker: talker,
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}

class _CombinedBlocObserver extends BlocObserver {
  final CrashlyticsService crashlyticsService;
  final Talker talker;

  _CombinedBlocObserver({
    required this.crashlyticsService,
    required this.talker,
  });

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    talker.debug('🔷 BLoC Created: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    talker.error('❌ BLoC Error: ${bloc.runtimeType}', error, stackTrace);

    crashlyticsService.recordError(
      error,
      stackTrace,
      reason: 'BLoC Error in ${bloc.runtimeType}',
      fatal: false,
      information: {
        'bloc_type': bloc.runtimeType.toString(),
        'bloc_state': bloc.state.toString(),
      },
    );
  }
}

/// Analytics Clickable Widget
///
/// Wraps any widget to automatically log click events to Analytics
///
/// Usage:
/// ```dart
/// AnalyticsClickable(
///   elementName: 'login_button',
///   screenName: 'LoginScreen',
///   onTap: () => print('Tapped!'),
///   child: ElevatedButton(
///     onPressed: null, // Don't set onPressed here
///     child: Text('Login'),
///   ),
/// )
/// ```
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
        try {
          // Get analytics service
          final analytics = getIt<AnalyticsService>();

          // Log click
          await analytics.logClick(
            elementName: elementName,
            screenName: screenName,
            additionalParams: additionalParams,
          );
        } catch (e) {
          // Silently fail if analytics not available
          final talker = getIt<Talker>();
          talker.warning('⚠️ Failed to log analytics click', e);
        }

        // Execute original callback
        onTap();
      },
      child: child,
    );
  }
}