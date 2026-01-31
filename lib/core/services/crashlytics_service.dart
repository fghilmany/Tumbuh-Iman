import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Crashlytics service following Clean Architecture principles
/// Located in Core layer as a shared cross-cutting concern
@lazySingleton
class CrashlyticsService {
  final FirebaseCrashlytics _crashlytics;

  CrashlyticsService(this._crashlytics);

  /// Initialize Crashlytics with Flutter error handling
  Future<void> initialize() async {
    // Pass all uncaught errors from the framework to Crashlytics
    FlutterError.onError = _crashlytics.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// Log a custom error
  Future<void> logError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
    bool fatal = false,
  }) async {
    await _crashlytics.recordError(
      exception,
      stackTrace,
      reason: reason,
      fatal: fatal,
    );
  }

  /// Log a custom message
  void log(String message) {
    _crashlytics.log(message);
  }

  /// Set user identifier
  Future<void> setUserIdentifier(String identifier) async {
    await _crashlytics.setUserIdentifier(identifier);
  }

  /// Set custom key-value pair
  Future<void> setCustomKey(String key, Object value) async {
    await _crashlytics.setCustomKey(key, value);
  }

  /// Check if Crashlytics collection is enabled
  Future<bool> isCrashlyticsCollectionEnabled() async {
    return _crashlytics.isCrashlyticsCollectionEnabled();
  }

  /// Enable/disable Crashlytics collection
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    await _crashlytics.setCrashlyticsCollectionEnabled(enabled);
  }
}
