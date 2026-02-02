import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/core/services/crashlytics_service.dart';
import 'package:tumbuh_iman/core/utils/result.dart';

@lazySingleton
class ErrorHandler {
  final CrashlyticsService _crashlytics;

  ErrorHandler(this._crashlytics);

  /// Handle repository calls with automatic error logging
  Future<Result<T>> handleRepositoryCall<T>({
    required Future<T> Function() call,
    required String context,
  }) async {
    try {
      final result = await call();
      return Result.success(result);
    } catch (e, stackTrace) {
      _crashlytics.log('Repository Error in $context');
      await _crashlytics.logError(
        e,
        stackTrace,
        reason: 'Repository Error: $context',
        fatal: false,
      );
      return Result.failure(
        e.toString(),
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  /// Handle use case calls with automatic error logging
  Future<Result<T>> handleUseCaseCall<T>({
    required Future<T> Function() call,
    required String context,
  }) async {
    try {
      final result = await call();
      return Result.success(result);
    } catch (e, stackTrace) {
      _crashlytics.log('UseCase Error in $context');
      await _crashlytics.logError(
        e,
        stackTrace,
        reason: 'UseCase Error: $context',
        fatal: false,
      );
      return Result.failure(
        e.toString(),
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}