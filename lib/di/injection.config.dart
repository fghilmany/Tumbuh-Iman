// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker/talker.dart' as _i993;

import '../core/services/analytics_service.dart' as _i267;
import '../core/services/crashlytics_service.dart' as _i758;
import '../core/utils/error_handler.dart' as _i240;
import '../data/local/database/app_database.dart' as _i130;
import '../data/remote/dialy_habit/meal_nutrition_api_client.dart' as _i585;
import '../data/remote/prayer_times/prayer_times_api_client.dart' as _i1039;
import '../data/remote/quran/quran_api_client.dart' as _i80;
import '../presentation/features/splash/bloc/splash_bloc.dart' as _i4;
import 'module/database_module.dart' as _i484;
import 'module/firebase_module.dart' as _i343;
import 'module/logger_module.dart' as _i454;
import 'module/network_module.dart' as _i881;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    final firebaseModule = _$FirebaseModule();
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i4.SplashBloc>(() => _i4.SplashBloc());
    await gh.lazySingletonAsync<_i130.AppDatabase>(
      () => databaseModule.database(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i141.FirebaseCrashlytics>(
      () => firebaseModule.crashlytics,
    );
    gh.lazySingleton<_i398.FirebaseAnalytics>(() => firebaseModule.analytics);
    gh.lazySingleton<_i398.FirebaseAnalyticsObserver>(
      () => firebaseModule.analyticsObserver,
    );
    gh.lazySingleton<_i993.Talker>(() => loggerModule.talker());
    gh.lazySingleton<_i758.CrashlyticsService>(
      () => _i758.CrashlyticsService(gh<_i141.FirebaseCrashlytics>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () =>
          networkModule.dio(gh<_i993.Talker>(), gh<_i758.CrashlyticsService>()),
    );
    gh.lazySingleton<_i267.AnalyticsService>(
      () => _i267.AnalyticsService(gh<_i398.FirebaseAnalytics>()),
    );
    gh.lazySingleton<_i240.ErrorHandler>(
      () => _i240.ErrorHandler(gh<_i758.CrashlyticsService>()),
    );
    gh.lazySingleton<_i80.QuranApiClient>(
      () => networkModule.quranApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1039.PrayerTimesApiClient>(
      () => networkModule.prayerTimesApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i585.MealNutritionApiClient>(
      () => networkModule.mealNutritionApiClient(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i484.DatabaseModule {}

class _$FirebaseModule extends _i343.FirebaseModule {}

class _$LoggerModule extends _i454.LoggerModule {}

class _$NetworkModule extends _i881.NetworkModule {}
