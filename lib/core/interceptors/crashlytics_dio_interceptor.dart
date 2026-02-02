import 'package:dio/dio.dart';
import 'package:tumbuh_iman/core/services/crashlytics_service.dart';

class CrashlyticsDioInterceptor extends Interceptor {
  final CrashlyticsService _crashlytics;

  CrashlyticsDioInterceptor(this._crashlytics);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Automatically log all API errors to Crashlytics
    _crashlytics.log('API Error: ${err.requestOptions.path}');
    _crashlytics.logError(
      err,
      err.stackTrace,
      reason: 'API Error: ${err.type} - ${err.response?.statusCode}',
      fatal: false,
    );

    super.onError(err, handler);
  }
}