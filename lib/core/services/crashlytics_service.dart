import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

/// Crashlytics service following Clean Architecture principles
/// Located in Core layer as a shared cross-cutting concern
@lazySingleton
class CrashlyticsService {
  final FirebaseCrashlytics _crashlytics;
  final Talker _talker;

  CrashlyticsService(this._crashlytics, this._talker);

  /// Initialize Crashlytics with Flutter error handling
  Future<void> initialize() async {
    try {
      _talker.info('Initializing Crashlytics...');

      // Check if crashlytics is enabled
      final isEnabled = _crashlytics.isCrashlyticsCollectionEnabled;
      _talker.info('Crashlytics collection enabled: $isEnabled');

      // Pass all uncaught errors from the framework to Crashlytics
      FlutterError.onError = (FlutterErrorDetails details) {
        _talker.error(
          'Flutter Framework Error',
          details.exception,
          details.stack,
        );
        _crashlytics.recordFlutterFatalError(details);
      };

      // Pass all uncaught asynchronous errors to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        _talker.error('Uncaught async error', error, stack);
        _crashlytics.recordError(error, stack, fatal: true);
        return true;
      };

      _talker.info('✅ Crashlytics initialized successfully');
    } catch (e, stackTrace) {
      _talker.error('❌ Failed to initialize Crashlytics', e, stackTrace);
      rethrow;
    }
  }

  /// Record an error (main method - used by BLoC observer)
  Future<void> recordError(
      dynamic exception,
      StackTrace? stackTrace, {
        String? reason,
        bool fatal = false,
        Map<String, dynamic>? information,
      }) async {
    try {
      _talker.debug('Recording error to Crashlytics: ${exception.runtimeType}');

      // Add custom keys if provided
      if (information != null) {
        for (final entry in information.entries) {
          await _crashlytics.setCustomKey(entry.key, entry.value);
        }
      }

      // Record the error
      await _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason,
        fatal: fatal,
      );

      _talker.debug('✅ Error recorded to Crashlytics');
    } catch (e, stack) {
      _talker.error('❌ Failed to record error to Crashlytics', e, stack);
    }
  }

  /// Log an error (alias for recordError for backward compatibility)
  Future<void> logError(
      dynamic exception,
      StackTrace? stackTrace, {
        String? reason,
        bool fatal = false,
      }) async {
    await recordError(
      exception,
      stackTrace,
      reason: reason,
      fatal: fatal,
    );
  }

  /// Log a custom message
  void log(String message) {
    try {
      _crashlytics.log(message);
      _talker.debug('Crashlytics log: $message');
    } catch (e) {
      _talker.error('Failed to log to Crashlytics', e);
    }
  }

  /// Set user identifier
  Future<void> setUserIdentifier(String identifier) async {
    try {
      await _crashlytics.setUserIdentifier(identifier);
      _talker.info('Crashlytics user identifier set: $identifier');
    } catch (e) {
      _talker.error('Failed to set user identifier', e);
    }
  }

  /// Set custom key-value pair
  Future<void> setCustomKey(String key, Object value) async {
    try {
      await _crashlytics.setCustomKey(key, value);
      _talker.debug('Crashlytics custom key set: $key = $value');
    } catch (e) {
      _talker.error('Failed to set custom key', e);
    }
  }

  /// Set multiple custom keys at once
  Future<void> setCustomKeys(Map<String, dynamic> keys) async {
    try {
      for (final entry in keys.entries) {
        await _crashlytics.setCustomKey(entry.key, entry.value);
      }
      _talker.debug('Crashlytics custom keys set: ${keys.length} keys');
    } catch (e) {
      _talker.error('Failed to set custom keys', e);
    }
  }

  /// Check if Crashlytics collection is enabled
  Future<bool> isCrashlyticsCollectionEnabled() async {
    try {
      return _crashlytics.isCrashlyticsCollectionEnabled;
    } catch (e) {
      _talker.error('Failed to check Crashlytics status', e);
      return false;
    }
  }

  /// Enable/disable Crashlytics collection
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    try {
      await _crashlytics.setCrashlyticsCollectionEnabled(enabled);
      _talker.info('Crashlytics collection ${enabled ? 'enabled' : 'disabled'}');
    } catch (e) {
      _talker.error('Failed to set Crashlytics collection status', e);
    }
  }

  /// Force crash for testing (use only in debug mode)
  void forceCrash() {
    if (kDebugMode) {
      _talker.warning('⚠️ Forcing crash for testing...');
      _crashlytics.crash();
    } else {
      _talker.warning('Force crash is only available in debug mode');
    }
  }

  /// Send test error to verify Crashlytics is working
  Future<void> sendTestError() async {
    try {
      _talker.info('Sending test error to Crashlytics...');
      await recordError(
        Exception('Test error from CrashlyticsService'),
        StackTrace.current,
        reason: 'Testing Crashlytics integration',
        fatal: false,
      );
      _talker.info('✅ Test error sent to Crashlytics');
    } catch (e, stack) {
      _talker.error('❌ Failed to send test error', e, stack);
    }
  }
}