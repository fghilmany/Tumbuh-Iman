import 'package:flutter_bloc/flutter_bloc.dart' show BlocObserver, BlocBase;
import 'package:tumbuh_iman/core/services/crashlytics_service.dart';

class CrashlyticsBlocObserver extends BlocObserver {
  final CrashlyticsService _crashlytics;

  CrashlyticsBlocObserver(this._crashlytics);

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _crashlytics.log('BLoC Error in ${bloc.runtimeType}');
    _crashlytics.logError(
      error,
      stackTrace,
      reason: 'BLoC Error: ${bloc.runtimeType}',
      fatal: false,
    );
    super.onError(bloc, error, stackTrace);
  }
}