import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

@LazySingleton()
class AnalyticsService {
  final FirebaseAnalytics _analytics;
  final Talker _talker;

  AnalyticsService(this._analytics, this._talker);

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await _analytics.setUserProperty(
      name: name,
      value: value,
    );
  }

  Future<void> setUserId(String? userId) async {
    await _analytics.setUserId(id: userId);
  }

  Future<void> logAppOpen() async {
    await _analytics.logAppOpen();
  }

  Future<void> logFeatureUsed(String featureName) async {
    await logEvent(
      name: 'feature_used',
      parameters: {'feature_name': featureName},
    );
  }

  Future<void> logClick({
    required String elementName,
    String? screenName,
    Map<String, dynamic>? additionalParams,
  }) async {
    final params = <String, Object>{
      'element_name': elementName,
      if (screenName != null) 'screen_name': screenName,
      'timestamp': DateTime.now().toIso8601String(),
      ...?additionalParams,
    };

    // 🔍 ADD THIS DEBUG LOG
    _talker.log('🔥 Analytics Click: $elementName on $screenName with params: $additionalParams');

    await _analytics.logEvent(
      name: 'element_click',
      parameters: params,
    );

    // 🔍 ADD THIS CONFIRMATION
    _talker.log('✅ Analytics logged successfully');
  }

  Future<void> logNavigationClick({
    required String from,
    required String to,
  }) async {
    await _analytics.logEvent(
      name: 'navigation_click',
      parameters: {
        'from_screen': from,
        'to_screen': to,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
}